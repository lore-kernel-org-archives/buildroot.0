From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 25 Jul 2012 17:25:11 -0300
Subject: [Buildroot] [PATCH] Clarify MIPS ABIs support
In-Reply-To: <20120725202503.7ecae923@skate>
References: <1343162828-13060-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <50102DAA.1030400@mind.be> <20120725202503.7ecae923@skate>
Message-ID: <50105627.6010905@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/25/12 15:25, Thomas Petazzoni wrote:

> Le Wed, 25 Jul 2012 19:32:26 +0200,
> Arnout Vandecappelle <arnout@mind.be> a ?crit :
> 
>>   As far as I understand, the situation is a bit similar to PCs, where
>> i386 and x86_64 are in fact quite different even at instruction set
>> level.  So wouldn't it make more sense to distinguish mips and mips64
>> at the 'Target Architecture' level?  Then mips would always select
>> o32, and the ABI choice would only exist for mips64.  And there
>> would be a 1-to-1 mapping between BR2_ARCH and the user choice,
>> which makes more sense to me.
> 
> Makes sense. Gustavo, what do you think?

Yes, it's the best option since we'll have the same dilemma sooner or
latter with powerpc(64) for example.

> No, it could be this way. The bigger question is:
> 
>>>   TARGET_CFLAGS+=-fno-pic -mno-abicalls
> 
> Why are those special CFLAGS needed from the beginning?

From what i could unearth it basically breaks dynamic linking though it
makes for smaller binaries.
I've tried removing it in my tests to get uClibc dynamic linking working
but something else is wrong, seemingly in the uClibc side.
For starters the loader is wrong, ld-linux in the target vs. ld64-linux
wanted by ELF files. And it seems there's something funky in the uClibc
Makefile about that (wants mips64 arch to build it, but they're using
unified ARCH as the kernel, so...)
Regards.
