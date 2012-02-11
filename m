From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 11 Feb 2012 17:41:05 +0100
Subject: [Buildroot] [PATCH] new program: usb_modeswitch_data
	Signed-off-by: J.C. Woltz <jwoltz@gmail.com>
In-Reply-To: <CAAXf6LXHDCgVzp+OpHN8BTsdx2X418ABum=PZS172F4dGktiSA@mail.gmail.com>
References: <1328831497-18455-1-git-send-email-jwoltz@gmail.com>
 <CAC78GpdRuVrqsF5n0Xn5MTBJ7vSPDua1rAAwur5tpdxyfwfrFw@mail.gmail.com>
 <CAAXf6LXHDCgVzp+OpHN8BTsdx2X418ABum=PZS172F4dGktiSA@mail.gmail.com>
Message-ID: <201202111741.05348.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 10 February 2012 15:46:05 Thomas De Schampheleire wrote:
>  I thought a select was appropriate since
> > usb_modeswitch_data is not vital for usb_modeswitch, but usb_modeswitch_data
> > is nice when using udev.
> 
> +config BR2_PACKAGE_USB_MODESWITCH_DATA
> +       select BR2_PACKAGE_USB_MODESWITCH
> 
> What you express with a select like this is that when you select
> 'usb_modeswitch_data' (which can be always selected), the
> configuration script should automatically select usb_modeswitch for
> you. The problem with this approach is that when usb_modeswitch
> depends on something, it will not enable these dependencies.
> See http://kernel.org/doc/Documentation/kbuild/kconfig-language.txt
> for more information.

 That's not entirely true.  select itself is transitive; it just
doesn't check if the select'd item depends on something.  But it will
recursively select other packages.  So with the select statement,
USB_MODESWITCH_DATA will select USB_MODESWITCH, which will select
LIBUSB_COMPAT, which will select LIBUSB.


> Since usb_modeswitch_data only makes sense when usb_modeswitch is
> already enabled (at least that's what I assume), you could better use:
> 
> config BR2_PACKAGE_USB_MODESWITCH_DATA
>         depends on BR2_PACKAGE_USB_MODESWITCH
> 
> With this expression, usb_modeswitch_data will not be visible unless
> usb_modeswitch has already been enabled. This makes sense. Any
> dependency that usb_modeswitch has will also be met when
> usb_modeswitch_data has been selected.

 I think the general trend is to prefer select rather than depends when
they are separate packages - precisely because this avoids the potential
inconsistencies you mentioned.  Take libusb-compat, for instance.  It's
obviously an extension of libusb, but because libusb-compat selects libusb,
it makes it easy and safe for other packages to select libusb-compat.

 Sorry for the inconsistent feedback, J.C.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
