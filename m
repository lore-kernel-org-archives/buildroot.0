From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 6 Nov 2016 02:25:08 +0100
Subject: [Buildroot] musl with kernel headers
In-Reply-To: <20161105224934.gwj7wzqawxnovgzs@tarshish>
References: <0b4d1e33355f00f915768a2bc3f5c4d997206731.1478152430.git.baruch@tkos.co.il>
 <20161103224656.1e6466a6@free-electrons.com>
 <20161104052244.c2qswgkglbwcod3a@tarshish>
 <20161104091639.1a0285c4@free-electrons.com>
 <20161105224934.gwj7wzqawxnovgzs@tarshish>
Message-ID: <1ee19442-01c1-9500-01c5-c0b056ee85a3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-11-16 23:49, Baruch Siach wrote:
> Hi Thomas,
> 
> On Fri, Nov 04, 2016 at 09:16:39AM +0100, Thomas Petazzoni wrote:
>> On Fri, 4 Nov 2016 07:22:44 +0200, Baruch Siach wrote:
>>
>>>> Yes, we probably need to do something like that. I'm sick of all the
>>>> patches we need to fix this structure redefinition mess, so if we have
>>>> a global solution, it would be nice. I guess it needs to be applied in
>>>> both the linux-headers package and the toolchain-external package.  
>>>
>>> I was thinking if a sed call in TOOLCHAIN_TARGET_FINALIZE_HOOKS to simplify 
>>> the hack. Would that work?
>>
>> No, because FINALIZE_HOOKS, like their name suggests, are called at the
>> very end of the build, after all packages have been built, and right
>> before we create the filesystem images.
>>
>> So to fix something that helps in building packages, it's a little bit
>> too late :-)
> 
> Of course.
> 
>> However, you could have it as post-install staging hook of the
>> toolchain virtual package I guess.
> 
> I experimented with TOOLCHAIN_POST_INSTALL_STAGING_HOOKS, but these hooks 
> never run. TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS work as expected, but 
> it's limited to external toolchains. What would be the right approach?

 The toolchain virtual package doesn't install to staging. Just add
TOOLCHAIN_INSTALL_STAGING = YES

 Regards,
 Arnout

> 
> baruch
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
