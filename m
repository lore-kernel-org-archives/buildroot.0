From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 28 Sep 2011 18:27:30 +0200
Subject: [Buildroot] [PATCH 7/8] package: change ordering of steps
In-Reply-To: <CAAXf6LUzxwPwbTZ1xK7eUXuCWqzdsJcLMtq=c5nfgFJW8kZnsw@mail.gmail.com>
References: <cover.1316290714.git.thomas.petazzoni@free-electrons.com>
 <20110928162807.10dcbaef@skate>
 <CAAXf6LUzxwPwbTZ1xK7eUXuCWqzdsJcLMtq=c5nfgFJW8kZnsw@mail.gmail.com>
Message-ID: <201109281827.30500.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Wednesday 28 September 2011 16:44:46, Thomas De Schampheleire wrote:
> >> * after this, I stumbled upon another problem: if I removed both the
> >> linux and the xenomai output directories, and ran make, then linux was
> >> the first to come into play. After extraction of linux, the PRE_PATCH
> >> hook of xenomai is executed, but Xenomai is not yet extracted! Indeed,
> >> the current dependency tree does not enforce this.
> >> I can fix my scenario by changing the order of -patch and -depends :
> >> 
> >> -$(1)-configure:                $(1)-patch $(1)-depends \
> >> +$(1)-configure:                $(1)-depends $(1)-patch \
> >> 
> >> but I'm not sure whether this breaks other cases...
> >> What do you think?
> > 
> > Aaaah, yes, dammit. Technically speaking, it's a bit ugly that the
> > patch step of one package depends on the dependencies being available.
> > This needs some more thought I guess...
> 
> Ok.
> One solution would be to first extract all packages, and then do all
> the rest, but I guess you don't think this is cleaner...

 Or you could split the depends step in a depends-extract and depends-install 
step.  A package's extract step would then depend on the extracts of all the 
packages it depends on.  Or am I completely confused now? :-)

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110928/2117e4a1/attachment-0002.html>
