From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 14 Feb 2012 10:22:49 +0100
Subject: [Buildroot] [PATCH v3-resend 2/2] new program:
	usb_modeswitch_data
In-Reply-To: <201202132240.11019.arnout@mind.be>
References: <1329073793-524-1-git-send-email-jwoltz@gmail.com>
 <201202122329.36300.arnout@mind.be>
 <CAAXf6LVC7C3mWLhvkFWONt3=4M=29wysdbGiw7nkRdmgSnBGWw@mail.gmail.com>
 <201202132240.11019.arnout@mind.be>
Message-ID: <CAAXf6LWabKF4AGjg9aZsAOJ68_6avWMwBF+dpk4_2vac6nKwKA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 13, 2012 at 10:40 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On Monday 13 February 2012 09:03:23 Thomas De Schampheleire wrote:
>> On Sun, Feb 12, 2012 at 11:29 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> > On Sunday 12 February 2012 20:09:53 J.C. Woltz wrote:
>> >> usb_modeswitch_data provides udev rules for usb VID/PID combinations to
>> >> switch usb deices from their default mode into a more useable mode. The
>> >> default mode usually is a cdrom with installation software that is of
>> >> little use in an embedded linux situation
>> >>
>> >> Signed-off-by: J.C. Woltz <jwoltz@gmail.com>
>> >>
>> >> Fix usb_modeswitch_data to depend usb_modeswitch
>> >> add $(TARGET_CONFIGURE_OPTS) to be consistent with usb_modeswitch
>> >
>> > ?Err... ?You just changed it into TARGET_CONFIGURE_ENV in usb_modeswitch...
>> >
>> > [snip]
>> >> +++ b/package/usb_modeswitch_data/Config.in
>> >> @@ -0,0 +1,8 @@
>> >> +config BR2_PACKAGE_USB_MODESWITCH_DATA
>> >> + ? ? depends on BR2_PACKAGE_USB_MODESWITCH
>> >
>> > ?Can we have a third opinion on whether this should be depends or select?
>> >
>>
>> Arnout,
>> Do I understand correctly from this that you prefer 'select'? Could
>> you expand on this?
>
> ?I explained that in my reply to the v1 of the patch:
>
> "That's not entirely true. ?select itself is transitive; it just
> doesn't check if the select'd item depends on something. ?But it will
> recursively select other packages. ?So with the select statement,
> USB_MODESWITCH_DATA will select USB_MODESWITCH, which will select
> LIBUSB_COMPAT, which will select LIBUSB.
>
> [snip]
>
> ?I think the general trend is to prefer select rather than depends when
> they are separate packages - precisely because this avoids the potential
> inconsistencies you mentioned. ?Take libusb-compat, for instance. ?It's
> obviously an extension of libusb, but because libusb-compat selects libusb,
> it makes it easy and safe for other packages to select libusb-compat."

Sorry, I missed that reply.

Although I understand your reasoning, I look at it from a different angle.
Package usb_modeswitch_data doesn't make sense if you don't have
usb_modeswitch. No-one will think 'Hey, I want package
usb_modeswitch_data' without realizing he should select usb_modeswitch
first. Therefore it makes no sense in showing the configuration option
unless usb_modeswitch has been selected.. That's why I think that a
'depends on' relation is more appropriate.

The fact that usb_modeswitch in turn 'selects' libusb and
libusb-compat is a little different. For users that want
usb_modeswitch, the relation to libusb/libusb-compat is probably not
clear, and so 'depends on' is not appropriate here.

By using 'depends on' for usb_modeswitch_data, the dependencies
between the various packages are correctly expressed.

On the other hand, due to the libusb/libusb-compat select from
usb_modeswitch, there is a problem (independent of whether
usb_modeswitch_data uses select or depends). Suppose libusb needs to
depend on libsomething. Then, every package that selects libusb, needs
to also select libsomething from that point onwards.
This shows that the usage of select should be limited as much as
possible. The longer the select chain, the more risk you have of
needing to add extra selects in the future.

I agree, input from other developers is very welcome here...

Best regards ,
Thomas
