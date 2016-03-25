From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 25 Mar 2016 23:27:36 +0100
Subject: [Buildroot] syslinux using host compiler.
In-Reply-To: <20160324151201.7e05fd28@free-electrons.com>
References: <20160324103941.GM22286@hermes.click-hack.org>
 <20160324135053.0d3b6b49@free-electrons.com>
 <20160324130856.GQ22286@hermes.click-hack.org>
 <20160324151201.7e05fd28@free-electrons.com>
Message-ID: <56F5BB58.1090702@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/24/16 15:12, Thomas Petazzoni wrote:
> Hello,
>
> On Thu, 24 Mar 2016 14:08:56 +0100, Gilles Chanteperdrix wrote:
>
>>> For grub2, it is actually using the target compiler, see the comment in
>>> grub2.mk:
>>
>> Ok, I thought I saw grub selected BR2_HOSTARCH_NEEDS_IA32_COMPILER
>> too, must I have misread.
>
> grub yes, not grub2. But your original comment was about grub2, hence I
> looked at grub2. But you are right, grub is like syslinux, we use the
> host compiler.

  One reason for this difference is that the build system was improved a lot 
with grub2. grub1 made it impossible to distinguish host from target build, and 
it does need to build some host tools.

[snip]
>>> The reason why we're using the host compiler rather than the target
>>> compiler is because syslinux must be built as 32-bits x86 code, even if
>>> your target system is x86_64.
>>
>> Yes, but AFAIK, gcc for x86_64 always supports the -m32 switch. To
>> build 32 bits host binaries, you need a multilib installation with a
>> 32 bits glibc, but a bootloader should not use anything in the glibc.
>
> Completely agree with the theory. In practice, I remember seeing some
> problems, like it was anyway trying to build some actual user-space
> applications with -m32. But (1) my analysis at the time might have been
> wrong and (2) syslinux was upgraded several times since then so maybe
> they have changed/fixed things. But that definitely doesn't mean I'm
> not interested in seeing patches improving this stuff.

  I remember I looked at it as well at the time, I think I even posted some 
patches that attempted to get a working syslinux using the cross-compiler, but 
it failed in some cases. This is from memory, consult the mailing list archives 
to be really sure.

  It's possible that it was just a matter of the -m elf_i386, which I wouldn't 
have thought of at the time (it's three years ago, I was still young and 
innexperienced :-P ).


  Regards,
  Arnout

>
>>>> I am using an x86_64 toolchain generated with ct-ng, did not enable
>>>> multilib, and syslinux seems to have no problem compiling with that
>>>> toolchain, which seems normal, since the boot code should not be
>>>> using the libc anyway.
>>>
>>> Are you sure you're using this target compiler to build syslinux, and
>>> not your host compiler? Back in 2014, when commit
>>> 09e7b4c89159a3e48f463b0a22e649c4fc12f4b3 was done, it wouldn't build
>>> with a x86-64 only compiler.
>>
>> Yes, I am sure of it. The only "trick" I had to apply was to force
>> LD="$(TARGET_LD) -m elf_i386". Now buildroot complains later because
>> isohybrid in the host directory is not compiled with the proper
>> rpath, but I guess it means we need host-syslinux.
>
> OK.
>
>>> If that actually works, then patches are welcome. But in this case, we
>>> will indeed probably need separate host-syslinux and syslinux packages,
>>> as you suggested.
>>
>> Yes. Ok, will work on the patch.
>
> Great!
>
> Thomas
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
