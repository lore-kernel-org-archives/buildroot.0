From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 10 Feb 2012 15:46:05 +0100
Subject: [Buildroot] [PATCH] new program: usb_modeswitch_data
 Signed-off-by: J.C. Woltz <jwoltz@gmail.com>
In-Reply-To: <CAC78GpdRuVrqsF5n0Xn5MTBJ7vSPDua1rAAwur5tpdxyfwfrFw@mail.gmail.com>
References: <1328831497-18455-1-git-send-email-jwoltz@gmail.com>
 <CAAXf6LUeHr4tVnpKHCeHvfTJnO2jdJT=2_O40TLnY_s533S7Jg@mail.gmail.com>
 <CAC78GpdRuVrqsF5n0Xn5MTBJ7vSPDua1rAAwur5tpdxyfwfrFw@mail.gmail.com>
Message-ID: <CAAXf6LXHDCgVzp+OpHN8BTsdx2X418ABum=PZS172F4dGktiSA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 10, 2012 at 3:21 PM, J.C. Woltz <jwoltz@gmail.com> wrote:
>
>
> On Fri, Feb 10, 2012 at 2:37 AM, Thomas De Schampheleire
> <patrickdepinguin+buildroot@gmail.com> wrote:
>>
>> Hi,
>>
>> On Fri, Feb 10, 2012 at 12:51 AM, J.C. Woltz <jwoltz@gmail.com> wrote:
>> > From: "J.C. Woltz" <jwoltz@gmail.com>
>>
>> You don't need the From: line.
>> Instead, the Signed-off-by: should appear here, and not in the Subject
>> line.
>
>
> I'm sorry, I thought I used the -s switch. I'll look into not getting the
> from line.
>
>>
>>
>> I think a 'depends on' clause is more appropriate than 'select' here.
>>
>> As a general rule, the help text should contain the URL to the project.
>
>
> I'll fix the URL. I thought a select was appropriate since
> usb_modeswitch_data is not vital for usb_modeswitch, but usb_modeswitch_data
> is nice when using udev.

+config BR2_PACKAGE_USB_MODESWITCH_DATA
+       select BR2_PACKAGE_USB_MODESWITCH

What you express with a select like this is that when you select
'usb_modeswitch_data' (which can be always selected), the
configuration script should automatically select usb_modeswitch for
you. The problem with this approach is that when usb_modeswitch
depends on something, it will not enable these dependencies.
See http://kernel.org/doc/Documentation/kbuild/kconfig-language.txt
for more information.

Since usb_modeswitch_data only makes sense when usb_modeswitch is
already enabled (at least that's what I assume), you could better use:

config BR2_PACKAGE_USB_MODESWITCH_DATA
        depends on BR2_PACKAGE_USB_MODESWITCH

With this expression, usb_modeswitch_data will not be visible unless
usb_modeswitch has already been enabled. This makes sense. Any
dependency that usb_modeswitch has will also be met when
usb_modeswitch_data has been selected.


>
>>
>> I know that it's not yet the case for many patches in the buildroot
>> tree, but patches should also have a short description at the top, and
>> a Signed-off-by: clause.
>>
>
> I can add a description. I thought I used -s, but I will make sure I do. Is
> there any other changes I should make. I am not a programmer or developer,
> but trying to help where I can.

It's nice to have people like you contribute changes, thanks for that.
I reviewed your patch and it looks good apart from the things I
mentioned, but I have not tested it.

I suggest you send it again after fixing my comments. Maybe other
people have further comments.

By the way, you may be interested in using a version control system
like git or mercurial for managing your buildroot developments. This
will make it easier to generate and mail patches.

Best regards,
Thomas
