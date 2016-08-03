From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 3 Aug 2016 19:41:09 +0200
Subject: [Buildroot] [RFC] toolchain: libatomic needs NTPL threads
	support
In-Reply-To: <20160802234521.5a77967c@free-electrons.com>
References: <1470158755-11455-1-git-send-email-romain.naour@gmail.com>
 <20160802234521.5a77967c@free-electrons.com>
Message-ID: <b6cb98c2-2bd1-8148-b6f4-386917bd32c8@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 02/08/2016 ? 23:45, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Tue,  2 Aug 2016 19:25:55 +0200, Romain Naour wrote:
> 
>>  	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 && \
>> -		BR2_TOOLCHAIN_HAS_THREADS
>> +		BR2_TOOLCHAIN_HAS_THREADS_NPTL
> 
> So, I had a closer look. The crux of the matter is in
> libatomic/configure.tgt. There you can see that if a platform uses the
> "linux" OS part of the target tuple, libatomic will be generated.
> However, if "uclinux" is used, libatomic will not be generated.
> 
> So it's not about having NPTL or not, it's about using BR2_BINFMT_FLAT
> or not.

I wasn't sure about this fix, I just observed that
BR2_TOOLCHAIN_HAS_THREADS_NPTL was not set for the two toolchain below. At least
it was a starting point for further investigations (thanks).

> 
> Example: the Microblaze architecture does not support NPTL, but
> libatomic is generated:
> 
> br-microblaze-full-2016.05-1162-g94c7298-build.log:checking for libatomic support... yes

Where I can find the log generated from toochains build ?

> 
> However, on ARM Cortex-M4, and m68k noMMU, we see:
> 
> br-arm-cortex-m4-full-2016.05-1162-g94c7298-build.log:checking for libatomic support... no
> br-m68k-5208-full-2016.05-1162-g94c7298-build.log:checking for libatomic support... no
> 
> Note that it's also not about noMMU vs. MMU, because a noMMU platform
> can use FDPIC, in which case the OS part of the tuple would be "linux".
> 
> I've therefore updated your patch with this, and applied.

Thanks for reworking this patch :)

Best regards,
Romain

> 
> However, it is worth mentioning that changing the gcc code would be
> pretty simple: it's about adding *-uclinux-* in
> libatomic/configure.tgt. Indeed, libatomic provides a generic posix
> implementation, which simply relies on pthread mutex locks to emulate
> atomicity. This works on all platforms, as long as thread support is
> available, including BR2_BINFMT_FLAT platforms.
> 
> People interested in testing this are encouraged to submit patches :-)
> 
> Thanks!
> 
> Thomas
> 
