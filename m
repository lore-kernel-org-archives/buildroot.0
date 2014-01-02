From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 2 Jan 2014 15:13:54 +0100
Subject: [Buildroot] [PATCH 4/6] toolchain-external: update Linaro
	AArch64 toolchains
In-Reply-To: <20140102142906.6ae2d2d7@skate>
References: <1388143942-1187-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1388143942-1187-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAAXf6LX9ZMaBppPWkRG1me5h5EZ9umV-8MGKWVyN+EbAW4_hjg@mail.gmail.com>
 <20131229185313.43b17aaa@skate> <87ob3zpbqa.fsf@dell.be.48ers.dk>
 <CAAXf6LW+E2KLPs8y88SCYe_eXJOMEAg9rGQyr+vcib+Ttn1cWw@mail.gmail.com>
 <20140102142906.6ae2d2d7@skate>
Message-ID: <CAAXf6LUUY6RW6EDtWpChNUdS=yJCn8wbgEOmEuaNMKg5o+FMUQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Jan 2, 2014 at 2:29 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> Happy new year!

I should have started with that :)
Thanks, same to you and to all buildroot users/developers!

>
> On Thu, 2 Jan 2014 14:17:31 +0100, Thomas De Schampheleire wrote:
>
>> While I agree that the existing patchset could continue in the
>> meanwhile, I think it is worth revisiting the core discussion. For
>> reference, here is the previous discussion:
>> http://lists.busybox.net/pipermail/buildroot/2013-October/080119.html
>>
>> Back then (October) there was not much debate about the idea of only
>> providing sufficiently-different versions of the Linaro toolchains.
>> The biggest problem was how to identify the toolchains so that 'minor'
>> updates can keep the same config symbol (and thus be transparent to
>> users). This boils down to the question: which parts of the toolchain
>> may change to continue considering it as 'the same' toolchain.
>> I think everyone will agree that a new gcc version or a new C library
>> version means a different toolchain.
>> However, what about the other parts? If Linaro updates binutils, do we
>> consider it the same toolchain or not?
>>
>> Based on this we could devise some logical names of the config symbols.
>> Note that this does not mean we can't change our minds later. Suppose
>> we start with the gcc/libc combination as key, and we'd have symbols
>> LINARO_GCC_4_8_GLIBC_2_17
>> LINARO_GCC_4_8_GLIBC_2_18
>> LINARO_GCC_5_0_GLIBC_2_18
>>
>> and suddenly Linaro releases a toolchain with the same gcc and glibc
>> version, but some other change that we consider as significant. Then
>> at that point we can simply introduce a new symbol and keep both, for
>> example:
>> LINARO_GCC_4_8_GLIBC_2_17
>> LINARO_GCC_4_8_GLIBC_2_18
>> LINARO_GCC_5_0_GLIBC_2_18
>> LINARO_GCC_5_0_GLIBC_2_18_OTHER_FEATURE
>>
>> Does this make sense? Did I overlook something?
>
> My personal view on this is that I still don't really understand what
> is the problem with the current naming scheme. If an user upgrades from
> one Buildroot version to another then the version of all components
> *are* changing, without changes to the corresponding Config.in symbol.
> You update Buildroot, then suddenly you get Qt 5.2 instead of Qt 5.1,
> without being notified. At the next Buildroot upgrade, you may still be
> using Qt 5.2, or Qt 5.2.1, or Qt 5.3, or 5.4. You have to verify it.
>
> With Linaro toolchains, if you use Linaro 2013.02 in your Buildroot
> configuration, then update to a new Buildroot version that still has
> Linaro 2013.02, then you will continue to use this toolchain. However,
> if Buildroot has updated a number of Linaro toolchains, and 2013.02 is
> no longer available, you will automatically default to the latest
> Linaro toolchain that exists for your architecture, maybe 2013.06 or
> 2013.07.
>
> What's the difference with Qt? I don't see any, to be honest.

One big difference is that for qt5 you cannot select the version, you
just say "I want qt5".
For the external toolchains, you specify a particular version, out of
a set of provided versions.

The problem arises when we introduce support for a newer version. For
qt5 (and most packages) we simply replace the old version with the new
one. No notification. No migration.
For toolchains (and some other packages) we add the new version, and
typically remove one or more old versions. The question is now: which
toolchains to remove?
- The oldest one? This is the approach taken currently for Linaro toolchains.
- The latest, most similar one?

For Sourcery toolchains, there are versions and patch levels. The
introduction of a toolchain version 2013.11 patchlevel 50 will
overwrite the previous toolchain 2013.11 patchlevel 40 (just an
example). We don't keep two patchlevels of the same toolchain version.
For Linaro, there are no real patchlevels (as far as I understood, I'm
no expert there) but they call everything a new 'version'. Thus, the
Linaro toolchains are released much more frequently than for Sourcery
toolchains. This blend of the version and patchlevel is the cause of
this discussion, I believe.
Two subsequent Linaro releases could be considered as two different
versions, or as one version but different patchlevel (in Sourcery
terminology). The classification used would determine what to do with
the buildroot config symbols (which ones to add and which to remove).

If it's a new 'version' we'd remove the oldest existing version and
add the new one.
If it's a new 'patchlevel', we'd remove the most recent toolchain of
the same 'version' (same combination of most important components) but
different 'patchlevel'.

This approach more or less requires different names of the config
symbols, unless we'd accept that config symbol LINARO_2013.11 could
actually install Linaro 2013.12 (example only).

Best regards,
Thomas
