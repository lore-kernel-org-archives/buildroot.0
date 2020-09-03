From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Sep 2020 23:26:48 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/makedumpfile: new package
In-Reply-To: <20200831111226.15764-1-egorenar-dev@posteo.net>
References: <20200831111226.15764-1-egorenar-dev@posteo.net>
Message-ID: <20200903232648.6be84338@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Aleksander,

On Mon, 31 Aug 2020 13:12:26 +0200
Alexander Egorenkov <egorenar-dev@posteo.net> wrote:

> Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
> ---
>  DEVELOPERS                                    |   3 +
>  package/Config.in                             |   1 +
>  ...move-duplicated-variable-definitions.patch | 103 ++++++++++++++++++
>  package/makedumpfile/Config.in                |  18 +++
>  package/makedumpfile/makedumpfile.hash        |   3 +
>  package/makedumpfile/makedumpfile.mk          |  28 +++++
>  6 files changed, 156 insertions(+)
>  create mode 100644 package/makedumpfile/0001-PATCH-Remove-duplicated-variable-definitions.patch
>  create mode 100644 package/makedumpfile/Config.in
>  create mode 100644 package/makedumpfile/makedumpfile.hash
>  create mode 100644 package/makedumpfile/makedumpfile.mk

Thanks for this new iteration. The patch now looks good, with a small
exception below. However, the main issue is that it doesn't build. The
following configuration:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2020.02.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_MAKEDUMPFILE=y
# BR2_TARGET_ROOTFS_TAR is not set

fails with:

elf_info.c: In function ?get_elf64_phnum?:
elf_info.c:1050:23: error: ?PN_XNUM? undeclared (first use in this function)
  if (ehdr->e_phnum == PN_XNUM) {
                       ^
elf_info.c:1050:23: note: each undeclared identifier is reported only once for each function it appears in
make[1]: *** [Makefile:90: elf_info.o] Error 1

PN_XNUM is defined in libelf/elf.h in the elfutils code base, but it
seems like this header file is only installed if elfutils is built with
--enable-install-elfh. However, I am not sure what would be the impact
of installing elf.h. Indeed, the kernel headers also have an elf.h file
in usr/include/linux/elf.h.

Could you have a look into this ?

> diff --git a/package/makedumpfile/0001-PATCH-Remove-duplicated-variable-definitions.patch b/package/makedumpfile/0001-PATCH-Remove-duplicated-variable-definitions.patch
> new file mode 100644
> index 0000000000..0255de796e
> --- /dev/null
> +++ b/package/makedumpfile/0001-PATCH-Remove-duplicated-variable-definitions.patch
> @@ -0,0 +1,103 @@
> +From 399f2c9a3acd5bd913e50a4dde52dee6527b297e Mon Sep 17 00:00:00 2001
> +From: Kairui Song <kasong@redhat.com>
> +Date: Wed, 29 Jan 2020 13:37:13 +0800
> +Subject: [PATCH 1/1] [PATCH] Remove duplicated variable definitions

[PATCH 1/1] shouldn't be there, it should be just [PATCH]. This is
verified by "make check-package" in Buildroot.

> +When building on Fedora 32 (with GCC 10), following error is observed:
> +
> +/usr/bin/ld: erase_info.o:/tmp/makedumpfile/makedumpfile.h:2010: multiple definition of
> + `crash_reserved_mem_nr'; elf_info.o:/tmp/makedumpfile/makedumpfile.h:2010: first defined here
> +/usr/bin/ld: erase_info.o:/tmp/makedumpfile/makedumpfile.h:2009: multiple definition of
> + `crash_reserved_mem'; elf_info.o:/tmp/makedumpfile/makedumpfile.h:2009: first defined here
> +/usr/bin/ld: erase_info.o:/tmp/makedumpfile/makedumpfile.h:1278: multiple definition of
> + `parallel_info_t'; elf_info.o:/tmp/makedumpfile/makedumpfile.h:1278: first defined here
> +/usr/bin/ld: erase_info.o:/tmp/makedumpfile/makedumpfile.h:1265: multiple definition of
> + `splitting_info_t'; elf_info.o:/tmp/makedumpfile/makedumpfile.h:1265: first defined here
> +...
> +collect2: error: ld returned 1 exit status
> +make: *** [Makefile:97: makedumpfile] Error 1
> +
> +These variables are wrongly defined multiple times. So remove the
> +duplicated definitions.
> +
> +Signed-off-by: Kairui Song <kasong@redhat.com>
> +Signed-off-by: Kazuhito Hagio <k-hagio-ab@nec.com>

Minor nit: we need you to add your own Signed-off-by, right after the
other Signed-off-by that are already there.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
