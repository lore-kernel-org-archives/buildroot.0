From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 2 Oct 2020 23:57:02 +0200
Subject: [Buildroot] [PATCH 2/2] package/glibc: bump to version
 2.32-4-g69beb5cbf85cae1c61fe7432500ac10880dc7b07
In-Reply-To: <20201002155931.1529915-2-romain.naour@gmail.com>
References: <20201002155931.1529915-1-romain.naour@gmail.com>
 <20201002155931.1529915-2-romain.naour@gmail.com>
Message-ID: <6998c0d3-b227-4a9b-48f3-522fa6546efe@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 02/10/2020 ? 17:59, Romain Naour a ?crit?:
> - Support for Synopsys ARC HS cores (ARCv2 ISA) running Linux has been added.
>   Remove the ARC specific version.
> 
> - Remove --enable-obsolete-rpc configure option.

I believe we need to be careful with this change:

* Remove configure option --enable-obsolete-rpc.  Sun RPC is removed
  from glibc.  This includes the rpcgen program, librpcsvc, and the Sun
  RPC header files.  Backward compatibility for old programs is kept
  only for architectures and ABIs that have been added in or before
  glibc 2.31.  New programs need to use TI-RPC
  <http://git.linux-nfs.org/?p=steved/libtirpc.git;a=summary> and
  rpcsvc-proto <https://github.com/thkukuk/rpcsvc-proto>.

First because we don't have rpcsvc-proto package

Second, because our toolchain-external infra select by default
BR2_TOOLCHAIN_EXTERNAL_INET_RPC for external glibc toolchains.
If not disabled, the check_glibc_rpc_feature check will stop the build:

https://git.buildroot.net/buildroot/tree/toolchain/toolchain-external/toolchain-external-custom/Config.in.options#n445

Finally, our internal toolchain backend select BR2_TOOLCHAIN_HAS_NATIVE_RPC
unconditionally:

https://git.buildroot.net/buildroot/tree/toolchain/toolchain-buildroot/Config.in#n61

This patch needs to be updated with those changes.

Best regards,
Romain

> 
> Security related changes:
> 
>   CVE-2016-10228: An infinite loop has been fixed in the iconv program when
>   invoked with the -c option and when processing invalid multi-byte input
>   sequences.  Reported by Jan Engelhardt.
> 
>   CVE-2020-10029: Trigonometric functions on x86 targets suffered from stack
>   corruption when they were passed a pseudo-zero argument.  Reported by Guido
>   Vranken / ForAllSecure Mayhem.
> 
>   CVE-2020-1752: A use-after-free vulnerability in the glob function when
>   expanding ~user has been fixed.
> 
>   CVE-2020-6096: A signed comparison vulnerability in the ARMv7 memcpy and
>   memmove functions has been fixed.  Discovered by Jason Royes and Samual
>   Dytrych of the Cisco Security Assessment and Penetration Team (See
>   TALOS-2020-1019).
> 
> See:
> https://sourceware.org/pipermail/libc-announce/2020/000029.html
> 
> Tested by https://gitlab.com/kubu93/buildroot/-/jobs/769818674
> (Only boot tested with busybox)
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  .../glibc.hash                                           | 7 -------
>  .../glibc.hash                                           | 2 +-
>  package/glibc/glibc.mk                                   | 9 ++-------
>  .../0001-HACK-only-build-and-install-localedef.patch     | 0
>  ...x-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch | 0
>  .../localedef.hash                                       | 2 +-
>  6 files changed, 4 insertions(+), 16 deletions(-)
>  delete mode 100644 package/glibc/2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d/glibc.hash
>  rename package/glibc/{2.32-2-g386543bc4495f658dcce6cd4d11e4ba6574a46f5 => 2.32-4-g69beb5cbf85cae1c61fe7432500ac10880dc7b07}/glibc.hash (72%)
>  rename package/localedef/{2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d => 2.32-4-g69beb5cbf85cae1c61fe7432500ac10880dc7b07}/0001-HACK-only-build-and-install-localedef.patch (100%)
>  rename package/localedef/{2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d => 2.32-4-g69beb5cbf85cae1c61fe7432500ac10880dc7b07}/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch (100%)
>  rename package/localedef/{2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d => 2.32-4-g69beb5cbf85cae1c61fe7432500ac10880dc7b07}/localedef.hash (70%)
> 
> diff --git a/package/glibc/2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d/glibc.hash b/package/glibc/2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d/glibc.hash
> deleted file mode 100644
> index a1b2ae12fd..0000000000
> --- a/package/glibc/2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d/glibc.hash
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Locally calculated (fetched from Github)
> -sha256  e1f2c9b424a4e0c00e7ad123a4204f7bc8afd3c504aeb8c79b1086509fd67176  glibc-2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d.tar.gz
> -
> -# Hashes for license files
> -sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> -sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
> -sha256  b33d0bd9f685b46853548814893a6135e74430d12f6d94ab3eba42fc591f83bc  LICENSES
> diff --git a/package/glibc/2.32-2-g386543bc4495f658dcce6cd4d11e4ba6574a46f5/glibc.hash b/package/glibc/2.32-4-g69beb5cbf85cae1c61fe7432500ac10880dc7b07/glibc.hash
> similarity index 72%
> rename from package/glibc/2.32-2-g386543bc4495f658dcce6cd4d11e4ba6574a46f5/glibc.hash
> rename to package/glibc/2.32-4-g69beb5cbf85cae1c61fe7432500ac10880dc7b07/glibc.hash
> index c6259a4745..f6dd527aae 100644
> --- a/package/glibc/2.32-2-g386543bc4495f658dcce6cd4d11e4ba6574a46f5/glibc.hash
> +++ b/package/glibc/2.32-4-g69beb5cbf85cae1c61fe7432500ac10880dc7b07/glibc.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated (fetched from Github)
> -sha256  07f3804abbc6a23315f09568686c0e5bb81d714251cf537d25a36f826cae540b  glibc-2.32-2-g386543bc4495f658dcce6cd4d11e4ba6574a46f5.tar.gz
> +sha256  8695cbca28015df9cda59b2755822d009f615dd47490c8f8f653354ebd087bd2  glibc-2.32-4-g69beb5cbf85cae1c61fe7432500ac10880dc7b07.tar.gz
>  
>  # Hashes for license files
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 4721177d83..bf0966cbd4 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -11,16 +11,12 @@ else
>  # Generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
>  # When updating the version, please also update localedef
> -ifeq ($(BR2_arc),y)
> -# ARC support in upstream was merged in 2.32 release
> -# This can be removed once BR upgrades to 2.32 or later
> -GLIBC_VERSION = 2.32-2-g386543bc4495f658dcce6cd4d11e4ba6574a46f5
> -else ifeq ($(BR2_RISCV_32),y)
> +ifeq ($(BR2_RISCV_32),y)
>  # RISC-V 32-bit (RV32) requires glibc 2.33 or newer
>  # Until 2.33 is released, just use master
>  GLIBC_VERSION = 2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99
>  else
> -GLIBC_VERSION = 2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d
> +GLIBC_VERSION = 2.32-4-g69beb5cbf85cae1c61fe7432500ac10880dc7b07
>  endif
>  # Upstream doesn't officially provide an https download link.
>  # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
> @@ -137,7 +133,6 @@ define GLIBC_CONFIGURE_CMDS
>  		--disable-profile \
>  		--disable-werror \
>  		--without-gd \
> -		--enable-obsolete-rpc \
>  		--enable-kernel=$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)) \
>  		--with-headers=$(STAGING_DIR)/usr/include)
>  	$(GLIBC_ADD_MISSING_STUB_H)
> diff --git a/package/localedef/2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d/0001-HACK-only-build-and-install-localedef.patch b/package/localedef/2.32-4-g69beb5cbf85cae1c61fe7432500ac10880dc7b07/0001-HACK-only-build-and-install-localedef.patch
> similarity index 100%
> rename from package/localedef/2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d/0001-HACK-only-build-and-install-localedef.patch
> rename to package/localedef/2.32-4-g69beb5cbf85cae1c61fe7432500ac10880dc7b07/0001-HACK-only-build-and-install-localedef.patch
> diff --git a/package/localedef/2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch b/package/localedef/2.32-4-g69beb5cbf85cae1c61fe7432500ac10880dc7b07/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
> similarity index 100%
> rename from package/localedef/2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
> rename to package/localedef/2.32-4-g69beb5cbf85cae1c61fe7432500ac10880dc7b07/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
> diff --git a/package/localedef/2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d/localedef.hash b/package/localedef/2.32-4-g69beb5cbf85cae1c61fe7432500ac10880dc7b07/localedef.hash
> similarity index 70%
> rename from package/localedef/2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d/localedef.hash
> rename to package/localedef/2.32-4-g69beb5cbf85cae1c61fe7432500ac10880dc7b07/localedef.hash
> index a1b2ae12fd..f6dd527aae 100644
> --- a/package/localedef/2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d/localedef.hash
> +++ b/package/localedef/2.32-4-g69beb5cbf85cae1c61fe7432500ac10880dc7b07/localedef.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated (fetched from Github)
> -sha256  e1f2c9b424a4e0c00e7ad123a4204f7bc8afd3c504aeb8c79b1086509fd67176  glibc-2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d.tar.gz
> +sha256  8695cbca28015df9cda59b2755822d009f615dd47490c8f8f653354ebd087bd2  glibc-2.32-4-g69beb5cbf85cae1c61fe7432500ac10880dc7b07.tar.gz
>  
>  # Hashes for license files
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> 
