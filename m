From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 5 Dec 2016 23:00:39 +0100
Subject: [Buildroot] [PATCH] bluez5_utils: add autoreconf back
In-Reply-To: <20161205221922.13838a32@free-electrons.com>
References: <20161205131504.28872-1-gary.bisson@boundarydevices.com>
 <20161205213207.42e356af@free-electrons.com>
 <d6c03c59-32b7-3749-80a7-ba4c812b3f87@mind.be>
 <20161205221922.13838a32@free-electrons.com>
Message-ID: <d545c88d-8eae-ed7a-23ab-781924c58571@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-12-16 22:19, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 5 Dec 2016 22:16:03 +0100, Arnout Vandecappelle wrote:
> 
>>> Have you tried adding BLUEZ5_AUTORECONF = YES to your external.mk file?  
>>
>>  That won't work, because it's used in an ifeq in the autotools-package
>> expansion, and external.mk is included after the packages.
> 
> Gah.
> 
>>  It does work if you put it in override.mk, but that's not convenient in an
>> external.
> 
> I guess you wanted to say "local.mk" and not "override.mk", right?
> 
> But in any case, I don't think we want to have a <pkg>_AUTORECONF = YES
> in a package "just in case" someone has patches against this package in
> his external tree. Otherwise, all autoconf packages should be
> <pkg>_AUTORECONF = YES.
> 
> So, we've got two options here:
> 
>  1. Say that having to change the original .mk file of a package in
>     Buildroot is a fact of life if you add custom patches for this
>     package.

 Actually, for this particular case, it would be sufficient to patch Makefile in
addition to Makefile.in. Which is a fact of life I'd say. We also sometimes have
to do that when autoreconf doesn't work.


>  2. Imagine a mechanism that allows the "external" stuff to set
>     autoreconf on a per-package basis.

 Eek please no.

 One thing I can imagine is that the expansion of the package infras is done
later (after inclusion of external.mk). The first pass would just set variables,
not define rules and definitely not use any ifdefs. The rules etc. would then
have to avoid using $(1) $(2) etc, and just rely on $($(PKG)_NAME) and friends.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
