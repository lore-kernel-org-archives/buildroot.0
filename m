From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Tue, 10 Feb 2009 14:34:25 -0200
Subject: [Buildroot] What's up with the kernel names? (Again)
In-Reply-To: <083a01c98b86$99d10260$f53018ac@Glamdring>
References: <d6cda7730902031749o51818770l1077d71877f9ad33@mail.gmail.com>
	<D071C392448744ECA7A451C54A46ABE6@aeglos>
	<d6cda7730902060631o54f2944rddc0f7cd8278a11a@mail.gmail.com>
	<1234200240.4143.8.camel@elrond.atmel.com>
	<87hc3376b4.fsf@macbook.be.48ers.dk>
	<1234219930.4143.16.camel@elrond.atmel.com>
	<874oz27iry.fsf@macbook.be.48ers.dk>
	<078a01c98b68$c18b47c0$f53018ac@Glamdring>
	<87ab8u5ub5.fsf@macbook.be.48ers.dk>
	<083a01c98b86$99d10260$f53018ac@Glamdring>
Message-ID: <d6cda7730902100834j409c7df8te83d42356957608c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Feb 10, 2009 at 11:50 AM, Ulf Samuelsson
<ulf.samuelsson@atmel.com> wrote:
>> >> Sure, we should try to make sure everything still works, but we also
>> >> HAVE to make it easy to do so - That means among others that the
>> >> various platforms should behave similary.
>> >>
>> Ulf> Each platform in u-boot behaves differently anyway.
>> Ulf> You define the functionality of u-boot in the board header file.
>>
>> Sure, that's why the only sane default is to use the filenames the
>> upstream projects use as that's what people expect.
>>
>> This doesn't mean that we shouldn't provide a setting (like the
>> suffix/prefix thing) to use other names if people want that, but it
>> shouldn't be default.
>
>
> The default IS to use the filenames the upstream projects use.
> You get that by selecting the standard build.
> When you select an "advanced" configuration, you should
> expect things to be a little different, don't you agree?

First of all, that's not fair when you have said earlier that some
platforms (namely avr32) are just unable to build with the "standard"
option, and therefore, there is no choice.
Second of all, I expect to have more choices in advanced, not less.
Third of all, your At91 customers will have the exact same problem had
they choosen the standard build because they also don't want the
forced odd name.

> There is a setting to generate the u-boot autoscript.
> If you use that, you really want the stuff to be compatible
> with the u-boot patches.
> I am OK with using that to set the default filename to the previous
> "complex" file name, and let the
> normal #Image possibly with PREFIX/SUFFIX
> be the default otherwise.
>
> The patches for U-boot are generic and coould be applied
> for any architecture.
>
> The problem I am trying to solve is with newbies calling in wanting help
> with the configuration of u-boot.
> That can be done with a short email instead of 30-60
> minutes conversation, with this fully working.
>

I found this on the patches:
+       setenv("linux",
MK_STR(BOARD_NAME)"-linux-"MK_STR(KERNEL_VERSION)"-"MK_STR(DATE)".gz");

That was broken to begin with. It has an hardcoded filename extension,
while the previous "naming convention" allowed for other different
extensions. The proper way of doing that would be:

+       setenv("linux",         MK_STR(KERNEL_LINUX26_NAME));

even without my changes! Only then it would be set to the kernel name,
whatever it might be. After that just echo that make variable to the
header where you previously defined the other macros.
Now, if we change the patch like above, at least this part, would work
even with standard build since I've made those variables have the same
name in both standard and advanced build.

While still on the subject, why haven't the patches been submitted
upstream? Last time you said that the At91 had given up because u-boot
devs were unavailable. Then, after that, avr32 team were able to get
their patches upstream. Why haven't At91 tried again?

We probably wouldn't be having this conversation had patches been
submited upstream, because they would not accept that and it would
have been fixed then.

I think I can edit the patch manually and have it build, but I can't
download it to a target, unless you want to ship a board and
programming tool to Brazil (with taxes to be collected from sender,
otherwise I will just refuse the package).

Kind Regards,
    Thiago A. Correa
