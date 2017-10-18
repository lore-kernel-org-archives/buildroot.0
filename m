From: Anisse Astier <anisse@astier.eu>
Date: Wed, 18 Oct 2017 09:34:33 +0200
Subject: [Buildroot] [PATCH RFC] core: enable per-package log files
In-Reply-To: <07c2fee3-d73c-bb09-444d-2fcdf67415bf@mind.be>
References: <20171011105809.2bf05267@windsurf.lan>
 <1508170801-31062-1-git-send-email-anisse@astier.eu>
 <20171016185248.0463ac82@windsurf.lan>
 <20171016211842.GA32198@bifrost>
 <20171017091152.67d7ad28@windsurf.lan>
 <4234cedb-0646-496e-9ee1-0bc60c847810@mind.be>
 <20171017154526.GA6368@bifrost>
 <07c2fee3-d73c-bb09-444d-2fcdf67415bf@mind.be>
Message-ID: <20171018073433.GA11912@bifrost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 18, 2017 at 12:58:20AM +0200, Arnout Vandecappelle wrote:
> 
> 
> On 17-10-17 17:45, Anisse Astier wrote:
> > On Tue, Oct 17, 2017 at 02:01:41PM +0200, Arnout Vandecappelle wrote:
> >>
> >>
> >> On 17-10-17 09:11, Thomas Petazzoni wrote:
> [snip]
> >>  I don't see any way that it could break things, actually. But obviously it
> >> *does* need to be tested more extensively.
> > 
> > Indeed it does. I found another issue in the parsing, it turns out there
> > might be many tabs at the beginning of a recipe, so they must be
> > consumed greedily as well:
> > 
> > @@ -46,6 +46,9 @@ for arg in args:
> >              elif line[0] == '+':  # ignore
> >                  dprint("jobserver MAKEFLAGS mode")
> >                  line = line[1:]
> > +            elif line[0] == '\t':  # eat additionnal tabs
> > +                dprint("more tabs")
> > +                line = line[1:]
> 
>  That's not entirely correct either, because any other make character followed
> by tab means the tab is part of the command. Better do line.lstrip('\t').

I disagree. See this Makefile for example :
all:
			--+	@	@echo multiple tab

It it's interpreted properly and shows that the parsing code seems
correct.

> 
> >              else:  # no more matching initial recipe character
> >                  break
> >          if print_command:
> > 
> >>
> >>>>
> >>>> Not many. I have only tested the qemu_aarch64_virt_defconfig which does
> >>>> not contain much(~28 packages), but I was already able to fix a few
> >>>> parsing issues.
> >>>
> >>> A bigger test is indeed needed to validate things. But let's see what
> >>> others have to say first.
> >>
> >>  Indeed, because I'm not in favour...
> >>
> >> - IMO 'make --output-sync=recurse' is sufficient to begin with.
> 
>  Anisse, what's your POV about this? Do you see reasons why output-sync is
> insufficient?

I have no attachment to my proposal. If -Orecurse works and removes one
roadblock for parallel building, I'm OK with that.

> 
> >>
> >> - This script requires python3 for *any* build, but python3 is not currently a
> >> dependency.
> >>
> >> - If the script is changed so it supports both 2 and 3, it still requires a
> >> python invocation for every build step, which is slowing things down.
> >>
> >> - Even if it is converted to a shell script or sped up in a different way, it
> >> will make things more complicated for IMO limited gain.
> > 
> > I'm not sure it can be converted to pure shell because of the lexing issues
> > (nested double quotes, etc.).
> 
>  Something like this?
> 
> IFS="$(echo)"
> for line in $2; do
> 	sh -c "$line" 2>&1 | $1
> done
> 
>  Hm, stripping the first characters of $line is still to do...

Ah yes, it's simpler and could work. Needs testing.

Regards,

Anisse
