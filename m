From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 11 Sep 2016 22:44:00 +0200
Subject: [Buildroot] [PATCH] core: distclean is a noconfig target
In-Reply-To: <20160911134627.GL5740@free.fr>
References: <1473598598-5546-1-git-send-email-yann.morin.1998@free.fr>
 <20160911153404.06d0d424@free-electrons.com> <20160911134627.GL5740@free.fr>
Message-ID: <d0ae3cba-3e56-fe7b-1234-01961a81a7d7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-09-16 15:46, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2016-09-11 15:34 +0200, Thomas Petazzoni spake thusly:
>> On Sun, 11 Sep 2016 14:56:38 +0200, Yann E. MORIN wrote:
>>> @@ -86,7 +86,7 @@ export BR2_VERSION_FULL := $(BR2_VERSION)$(shell $(TOPDIR)/support/scripts/setlo
>>>  noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconfig \
>>>  	defconfig %_defconfig allyesconfig allnoconfig silentoldconfig release \
>>>  	randpackageconfig allyespackageconfig allnopackageconfig \
>>> -	print-version olddefconfig
>>> +	print-version olddefconfig distclean
>>
>> The distclean target uses the DL_DIR variable, which is derived from
>> BR2_DL_DIR, which can come from either the environment... or the
>> configuration file. So, the BR2_DL_DIR from the configuration will be
>> ignored. I'm not sure what the consequence is, but it's worth thinking
>> about this.

 With the small caveat that a BR2_DL_DIR specified in the environment *will*
override the one of the .config, and that one will still be used even if .config
is not read. I think, because there is still some twisted logic in pkg-download
that I didn't analyze.

> 
> Well, if either is set on not the default, then it is currently not
> removed.
> 
> With this change, however, it is no longer removed, indeed.
> 
> But, why are we even having this removal conditional? We can just
> unconditionally remove $(TOPDIR)/dl and be done with that, no?

 Seems OK to me.

 Regards,
 Arnout

> 
>> Also, what is the rationale for having just "distclean" and not "clean"
>> in noconfig_targets ? The fact that "distclean" remove the
>> configuration, and as such "helps" in solving configuration issues ?
> 
> Exactly.
> 
> Otherwise one has to manually remove the .config file, which is not
> very nice...
> 
> Regards,
> Yann E. MORIN.
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
