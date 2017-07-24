From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Jul 2017 18:01:23 +0200
Subject: [Buildroot] [PATCH 18/20] fs: add pre- and post-command hooks
In-Reply-To: <d549596f-af21-640b-4196-fcc96557c14c@mind.be>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <9ad47b5d1b91f4c74c62b01fb37b75d85c23a9ca.1500398733.git.yann.morin.1998@free.fr>
 <1a767f33-47a3-5ab6-ed40-00e2bfa31da8@mind.be>
 <20170723141744.GI26998@scaer>
 <d549596f-af21-640b-4196-fcc96557c14c@mind.be>
Message-ID: <20170724160123.GE2918@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2017-07-23 23:51 +0200, Arnout Vandecappelle spake thusly:
> 
> 
> On 23-07-17 16:17, Yann E. MORIN wrote:
> > Arnout, All,
> > 
> > On 2017-07-23 15:42 +0200, Arnout Vandecappelle spake thusly:
> [snip]
> >> 	$$(call PRINTF,$$(ROOTFS_SKELETON_PRE_CMD_HOOK)) >> $$(FAKEROOT_SCRIPT)
> >>
> >>  You may want to change the variable name, obviously.
> > 
> > And it also means that the declaration of ROOTFS_SKELETON_PRE_CMD_HOOK
> > be conditional in the skeleton-systemd package, like:
> > 
> >     ifeq ($(BR2_PACKAGE_SKELETON_SYSTEMD),y)
> >     define ROOTFS_SKELETON_PRE_CMD_HOOK
> >         blabla
> >     endef
> >     endif
> > 
> > But I do not like these kind of constructs in the packages themselves,
> > because they are too easy to miss...
> 
>  I'm not sure if it's that hard to miss. You just grep for
> ROOTFS_SKELETON_PRE_CMD_HOOK to get the context.
> 
> 
> > Alternatively, I would rather move that logic into the filesystem code
> > itself, because after all that is its responsibility, and guard its use
> > with something like (with a proper variable name, of course):
> > 
> >     ifeq ($(ROOTFS_VAR_FACTORY_BLABLA),YES)
> >         blabla...
> >     endif
> > 
> > And then have the packages that need it just set:
> >     ROOTFS_VAR_FACTORY_BLABLA = YES
> 
>  I'm not so sure I like that better...

I'm not sure either, but I'll further explain below, so you get a better
picture than the blurred one I posted yesterday...

> > All that, because Thomas already suggested (last year in Toulouse) that
> > we could re-use the same factory mechanism for the other init systems as
> > well (on read-only rootfs). In this case, the code would then be guarded
> > by an test against an empty $(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),
> > because then there would be no relation to an init system at all.
> 
>  You completely lost me here.

Ah...

So, the factory is something that is indeed specific to systemd.

However, it allows for a systemd-based rootfs to start with a known
first-boot state, that is put in place early, before
applications/services need them.

IWith this patch, it means that every boot if a first-boot, but at least
the content of /var is what packages isntalled, and they know it is
writable.

But with the other init systems (busybox, syysvinit) we do not have a
factory. Instead /var contains only symlinks to /tmp, which is clean on
boot. So packages won't find what they need in /var, either:
  - it is redirected to /tmp, in which case it is empty, or
  - it is not redirected to /tmp, and it is read-only.

So Thomas suggested that we apply the factory feature to all init
systems. With systemd, it would be built-in (by mean of tmpfiles),
while for the others we'd need some extra startup scripts to mount a
tmpfs on /var and populate it.

> > But the tmpfiles format is very specific to systemd; we'd have to write
> > our own parser for that (not too difficult, I think, but it'd run on
> > the target so it'd have to be really dead-simple).
> > 
> > So in the end, I'd remove the hooks and move the code to the fs
> > handling, protected by a conditional that so far only systemd would set.
> > 
> > OK with this new approach?
> 
>  I'm not so convinced. I mean, if you're putting systemd-specific code into
> ROOTFS_TARGET_INTERNAL, you might just as well make that bit depend on
> BR2_INIT_SYSTEMD directly.

But then it is no longer systemd-specific, see above.

> But then it becomes really too intertwined for my
> liking. I think my ROOTFS_SKELETON_PRE_CMD_HOOK proposal is a better middle
> ground between complexity and abstraction. If you really don't like that, I
> prefer the original ROOTFS_PRE_CMD_HOOKS approach. I just think that giving the
> possibility of defining more than one hook is useless. Particularly since the
> systemd hook hinges on being the very last thing before rootfs creation.
> 
> 
> > Still, there is yet ine thing that I dislike in this solution, whether
> > it be with hooks or the variable, and that noone has seen so far: it is
> > not atomic and the target/ directory will be broken if the filesystem
> > command fails right in the middle, before the var symlink was restored.
> 
>  Can we create the symlink early in the build process, every time? I.e. run
> SKELETON_SYSTEMD_POST_ROOTFS_VAR somehwere at the start of the build as well?
> Only, I'm not sure where we could put it.

Hmm... Good point. I'll try to find a place. But I'm not sure that would
be possible.

Maybe with the step-hooks, that are called very early for all steps, and
then we'd use that to create the symlink if missing. But I do not like
that too much...

I'll investigate.

In the meantime, I'll drop the read-only patches from the series, to
avoid too much noise for now, and so we concentrate on the skeleton
stuff for this release.

Thanks!

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> 
> > I have seen no solution to this issue, except doing a copy of target
> > first, right before assembling the image(s), becasue in that case, we
> > wouldn't care about restoring the previous status, so we would no longer
> > need atomicity.
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
