From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 30 Sep 2012 16:59:48 +0200
Subject: [Buildroot] [PATCH v3 1/2] pcsc-lite: new package
In-Reply-To: <1348212739-32093-1-git-send-email-waldemar.rymarkiewicz@tieto.com>
References: <1348212739-32093-1-git-send-email-waldemar.rymarkiewicz@tieto.com>
Message-ID: <50685E64.8040908@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/09/12 09:32, Waldemar Rymarkiewicz wrote:
> Middleware to access a smart card using SCard API (PC/SC).
>
> http://pcsclite.alioth.debian.org/
>
> Signed-off-by: Waldemar Rymarkiewicz<waldemar.rymarkiewicz@tieto.com>
[snip]
> +config BR2_PACKAGE_PCSC_LITE_FORCE_LIBUSB
> +	bool "use libusb"
> +	depends on !BR2_PACKAGE_UDEV
> +	select BR2_PACKAGE_LIBUSB

  This one is missing a help text.

[snip]
> +# - libudev and libusb are optional
> +# - libudev and libusb can't be used together
> +# - libudev has a priority over libusb

  Well put!

> +
> +ifeq ($(BR2_PACKAGE_UDEV),y)
> +PCSC_LITE_CONF_OPT += --enable-libudev --disable-libusb
> +PCSC_LITE_DEPENDENCIES += udev
> +else
> +ifeq ($(BR2_PACKAGE_LIBUSB),y)
> +PCSC_LITE_CONF_OPT += --enable-libusb --disable-libudev
> +PCSC_LITE_DEPENDENCIES += libusb
> +else
> +PCSC_LITE_CONF_OPT += --disable-libusb --disable-libudev
> +endif
> +endif
> +
> +ifeq ($(PACKAGE_PCSC_LITE_DEBUGATR),y)
> +PCSC_LITE_CONF_OPT += --enable-debugatr
> +endif
> +
> +ifeq ($(PACKAGE_PCSC_LITE_EMBEDDED),y)
> +PCSC_LITE_CONF_OPT += --enable-embedded
> +endif

  There is also a --enable-usbdropdir which defaults to
/usr/local/lib/pcsc/drivers.  We avoid using /usr/local, so could
you make that point to /usr/lib/pcsc/drivers?  Or is it anyway
not used?


  Regards,
  Arnout

> +
> +$(eval $(call autotools-package))

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
