From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 05 Dec 2013 18:49:48 +0100
Subject: [Buildroot] [PATCH 1/2] qemu-system: new host package
In-Reply-To: <529F24A4.6030005@zacarias.com.ar>
References: <1386117649-7119-1-git-send-email-gustavo@zacarias.com.ar>	<1386117649-7119-2-git-send-email-gustavo@zacarias.com.ar>	<20131204094419.6d4d4279@skate>	<529EFEBA.8040103@zacarias.com.ar>
 <20131204133306.7e7e8e07@skate> <529F24A4.6030005@zacarias.com.ar>
Message-ID: <52A0BCBC.5000008@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/12/13 13:48, Gustavo Zacarias wrote:
> On 12/04/2013 09:33 AM, Thomas Petazzoni wrote:
>
>> Yes, I agree, the user mode emulation should probably be removed. It
>> simply cannot work properly, because we have no way of guaranteeing
>> that the kernel headers used for the target toolchain are older than
>> the kernel running on the system.

  It's not possible to do it in Config.in, but it's easy to do during the 
build: compare /usr/include/linux/version.h with 
$(STAGING_DIR)/usr/include/linux/version.h

  Or am I missing something? I admit, it assumes that the distro installs 
kernel headers corresponding to the running kernel (but a distro that 
doesn't do that is pretty broken), and it assumes that you'll run qemu on 
the build machine.


>> And even if we want to keep the user mode emulation, I think there
>> should be one single package. Nothing prevents from having sub-options
>> to enable either the user mode or system mode emulation, or both, or to
>> have a version selection.
>
> A single package prevents different versions of -user and -system (at
> least in a nice way).

  We do it for gcc, binutils, ... and it doesn't look that ugly to me. 
It's mostly the Config.in part that looks ugly.


> Sometimes the latest version of qemu doesn't play nice with some kernel
> versions because of newer OpenBIOS/other BIOSes versions breaking with
> newer kernels - it's a common scenario for non-x86/x86_64.
> And there may be some particular need for -user to be a newer or
> different version than system, though i can't come up with any idea of why.
> At the moment i don't think -user is useful for anything in particular
> because of the limitations you wrote.
> Problem is building two different versions in a single package wouldn't
> be all that great, for all intents and purposes they would be two
> packages anyway.

  The two packages would be 90% identical (except for needless 
divergences, like one using generic-package and the other using 
autotools-package). So I don't agree they would be two packages. The host 
and the target build of e.g. python differ more than these two.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
