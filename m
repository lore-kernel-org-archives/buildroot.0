From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 31 Jul 2018 09:53:43 +0200
Subject: [Buildroot] [PATCH 3/3] New <pkg>-update-last-config-fragment
 target in pkg-kconfig.mk
In-Reply-To: <OFD5432E43.3E2246DD-ONC12582DB.0025E0A8-C12582DB.002A82C6@local-dmz.de>
References: <20180730155153.24091-1-m.patzlaff@pilz.de>
 <20180730155153.24091-4-m.patzlaff@pilz.de>
 <20180730234643.34315d11@windsurf>
 <OFD5432E43.3E2246DD-ONC12582DB.0025E0A8-C12582DB.002A82C6@local-dmz.de>
Message-ID: <20180731095343.3440afc1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Marcel,

On Tue, 31 Jul 2018 09:44:19 +0200, Marcel Patzlaff wrote:
> Hello Thomas,

> > On my side, I find the semantic of "let's update the _last_ fragment"
> > to be a bit weird and complex to understand. Why the last one, and not
> > any other ?
> > 
> > I'm not sure it's possible to have something that updates fragments
> > with a sensible semantic.  
> 
> Well, it should just reflect what the merge_config script does: the last
> file in the list of files to be merged always overrides settings done in
> files before. So this means, that the last fragment is basically the
> most significate one.

Fragments are not about "priority", they are typically about splitting
by topic different aspects. So it is not because the last fragment
overrides the configuration options of other fragments that a
configuration change you just did to enable driver FOO should go in the
last fragment.

> When I think about it, this should also be documented somewhere. Because
> the result with configuration fragments A, B, C could be different than
> B, A, C for example. So it should definitely be told, that the order of
> fragments matters and that the fragments are best used to specialise the
> configuration of other "layers" before.

This can be documented in the Config.in help text of the
BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES option (ditto for U-Boot, etc.).

> > However, what would be useful would be a way to dump the difference
> > between the current configuration, and what the combination of the
> > defconfig+fragments provide.
> > 
> > I.e, you start Buildroot with omap2plus_defconfig + some specific
> > fragments as the kernel configuration.
> > 
> > You run "make linux-show-config-diff", which returns empty.
> > 
> > Then you tweak the configuration with "make linux-menuconfig", and run
> > "make linux-show-config-diff", which shows you the lines that you need
> > to put in one of your fragments to preserve the configuration tweaks
> > you have done.
> > 
> > Of course, the name "linux-show-config-diff" is just made up here, and
> > some more thought is needed to find a good name. But overall, I
> > believe the semantic would be much clearer, and doesn't make any
> > assumption on whether we have one or several fragments, and whether
> > the last fragment or any other fragment needs to be updated.
> > 
> > What do you think about this? Would this also fill your needs?  
> 
> Despite the fact, that you now have to put this diff manually somewhere
> it would not change things. Because this diff, as I pointed out above,
> is in general only useful for the last fragment.

Not at all, as explained above. You enabled driver FOO, it may need to
go to the last fragment, or potentially to any other fragment, it
really depends on how the fragments are organized.

> Updating any other fragment in the list would require either to have no
> dependencies between fragments at all (too restrictive at least for my
> use cases and also I'm not sure that this is feasible) or to have a deep
> understanding of the dependencies.

When someone is using fragments, then they understand what they mean to
split the configuration in different snippets. People who don't
understand that will typically use a single monolithic .config file.

> From my perspective, neither option is that encouraging, so I do not
> want to propose a way to update any fragment other than the last one.

My position is that updating anything is not correct, because you
cannot know whether it is the last fragment or any of the other
fragment that needs to be updated. The only sane semantic is to show
what the differences are, and let the user figure out where these
configuration differences should be propagated.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
