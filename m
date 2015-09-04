From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 4 Sep 2015 21:05:28 +0200
Subject: [Buildroot] [PATCH] system: add options for /bin /sbin and /lib
 to be symlinks into /usr
In-Reply-To: <20150904162946.GC4540@free.fr>
References: <1441324062-31743-1-git-send-email-yann.morin.1998@free.fr>
 <55E94CE5.1010308@imgtec.com> <55E9534C.3070708@mind.be>
 <20150904162946.GC4540@free.fr>
Message-ID: <55E9EB78.9000702@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-09-15 18:29, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2015-09-04 10:16 +0200, Arnout Vandecappelle spake thusly:
[snip]
>>>> diff --git a/system/Config.in b/system/Config.in
>>>> index fad829d..735ad62 100644
>>>> --- a/system/Config.in
>>>> +++ b/system/Config.in
>>>> @@ -88,6 +88,7 @@ config BR2_INIT_SYSTEMD
>>>>  	depends on BR2_USE_MMU
>>>>  	depends on !BR2_STATIC_LIBS
>>>>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
>>>> +	select BR2_ROOTFS_MERGED_USR
>>
>>  Wouldn't it be more appropriate to move this to package/systemd/Config.in,
>> which already has all the other selects?
>>
>>  OTOH, this is a system option while package/systemd/Config.in selects only
>> packages.
> 
> Well, I don't care. In fact, BR2_INIT_SYSTEMD and BR2_PACKAGE_SYSTEMD
> are in effect synonyms. So, it's completely arbiotrary where we put the
> selects.
> 
> I would have favoured pacakge dependencies, like libs and support stuff,
> to be selected by the package, while system-related dependencies would
> have been handled by the init sytem.

 Indeed.

> But as you say, this is a fringe case. After all, systemd *does* support
> a separate /usr, it's just that we in Buildroot decided (with this
> patch) not to support that case.
> 
>>  I think we should reason as follows: if we would ever support building the
>> systemd package without BR2_INIT_SYSTEMD,
> 
> But does that question even make sense to start with? systemd *is* an
> init system and nothing more, so there's no reason we would ever build
> systemd stand-alone.
> 
> At least, in the current state of affairs, for the foreseeable future,
> there's almost no chance we build systemd standalone.

 Yeah, you're right, not a good idea to design for things that may not happen.


>>  Anyway, it's probably bikeshedding. But perhaps you can put a rationale in the
>> commit message for future reference.
> 
> Like:
> 
>     In Buildroot, we decided not to support a split-usr when systemd
>     is used as an init system. This is not a systemd issue, this is a
>     deign decision. Thus the select is with BR2_INIT_SYSTEMD rather
>     than with BR2_PACKAGE_SYSTEMD.

 Perfect!


 Regards,
 Arnout

> 
>> After all, your commit message is a bit
>> short at the moment :-P
> 
> I'll take that as an incitation at expanding it even more. The four
> lines above will make it! ;-p
> 
> Regards,
> Yann E. MORIN.
> 

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
