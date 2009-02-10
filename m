From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 10 Feb 2009 19:50:11 +0100
Subject: [Buildroot] What's up with the kernel names? (Again)
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
	<d6cda7730902100834j409c7df8te83d42356957608c@mail.gmail.com>
Message-ID: <264FEF6125FE485C9E19C343987ADD0F@aeglos>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Subject: Re: [Buildroot] What's up with the kernel names? (Again)


> Hi,
>
> On Tue, Feb 10, 2009 at 11:50 AM, Ulf Samuelsson
> <ulf.samuelsson@atmel.com> wrote:
>>> >> Sure, we should try to make sure everything still works, but we also
>>> >> HAVE to make it easy to do so - That means among others that the
>>> >> various platforms should behave similary.
>>> >>
>>> Ulf> Each platform in u-boot behaves differently anyway.
>>> Ulf> You define the functionality of u-boot in the board header file.
>>>
>>> Sure, that's why the only sane default is to use the filenames the
>>> upstream projects use as that's what people expect.
>>>
>>> This doesn't mean that we shouldn't provide a setting (like the
>>> suffix/prefix thing) to use other names if people want that, but it
>>> shouldn't be default.
>>
>>
>> The default IS to use the filenames the upstream projects use.
>> You get that by selecting the standard build.
>> When you select an "advanced" configuration, you should
>> expect things to be a little different, don't you agree?
>
> First of all, that's not fair when you have said earlier that some
> platforms (namely avr32) are just unable to build with the "standard"
> option, and therefore, there is no choice.

You can build, but you do not get the latest patches.

> Second of all, I expect to have more choices in advanced, not less.
> Third of all, your At91 customers will have the exact same problem had
> they choosen the standard build because they also don't want the
> forced odd name.

That is an assumption you make.
I regularily discuss pro's and con's with buildroot with end customers.
There are a number of things brought up, but, so far, never the linux file 
name.

The key requirement for newbies is to load a kernel/rootfs to the target
with minimum effort. The current "cleanups" to "sane" defaults is clearly
making life harder for newbies.

This category does NOT want to change a lot of options from (in)sane 
defaults.
They want (at the most) to do

$ make userconfig                ; setup user specific defaults.
$ make <board>_config       ; setup board
$ make                                 ; build board
$ make install                        ; program target with resulting files.

and then connect to the target with a terminal and see linux boot.
*I* want it to be easy, or they will phone me and ask for help,
which means I can handle less projects.

We are far from this point, but with the u-boot patches I can easily
support people over the phone without worrying about
having the odd environment variable misspelled or so.

---------------
Once they have passed a certain point and are confident with buildroot
then the requirements change.

The main complaint of buildroot is lack of stability.
People do not want to upgrade and retest just because someone feels
that this is a good idea, they want 100% control over when upgrades happen.
At the same time they would like to work in a project which is maintained.

With buildroot you are forced to continuosly upgrade or you lose support
and it is getting worse.

There is complaints that there is no support for proprietary functions.
If you want to add your company logo at boot, this is certainly
not something that should  be in the trunk, but still people
want this to be easy to include in the build.



>
>> There is a setting to generate the u-boot autoscript.
>> If you use that, you really want the stuff to be compatible
>> with the u-boot patches.
>> I am OK with using that to set the default filename to the previous
>> "complex" file name, and let the
>> normal #Image possibly with PREFIX/SUFFIX
>> be the default otherwise.
>>
>> The patches for U-boot are generic and coould be applied
>> for any architecture.
>>
>> The problem I am trying to solve is with newbies calling in wanting help
>> with the configuration of u-boot.
>> That can be done with a short email instead of 30-60
>> minutes conversation, with this fully working.
>>
>
> I found this on the patches:
> +       setenv("linux",
> MK_STR(BOARD_NAME)"-linux-"MK_STR(KERNEL_VERSION)"-"MK_STR(DATE)".gz");
>
> That was broken to begin with. >

Considering that ?ou only AFAIK want to  build uImage's for U-Boot,
this is a minor restriction.

> It has an hardcoded filename extension,
> while the previous "naming convention" allowed for other different
> extensions. The proper way of doing that would be:
>
> +       setenv("linux",         MK_STR(KERNEL_LINUX26_NAME));
>

No, because the whole idea of the patches is that you can modify the
different parts of the filename afterwards.

If the kernel name is:

at91sam9260ek-linux-2.6.28-20081001.gz

then
"setenv kernel_version 2.6.28.1 ; os"

will change the kernel name to

at91sam9260ek-linux-2.6.28.1-20081001.gz

Your patch will FIX the kernel name to whatever was the name at u-boot 
build.

> even without my changes! Only then it would be set to the kernel name,
> whatever it might be. After that just echo that make variable to the
> header where you previously defined the other macros.
> Now, if we change the patch like above, at least this part, would work
> even with standard build since I've made those variables have the same
> name in both standard and advanced build.

As you see from above - NO.

>
> While still on the subject, why haven't the patches been submitted
> upstream? Last time you said that the At91 had given up because u-boot
> devs were unavailable. Then, after that, avr32 team were able to get
> their patches upstream. Why haven't At91 tried again?

You can send a mail to the at91 team and ask.

>
> We probably wouldn't be having this conversation had patches been
> submited upstream, because they would not accept that and it would
> have been fixed then.
>
> I think I can edit the patch manually and have it build, but I can't
> download it to a target, unless you want to ship a board and
> programming tool to Brazil (with taxes to be collected from sender,
> otherwise I will just refuse the package).

I can test any binary, but if it looks like the one you send, then that is 
broken.

>
> Kind Regards,
>    Thiago A. Correa
>
