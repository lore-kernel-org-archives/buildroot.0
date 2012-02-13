From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 13 Feb 2012 22:40:10 +0100
Subject: [Buildroot] [PATCH v3-resend 2/2] new program:
	usb_modeswitch_data
In-Reply-To: <CAAXf6LVC7C3mWLhvkFWONt3=4M=29wysdbGiw7nkRdmgSnBGWw@mail.gmail.com>
References: <1329073793-524-1-git-send-email-jwoltz@gmail.com>
 <201202122329.36300.arnout@mind.be>
 <CAAXf6LVC7C3mWLhvkFWONt3=4M=29wysdbGiw7nkRdmgSnBGWw@mail.gmail.com>
Message-ID: <201202132240.11019.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 13 February 2012 09:03:23 Thomas De Schampheleire wrote:
> On Sun, Feb 12, 2012 at 11:29 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> > On Sunday 12 February 2012 20:09:53 J.C. Woltz wrote:
> >> usb_modeswitch_data provides udev rules for usb VID/PID combinations to
> >> switch usb deices from their default mode into a more useable mode. The
> >> default mode usually is a cdrom with installation software that is of
> >> little use in an embedded linux situation
> >>
> >> Signed-off-by: J.C. Woltz <jwoltz@gmail.com>
> >>
> >> Fix usb_modeswitch_data to depend usb_modeswitch
> >> add $(TARGET_CONFIGURE_OPTS) to be consistent with usb_modeswitch
> >
> >  Err...  You just changed it into TARGET_CONFIGURE_ENV in usb_modeswitch...
> >
> > [snip]
> >> +++ b/package/usb_modeswitch_data/Config.in
> >> @@ -0,0 +1,8 @@
> >> +config BR2_PACKAGE_USB_MODESWITCH_DATA
> >> +     depends on BR2_PACKAGE_USB_MODESWITCH
> >
> >  Can we have a third opinion on whether this should be depends or select?
> >
> 
> Arnout,
> Do I understand correctly from this that you prefer 'select'? Could
> you expand on this?

 I explained that in my reply to the v1 of the patch:

"That's not entirely true.  select itself is transitive; it just
doesn't check if the select'd item depends on something.  But it will
recursively select other packages.  So with the select statement,
USB_MODESWITCH_DATA will select USB_MODESWITCH, which will select
LIBUSB_COMPAT, which will select LIBUSB.

[snip]

 I think the general trend is to prefer select rather than depends when
they are separate packages - precisely because this avoids the potential
inconsistencies you mentioned.  Take libusb-compat, for instance.  It's
obviously an extension of libusb, but because libusb-compat selects libusb,
it makes it easy and safe for other packages to select libusb-compat."


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
