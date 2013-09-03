From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Sep 2013 13:52:09 +0200
Subject: [Buildroot] [PATCH 2 of 9 v4] Config.in.legacy: update
 description for users
In-Reply-To: <CAAXf6LWNRK1fZMQfMU5w52NzgyG+HL1VbXPU1o5FuFQ+eNBFEA@mail.gmail.com>
References: <patchbomb.1378152469@argentina>
 <ac4d080274a06689e8d4.1378152471@argentina>
 <20130902225514.7d9323cc@skate> <52257EA4.9030001@mind.be>
 <20130903091818.616d6665@skate>
 <CAAXf6LWNRK1fZMQfMU5w52NzgyG+HL1VbXPU1o5FuFQ+eNBFEA@mail.gmail.com>
Message-ID: <20130903135209.3b1ea8f5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Tue, 3 Sep 2013 13:42:39 +0200, Thomas De Schampheleire wrote:

> >> > This really seems ugly for users, no? I know it's been discussed, but
> >> > can you summarize why this should be done by our users?
> >>
> >>   I.e., add "because of Kconfig limitations", right?
> >
> > That I understood, but for my own culture, can you summarize what are
> > those limitations? Maybe it would be good to document them in the big
> > fat comment inside Config.in.legacy (not the one shown to the user, but
> > the one inside the source code). Having to exit menuconfig, and restart
> > it doesn't seem like a really great thing, so I'd like to understand
> > why we need that, and what are our options to maybe solve this in the
> > future.
> >
> 
> The basic problem is that kconfig seems to remember how a given symbol
> was selected, *within one kconfig session*. 'How' can be: explicitly
> selected by the user, or selected through a 'select' statement of
> another symbol. In the latter case, when the first symbol is disabled,
> the 'selected' symbol is also automatically disabled.
> When you start a new kconfig session (by saving the configuration and
> reopening it) kconfig has no clue anymore about how the different
> symbols became selected, because clearly there is no indication about
> this whatsoever in the .config file.
> 
> Applied to the legacy symbols: suppose symbol FOO is renamed into BAR,
> and we have made the legacy symbol FOO 'select' the new symbol BAR
> through Config.in.legacy. The user opens the menuconfig, sees that
> there is something in the legacy menu, reads the help text, goes to
> the menu where FOO used to be selected, sees that BAR is already
> correctly selected thanks to the automatic propagation, and decides to
> clear the legacy FOO symbol in the legacy menu. Then he saves the
> configuration.
> If you check the .config file afterwards (or even if you check the BAR
> symbol after deselecting FOO before exiting menuconfig) you will see
> that BAR is no longer selected. The only way to saveguard that is by
> saving the configuration before fiddling with the legacy menu, thereby
> 'flattening' the symbols.

Thanks for the great summary. I now understand the problem (sorry for
being slow).

> Provided we want automatic propagation of symbols (boolean or
> otherwise), I don't see another solution.
> See also the other thread where you asked whether it's at all logical
> to have something in legacy for such renames.

In the light of this, I indeed restate my question asking whether it's
logical to select BR2_LEGACY for renames that are equivalent.

So I believe I would rather classify the legacy options in two
categories:

 (1) Options that have been renamed, or can be approximated in such a
     close way that letting the user know about the rename or change is
     not important: we simply add an hidden Config.in.legacy symbol that
     selects the new relevant option. This legacy symbol does not select
     BR2_LEGACY, and things are fully transparent for the user. Of
     course the symbol remains =y in the .config file, but it's clearly
     identified as such.

 (2) Options that have been removed, or changed in such a way that it's
     not possible to approximate the modification by selecting other
     options. In this case, the legacy Config.in.legacy symbol is not
     hidden, and only selects BR2_LEGACY and no other option, and the
     user is requested to act by disabling this option and doing the
     necessary configuration changes.

So far, the only problem I see with this are related to minimal
defconfigs. In the case (1) above, the minimal defconfig will continue
to contain the name of the legacy option, and not the name of the new
option, since the new option is selected by the legacy option. This is
annoying since it means minimal defconfigs are not progressively
updated to use the new option name. And this probably makes my entire
proposal moot.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
