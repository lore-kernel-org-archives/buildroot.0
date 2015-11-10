From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 10 Nov 2015 22:48:36 +0100
Subject: [Buildroot] [PATCH] core: fix setting of HOSTARCH
In-Reply-To: <20151109221737.GD5162@free.fr>
References: <1447095621-32080-1-git-send-email-yann.morin.1998@free.fr>
 <564117BE.4050300@mind.be> <20151109221737.GD5162@free.fr>
Message-ID: <56426634.3010306@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09-11-15 23:17, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2015-11-09 23:01 +0100, Arnout Vandecappelle spake thusly:
>> On 09-11-15 20:00, Yann E. MORIN wrote:
>>> Currently, we set HOSTARCH to the output of `uname -m`. This gives us
>>> the architecture as seen by the running kernel. For example, we would
>>> end up with 'x86_64' for a 64-bit kernel running on an x86_64 processor.
> [--SNIP--]
>>> So, instead of relying on the output of `uname -r`, look for the host
>>> gcc and extract the target it was configured to generate code for.
> [--SNIP--]
>>> +export HOSTARCH := $(shell gcc -v 2>&1 | \
>>> +	sed -e '/^Target: \([^-]*\).*/!d' \
>>> +	    -e 's//\1/' \
>>> +	    -e 's/i.86/x86/' \
>>> +	    -e 's/sun4u/sparc64/' \
>>> +	    -e 's/arm.*/arm/' \
>>> +	    -e 's/sa110/arm/' \
>>> +	    -e 's/ppc64/powerpc64/' \
>>> +	    -e 's/ppc/powerpc/' \
>>> +	    -e 's/macppc/powerpc/' \
>>> +	    -e 's/sh.*/sh/' )
>>
>>  Since what we get here already are gcc tuples, the de-mangling shouldn't be
>> needed, right?
> 
> I am not sure either way. Note that I only constrained the check on how
> to retrieve the value, and expressely did not address the way we played
> with it, so as to follow the path of least surprise.
> 
> However, we still have to de-mangle i.86 into x86 because that what
> we're using everywhere. 

 Right, we'd have to change that.


> Also, we need to demangle arm.* into arm,
> because arm may have some trailing stuff (like armv6) which still means
> it's an arm. 

 Really? For the kernel arch (uname -m) that's true, but also for the gcc tuple?
But armeb is indeed possible.

> Ditto sh I guess. macppc I would guess (y the name of it)
> that we really don't care about. sa110: are we really expecting to run
> on that machine anyway?
> 
> We can further reduce the de-mangling in a later patch, however, it that
> makes sense...

 Of course. However, I'm not sure if it makes sense to copy the mangling for the
uname to the mangling of the gcc tuple...

 Regards,
 Arnout

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
