From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 10 Dec 2014 23:37:09 +0100
Subject: [Buildroot] Patchwork review evening (this week!)
In-Reply-To: <20141208002008.18756fac@free-electrons.com>
References: <20141208002008.18756fac@free-electrons.com>
Message-ID: <20141210223709.GL3926@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2014-12-08 00:20 +0100, Thomas Petazzoni spake thusly:
> In order to help with killing a bit of the patchwork backlog, I'm
> proposing to have a "patchwork review evening". The idea is that a
> group of Buildroot developers join on IRC for a few hours in the
> evening, and we go through a list of patches or patch series that are
> 'complex' and try to take some decision about them.

You can find the results of the discussion on the etherpad:
    https://etherpad.fr/p/Buildroot-Patchwork

Thank you to all participants! :-)

I'm attaching it so it is archived in the list, for future reference.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
-------------- next part --------------
Patches to review during the Patchwork-review day

Need arbitration:
	* http://patchwork.ozlabs.org/patch/404927/ - set simple network setup via the system configuration submenu
		* Do we want this feature in Buildroot, or should we let the user handle this via a rootfs overlay
		* Maybe only a simpler variant that only allows "localhost only / eth0 with DHCP" and that's it?
		* Yann E. MORIN: "lo" should always be brought up, no matter what; then "primary interface with DHCP" with a name, default to "eth0"
		* Conclusion: Peter also thinks it's too complicated, and a single string option to do DHCP on one interface is acceptable. Any other setup will need an overlay.
		* Patch rejected, and mail sent by Thomas.
	* http://patchwork.ozlabs.org/patch/400650/ <- patch needs the call from Peter
		* Conclusion: Peter: "I agree with Arnout that such an option doesn't make much sense. A single option doesn't really hurt much, but where to stop?"
	* http://patchwork.ozlabs.org/patch/400751/ <- patch needs the call from Peter
		* Conclusion: Peter: "I wonder if it makes sense if the option is this rare? All those warnings about unknown options are not really nice"
	* http://patchwork.ozlabs.org/patch/410002/ <- patch needs a decision
		* Conclusion: Peter: "I would say enable it as the uClibc guys apparently think it should be enabled (default y) and matters quite a bit for performance". To be applie
		* Applied by Thomas.
	* http://patchwork.ozlabs.org/patch/417509/ - fs: allow to specify compression options
		* Opinions?
		* Yann E. MORIN: my opinion would be to get rid of FS compression, except for those FS where it makes sense (squashfs...)
		* Conclusion: Peter: "I agree with Yann that these options aren't really "important/commonly used", so they could as well be put in a post-image script for full flexibility"
		* -> Reject the patch, and deprecate the existing options around FS compression, as suggested by Yann.
		* Yann: send a reject mail, asking for removal instead
	* http://patchwork.ozlabs.org/patch/388306/ - dropbear: add extra build customization options
		* Peter should arbitrate
		* Conclusion: Peter will rework the patch to use positive logic and apply
	* http://patchwork.ozlabs.org/patch/415898/ - pkg-generic.mk: reinstall targets
		* (Thomas P) I personally don't see why we wouldn't want this, so I'm in favor of the patch. Needs review of course, but the principle is OK
		* Yann E. MORIN: I'm OK on principle, too.
		* Conclusion: Peter: "seems ok to me (unless the extra make targets slows stuff down significantly)"
		* Yann will do some timing before/after the patch to see the impact.
	* Defining kernel options depending on enabled packages, question raised by the following patches from Gustavo
		* http://patchwork.ozlabs.org/patch/401836/ - iptables: enable basic kernel options
		* http://patchwork.ozlabs.org/patch/401837/ - xtables-addons: enable necessary kernel options
		* Conclusion: Peter: "seems ok to me, as long as those options are really REQUIRED" -> to be applied
	* http://patchwork.ozlabs.org/patch/413090/ - bumping pcmanfm and the libfm mess (with following patches)
		* Thomas: not sure there's much discussion to have on those ones. It's a mess, just needs to be understood and reviewed.
		* Peter says: "is ok, it just seems odd"
		* Yann will do the review
	* http://patchwork.ozlabs.org/patch/415725/ - skeleton: make /run a proper directory/filesystem
		* What is the approach for removing /etc/init.d from the main skeleton?
		* Patch from Maxime Hadjinlian, adding an iniscript package: http://patchwork.ozlabs.org/patch/400682/ (initscripts: new package)
		* Should the skeleton itself become a package?
		* Also related patches from J?r?me http://patchwork.ozlabs.org/patch/399413/ and http://patchwork.ozlabs.org/patch/399412/
	* Related topic: automated installation of init scripts
		* http://patchwork.ozlabs.org/patch/400684/
			* Samuel: while I'm ok with installing the service in the right location, I'm dubious about enabling (all of) them by default. BTW, this last point is missing in the doc, and only valid for systemd init.
	* http://patchwork.ozlabs.org/patch/400833/ - xserver_xorg-server: Change default to X.org modular server on supported platforms    
		* Should we switch to modular X.org by default?
		* (Thomas P.) The patch makes it the default depending on toolchain options, which seems a bit weird
		* Yann E. MORIN: modular is the way of the future ;-) so it should be the default when possible.
		* Samuel: i'm ok with it.
		* Thomas: OK, but then should we enforce the related toolchain options for X.org in all cases (modular and not) ? To me it is really odd that the default value changes depending on the toolchain options. This is potentially very confusing for the user, IMO.
		* Conclusion: Peter: is ok I think. If you have the toolchain config for it, modular X seems more sensible" -> to be applied
	* Image generation
		* Issue has come up again with http://patchwork.ozlabs.org/patch/419162/ (fs/rawimg: new rootfs target)
		* It's again a fairly use-case specific solution.
		* Should we NAK this again?
		* Yann E. MORIN:
			* NAK. Multi-FS layout should be left to a post-image script. I thought that was the output of the previous attempt, no?
			* The discussion was: either we do it correctly and in a generic way, or we do not do it at all. Doing it in a generic way is not easy at all, so the answer was "no".
		* Samuel: I'm not very fond of it, we did the post-image script infra for that purpose, so nak.
		* Jerome: I used genimage tool to do this job in the past. It works well. Why not just adding an option in fs menu to specify a configuration file for genimage?
		* Conclusion: NAK  (to be done by Yann)
		* patch 1/3 is similar to 419247 which does not require a patch to binutils (but menu entry should be in "Host utilities")
		* Supplementary conclusion (re: 419247): packages needing host util-linux libs just build-depend on host-util-linux; if they need one or more host util-linux progams, they kconfig-dpeend on it
	* Separate upstream source from local source name, and better github/gitorious handling
		* http://lists.busybox.net/pipermail/buildroot/2014-December/114286.html
		* Patch series from Yann
		* Thomas said: either keep the upstream file name in *all* cases, or use a locally crafted file name in *all* cases.
		* Peter said: But having our tarball name different from upstream is not super nice either (e.g. for the backup site, and for hashes)
		* Yann suggested: rename the extra downloads and patches to:    PKG-VERSION.PATCH-NAME  and  PKG-VERSION.EXTRA-DL-NAME
		* Peter suggested: alternatively we could make <pkg>-<version> subdirs in dl/ and put stuff there, but it's also not really nice (and doesn't solve the problem for the mirroring)
		* Conclusion: Yann thinks a bit more about all that and respin another solution
	* Static/shared library selection
		* http://lists.busybox.net/pipermail/buildroot/2014-December/114192.html
		* Patch series from Thomas P.
	* Big patch from Samuel doing the renaming of all the patches?
		* Yann E. MORIN: OK on principle. Reviewing will be tedious, so if it can be scripted, that'd be nice.
		* Samuel: @Yann: the script is here: http://patchwork.ozlabs.org/patch/403345/ ;)
		* Conclusion: Go for it; just needs to re-run the conversion script on a fresh master.
	* Remove hash files for github downloads
		* http://patchwork.ozlabs.org/patch/403247/
		* http://patchwork.ozlabs.org/patch/403248/
		* Conclusion: Yes.
	* http://patchwork.ozlabs.org/patch/366549/ - [RFC] Separate target-building make targets from image-building make targets
		* Samuel: looks sensible, i'm rather ok with it
	* http://patchwork.ozlabs.org/patch/409989/ - inetutils: new package
		* How should it "override" other packages.

Need review:
    
    http://patchwork.ozlabs.org/patch/416780/    imx6 and Xorg (and following patches)
    http://patchwork.ozlabs.org/patch/415967/    gpu-amd-bin-mx51: new package
    http://patchwork.ozlabs.org/patch/415968/    xdriver_xf86-video-imx: new package
    http://patchwork.ozlabs.org/patch/413102/    Makefile: don't depend on the umask (and following patches)
    
    
Actions:

Yann E. MORIN:
	* to review:
		* 417509  -> send reject mail, ask for removal instead  (done)
		* 415898  -> do timings before/after the new targets  (done)
		* 413090  -> do the review of the series (1..3: done, 4 left out for now)
		* 419162  -> send reject mail with lotta explanations (done); provide some post-image sample scripts for this purpose
		* 419247  -> adapt to the conclusion, fit in "Host utilities" sub-menu  (done by asking author to do so)
	* to adopt and respin:
		* upstream vs. local: Yann rethink another solution and respin it for further discussions

Samuel:
	* to respin:
		* big patch renaming all patches
		* 
