From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 6 Nov 2018 11:31:29 +0100
Subject: [Buildroot] [PATCH 1/2] ngrep: bump to version 1.47
In-Reply-To: <87tvkubkf2.fsf@dell.be.48ers.dk>
References: <20181101132326.13015-1-fontaine.fabrice@gmail.com>
 <20181103224222.229c064a@windsurf>
 <CAPi7W8388ghbe_PtDyJ_Hi1=2PLo4sAoZbzwORjH4qLGQ-ue5w@mail.gmail.com>
 <20181104111953.08d765e0@windsurf>
 <CAPi7W83CQfQGjuhZBUvZoPBsJJLSE2sgRj_P9UHt7Lvb9bpqpA@mail.gmail.com>
 <87lg69nkjx.fsf@tkos.co.il> <616d82b7-c580-49cd-b4bf-ad1b6da2368b@mind.be>
 <20181106085910.665564c3@windsurf> <87tvkubkf2.fsf@dell.be.48ers.dk>
Message-ID: <e17b869d-0492-f0f9-fd2b-2ab04de0cdca@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06/11/18 10:54, Peter Korsgaard wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
> 
>  > Hello,
>  > On Tue, 6 Nov 2018 01:14:48 +0100, Arnout Vandecappelle wrote:
> 
>  >> Since we don't really want to pass any flags from Buildroot down to the package
>  >> build systems, perhaps we should just set
>  >> 
>  >> override MAKE := make <jlevel stuff>
>  >> 
>  >> at the top of package/Makefile.in? I've done a quick test, and it seems to fix
>  >> the boa issue at least.
>  >> 
>  >> This would revert the following commit though:
>  >> 
>  >> commit 4705b600764c683e934da7db54f7971a3c647e8a
>  >> Author: Ulf Samuelsson <ulf.samuelsson@atmel.com>
>  >> Date:   Tue Jul 17 14:09:07 2007
>  >> 
>  >> Ensure we use host 'make', even when building 'make' in buildroot
>  >> 
>  >> but that doesn't explain why it is not wanted to use the Buildroot-built make...
> 
>  > But then it would mean that if you have a build like this:
> 
>  > packageA
>  > packageB
>  > packageC
>  > host-make
>  > packageD
>  > packageE
>  > packageF
> 
>  > then package{A,B,C} would be built with the system-provided make, and
>  > then package{D,E,F} would be built with host-make ? Is this really a
>  > desirable situation ?
> 
> Well, it sounds better than the breakage we have today.

 At first sight, I don't see why it should be a problem to use a different make
for different packages. A bit weird, but it really shouldn't affect
reproducibility or anything.


> In general, mixing make versions in recursive invocations seems a bit
> icky. I guess we could end up with issues if/when we do toplevel
> parallel builds as well if the job control tracking differs between
> versions.

 Ooh, yes, top-level parallel build might break dramatically in such a situation...

 Well, let's fix that problem when we get there, right?

 Regards,
 Arnout
