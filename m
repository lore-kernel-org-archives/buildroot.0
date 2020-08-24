From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Aug 2020 10:58:38 +0200
Subject: [Buildroot] [PATCH/next] package/openfpgaloader: bump to
 current master
In-Reply-To: <20200824083838.12073-1-gwenj@trabucayre.com>
References: <20200824083838.12073-1-gwenj@trabucayre.com>
Message-ID: <20200824085838.GD10811@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gwenhael, All,

On 2020-08-24 10:38 +0200, Gwenhael Goavec-Merou spake thusly:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> - argp is no more used;
> - UDEV dependency is now optional
> 
> Fix:
> - http://autobuild.buildroot.org/results/f3f3cc216ae42bb8a8925b0df7c1a3cc79b027d7   
> 
> /home/buildroot/autobuild/instance-1/output-1/build/openfpgaloader-849e5751e06d4d00f323205d5f02ee01f9f59a61/src/spiFlash.cpp:
> In member function 'void SPIFlash::jtag_write_read(uint8_t, uint8_t*, uint8_t*, uint16_t)':
> /home/buildroot/autobuild/instance-1/output-1/build/openfpgaloader-849e5751e06d4d00f323205d5f02ee01f9f59a61/src/spiFlash.cpp:92:43:
> error: variable-sized object 'jtx' may not be initialized
>   uint8_t jtx[xfer_len] = {reverseByte(cmd)};
>                            ^
> and 
> 
> src/gowin.cpp:73:11: error: 'runtime_error' is not a member of 'std'
>  throw std::runtime_error("both write-flash and write-sram can't be set");
>        ^
> src/gowin.cpp:81:10: error: 'runtime_error' is not a member of 'std'
>   throw std::runtime_error("incompatible file format");
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Applied to master, but see below...

> ---
>  package/openfpgaloader/Config.in           | 13 ++++++++++---
>  package/openfpgaloader/openfpgaloader.hash |  2 +-
>  package/openfpgaloader/openfpgaloader.mk   | 12 +++++++-----
>  3 files changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/package/openfpgaloader/Config.in b/package/openfpgaloader/Config.in
> index 9835b84b64..421778105e 100644
> --- a/package/openfpgaloader/Config.in
> +++ b/package/openfpgaloader/Config.in
> @@ -1,11 +1,8 @@
>  config BR2_PACKAGE_OPENFPGALOADER
>  	bool "openfpgaloader"
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi1
> -	depends on BR2_PACKAGE_HAS_UDEV
>  	depends on BR2_INSTALL_LIBSTDCPP # libftdipp1
>  	depends on BR2_USE_WCHAR # libftdipp1
> -	select BR2_PACKAGE_ARGP_STANDALONE \
> -	       if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL # argp
>  	select BR2_PACKAGE_LIBFTDI1
>  	select BR2_PACKAGE_LIBFTDI1_LIBFTDIPP1
>  	help
> @@ -13,6 +10,16 @@ config BR2_PACKAGE_OPENFPGALOADER
>  
>  	  https://github.com/trabucayre/openFPGALoader/
>  
> +if BR2_PACKAGE_OPENFPGALOADER
> +
> +config BR2_PACKAGE_OPENFPGALODER_UDEV
> +	bool "udev support"
> +	depends on BR2_PACKAGE_HAS_UDEV
> +	help
> +	  use udev to search JTAG adapter from /dev/xx

I dropped this option, and directly used BR2_PACKAGE_HAS_UDEV in the .mk
file.

Also, I fixed the conflict after 1ca0077d9141 (package/openfpgaloader:
C++ dependency is not inherited).

Applied to master, thanks.

Regards,
Yann E. MORIN.

> +endif
> +
>  comment "openfpgaloader needs udev, a toolchain w/ threads, wchar, C++"
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
>  		!BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_HAS_UDEV
> diff --git a/package/openfpgaloader/openfpgaloader.hash b/package/openfpgaloader/openfpgaloader.hash
> index a084e938b0..990149cded 100644
> --- a/package/openfpgaloader/openfpgaloader.hash
> +++ b/package/openfpgaloader/openfpgaloader.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  fcff4999164ee2d3734f16b7f1d2063b3a68e237921e8d63c2afe75e16cdc7ce  openfpgaloader-849e5751e06d4d00f323205d5f02ee01f9f59a61.tar.gz
> +sha256  ef3ed60297ab560f15cd4362d61b7da86c44b84e18937e0411023f8d1cf6a606  openfpgaloader-381c67de00a3102cf6e9bb20ca84030a71c7a0f2.tar.gz
>  sha256  8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef  LICENSE
> diff --git a/package/openfpgaloader/openfpgaloader.mk b/package/openfpgaloader/openfpgaloader.mk
> index f806fd68f9..0d60f9405e 100644
> --- a/package/openfpgaloader/openfpgaloader.mk
> +++ b/package/openfpgaloader/openfpgaloader.mk
> @@ -4,15 +4,17 @@
>  #
>  ################################################################################
>  
> -OPENFPGALOADER_VERSION = 849e5751e06d4d00f323205d5f02ee01f9f59a61
> +OPENFPGALOADER_VERSION = 381c67de00a3102cf6e9bb20ca84030a71c7a0f2
>  OPENFPGALOADER_SITE = $(call github,trabucayre,openFPGALoader,$(OPENFPGALOADER_VERSION))
>  OPENFPGALOADER_LICENSE = AGPL-3.0
>  OPENFPGALOADER_LICENSE_FILES = LICENSE
> -OPENFPGALOADER_DEPENDENCIES = libftdi1 udev
> +OPENFPGALOADER_DEPENDENCIES = libftdi1
>  
> -ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
> -OPENFPGALOADER_DEPENDENCIES += argp-standalone
> -OPENFPGALOADER_CONF_OPTS += -DCMAKE_CXX_STANDARD_LIBRARIES="-largp"
> +ifeq ($(BR2_PACKAGE_OPENFPGALOADER_UDEV),y)
> +OPENFPGALOADER_DEPENDENCIES += udev
> +OPENFPGALOADER_CONF_OPTS += -DENABLE_UDEV=ON
> +else
> +OPENFPGALOADER_CONF_OPTS += -DENABLE_UDEV=OFF
>  endif
>  
>  $(eval $(cmake-package))
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
