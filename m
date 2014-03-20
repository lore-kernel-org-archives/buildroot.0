From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Mar 2014 21:43:59 +0100
Subject: [Buildroot] [PATCH] support: properly check for bash as a
	dependency
In-Reply-To: <20140318165518.GA3342@free.fr>
References: <1395052954-1567-1-git-send-email-yann.morin.1998@free.fr>
 <20140318060130.282f5a46@skate> <20140318165518.GA3342@free.fr>
Message-ID: <532B530F.5050408@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/03/14 17:55, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2014-03-18 06:01 +0100, Thomas Petazzoni spake thusly:
>> On Mon, 17 Mar 2014 11:42:34 +0100, Yann E. MORIN wrote:
>>
>>> So, calling "$SHELL --version" will still return "^GNU bash" no matter
>>> what shell is actually running.

 Have you tested this? dependencies.sh is run from the Makefile, and that
says:

SHELL:=$(shell if [ -x "$$BASH" ]; then echo $$BASH; \
        else if [ -x /bin/bash ]; then echo /bin/bash; \
        else echo sh; fi; fi)
[snip]

export SHELL CONFIG_SHELL quiet Q KBUILD_VERBOSE VERBOSE

 So $SHELL _will_ be set to bash unless there is no bash.

>>>
>>> Since quite a lot of #!/bin/sh scripts are in fact bash scripts, we
>>> really want to ensure that /bin/sh is bash.
>>
>> I'm definitely against that. My system has /bin/sh pointing to dash,
>> and Buildroot works fine. One of the thing that annoyed me in
>> OpenEmbedded was its requirements to have /bin/sh be bash.
>>
>> We clearly don't want that.
> 
> I'm just fine with that. :-)
> 
> But the current check is broken anyway, as all it checks is that the
> login shell of the user is bash.
> 
>   - if we want to work whith dash as the system shell, then the current
>     check is unneeded;
> 
>   - if we want to work with dash as the system shell, we don't care what
>     login shell the user is using, as we must also work when this is dash;
> 
>   - SHELL is not mandated by POSIX, so it may be empty on a
>     POSIX-compliant shell anyway.
> 
> So, we should just remove this check altogether.

 Not remove, but rather replace it with a check for /bin/bash existence.
We do have quite a lot of stuff referring to /bin/bash. bash in PATH is
not good enough.


 Regards,
 Arnout

> 
>> I've just checked the Free Electrons autobuilders, and there are also
>> using dash as /bin/sh. This means that if configure scripts were using
>> bashims unsupported by dash, we would have noticed.
> 
> Andrew, what package was the breakage due to?
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
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
