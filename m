From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Tue, 10 Feb 2009 18:06:37 -0200
Subject: [Buildroot] What's up with the kernel names? (Again)
In-Reply-To: <264FEF6125FE485C9E19C343987ADD0F@aeglos>
References: <d6cda7730902031749o51818770l1077d71877f9ad33@mail.gmail.com>
	<1234200240.4143.8.camel@elrond.atmel.com>
	<87hc3376b4.fsf@macbook.be.48ers.dk>
	<1234219930.4143.16.camel@elrond.atmel.com>
	<874oz27iry.fsf@macbook.be.48ers.dk>
	<078a01c98b68$c18b47c0$f53018ac@Glamdring>
	<87ab8u5ub5.fsf@macbook.be.48ers.dk>
	<083a01c98b86$99d10260$f53018ac@Glamdring>
	<d6cda7730902100834j409c7df8te83d42356957608c@mail.gmail.com>
	<264FEF6125FE485C9E19C343987ADD0F@aeglos>
Message-ID: <d6cda7730902101206k8dfe134ief7acc668a1ea9cd@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

   I think I finally understand your use case. But I still think you
are getting the requirement backward.

On Tue, Feb 10, 2009 at 4:50 PM, Ulf Samuelsson
<ulf.samuelsson@atmel.com> wrote:
>> Second of all, I expect to have more choices in advanced, not less.
>> Third of all, your At91 customers will have the exact same problem had
>> they choosen the standard build because they also don't want the
>> forced odd name.
>
> That is an assumption you make.
> I regularily discuss pro's and con's with buildroot with end customers.
> There are a number of things brought up, but, so far, never the linux file
> name.

Well, we buy quite a lot from Atmel, so you can count me as a first. :)

> The key requirement for newbies is to load a kernel/rootfs to the target
> with minimum effort. The current "cleanups" to "sane" defaults is clearly
> making life harder for newbies.

Agreed, and if the kernel is named uImage, there is no need for
setenv's or special undocumented commands.

> This category does NOT want to change a lot of options from (in)sane
> defaults.
> They want (at the most) to do
>
> $ make userconfig                ; setup user specific defaults.
> $ make <board>_config       ; setup board
> $ make                                 ; build board
> $ make install                        ; program target with resulting files.

If it was avr32, make install could simply invoke avr32program and
upload the rootfs to the target. Being uImage a static name, uboot
would never need to be touched, they could simply wait for the board
to load. Sure it's slow, but it's also easy.
AT91 might have something similar, I don't know. I evaluated Atmel's
ARMs once, but that J-Link programmer simply never worked. Might have
been a bad board, since it was in another customer before, I don't
know.

> and then connect to the target with a terminal and see linux boot.
> *I* want it to be easy, or they will phone me and ask for help,
> which means I can handle less projects.

Same here, but with a different reason. I'm on the other end of the
problem, I'm a software developer.
Whenever I need to test my code on the board, I want names not to
change. I know the previous build was flawed, or in the case of the
kernel, most likely is just the same binary. I need to rerun buildroot
when I change my code, so it links with all the system libs, but the
side effect is that I get a new kernel every day, except that they are
exactly the same binary that was just relinked because it's name
changed from yesterday.

> We are far from this point, but with the u-boot patches I can easily
> support people over the phone without worrying about
> having the odd environment variable misspelled or so.

Just don't create odd environment variables, then it can never be mispelled.

> ---------------
> Once they have passed a certain point and are confident with buildroot
> then the requirements change.
>
> The main complaint of buildroot is lack of stability.
> People do not want to upgrade and retest just because someone feels
> that this is a good idea, they want 100% control over when upgrades happen.
> At the same time they would like to work in a project which is maintained.
>
> With buildroot you are forced to continuosly upgrade or you lose support
> and it is getting worse.

That's what Peter is trying to fix. And I hope this goes well, because
I would like to see buildroot being stable. I remember that when I
started using buildroot, the toolchain was broken every 100 or so
revisions, and it was almost impossible to work. Try explaining that
to your management.

> There is complaints that there is no support for proprietary functions.
> If you want to add your company logo at boot, this is certainly
> not something that should  be in the trunk, but still people
> want this to be easy to include in the build.
>

That's the case of the silent u-boot build support, that I have added
a while back. We didn't want the console spilling out information as
we needed to use that U(S)ART for other purposes. It's not nice when
your custommer turns on your device and it sends to a printer several
pages of boot messages.

> No, because the whole idea of the patches is that you can modify the
> different parts of the filename afterwards.
>
> If the kernel name is:
>
> at91sam9260ek-linux-2.6.28-20081001.gz
>
> then
> "setenv kernel_version 2.6.28.1 ; os"
>
> will change the kernel name to
>
> at91sam9260ek-linux-2.6.28.1-20081001.gz
>
> Your patch will FIX the kernel name to whatever was the name at u-boot
> build.

Yeah, that's what I thought when I saw a file named factory defaults.
You could either have ppl build with a suffix that is predetermined such as:
at91sam9260ek-2.6.28-20081001 and get uImage-at91sam9260ek-2.6.28-20081001

And hardcode that do u-boot (as software developer, I find it horrible)

Or, you could drop all that complication and use uImage, or if you
really want that approach, make it better and introduce a command to
ask for kernel version, then generates it using strstr to find the
older entry, and therefore, it's able to cope with different naming
schemes, whatever the customer throws at it.

>>
>> While still on the subject, why haven't the patches been submitted
>> upstream? Last time you said that the At91 had given up because u-boot
>> devs were unavailable. Then, after that, avr32 team were able to get
>> their patches upstream. Why haven't At91 tried again?
>
> You can send a mail to the at91 team and ask.

Does support.atmel.no makes any difference? I had a ticket there
asking for the avr32 patches to be submited to FSF over a year ago,
and we all know how that turned out so far.


Kind Regards,
    Thiago A. Correa
