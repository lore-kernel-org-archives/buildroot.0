From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 4 Feb 2019 15:12:03 +0100
Subject: [Buildroot] [PATCH 1/1] toolchain: Fix ld.so copying for
 multilib toolchains.
In-Reply-To: <20180629113339.59102-1-christoph.muellner@theobroma-systems.com>
References: <20180629113339.59102-1-christoph.muellner@theobroma-systems.com>
Message-ID: <CAAXf6LUmhp+bx+wF5u+H33CVsZ18-pwM6k0od0omrVKc7+45qw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

El vie., 29 jun. 2018 a las 13:51, Christoph Muellner
(<christoph.muellner@theobroma-systems.com>) escribi?:
>
> Multilib toolchains can have more than one ld.so files in lib/.
> Typically one for each lib* directory.
> However the current copy_toolchain_sysroot implemenation does
> not support more than one ld.so.
>
> This patch addresses this by iterating over all ld.so files
> in the lib/ directory and choose the one, which has a symlink
> into $ARCH_LIB_DIR/.
>
> An example is a multilib toolchain for aarch64 (LP64 and ILP32),
> which includes the following entries in lib/:
>
> $ ls -l lib/
> lrwxrwxrwx 1 user group ld-linux-aarch64_ilp32.so.1 -> ../libilp32/ld-2.27.so
> lrwxrwxrwx 1 user group ld-linux-aarch64.so.1 -> ../lib64/ld-2.27.so
>
> $ARCH_LIB_DIR/ will be detected as lib64.
> Without the patch no ld.so will be copied.
> With the patch the second ld.so (the one for LP64) will be copied.
>
> Signed-off-by: Christoph Muellner <christoph.muellner@theobroma-systems.com>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@theobroma-systems.com>
> ---
>  toolchain/helpers.mk | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)

Please extend the commit message and refer to the toolchain in which
you found this problem, with its link.
This will help future analysis when more rework in this area is needed.

>
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index 1792286add..62c0454be5 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -136,9 +136,14 @@ copy_toolchain_sysroot = \
>                 done ; \
>         fi ; \
>         if [ ! -e $(STAGING_DIR)/lib/ld*.so.* ]; then \
> -               if [ -e $${ARCH_SYSROOT_DIR}/lib/ld*.so.* ]; then \
> -                       cp -a $${ARCH_SYSROOT_DIR}/lib/ld*.so.* $(STAGING_DIR)/lib/ ; \
> -               fi ; \
> +               find $${ARCH_SYSROOT_DIR}/lib/ -name ld*.so.* -print0 | while IFS= read -r -d '' LD_SO; do \
> +                       LINKTARGET=`realpath $${LD_SO}` ; \
> +                       LINKTARGETDIR=`dirname $${LINKTARGET}` ; \
> +                       LINKTARGETBASE=`basename $${LINKTARGETDIR}` ; \

This is more correctly 'LINKTARGETDIRBASE' not 'LINKTARGETBASE', i.e.
'LINKTARGETBASE' would be 'ld.so.xxxx'.

> +                       if [ "$${LINKTARGETBASE}" = "$${ARCH_LIB_DIR}" ]; then \
> +                               cp -a $${LD_SO} $(STAGING_DIR)/lib/ ; \
> +                       fi ; \
> +               done ; \

I tested the changes both for the specified toolchain as for the
Marvell-provided Octeon toolchain which is also multilib, and the
expected ld.so files are indeed present on the target.

However, the new code assumes that the ld.so file matched with the
find command is a symbolic link, and then assumes that it points to
something identifyable with ARCH_LIB_DIR. I don't know whether it
occurs in practice, but suppose:
a. a single file is found and it is a regular file
b. a single file is found, it is a symbolic link, but it points to
something that is not containing ARCH_LIB_DIR as base.
c. multiple files are found, they are not symbolic links.

Case a and b could be solved by falling back to a simple copy (of all
matched files) if the link-comparing approach is not resulting in a
match.
But case c is more complex. An alternative would be to actually
inspect the architecture using readelf and compare it to the expected
value, e.g. based on libc.a.

I don't know how far we should go...

Best regards,
Thomas
