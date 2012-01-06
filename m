From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 6 Jan 2012 08:13:26 +0100
Subject: [Buildroot] [PATCH 2/3] Rework of the init system
In-Reply-To: <4F017E4D.4020004@free-electrons.com>
References: <1322047811-12933-1-git-send-email-maxime.ripard@free-electrons.com>
 <201112200903.41149.arnout@mind.be> <4F017E4D.4020004@free-electrons.com>
Message-ID: <201201060813.26133.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 02 January 2012 10:52:13 Maxime Ripard wrote:
> On 20/12/2011 09:03, Arnout Vandecappelle wrote:
> > On Wednesday 23 November 2011 12:30:10 Maxime Ripard wrote:
[snip]
> >> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> >> index 9e91136..73c4969 100644
> >> --- a/package/busybox/busybox.mk
> >> +++ b/package/busybox/busybox.mk
> >> @@ -129,6 +129,16 @@ define BUSYBOX_DISABLE_MMU_APPLETS
> >>  endef
> >>  endif
> >>  
> >> +ifeq ($(BR2_INIT_BUSYBOX),y)
> >> +define BUSYBOX_SET_INIT
> >> +	$(call KCONFIG_ENABLE_OPT,CONFIG_INIT,$(BUSYBOX_BUILD_CONFIG))
> >> +endef
> >> +else
> >> +define BUSYBOX_SET_INIT
> >> +	$(call KCONFIG_DISABLE_OPT,CONFIG_INIT,$(BUSYBOX_BUILD_CONFIG))
> >> +endef
> >> +endif
> >> +
> >  I'm not sure if I'd want to have the disable there if BR2_INIT_BUSYBOX
> > is not selected.  There's nothing against a parallel install of
> > systemd and busybox-init, selectable by 'init=...' on the kernel
> > command line.  (Well, except that systemd's symlinks destroy busybox init.)
> 
> Well mutually exclusive init systems is the more obvious solution.
> Having an sysv init and systemd should be ok at the same time should be
> ok indeed, at least from a filesystem and boot point of view, but it
> will probably be more problematic for the init scripts.

 Just to be clear: I agree that we should only support mutually exclusive
init systems, but NOT mutually exclusive init packages.  In other words,
BR2_INIT_{BUSYBOX,SYSV,SYSTEMD} should be mutually exclusive.  However, 
IMO that doesn't mean that the unused binaries should be forcibly removed 
from the system.  In the current situation, it is also possible to compile 
the init applet of busybox and at the same time install the sysvinit package
(where the sysvinit package will remove busybox's symlink).

 The main reason to allow both packages in parallel is that making them
mutually exclusive adds complexity, while it is difficult to be sure that
it really enforces mutual exclusivity in all situations.  There are many
cases where two packages supply the same functionality (especially with
busybox), and buildroot does little (and should do little) to enforce
that only one of them is used.

 Also enforcing it gives little benefit.  You would normally not select
any init package explicitly, you'd only select a BR2_INIT_ option.  If
you do select an init package explicitly after all, there may be a good
reason for it.  (Of course, this does mean that init should be removed
from the default busybox configs.)

 The second reason is that it could make sense to have both (especially
during development).  So why spend extra effort to disable something
that could be useful?

> From what I understood of it, if init scripts are presents, systemd will
> check the name to see if it has a unit for this, and will prefer the
> unit if it has one. But I'm not sure how it will behave with our way of
> naming the init scripts.

 That's something else: buildroot should install only one set of init 
scripts, either sysv or systemd.  If you really want both, you'll have
to put it in the skeleton.

> >> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> >> index 09cedb9..33d5ccf 100644
> >> --- a/package/systemd/Config.in
> >> +++ b/package/systemd/Config.in
> >> @@ -1,5 +1,6 @@
> >>  config BR2_PACKAGE_SYSTEMD
> >>  	bool "systemd"
> >> +	depends on BR2_INIT_SYSTEMD
> >  Again, there is no reason why you can't have sysvinit and systemd in
> > parallel (except for the symlinks).  Also, if you really want them to
> > be mutually exclusive, I'd prefer the more explicit
> > 	depends on !BR2_PACKAGE_SYSVINIT
> 
> Hmmm, you mean BR2_INIT_SYSV ?

 Well, actually: if you want them to be mutually exclusive, the systemd
package (and the sysvinit package) have no place in the menuconfig, so
instead it should be:

config BR2_PACKAGE_SYSTEMD
	depends on BR2_INIT_SYSTEMD

This will make sure it gets selected if and only if BR2_INIT_SYSTEMD is
selected, and will hide it from the menuconfig.

> >>  	depends on BR2_PACKAGE_UDEV
> >>  	depends on BR2_PACKAGE_DBUS
> >>  	select BR2_PACKAGE_LIBCAP
> >> diff --git a/package/sysvinit/Config.in b/package/sysvinit/Config.in
> >> index 34ec391..d91c643 100644
> >> --- a/package/sysvinit/Config.in
> >> +++ b/package/sysvinit/Config.in
> >> @@ -1,5 +1,6 @@
> >>  config BR2_PACKAGE_SYSVINIT
> >>  	bool "sysvinit"
> >> +	depends on BR2_INIT_SYSV
> >>  	help
> >>  	  /sbin/init - parent of all processes

 Same here.

 [snip]

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
