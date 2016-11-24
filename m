From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 25 Nov 2016 00:13:16 +0100
Subject: [Buildroot] [PATCH 2/2] toolchain: simplify the conditions for
 BR2_TOOLCHAIN_ARM_HAS_SYNC_8
In-Reply-To: <20161122093515.6db0df30@free-electrons.com>
References: <20161121234340.30463-1-arnout@mind.be>
 <20161121234340.30463-2-arnout@mind.be>
 <20161122093515.6db0df30@free-electrons.com>
Message-ID: <47d66856-80eb-9c55-026d-3b74b44886b1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22-11-16 09:35, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 22 Nov 2016 00:43:40 +0100, Arnout Vandecappelle
> (Essensium/Mind) wrote:
> 
>>  config BR2_TOOLCHAIN_ARM_HAS_SYNC_8
>>  	bool
>>  	default y
>>  	depends on BR2_arm || BR2_armeb
>> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
>> -	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_ARM_CPU_ARMV7A
>> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> 
> Can we make this instead:
> 
> 	depends on (BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 && BR2_TOOLCHAIN_USES_GLIBC) || BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> 
> This way, glibc toolchains (which were never affected by the _write
> issue) still expose the fact that they support the __sync_8 thing.
> Otherwise, your change introduces a regression: a 4.7 glibc external
> toolchain was prior to your patch exposing the fact that it supports
> 8-byte sync, but no longer after your patch.not-quite

 Now I think about it again, I think the condition should simply be
	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7

 Let me explain again my reasoning.

 For me, the toolchain conditions that we add to hide packages are only there to
cover missing features in certain compiler versions, not to cover bugs. The
incorrect sync_8 implementation in gcc < 5.2 is something I consider a bug: it's
something that has been implemented, works correctly, but fails to link with a
specific library. Therefore, I would say that sync_8 on ARM has been available
since gcc 4.7. An external non-glibc toolchain with gcc < 5.2 will not actually
work, but that's due to a compiler bug. People who need one of the 3 packages
that fail because of this compiler bug should update their compiler - and the
best way to tell them that is to make the build fail, not to hide the option.

 But that's my opinion. It's clearly not the rule that is currently followed in
Buildroot. Just look@the number of packages with some kind of external
toolchain specific dependency. Honestly, I think those things are giving us more
work for no added benefit to the user.


> Also, what about the __atomic 8 bytes? As we discussed yesterday, it's
> in fact affected by the same issue. How do we deal with that? Do we
> introduce per-size BR2_TOOLCHAIN_HAS_ATOMIC_<size> options?

 If the condition for SYNC_8 is simply BR2_TOOLCHAIN_GCC_AT_LEAST_4_7, then
HAS_ATOMIC is already OK.

 Regards,
 Arnout


> 
> Best regards,
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
