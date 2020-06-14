From: Norbert Lange <nolange79@gmail.com>
Date: Sun, 14 Jun 2020 23:30:03 +0200
Subject: [Buildroot] [PATCH v2] package/dbusbroker: new package
In-Reply-To: <20200614131013.GO2346@scaer>
References: <20200610232428.201616-1-nolange79@gmail.com>
 <20200612053155.GU13972@scaer>
 <CADYdroP2X5Q1hgO27YPh9uNCF=LZQSxtW1L+kd0bDGLjPDLqcQ@mail.gmail.com>
 <20200614131013.GO2346@scaer>
Message-ID: <CADYdroPBJBr4psh4YLM+Er--SEF_1hCUd0Drqizcv3mjM2+eJw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am So., 14. Juni 2020 um 15:10 Uhr schrieb Yann E. MORIN
<yann.morin.1998@free.fr>:
>
> Norbert, All,
>
> On 2020-06-12 09:02 +0200, Norbert Lange spake thusly:
> > Am Fr., 12. Juni 2020 um 07:32 Uhr schrieb Yann E. MORIN
> > <yann.morin.1998@free.fr>:
> > >
> > > Thanks for this new improved version. :-)
> > >
> > > I still have a few concerns about it, see below...
> > >
> > > On 2020-06-11 01:24 +0200, Norbert Lange spake thusly:
> > > > Add dbus-broker, which is a drop-in replacement
> > > > for the dbus-daemon.
> > >
> > > Sorry, but this commit log is far from enough. See below for all the
> > > pieces I find are missing.
> > >
> > > A commit log is not here to describe what is being done, but why it
> > > is being done. It is here so that the others can understand it. The
> > > more details you can add (up to a certain externt, of course!), the
> > > easier the patch can be reviewed, especially when there are
> > > misundersstanding like what I provided in my own submission.
> >
> > Yes, I hoped you could merge this from your version, which I commented BTW.
> > I have more a problem with the workflow of the ML, especially if someone
> > "branches out" with another patch.
>
> When I am suggesting an alternate solution, but I have some doubts about
> it, I would usually take the original patch, massage it into my idea of
> what it should look like, test it, and resubmit to make my point.
>
> Then the original submitter (and others!) have a way to see the point,
> and comment further by providing additional review and explanations on
> why the alternate proposal is not correct.
>
> Eventually, the original submitter can further improve by keeping the
> good pieces, removing the bad ones, and so on... and resubmit a new
> iteration.
>
> So you are very welcome to have re-spun this new iteration. :-)

As said, I have trouble with the ML flow, seems like the commit should then
include the whole discussion as otherwise no one is able to follow?

(Might be just me)

>
> [--SNIP--]
> > > The commit log also misses the explanations about the licensing
> > > information. This is *very* important to have, because it is not
> > > obvious hy the terms are as they are, and wh we have two files for
> > > each sub-projects. You could have simply duplicated what I wrote
> > > in my own submission.
> > Yes, I am not up to speed about commit-log stuff, and I usually
> > keep explanations where the code is.
>
> Usually, we like the nitty-gritty details in the commit log, for
> posterity, while we keep the comments in the code to the bare minimal.
>
> In this case, the licensing dirtiness should be kept in the commit log,
> and a comment could be added in the .mk, like:

I did not adjust the commit log, should've mentioned that ;)
Consider it a continued discussion.

>
>     # Inconsistency between AUTHORS and README, keep both, and
>     # interpret as per the README
>
> > > Finally, the folowing, from here [*]:
> > >
> > > > bases on Yanns changes, and
> > > > -   add an own config entry for dbus-broker-launch
> > > >     enabled by default if systemd init is used
> > >
> > > We usually do not enable options by default. But see below...
> > >
> > > > -   undo BR2_COREUTILS_HOST_DEPENDENCY
> > >
> > > So, I see you don;t like it, but BR2_COREUTILS_HOST_DEPENDENCY is
> > > already a dependency of systemd, so adding it to dbus-broker is not in
> > > fact adding any new build-time overhead. And if your build machine has a
> > > recent-enough, BR2_COREUTILS_HOST_DEPENDENCY will be empty already.
> >
> > There is still the point of keeping things simple, and I dont get why
> > ../dbus.socket
> > cant be used, instead of an gnu-specific option.
>
> I tend to like it better that we use it, because this makes it explicit.
>
> Also, there is always the ambiguity about what a relative symlink means
> when created: is it relative to the current working directory, or
> relative to the symlink itself?

Seems clearer to me than some non-trivial path duplicated,
and identical to what you see with a 'ln -l'.
But I am not really invested into keeping it one way or another.

>
> And since we already anyway are sure we do have it (either from the host
> or as a dependency of systemd itself), let's just use it...
>
> And BTW, we do not explicitly support building on a non-GNU system
> anyway, so it being a GNU extension is moot (IMHO).
>
> > > > -   undo adding dbus user - never used by this package
> > >
> > > So, how does the does the message bus daemon runs as non-root? In the
> > > original dbus pakcage, we define a user, that is used to switch the
> > > mesage bus to run as non-root. Pleas explain why the user is nopt
> > > needed.
> >
> > Ok,  I take everything back.
> > I thought this was handled in the service files by adding isolation options
> > (as systemd does the "launching"). Seems like it does drop to the uid,
> > dunno what I tested months ago when first created that package
>
> OK, I knew that would have been systemd doing the uid-drop, by I'd still
> like the info appear somewhere (so that we do not later question this in
> light of the original dbus package which defines one).

Not sure if we got some communication issues. The setting does
something (drop privileges),
while I originally considered the launcher ignoring the Xml key.
I guess you could tweak the systemd service to use a Dynamic user,
but I won't touch that for now.

>
> [--SNIP--]
> > > Why do you add an option to enable the launcher? Just do it
> > > unconditionally when systemd is enabled. And select expat as I did in my
> > > own patch, in the main symbol:
> > Well, my first attempt was to only make dbus-broker(-launch) available
> > with systemd,
> > given that there is probably no one using it differently yet.
> > If you argue that it makes sense to provide the plain dbus-broker,
> > then it makes sense doing so with systemd aswell.
> > (see below, I use system without dbus or dbus-broker-launch).
>
> I guess you meant 'systemd' in that last sentence.
>
> But OK, I would be fine to introduce this package as a systemd-only
> option for now, until someone actually provides a non-systemd launcher.
>
> So, we would still not need an extra option, but just:
>
>     config BR2_PACKAGE_DBUS_BROKER
>         bool "dbus-broker"
>         depends on BR2_USE_MMU
>         depends on BR2_TOOLCHAIN_HAS_THREADS
>         depends on BR2_PACKAGE_SYSTEMD
>         select BR2_PACKAGE_EXPAT
>
> And explain in the commit log that the launcher needs systemd, and that
> without the launcher there is no point in dbus-broker.

Seems to be the best option for now IMHO. Revisit the launcher-less option
once you have something to test.

>
> [--SNIP--]
> > > So, in addition to all the above, this patch is lacking two other things
> > > that I did provide:
> > >
> > >   - switching systemd to work with dbus-broker (rather than whining
> > >     about it in the commit log;
> >
> > I got a patch series for systemd, just a matter of finding the time
> > (and retesting).
> > But I would just simply *take out* the dependency to DBUS
> > ( and UTIL_LINUX_BINARIES and UTIL_LINUX_NOLOGIN, getting a systemd
> > rootfs below 20MB).
> > I have been running systemd without either for more than a year.
> > What would be your pick here? no dependency and a warning if neither
> > is available?
>
> What would be the reason for not wanting dbus on a systemd-based system
> (honest question) ?

Minimalism, both in RAM + storage aswell as in maintenance and attack points.
You can have alot of "Dbus-like" just with unix sockets, and the
core system and service manager portion is fully functional without it.
systemd moved some early init stuff and core stuff to "varlink" the
last couple years [1],
I can run my system without realizing dbus is missing.

(Back when I wasn't sure about that, I added dbus-broker for a cleaner
dbus implementations)

>
> Should we move that select to a (existing?) sub-option of systemd?

Dunno, add a warning like?

+ comment "systemd recommends enabling a dbus daemon"
+ depends on !BR2_PACKAGE_DBUS
+ depends on !BR2_PACKAGE_DBUS_BROKER

>
> > adding some BR2_HAS_DBUS_DAEMON that is set by both, so systemd
> > features (like logind) and packages depending on that (and potentially
> > on PACKAGE_DBUS if they need the library or tools)?
> > (https://github.com/nolange/buildroot/commits/improve_systemd_nodbus)
>
> In the current case, we would have the systemd's sub-option(s) select
> what they require, and move the select down to logind (and other
> sub-options, maybe?)
>
>     config BR2_PACKAGE_SYSTEMD_LOGIND
>         bool "logind"
>         depends on BR2_USE_MMU  # dbus && dbus-broker
>         depends on BR2_TOOLCHAIN_HAS_THREADS  # dbus && dbus-broker
>         select BR2_PACKAGE_DBUS if !BR2_PACKAGE_DBUS_BROKER
>
>     comment "logind needs a toolchain w/ threads"
>         depends on BR2_USE_MMU
>         depends on !BR2_TOOLCHAIN_HAS_THREADS
>
> ... and keep the systemd.mk as it is now.
>
> Note that is there are three or more sub-option that require dbus, we
> could go with an intermediate option:
>
>     config BR2_PACKAGE_SYSTEMD_NEEDS_DBUS
>         bool
>         depends on BR2_USE_MMU  # dbus && dbus-broker
>         depends on BR2_TOOLCHAIN_HAS_THREADS  # dbus && dbus-broker
>         select BR2_PACKAGE_DBUS if !BR2_PACKAGE_DBUS_BROKER
>
>     config BR2_PACKAGE_SYSTEMD_LOGIND
>         bool "logind"
>         depends on BR2_USE_MMU  # needs_dbus
>         depends on BR2_TOOLCHAIN_HAS_THREADS  # needs_dbus
>         select BR2_PACKAGE_SYSTEMD_NEEDS_DBUS
>
>     comment "logind needs a toolchain w/ threads"
>         depends on BR2_USE_MMU
>         depends on !BR2_TOOLCHAIN_HAS_THREADS
>

Problem is, that thi is not as clear-cut and might change btw version, see [1].
For the time being, a global "here be dragons" warning if no dbus-daemon
is available would be best.

For example networkd is fine handling the system setup, but networkctl
cant display
the state.

dbus/broker should be enabled by default with systemd, but with some way
that the user still can disable those. Dunno what's the correct to do
this in buildroot,
add a line to dbus  'default y if BR2_PACKAGE_SYSTEMD'?

> > >   - a runtime test that demonstrates that systemd does run fine with
> > >     dbus-broker, and that the original dbus still takes precendence when
> > >     both dbus and dbus-broker are enabled.
> > >
> > > Note that the runtime test is not only about demonstrating the feature;
> > > it is also and foremost a way to guarantee that any regression will be
> > > caught, since we automatically run the runtime tests weekly in gitlab-ci.
> > Ok. Since you already have that, and I know little about your test framework,
> > then could you please incorporate this version into your patch-set.
>
> If you agree, then I'll try to merge your new submission with your
> comments into my series and re-spin it soon-ish, if that's OK with you.

You doing the work, and I get to nag? Deal ;)

Norbert

[1] - https://github.com/systemd/systemd/issues/14190
