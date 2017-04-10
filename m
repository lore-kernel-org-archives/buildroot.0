From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Apr 2017 10:06:33 +0200
Subject: [Buildroot] [PATCH v2] arp-scan: new package
In-Reply-To: <20170408180349.GR5361@waldemar-brodkorb.de>
References: <20170405101410.27980-1-arnout@mind.be>
 <20170405183445.6cde0af8@free-electrons.com>
 <20170408180349.GR5361@waldemar-brodkorb.de>
Message-ID: <7f6d8f28-48f6-c1e8-2fc2-9351d5fb1e73@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-04-17 20:03, Waldemar Brodkorb wrote:
> Hi Thomas,
> Thomas Petazzoni wrote,
> 
>> Hello,
>>
>> On Wed, 5 Apr 2017 12:14:10 +0200, Arnout Vandecappelle
>> (Essensium/Mind) wrote:
>>> On the br-arm-cortex-m4-full toolchain, the build fails with a
>>> segmentation fault in elf2flt, so add an exception for ARM FLAT
>>> toolchains. Other FLAT toolchains (e.g. br-m68k-5208-full) work fine.
>>>
>>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>>> ---
>>> I tried to debug the elf2flt segfault but elf2flt isn't exactly the
>>> most low-entry-bar source code...
>>
>> I think we have a regression here, which I would point to the bump of
>> binutils from 2.26 to 2.27. Indeed, several packages are now causing
>> segfaults in elf2flt on ARM:
>>
>> Busybox:
>>
>>   http://autobuild.buildroot.net/results/475/4758354f0e2f7f127c1a99ef7846eb62f5ce41b5/build-end.log
>>
>> pcre:
>>
>>   http://autobuild.buildroot.net/results/68c/68cf951594b0e67b45f8711745c17b93e2fbc03e/build-end.log
>>
>> and I'm sure the list will grow. So I believe that binutils 2.27
>> produces binaries that are a bit different, and confuse elf2flt.
>>
>> Looking at https://github.com/uclinux-dev/elf2flt/commits/master, I
>> don't see anything that particular stands out.
> 
> It seems this is somehow fixed with binutils 2.28. But I have no
> idea in which commit(s).

 Thanks for the hint! I bisected it to commit 4ba2ef8fbe7. Its parent
024425668d1 fails, but 4ba2ef8fbe7 doesn't.

 Unfortunately, binutils is such a heap of [fill in something unsavoury] that I
have a hard time understanding what that patch could do. I'll see if I can
backport it.

 Regards,
 Arnout

> Should we blacklist binutils 2.27 for ARM
> noMMU?
> 
> best regards
>  Waldemar
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
