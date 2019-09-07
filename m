From: Romain Naour <romain.naour@smile.fr>
Date: Sat, 7 Sep 2019 15:38:53 +0200
Subject: [Buildroot] [PATCH 2/2] packages/sox: disable stack protector
 if SSP is not enabled
In-Reply-To: <20190902063728.31203-2-ydroneaud@opteya.com>
References: <20190902063728.31203-1-ydroneaud@opteya.com>
 <20190902063728.31203-2-ydroneaud@opteya.com>
Message-ID: <2d9c9bfa-12be-a78b-516a-306d22ea8634@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Le 02/09/2019 ? 08:37, Yann Droneaud a ?crit?:
> By default, sox link with libssp.so when available.
> 
> libssp.so is usually available within builtroot, as it's
> provided by almost, if not all, external cross toolchains.
> 
> Unfortunately, unlike libgcc_s.so, libssp.so is not copied
> on the target filesystem, so it's only available at link
> time and not at runtime, hence the following failures on
> target:
> 
>   $ sox
>   sox: error while loading shared libraries: libssp.so.0: cannot open shared object file: No such file or directory
> 
>   $ rec
>   rec: error while loading shared libraries: libssp.so.0: cannot open shared object file: No such file or directory
> 
> If BR2_SSP_NONE is set, libssp.so is not expected to be copied, so
> sox must not use it, and must be configured with --disable-stack-protector.
> 
> If BR2_SSP_REGULAR, BR2_SSP_STRONG, or BR2_SSP_ALL is set, as libssp.so
> provides __stack_chk_fail, and *_chk symbols, the library should be made
> available on target, so sox could use it.
> 
> Signed-off-by: Yann Droneaud <ydroneaud@opteya.com>
> ---
>  package/sox/sox.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/sox/sox.mk b/package/sox/sox.mk
> index 0b3dc136d815..a3d1089bf747 100644
> --- a/package/sox/sox.mk
> +++ b/package/sox/sox.mk
> @@ -13,6 +13,10 @@ SOX_CONF_OPTS = --with-distro="Buildroot" --without-ffmpeg --disable-gomp \
>  SOX_LICENSE = GPL-2.0+ (sox binary), LGPL-2.1+ (libraries)
>  SOX_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL
>  
> +ifeq ($(BR2_SSP_NONE),y)
> +SOX_CONF_OPTS += --disable-stack-protector
> +endif

It make sense to explicitly disable the ssp suppport when BR2_SSP_NONE even if
the toolchain support it. But the commit log is about libssp.

From sox's config.log, you can notice the missing libssp library

checking whether libssp exists
[..]/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld:
cannot find -lssp
collect2: error: ld returned 1 exit status

Then the successful ssp check:

checking whether stack-smashing protection is available
result: yes
checking whether stack-smashing protection is buggy
result: no
checking whether [..]host/bin/aarch64-linux-gnu-gcc accepts -fstack-protector
[...]/host/bin/aarch64-linux-gnu-gcc -c -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -fstack-protector -Werror
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 conftest.c >&5
configure:9519: $? = 0
configure:9528: result: yes

At the end of configuration report:
ssp_cv_cc=yes
ssp_cv_lib=no

Note, the SSP support is completely disabled when the toolchain doesn't support
it. [1]

[1] https://git.buildroot.net/buildroot/tree/package/sox/sox.mk#n12

Best regards,
Romain

> +
>  # MIPS Codescape toolchains don't support stack-smashing protection
>  # despite of using glibc.
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS)$(BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS),y)
> 
