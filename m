From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 13 Jul 2018 11:39:31 +0200
Subject: [Buildroot] [PATCH 3/6] package/Makefile.in: Use gcc spec files
 for PIE build flags
In-Reply-To: <CANQCQpaJd3-tj47Xp4XyFGvu9w5GcKZZyr+Pi98A0i1XRxa1Ww@mail.gmail.com>
References: <20180711143113.11927-1-matthew.weber@rockwellcollins.com>
 <20180711143113.11927-4-matthew.weber@rockwellcollins.com>
 <cc562d31-b770-c7e1-0a6d-e3f004c917db@mind.be>
 <CANQCQpaJd3-tj47Xp4XyFGvu9w5GcKZZyr+Pi98A0i1XRxa1Ww@mail.gmail.com>
Message-ID: <d6295d8b-0f65-bd81-a5fa-355b5eb70f9f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12-07-18 01:17, Matthew Weber wrote:
> Arnout,
> 
> On Wed, Jul 11, 2018 at 4:44 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>> On 11-07-18 16:31, Matt Weber wrote:
>>> From: Stefan S?rensen <stefan.sorensen@spectralink.com>
>>>
>>> The PIE build flags are only intended for building executables and can not be
>>> used in relocateable links (-r), static builds and shared library build -
>>> including the flags here causes build errors.
>>>
>>> So instead of parsing the PIE flags directly on the command line to gcc,
>>> include them in a gcc spec file where it is possible to only apply the flags
>>> when other incompatible flags are not set.
>>
>>  The commit message should also have the reasoning why this is considered better
>> than doing the same in the wrapper.
>>
> 
> It probably isn't better then doing it in the wrapper.  At this point,
> its just fixing something that's broken with the current approach.  I
> was assuming a solid baseline option with this feature that's working
> first and then start looking at replacing the approach with the
> suggestion awhile back with doing it via the wrapper.

 I'm a bit confused about where you'd like to go in the long run: spec file or
wrapper? In your reply to the cover letter you mention "I do like the concept of
changing to the wrapper and evaluating if we can use GCC spec files"...

 I guess the spec files have the advantage that it is a lot easier to specify
mutually exclusive options. We have that now in the wrapper for arch/cpu/tune,
but it's a lot of code to specify something simple. That said, spec files are so
arcane that you can't expect many people contributing to it. The C code, though
more verbose, is a lot more understandable.

 Back to the patch: basically, the same could be done in the wrapper, but here
the spec files are just taken from Fedora so that's a lot simpler. Right?


>>> -TARGET_HARDENED += -fPIE $(TARGET_CFLAGS_RELRO_FULL)
>>> -TARGET_LDFLAGS += -pie $(TARGET_CFLAGS_RELRO_FULL)
>>> +TARGET_HARDENED += $(TARGET_CFLAGS_RELRO_FULL) -specs=$(TOPDIR)/toolchain/gcc-specs-pie-cc1
>>> +TARGET_LDFLAGS += $(TARGET_CFLAGS_RELRO_FULL) -specs=$(TOPDIR)/toolchain/gcc-specs-pie-ld
>>
>>  As mentioned in my other mail, it is very likely that there are packages that
>> link with TARGET_CFLAGS instead of TARGET_LDFLAGS. Would that be a problem?

 I don't think you answered this question?

>> Actually, can't we just have a single spec file that contains both?
> 
> Like you mentioned previously, flag usage isn't consistent.  When we
> started doing validation of the elf files we found that inconsistency
> and we were individually trying to fix the packages.  This didn't get
> to far as lots of the packages are in stable, no real maintaining
> occuring.  I'm glad Stefan brought up the spec file idea as that
> solved all the rework on the linker ordering and combination of
> values.

 Yes, spec file (or wrapper) is definitely better than patching individual packages.


 Regards,
 Arnout

> Related to using a single spec file.  I'm not to familiar with using
> them but since we have a mix of good/bad flag options already
> occurring, guessing it wouldn't matter to consolidate to one file.  I
> can test going to a single file. Stefan, do you know?
> 
> Matt
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
