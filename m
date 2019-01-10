From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 10 Jan 2019 07:56:00 +0200
Subject: [Buildroot] openocd CMSIS-DAP support
In-Reply-To: <CADjezmZq4MSvxbGm9HAHxAGN2O5F1XZrVRRoGw9ehV-i=CUSyg@mail.gmail.com>
References: <CADjezmZq4MSvxbGm9HAHxAGN2O5F1XZrVRRoGw9ehV-i=CUSyg@mail.gmail.com>
Message-ID: <87a7k9hx8v.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt,

On Mon, Jan 07 2019, mattwood wrote:
> I need CMSIS-DAP support in openOCD on my target build.  I noticed the
> comment in openocd.mk explaining that CMSIS-DAP support is disabled for the
> host build because HIDAPI is not supported in buildroot.
>
> However, I see cmsis-dap support in the target options of openocd as well
> as HIDAPI support for target buids.
>
> I was able to add cmsis-dap support for the target easily with the patch
> below.
>
> Is there a reason why the CMSIS-DAP Adapter option in Config.in was removed
> or never added for the target build?  If not I'll submit this but wanted to
> make sure I wasn't missing something.

This patch looks correct to me.

Confusingly, commit aa441aa84c38 notes that CMSIS_DAP requires hidapi
which was not packaged in Buildroot at the time (Dec 2014). Still that
commit added a dangling --enable-cmsis-dap that could never be enabled
because BR2_PACKAGE_OPENOCD_CMSIS_DAP is not defined. Your patch fixes
that.

One more comment below.

> diff --git a/package/openocd/Config.in b/package/openocd/Config.in
> index 6cba7a04c8..2145ac72eb 100644
> --- a/package/openocd/Config.in
> +++ b/package/openocd/Config.in
> @@ -9,6 +9,16 @@ if BR2_PACKAGE_OPENOCD
>
>  comment "Adapters"
>
> +config BR2_PACKAGE_OPENOCD_CMSIS_DAP
> +
> +       bool "CMSIS-DAP compliant debuggers"
> +       depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
> +       select BR2_PACKAGE_LIBUSB
> +       select BR2_PACKAGE_HIDAPI

You forgot the BR2_PACKAGE_HIDAPI dependencies:

	depends on BR2_PACKAGE_HAS_UDEV
	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL

Actually the NPTL dependency is stronger than plain threads
dependency. So you can drop the latter.

baruch

> +       help
> +         Enable support for CMSIS-DAP compliant
> +         debuggers (i.e Atmel/Microchip EDBG, etc.)
> +
>  config BR2_PACKAGE_OPENOCD_FTDI
>         bool "MPSSE mode of FTDI based devices"
>         depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
> diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
> index 9d2576ceeb..a4e7a26921 100644
> --- a/package/openocd/openocd.mk
> +++ b/package/openocd/openocd.mk
> @@ -29,7 +29,8 @@ OPENOCD_DEPENDENCIES = \
>         $(if $(BR2_PACKAGE_LIBFTDI1),libftdi1) \
>         $(if $(BR2_PACKAGE_LIBUSB),libusb) \
>         $(if $(BR2_PACKAGE_LIBUSB_COMPAT),libusb-compat) \
> -       $(if $(BR2_PACKAGE_LIBHID),libhid)
> +       $(if $(BR2_PACKAGE_LIBHID),libhid) \
> +       $(if $(BR2_PACKAGE_HIDAPI),hidapi)
>
>  # Adapters
>  OPENOCD_CONF_OPTS += \

--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
