From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 16 Feb 2017 00:14:53 +0100
Subject: [Buildroot] Analysis of build results for 2017-02-13
In-Reply-To: <20170215093351.46cf9b57@free-electrons.com>
References: <20170214072856.3AE8320B8C@mail.free-electrons.com>
 <20170214142725.1b9e98ae@free-electrons.com>
 <20170214232912.42d8a2df@free-electrons.com>
 <8760kbj44g.fsf@dell.be.48ers.dk>
 <20170215093351.46cf9b57@free-electrons.com>
Message-ID: <c2a9e08b-74a1-be16-740f-3b560abdc1fc@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-02-17 09:33, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 15 Feb 2017 08:38:07 +0100, Peter Korsgaard wrote:
> 
>>  > I'm not sure how to fix this. Adding __STDC_LIMIT_MACROS to the build
>>  > of libraw would fix it, but it's rather weird to have this
>>  > implementation "detail" of jasper creep in all the way to users of the
>>  > library.  
>>
>> I didn't look at libraw yet, but couldn't the jasper include just be
>> moved to the top of the file?
> 
> Haven't tried that. Could be an option, but it still seems weird.
> 
> However, I had a second thought about this: according to
> http://autobuild.buildroot.net/?reason=libraw-0.17.1, we only have this
> issue with toolchains using rather old gcc versions:
> 
>  - SH4 toolchain is using 4.7
>  - the Buildroot i686/pentium4 toolchain is using gcc 4.5
>  - the older build results on Blackfin were with the Analog Devices
>    toolchain, gcc 4.3 based
> 
> With more recent toolchains (starting with gcc 4.8) this issue does not
> occur. Is it something that has changed in the C/C++ standard
> implemented starting from 4.8 ? Or is it C library version related ?
> 
> Indeed in the SH4 toolchain, the stdint.h header only provides the
> SIZE_MAX and related definitions if you're *not* in C++ *or*
> __STDC_LIMIT_MACROS is defined. But on my system, stdint.h doesn't have
> anything like that: SIZE_MAX and related macros are unconditionally
> defined.

 Indeed, the __STDC_LIMIT_MACROS definition was removed in glibc 2.18 (commit
1ef74943ce2f114c78b215af57c2ccc72ccdb0b7). That's why it only happens with old
external glibc toolchains.

 Unfortunately we don't have a version symbol for glibc. But in this case, I
think the easy way out is to just add -D__STDC_LIMIT_MACROS to LIBRAW_CFLAGS
when jasper is selected. This macro isn't used anymore in recent glibc, so it
certainly doesn't hurt to define it.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
