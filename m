From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 6 Mar 2016 20:02:59 +0100
Subject: [Buildroot] [PATCH v3 1/2] erlang: use erlang's native atomic
	ops
In-Reply-To: <CA+-urNTJJ292+XY1gK4-4nwgFvpLmF2AaUtnVWvx=LcO=Yx88A@mail.gmail.com>
References: <1456082246-28181-1-git-send-email-fhunleth@troodon-software.com>
 <56D22060.4020108@mind.be>
 <CA+-urNTJJ292+XY1gK4-4nwgFvpLmF2AaUtnVWvx=LcO=Yx88A@mail.gmail.com>
Message-ID: <56DC7EE3.50107@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/02/16 21:47, Frank Hunleth wrote:
> Hi Arnout, all,
> 
> On Sat, Feb 27, 2016 at 5:17 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 02/21/16 20:17, Frank Hunleth wrote:
>>> Now that we're using Erlang 18, the preferred atomic ops implementation
>>> for Erlang is its own built-in implementation, so use it.  It is still
>>> possible to use libatomic_ops if the native implementation does not
>>> work. BR2_PACKAGE_ERLANG_ARCH_SUPPORTS is added now that
>>> BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS is no longer appropriate for
>>> checking whether Erlang can be built for a platform.
>>>
>>> This fixes an autobuilder failure when using libatomic_ops on aarch64.
>>> Erlang's native atomic ops implementation works on this platform.
>>>
>>> Fixes:
>>> http://autobuild.buildroot.net/results/0cd/0cd22eb74fa29e5a85bf897762e16ab3daf33962/
>>>
>>> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
>>> ---
>> [snip]
>>> +config BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
>>> +     bool
>>> +     default y if BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_sparc_v9 || BR2_arm || BR2_aarch64 # case (1)
>>
>>  This line is too long, please split it.
>>
>>> +     default y if BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS # case (4)
>>>
>>>  config BR2_PACKAGE_ERLANG
>>>       bool "erlang"
>>>       depends on BR2_USE_MMU # fork()
>>>       depends on !BR2_STATIC_LIBS
>>> -     depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS
>>> -     select BR2_PACKAGE_LIBATOMIC_OPS
>>> +     depends on BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
>>>       help
>>>         Erlang is a programming language used to build massively scalable
>>>         soft real-time systems with requirements on high availability.
>>> @@ -20,6 +36,14 @@ config BR2_PACKAGE_ERLANG
>>>
>>>  if BR2_PACKAGE_ERLANG
>>>
>>> +config BR2_PACKAGE_ERLANG_LIBATOMIC_OPS
>>> +     bool "libatomic_ops"
>>
>>  Does it make sense to let the user select this? I don't think so...
>>
>>  I think we should have:
>>
>> config BR2_PACKAGE_ERLANG_ARCH_SUPPORTS_DIRECTLY # case (1)
>>         bool
>>         default y if BR2_i386 || BR2_x86_64 || BR2_powerpc || \
>>                 BR2_sparc_v9 || BR2_arm # aarch64 causes build failures
>>
>> config BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
>>         bool
>>         default y if BR2_PACKAGE_ERLANG_ARCH_SUPPORTS_DIRECTLY
>>         default y if BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS # case (4)
>>
>> and nothing more.
> 
> The more I think about this patch, the more I want to drop all
> references to libatomic_ops. The reason is that the native Erlang
> atomic ops implementation supports almost every platform supported by
> libatomic_ops. In fact, it looks like every _defconfig in Buildroot
> that supports Erlang uses the native atomic ops implementation rather
> than libatomic_ops. (I actually tried building all _defconfigs at one
> point, but I'll double check if there are doubts.)
> 
> Does it make sense to remove libatomic_ops altogether? I think the
> original reason for including it doesn't apply now that we upgraded to
> Erlang 18.

 Sounds OK to me.

 Regards,
 Arnout

> 
> Thanks,
> Frank
> 
> 
>>
>>> +     depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS
>>> +     depends on !BR2_aarch64 # causes build failures
>>> +     select BR2_PACKAGE_LIBATOMIC_OPS
>>> +     help
>>> +       Use libatomic_ops instead of Erlang's native atomic ops support.
>>> +
[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
