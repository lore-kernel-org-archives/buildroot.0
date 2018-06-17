From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 17 Jun 2018 21:07:09 +0300
Subject: [Buildroot] [PATCH 1/1] package/hidapi: select glibc gconv libs
 copy
In-Reply-To: <1529257913-9183-1-git-send-email-danwalkes@trellis-logic.com>
References: <1529257913-9183-1-git-send-email-danwalkes@trellis-logic.com>
Message-ID: <20180617180709.y3czlfck7hh53biz@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Dan,

On Sun, Jun 17, 2018 at 05:51:53PM +0000, Dan Walkes wrote:
> Hidapi source uses iconv_open UTF-16 conversion [1] which requires
> gconv libararies when buiding with glibc in order to successfully
> find serial number, manufacturer and product strings [2].
> 
> Use select in the config file to autmatically select gconv libararies
> for inclusion on the target when building with glibc
> 
> Tested with ./utils/test-pkg -c hidapi.cfg -p hidapi and hidapi.cfg file
> contents:
> BR2_PACKAGE_HIDAPI=y
> BR2_PACKAGE_EUDEV=y
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> BR2_USE_MMU=y
> BR2_USE_WCHAR=y
> 
> Also tested on x86-64 build target with application using hidapi
> 
> [1]: https://github.com/signal11/hidapi/blob/a6a622ffb680c55da0de787ff93b80280498330f/libusb/hid.c#L446
> [2]: https://www.silabs.com/community/interface/forum.topic.html/cp2114_linux_sta-RtWg
> 
> Signed-off-by: Dan Walkes <danwalkes@trellis-logic.com>
> Tested-by: Dan Walkes <danwalkes@trellis-logic.com>
> ---
>  package/hidapi/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/hidapi/Config.in b/package/hidapi/Config.in
> index f6a31ba..d02ec23 100644
> --- a/package/hidapi/Config.in
> +++ b/package/hidapi/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_HIDAPI
>  	select BR2_PACKAGE_LIBUSB
>  	select BR2_PACKAGE_LIBGUDEV
>  	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
> +	select BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY if BR2_TOOLCHAIN_USES_GLIBC # runtime UTF conversion support

This does not work for external toolchains.

Maybe just add a comment in the help text saying that fully featured build 
requires BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY.

>  	help
>  	  HIDAPI is a multi-platform library which allows an application
>  	  to interface with USB and Bluetooth HID-Class devices on

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
