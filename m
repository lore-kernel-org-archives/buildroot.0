From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 3 Jul 2015 09:26:24 +0200
Subject: [Buildroot] [PATCH] valgrind: install to staging
In-Reply-To: <87lhexyatr.fsf@dell.be.48ers.dk>
References: <1435852333-19317-1-git-send-email-Vincent.Riera@imgtec.com>
 <5595B17C.2070704@mind.be> <87lhexyatr.fsf@dell.be.48ers.dk>
Message-ID: <55963920.8090909@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/03/15 09:11, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
> Hi,
> 
>>> diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
>  >> index cfce8da..f8f205e 100644
>  >> --- a/package/valgrind/valgrind.mk
>  >> +++ b/package/valgrind/valgrind.mk
>  >> @@ -11,6 +11,7 @@ VALGRIND_LICENSE = GPLv2 GFDLv1.2
>  >> VALGRIND_LICENSE_FILES = COPYING COPYING.DOCS
>  >> VALGRIND_CONF_OPTS = --disable-tls
>  >> VALGRIND_AUTORECONF = YES
>  >> +VALGRIND_INSTALL_STAGING = YES
> 
>  >  I wonder, are there going to be a lot of packages that will autodetect valgrind
>  > presence and will now start linking with it?
> 
> Do programs need to link against valgrind? I thought it only provided a
> header with some magic macros that somehow would direct valgrind to
> behave differently, but didn't do anything when not running through
> valgrind?

 I'm not altogether sure, but I thought there were extra functions you could
call when running through valgrind (these functions are in fact inline and
detect whether you're running under valgrind or not). But you can only use these
functions when valgrind headers are available, so a program that wants to use
them will be slightly different when valgrind headers are available.

 The problem I'm worried about is reproducible builds, of course. When valgrind
happens to be built earlier than your program, it will be different than when
the program is built first.

 Of course, Fabio's per-package staging patch series (which I really should
review...) will fix all that!

> In any case, if the user has enabled valgrind, then he/she presumably
> wants to enable valgrind support in all applicable packages, but we
> indeed will need to add valgrind as an optional dependency of those.
> 
> I don't know how common it is to have explicit valgrind support though,
> I guess only a few packages have it.

 Probably, yes. But one or two, or a few dozen? That's a big difference...
Perhaps someone who has all packages extracted could grep for valgrind in them?

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
