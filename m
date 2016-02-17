From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 17 Feb 2016 23:41:14 +0100
Subject: [Buildroot] [PATCH 1/2] package/Makefile.in: append endianness
 argument to TARGET_LD for MIPS
In-Reply-To: <20160217221313.439547e4@free-electrons.com>
References: <1455728874-47789-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160217221313.439547e4@free-electrons.com>
Message-ID: <56C4F70A.8060506@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17-02-16 22:13, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
> 
> On Wed, 17 Feb 2016 17:07:53 +0000, Vicente Olivert Riera wrote:
>> We don't use a wrapper for ld in Buildroot like we do for gcc, so when
>> using ld for linking (instead of gcc) the process can fail if the
>> appropriate arguments are not passed to it. For instance, this happens
>> when building perf (Linux -> Linux Kernel Tools -> perf) for MIPS little
>> endian, and this is how the error message looks like:
[snip]
>> +# Append the endianness argument to ld for MIPS architecture in order to
>> +# avoid problems like this one when using ld instead of gcc for linking:
>> +# mips-linux-gnu-ld: failed to merge target specific data of file foo.o
>> +# mips-linux-gnu-ld: foo.o: compiled for a little endian system and
>> +# target is big endian
>> +ifeq ($(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el),y)
>> +ifeq ($(BR2_ENDIAN),"BIG")
>> +TARGET_LD += -EB
>> +else
>> +TARGET_LD += -EL
>> +endif
>> +endif
> 
> This is really an horrible fix IMO. First because TARGET_LD is only
> meant to contain the path to the linker, and not additional flags.
> Additional flags should go in TARGET_LDFLAGS.
> 
> And secondly because programs should not use ld directly for linking,
> but gcc. Remember Vicente, you already fixed this issue in other
> packages and the fix was to use gcc instead of ld.

 So, are we really going to "fix" all packages that use ld directly? I don't see
why a package shouldn't be allowed to call ld when it is really doing linking
without any other toolchainy stuff.

 LDFLAGS has a bit of the same problem: there will probably be packages that
don't (completely) honour it.

 For CFLAGS, that was the reason why we introduced the wrapper. So I think we
should just add a wrapper for ld as well.

 Ideally the ld wrapper and the gcc wrapper should be refactored into the same
source file, but I think we could start out with separate sources and factor later.

 Any takers?


 Unless Vicente volunteers to work on an ld wrapper, I guess on the short term
we should take patches like these. That said, it should really be passed through
LDFLAGS and not LD itself.

 Regards,
 Arnout

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
