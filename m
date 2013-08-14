From: WAlnna <alnnawang@hotmail.com>
Date: Wed, 14 Aug 2013 08:24:45 -0400
Subject: [Buildroot] acs_map problem of buildroot when make menuconfig
In-Reply-To: <mailman.25734.1376447357.3407.buildroot@busybox.net>
References: <mailman.25734.1376447357.3407.buildroot@busybox.net>
Message-ID: <BLU174-W5162C8A450BB1132D56693BC450@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

please change the orginal file to below220 HOSTLOADLIBES_mconf   = $(shell $(CONFIG_SHELL) $(check-lxdialog) -ldflags $(HOSTCC)) -ltinfo221 +HOSTLOADLIBES_mconf += -ltinfo
in git/buildroot/support/kconfig/Makefile    line 220
problem solved
> From: buildroot-request at busybox.net
> Subject: buildroot Digest, Vol 86, Issue 79
> To: buildroot at busybox.net
> Date: Wed, 14 Aug 2013 02:29:17 +0000
> 
> Send buildroot mailing list submissions to
> 	buildroot at busybox.net
> 
> To subscribe or unsubscribe via the World Wide Web, visit
> 	http://lists.busybox.net/mailman/listinfo/buildroot
> or, via email, send a message with subject or body 'help' to
> 	buildroot-request at busybox.net
> 
> You can reach the person managing the list at
> 	buildroot-owner at busybox.net
> 
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of buildroot digest..."
> 
> 
> Today's Topics:
> 
>    1. BeagleBoneBlack Status (Spenser Gilliland)
>    2. Re: BeagleBoneBlack Status (Frank Hunleth)
>    3. Re: [PATCH 1/1] ola: new package (Blanco)
>    4. Re: buildroot Digest, Vol 86, Issue 78 (WAlnna)
> 
> 
> ----------------------------------------------------------------------
> 
> Message: 1
> Date: Tue, 13 Aug 2013 18:11:01 -0500
> From: Spenser Gilliland <spenser@gillilanding.com>
> To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, buildroot
> 	<buildroot@busybox.net>
> Subject: [Buildroot] BeagleBoneBlack Status
> Message-ID:
> 	<CAEBucnD__n6ebXT6_vNLoUwV4tiKKteQNM9njeAjbh-Ld6+mKg@mail.gmail.com>
> Content-Type: text/plain; charset=ISO-8859-1
> 
> Hi Everyone,
> 
> I'm here with an update on the status of BBB. I have developed a
> defconfig for the BBB.  It is the beagleblack_defconfig in my
> github.com/Spenser309/buildroot (branch beagleblack) repo.  This takes
> in the mega patch from RobertCNelson, adds the dtc kernel patch, my
> linux_defconfig and builds a kernel/rfs that works on the BBB.
> 
> The Beagle Bone Black faces two main issues in order to be completely
> supported in Buildroot.
> 
> 1. The firmware (for BBB capes) must be builtin to the kernel as the
> kernels firmware loading mechanism does not wait for the RFS to be
> mounted.  This greatly increases the kernel size.
> 2. The SGX core has no support (or at least no documentation) for
> integrating with the TI DRM Framebuffer (supposedly will be
> implemented in next ti-gfx release.)
> 
> Thanks,
> Spenser
> 
> -- 
> Spenser Gilliland
> Computer Engineer
> Doctoral Candidate
> 
> 
> ------------------------------
> 
> Message: 2
> Date: Tue, 13 Aug 2013 20:44:56 -0400
> From: Frank Hunleth <fhunleth@troodon-software.com>
> To: Spenser Gilliland <spenser@gillilanding.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, buildroot
> 	<buildroot@busybox.net>
> Subject: Re: [Buildroot] BeagleBoneBlack Status
> Message-ID:
> 	<CA+-urNRh=T8VuSmOwCr7RmxtYWJiUp=FyC8r-eO6sjvN8LnfyQ@mail.gmail.com>
> Content-Type: text/plain; charset=ISO-8859-1
> 
> Hi Spenser,
> 
> On Tue, Aug 13, 2013 at 7:11 PM, Spenser Gilliland
> <spenser@gillilanding.com> wrote:
> >
> > Hi Everyone,
> >
> > I'm here with an update on the status of BBB. I have developed a
> > defconfig for the BBB.  It is the beagleblack_defconfig in my
> > github.com/Spenser309/buildroot (branch beagleblack) repo.  This takes
> > in the mega patch from RobertCNelson, adds the dtc kernel patch, my
> > linux_defconfig and builds a kernel/rfs that works on the BBB.
> 
> FWIW, RobertCNelson has a newer patch (bone25). I haven't tried it out
> since everything has been working well for me with an older version.
> 
> Also, just so there's proper attribution for the dtc kernel patch, I
> later found out that someone figured it out with Angstrom before me.
> Here's a link to their patch:
> 
> https://github.com/beagleboard/kernel/blob/3.8/patches/build/0004-Make-single-.dtb-targets-also-with-DTC_FLAGS.patch
> 
> That particular patch directory has other patches that RCN doesn't
> apply to his Debian builds (i.e. not in the mega patch), but it
> doesn't seem like the others are necessary.
> 
> >
> > The Beagle Bone Black faces two main issues in order to be completely
> > supported in Buildroot.
> >
> > 1. The firmware (for BBB capes) must be builtin to the kernel as the
> > kernels firmware loading mechanism does not wait for the RFS to be
> > mounted.  This greatly increases the kernel size.
> 
> There's only about a 20 KB difference when CONFIG_FIRMWARE_IN_KERNEL
> is defined. That doesn't seem that bad?
> 
> > 2. The SGX core has no support (or at least no documentation) for
> > integrating with the TI DRM Framebuffer (supposedly will be
> > implemented in next ti-gfx release.)
> 
> I also hope that this isn't a showstopper for bbb support in
> buildroot, since the bbb is quite useful without the SGX core. (and
> who knows when the next ti-gfx release will be)
> 
> As I get a chance, I'll start trying out some of your changes. Thanks
> for sharing.
> 
> Frank
> 
> >
> > Thanks,
> > Spenser
> >
> > --
> > Spenser Gilliland
> > Computer Engineer
> > Doctoral Candidate
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
> ------------------------------
> 
> Message: 3
> Date: Tue, 13 Aug 2013 20:51:58 -0400
> From: Blanco <blanco.ether@gmail.com>
> To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: "buildroot at busybox.net" <buildroot@busybox.net>
> Subject: Re: [Buildroot] [PATCH 1/1] ola: new package
> Message-ID: <30D3ECD4-98BF-4A89-A156-5A5D2A7EE1AB@gmail.com>
> Content-Type: text/plain;	charset=us-ascii
> 
> 
> Hi Thomas, 
> 
> No, plugins should not be built if not selected.  I took out autoreconfig when I switched from git repo to tarred release.  It is possible that is the cause.  I will check.
> 
> Dave
> 
> On Aug 13, 2013, at 6:32 PM, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> 
> > Dear Dave Skok,
> > 
> > On Mon, 12 Aug 2013 14:05:15 -0400, Dave Skok wrote:
> >> Signed-off-by: Dave Skok <blanco.ether@gmail.com>
> >> ---
> >> package/Config.in     |   1 +
> >> package/ola/Config.in | 144 +++++++++++++++++++++++++++++++++++++++++++++++
> >> package/ola/ola.mk    | 153 ++++++++++++++++++++++++++++++++++++++++++++++++++
> >> 3 files changed, 298 insertions(+)
> >> create mode 100644 package/ola/Config.in
> >> create mode 100644 package/ola/ola.mk
> > 
> > Thanks, it now builds successfully.
> > 
> > However, I've found another issue: even if I keep most plugins
> > disabled, they are still all built and installed. For example, with a
> > configuration that has:
> > 
> > # BR2_PACKAGE_OLA_PLUGIN_KARATE is not set
> > 
> > I get the karate plugin built and installed:
> > 
> > $ ls -1 output/target/usr/lib/olad/*karate*
> > output/target/usr/lib/olad/libolakarate.so
> > output/target/usr/lib/olad/libolakarate.so.0
> > output/target/usr/lib/olad/libolakarate.so.0.0.0
> > 
> > Same goes for:
> > 
> > # BR2_PACKAGE_OLA_PLUGIN_SPI is not set
> > 
> > $ ls -1 output/target/usr/lib/olad/*spi*
> > output/target/usr/lib/olad/libolaspicore.so
> > output/target/usr/lib/olad/libolaspicore.so.0
> > output/target/usr/lib/olad/libolaspicore.so.0.0.0
> > output/target/usr/lib/olad/libolaspi.so
> > output/target/usr/lib/olad/libolaspi.so.0
> > output/target/usr/lib/olad/libolaspi.so.0.0.0
> > 
> > Is this expected?
> > 
> > Thanks,
> > 
> > Thomas
> > -- 
> > Thomas Petazzoni, Free Electrons
> > Kernel, drivers, real-time and embedded Linux
> > development, consulting, training and support.
> > http://free-electrons.com
> 
> 
> ------------------------------
> 
> Message: 4
> Date: Tue, 13 Aug 2013 22:28:47 -0400
> From: WAlnna <alnnawang@hotmail.com>
> To: "buildroot at busybox.net" <buildroot@busybox.net>
> Subject: Re: [Buildroot] buildroot Digest, Vol 86, Issue 78
> Message-ID: <BLU174-W102C9D4DB122C4A2918F2ABC450@phx.gbl>
> Content-Type: text/plain; charset="gb2312"
> 
> When i try to run "make menuconfig"there always have  a error: 
> "undefined reference to symbol 'acs_map' 'acs_map' is defined in /libtinfo.so.5 so try adding it to the linker
> command line
> /lib64/libtinfo.so.5: could not read symbols: Invalid operation"how to solve this problem?
> i try a lot of methods still not working
> please help me
> > From: buildroot-request at busybox.net
> > Subject: buildroot Digest, Vol 86, Issue 78
> > To: buildroot at busybox.net
> > Date: Tue, 13 Aug 2013 22:37:28 +0000
> > 
> > Send buildroot mailing list submissions to
> > 	buildroot at busybox.net
> > 
> > To subscribe or unsubscribe via the World Wide Web, visit
> > 	http://lists.busybox.net/mailman/listinfo/buildroot
> > or, via email, send a message with subject or body 'help' to
> > 	buildroot-request at busybox.net
> > 
> > You can reach the person managing the list at
> > 	buildroot-owner at busybox.net
> > 
> > When replying, please edit your Subject line so it is more specific
> > than "Re: Contents of buildroot digest..."
> > 
> > 
> > Today's Topics:
> > 
> >    1. Re: [PATCH] package: add the duma memory debugging library
> >       (Thomas Petazzoni)
> >    2. Re: [PATCH 1/1 v2] Hide issue and hostname menu when using a
> >       custom skeleton. (Yann E. MORIN)
> >    3. Re: [PATCH 1/1] ola: new package (Thomas Petazzoni)
> >    4. Re: [PATCH 3/5] luajit: allow building for the host
> >       (Thomas Petazzoni)
> >    5. Re: [PATCH] lua: remove shared library feature (Thomas Petazzoni)
> > 
> > 
> > ----------------------------------------------------------------------
> > 
> > Message: 1
> > Date: Wed, 14 Aug 2013 00:22:50 +0200
> > From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > To: Reuben Dowle <reuben.dowle@4rf.com>
> > Cc: "buildroot at busybox.net" <buildroot@busybox.net>
> > Subject: Re: [Buildroot] [PATCH] package: add the duma memory
> > 	debugging library
> > Message-ID: <20130814002250.1b8196fe@skate>
> > Content-Type: text/plain; charset=US-ASCII
> > 
> > Dear Reuben Dowle,
> > 
> > On Tue, 13 Aug 2013 22:15:34 +0000, Reuben Dowle wrote:
> > 
> > > To get duma compiling I just copied the patches that crosstool-ng was using verbatim. My toolchain supports c++, so this is not of any interest to me.
> > 
> > Ok. Then for some reason, those patches didn't seem to be sufficient
> > here. Anyway, if you don't care about non-C++ support, that's fine.
> > We'll leave that work for the unlikely contributor who really wants to
> > use duma in a non-C++ environment.
> > 
> > Thanks,
> > 
> > Thomas
> > -- 
> > Thomas Petazzoni, Free Electrons
> > Kernel, drivers, real-time and embedded Linux
> > development, consulting, training and support.
> > http://free-electrons.com
> > 
> > 
> > ------------------------------
> > 
> > Message: 2
> > Date: Wed, 14 Aug 2013 00:29:57 +0200
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: buildroot at busybox.net, Sagaert Johan <sagaert.johan@skynet.be>
> > Subject: Re: [Buildroot] [PATCH 1/1 v2] Hide issue and hostname menu
> > 	when using a custom skeleton.
> > Message-ID: <20130813222957.GB3427@free.fr>
> > Content-Type: text/plain; charset=utf-8
> > 
> > Thomas, All,
> > 
> > On 2013-08-14 00:11 +0200, Thomas Petazzoni spake thusly:
> > > Gustavo, Yann, Thomas, Arnout,
> > > 
> > > What do you think of the below patch?
> > 
> > I think the idea behind the patch is valid.
> > 
> > However, I've not teted it, so I can't say if the patch is OK or not.
> > With a simple look at system/system.mk, it seems it would work as
> > expected.
> > 
> > > My main concern is that it handles the case of /etc/issue
> > > and /etc/hostname, but I see potentially other "System configuration"
> > > parameters that may conflict with a custom skeleton.
> > > 
> > > Thoughts?
> > 
> > I'd say, we should take it, and if some other "System configuration"
> > items need to be guarded behind BR2_ROOTFS_SKELETON_DEFAULT, we can
> > still move them later when the need arises.
> >  
> > > Thomas
> > > 
> > > On Sun, 13 Jan 2013 19:39:59 +0100, Sagaert Johan wrote:
> > > > 
> > > > Only show hostname and issue options when the default skeleton is selected.
> > > > Moved the menu sections so that when a custom skeleton is selected the 
> > > > issue and hostname options are hidden.
> > > > 
> > > > Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
> > > > ---
> > > >  v2 : Only hide issue and hostname menu when a custom skeleton is selected.
> > > > 
> > > >  system/Config.in | 24 ++++++++++++------------
> > > >  1 file changed, 12 insertions(+), 12 deletions(-)
> > > > 
> > > > diff --git a/system/Config.in b/system/Config.in
> > > > index 69863c4..5b38cae 100644
> > > > --- a/system/Config.in
> > > > +++ b/system/Config.in
> > > > @@ -1,17 +1,5 @@
> > > >  menu "System configuration"
> > > >  
> > > > -config BR2_TARGET_GENERIC_HOSTNAME
> > > > -       string "System hostname"
> > > > -       default "buildroot"
> > > > -       help
> > > > -         Select system hostname to be stored in /etc/hostname.
> > > > -
> > > > -config BR2_TARGET_GENERIC_ISSUE
> > > > -       string "System banner"
> > > > -       default "Welcome to Buildroot"
> > > > -       help
> > > > -         Select system banner (/etc/issue) to be displayed at login.
> > > > -
> > > >  choice
> > > >  	bool "Passwords encoding"
> > > >  	default BR2_TARGET_GENERIC_PASSWD_MD5
> > > > @@ -173,6 +161,18 @@ endif
> > > >  
> > > >  if BR2_ROOTFS_SKELETON_DEFAULT
> > > >  
> > > > +config BR2_TARGET_GENERIC_HOSTNAME
> > > > +       string "System hostname"
> > > > +       default "buildroot"
> > > > +       help
> > > > +         Select system hostname to be stored in /etc/hostname.
> > > > +
> > > > +config BR2_TARGET_GENERIC_ISSUE
> > > > +       string "System banner"
> > > > +       default "Welcome to Buildroot"
> > > > +       help
> > > > +         Select system banner (/etc/issue) to be displayed at login.
> > > > +
> > > >  config BR2_TARGET_GENERIC_ROOT_PASSWD
> > > >  	string "Root password"
> > > >  	default ""
> > > 
> > > 
> > > 
> > > -- 
> > > Thomas Petazzoni, Free Electrons
> > > Kernel, drivers, real-time and embedded Linux
> > > development, consulting, training and support.
> > > http://free-electrons.com
> > 
> > -- 
> > .-----------------.--------------------.------------------.--------------------.
> > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> > | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> > '------------------------------^-------^------------------^--------------------'
> > 
> > 
> > ------------------------------
> > 
> > Message: 3
> > Date: Wed, 14 Aug 2013 00:32:11 +0200
> > From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > To: Dave Skok <blanco.ether@gmail.com>
> > Cc: buildroot at busybox.net
> > Subject: Re: [Buildroot] [PATCH 1/1] ola: new package
> > Message-ID: <20130814003211.0c9bdaa7@skate>
> > Content-Type: text/plain; charset=US-ASCII
> > 
> > Dear Dave Skok,
> > 
> > On Mon, 12 Aug 2013 14:05:15 -0400, Dave Skok wrote:
> > > Signed-off-by: Dave Skok <blanco.ether@gmail.com>
> > > ---
> > >  package/Config.in     |   1 +
> > >  package/ola/Config.in | 144 +++++++++++++++++++++++++++++++++++++++++++++++
> > >  package/ola/ola.mk    | 153 ++++++++++++++++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 298 insertions(+)
> > >  create mode 100644 package/ola/Config.in
> > >  create mode 100644 package/ola/ola.mk
> > 
> > Thanks, it now builds successfully.
> > 
> > However, I've found another issue: even if I keep most plugins
> > disabled, they are still all built and installed. For example, with a
> > configuration that has:
> > 
> > # BR2_PACKAGE_OLA_PLUGIN_KARATE is not set
> > 
> > I get the karate plugin built and installed:
> > 
> > $ ls -1 output/target/usr/lib/olad/*karate*
> > output/target/usr/lib/olad/libolakarate.so
> > output/target/usr/lib/olad/libolakarate.so.0
> > output/target/usr/lib/olad/libolakarate.so.0.0.0
> > 
> > Same goes for:
> > 
> > # BR2_PACKAGE_OLA_PLUGIN_SPI is not set
> > 
> > $ ls -1 output/target/usr/lib/olad/*spi*
> > output/target/usr/lib/olad/libolaspicore.so
> > output/target/usr/lib/olad/libolaspicore.so.0
> > output/target/usr/lib/olad/libolaspicore.so.0.0.0
> > output/target/usr/lib/olad/libolaspi.so
> > output/target/usr/lib/olad/libolaspi.so.0
> > output/target/usr/lib/olad/libolaspi.so.0.0.0
> > 
> > Is this expected?
> > 
> > Thanks,
> > 
> > Thomas
> > -- 
> > Thomas Petazzoni, Free Electrons
> > Kernel, drivers, real-time and embedded Linux
> > development, consulting, training and support.
> > http://free-electrons.com
> > 
> > 
> > ------------------------------
> > 
> > Message: 4
> > Date: Wed, 14 Aug 2013 00:33:47 +0200
> > From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > To: Francois Perrad <fperrad@gmail.com>
> > Cc: buildroot at busybox.net
> > Subject: Re: [Buildroot] [PATCH 3/5] luajit: allow building for the
> > 	host
> > Message-ID: <20130814003347.03a6be87@skate>
> > Content-Type: text/plain; charset=US-ASCII
> > 
> > Dear Francois Perrad,
> > 
> > Why is the below patch needed? What is the usage of luajit built for
> > the host?
> > 
> > Thanks,
> > 
> > Thomas
> > 
> > On Tue,  4 Sep 2012 08:58:39 +0200, Francois Perrad wrote:
> > > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> > > ---
> > >  package/luajit/luajit.mk |   10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > > 
> > > diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
> > > index 913bc0c..e82df64 100644
> > > --- a/package/luajit/luajit.mk
> > > +++ b/package/luajit/luajit.mk
> > > @@ -50,6 +50,11 @@ define LUAJIT_BUILD_CMDS
> > >  		-C $(@D) amalg
> > >  endef
> > >  
> > > +define HOST_LUAJIT_BUILD_CMDS
> > > +	$(MAKE) PREFIX="/usr" \
> > > +		-C $(@D) amalg
> > > +endef
> > > +
> > >  define LUAJIT_INSTALL_STAGING_CMDS
> > >  	$(MAKE) PREFIX="/usr" DESTDIR="$(STAGING_DIR)" -C $(@D) install
> > >  endef
> > > @@ -58,8 +63,13 @@ define LUAJIT_INSTALL_TARGET_CMDS
> > >  	$(MAKE) PREFIX="/usr" DESTDIR="$(TARGET_DIR)" -C $(@D) install
> > >  endef
> > >  
> > > +define HOST_LUAJIT_INSTALL_CMDS
> > > +	$(MAKE) PREFIX="/usr" DESTDIR="$(HOST_DIR)" -C $(@D) install
> > > +endef
> > > +
> > >  define LUAJIT_CLEAN_CMDS
> > >  	-$(MAKE) -C $(@D) clean
> > >  endef
> > >  
> > >  $(eval $(generic-package))
> > > +$(eval $(host-generic-package))
> > 
> > 
> > 
> > -- 
> > Thomas Petazzoni, Free Electrons
> > Kernel, drivers, real-time and embedded Linux
> > development, consulting, training and support.
> > http://free-electrons.com
> > 
> > 
> > ------------------------------
> > 
> > Message: 5
> > Date: Wed, 14 Aug 2013 00:36:52 +0200
> > From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
> > Cc: buildroot at busybox.net
> > Subject: Re: [Buildroot] [PATCH] lua: remove shared library feature
> > Message-ID: <20130814003652.39c4d945@skate>
> > Content-Type: text/plain; charset=UTF-8
> > 
> > Fran?ois, Gustavo,
> > 
> > Can you look at the below patch and tell me what you think?
> > 
> > Thanks,
> > 
> > Thomas
> > 
> > On Sun,  4 Nov 2012 13:45:24 +0100, Arnout Vandecappelle
> > (Essensium/Mind) wrote:
> > > The shared library is a feature we added to lua, but it doesn't work
> > > correctly.  Since we anyway normally don't add features to packages,
> > > just remove all the support for the shared library.
> > > 
> > > Fixes
> > > http://autobuild.buildroot.net/results/3946da859a0dcab99a8db8b91fd9428d9e85bdf1/
> > > 
> > > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> > > ---
> > > Francois, Gustavo, could you review and Ack this patch please?  You're
> > > more or less the lua maintainers...
> > > 
> > > v2: Added reference to autobuild failure
> > > 
> > >  package/lua/Config.in                         |    7 --
> > >  package/lua/lua-02-shared-libs-for-lua.patch  |   49 -------------
> > >  package/lua/lua-03-shared-libs-for-luac.patch |   97 -------------------------
> > >  package/lua/lua.mk                            |   28 +------
> > >  4 files changed, 2 insertions(+), 179 deletions(-)
> > > 
> > > diff --git a/package/lua/Config.in b/package/lua/Config.in
> > > index 76359c0..c85b6ab 100644
> > > --- a/package/lua/Config.in
> > > +++ b/package/lua/Config.in
> > > @@ -9,13 +9,11 @@ if BR2_PACKAGE_LUA
> > >  
> > >  config BR2_PACKAGE_LUA_COMPILER
> > >  	bool "lua compiler"
> > > -	select BR2_PACKAGE_LUA_SHARED_LIBRARY
> > >  	help
> > >  	  Install luac binary
> > >  
> > >  config BR2_PACKAGE_LUA_INTERPRETER
> > >  	bool "lua interpreter"
> > > -	select BR2_PACKAGE_LUA_SHARED_LIBRARY
> > >  	help
> > >  	  Install lua binary
> > >  
> > > @@ -27,9 +25,4 @@ config BR2_PACKAGE_LUA_INTERPRETER_READLINE
> > >  	help
> > >  	  Enables command-line editing in the lua interpreter.
> > >  
> > > -config BR2_PACKAGE_LUA_SHARED_LIBRARY
> > > -	bool "shared library"
> > > -	help
> > > -	  Install shared liblua.so
> > > -
> > >  endif
> > > diff --git a/package/lua/lua-02-shared-libs-for-lua.patch b/package/lua/lua-02-shared-libs-for-lua.patch
> > > deleted file mode 100644
> > > index 454e660..0000000
> > > --- a/package/lua/lua-02-shared-libs-for-lua.patch
> > > +++ /dev/null
> > > @@ -1,49 +0,0 @@
> > > -Add the compilation of a shared library.
> > > -Compile the lua binary with the shared library.
> > > -
> > > -Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> > > -
> > > -Index: b/src/Makefile
> > > -===================================================================
> > > ---- a/src/Makefile
> > > -+++ b/src/Makefile
> > > -@@ -23,6 +23,7 @@
> > > - PLATS= aix ansi bsd freebsd generic linux macosx mingw posix solaris
> > > - 
> > > - LUA_A=	liblua.a
> > > -+LUA_SO=	liblua.so
> > > - CORE_O=	lapi.o lcode.o ldebug.o ldo.o ldump.o lfunc.o lgc.o llex.o lmem.o \
> > > - 	lobject.o lopcodes.o lparser.o lstate.o lstring.o ltable.o ltm.o  \
> > > - 	lundump.o lvm.o lzio.o
> > > -@@ -36,8 +37,9 @@
> > > - LUAC_O=	luac.o print.o
> > > - 
> > > - ALL_O= $(CORE_O) $(LIB_O) $(LUA_O) $(LUAC_O)
> > > --ALL_T= $(LUA_A) $(LUA_T) $(LUAC_T)
> > > -+ALL_T= $(LUA_A) $(LUA_SO) $(LUA_T) $(LUAC_T)
> > > - ALL_A= $(LUA_A)
> > > -+ALL_SO= $(LUA_SO)
> > > - 
> > > - default: $(PLAT)
> > > - 
> > > -@@ -47,12 +49,18 @@
> > > - 
> > > - a:	$(ALL_A)
> > > - 
> > > -+so:	$(ALL_SO)
> > > -+
> > > - $(LUA_A): $(CORE_O) $(LIB_O)
> > > - 	$(AR) $@ $(CORE_O) $(LIB_O)	# DLL needs all object files
> > > - 	$(RANLIB) $@
> > > - 
> > > --$(LUA_T): $(LUA_O) $(LUA_A)
> > > --	$(CC) -o $@ $(MYLDFLAGS) $(LUA_O) $(LUA_A) $(LIBS)
> > > -+$(LUA_SO): $(CORE_O) $(LIB_O)
> > > -+	$(CC) -o $@.$(PKG_VERSION) -shared -Wl,-soname="$@.$(PKG_VERSION)" $? -nostdlib -lgcc
> > > -+	ln -fs $@.$(PKG_VERSION) $@
> > > -+
> > > -+$(LUA_T): $(LUA_O) $(LUA_SO)
> > > -+	$(CC) -o $@ -L. $(MYLDFLAGS) $(LUA_O) -llua $(LIBS)
> > > - 
> > > - $(LUAC_T): $(LUAC_O) $(LUA_A)
> > > - 	$(CC) -o $@ $(MYLDFLAGS) $(LUAC_O) $(LUA_A) $(LIBS)
> > > diff --git a/package/lua/lua-03-shared-libs-for-luac.patch b/package/lua/lua-03-shared-libs-for-luac.patch
> > > deleted file mode 100644
> > > index 33f9183..0000000
> > > --- a/package/lua/lua-03-shared-libs-for-luac.patch
> > > +++ /dev/null
> > > @@ -1,97 +0,0 @@
> > > -Compile the luac binary with the shared library.
> > > -Many internal functions (LUAI_FUNC) must be exported (LUA_API).
> > > -
> > > -Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> > > -
> > > -Index: b/src/ldo.h
> > > -===================================================================
> > > ---- a/src/ldo.h
> > > -+++ b/src/ldo.h
> > > -@@ -46,7 +46,7 @@
> > > - LUAI_FUNC int luaD_poscall (lua_State *L, StkId firstResult);
> > > - LUAI_FUNC void luaD_reallocCI (lua_State *L, int newsize);
> > > - LUAI_FUNC void luaD_reallocstack (lua_State *L, int newsize);
> > > --LUAI_FUNC void luaD_growstack (lua_State *L, int n);
> > > -+LUA_API void luaD_growstack (lua_State *L, int n);
> > > - 
> > > - LUAI_FUNC void luaD_throw (lua_State *L, int errcode);
> > > - LUAI_FUNC int luaD_rawrunprotected (lua_State *L, Pfunc f, void *ud);
> > > -Index: b/src/lfunc.h
> > > -===================================================================
> > > ---- a/src/lfunc.h
> > > -+++ b/src/lfunc.h
> > > -@@ -18,7 +18,7 @@
> > > -                          cast(int, sizeof(TValue *)*((n)-1)))
> > > - 
> > > - 
> > > --LUAI_FUNC Proto *luaF_newproto (lua_State *L);
> > > -+LUA_API Proto *luaF_newproto (lua_State *L);
> > > - LUAI_FUNC Closure *luaF_newCclosure (lua_State *L, int nelems, Table *e);
> > > - LUAI_FUNC Closure *luaF_newLclosure (lua_State *L, int nelems, Table *e);
> > > - LUAI_FUNC UpVal *luaF_newupval (lua_State *L);
> > > -Index: b/src/lmem.h
> > > -===================================================================
> > > ---- a/src/lmem.h
> > > -+++ b/src/lmem.h
> > > -@@ -38,9 +38,9 @@
> > > -    ((v)=cast(t *, luaM_reallocv(L, v, oldn, n, sizeof(t))))
> > > - 
> > > - 
> > > --LUAI_FUNC void *luaM_realloc_ (lua_State *L, void *block, size_t oldsize,
> > > -+LUA_API void *luaM_realloc_ (lua_State *L, void *block, size_t oldsize,
> > > -                                                           size_t size);
> > > --LUAI_FUNC void *luaM_toobig (lua_State *L);
> > > -+LUA_API void *luaM_toobig (lua_State *L);
> > > - LUAI_FUNC void *luaM_growaux_ (lua_State *L, void *block, int *size,
> > > -                                size_t size_elem, int limit,
> > > -                                const char *errormsg);
> > > -Index: b/src/lstring.h
> > > -===================================================================
> > > ---- a/src/lstring.h
> > > -+++ b/src/lstring.h
> > > -@@ -25,7 +25,7 @@
> > > - 
> > > - LUAI_FUNC void luaS_resize (lua_State *L, int newsize);
> > > - LUAI_FUNC Udata *luaS_newudata (lua_State *L, size_t s, Table *e);
> > > --LUAI_FUNC TString *luaS_newlstr (lua_State *L, const char *str, size_t l);
> > > -+LUA_API TString *luaS_newlstr (lua_State *L, const char *str, size_t l);
> > > - 
> > > - 
> > > - #endif
> > > -Index: b/src/lundump.h
> > > -===================================================================
> > > ---- a/src/lundump.h
> > > -+++ b/src/lundump.h
> > > -@@ -17,7 +17,7 @@
> > > - LUAI_FUNC void luaU_header (char* h);
> > > - 
> > > - /* dump one chunk; from ldump.c */
> > > --LUAI_FUNC int luaU_dump (lua_State* L, const Proto* f, lua_Writer w, void* data, int strip);
> > > -+LUA_API int luaU_dump (lua_State* L, const Proto* f, lua_Writer w, void* data, int strip);
> > > - 
> > > - #ifdef luac_c
> > > - /* print one chunk; from print.c */
> > > -Index: b/src/Makefile
> > > -===================================================================
> > > ---- a/src/Makefile
> > > -+++ b/src/Makefile
> > > -@@ -34,7 +34,7 @@
> > > - LUA_O=	lua.o
> > > - 
> > > - LUAC_T=	luac
> > > --LUAC_O=	luac.o print.o
> > > -+LUAC_O=	luac.o print.o lopcodes.o
> > > - 
> > > - ALL_O= $(CORE_O) $(LIB_O) $(LUA_O) $(LUAC_O)
> > > - ALL_T= $(LUA_A) $(LUA_SO) $(LUA_T) $(LUAC_T)
> > > -@@ -62,8 +62,8 @@
> > > - $(LUA_T): $(LUA_O) $(LUA_SO)
> > > - 	$(CC) -o $@ -L. -llua $(MYLDFLAGS) $(LUA_O) $(LIBS)
> > > - 
> > > --$(LUAC_T): $(LUAC_O) $(LUA_A)
> > > --	$(CC) -o $@ $(MYLDFLAGS) $(LUAC_O) $(LUA_A) $(LIBS)
> > > -+$(LUAC_T): $(LUAC_O) $(LUA_SO)
> > > -+	$(CC) -o $@ -L. $(MYLDFLAGS) $(LUAC_O) -llua $(LIBS)
> > > - 
> > > - clean:
> > > - 	$(RM) $(ALL_T) $(ALL_O)
> > > diff --git a/package/lua/lua.mk b/package/lua/lua.mk
> > > index de60c57..cc5cd34 100644
> > > --- a/package/lua/lua.mk
> > > +++ b/package/lua/lua.mk
> > > @@ -11,9 +11,6 @@ LUA_LICENSE = MIT
> > >  LUA_LICENSE_FILES = COPYRIGHT
> > >  
> > >  LUA_CFLAGS = -Wall
> > > -ifeq ($(BR2_PACKAGE_LUA_SHARED_LIBRARY),y)
> > > -	LUA_CFLAGS += -fPIC
> > > -endif
> > >  
> > >  LUA_MYLIBS += -ldl
> > >  
> > > @@ -28,7 +25,7 @@ endif
> > >  # We never want to have host-readline and host-ncurses as dependencies
> > >  # of host-lua.
> > >  HOST_LUA_DEPENDENCIES =
> > > -HOST_LUA_CFLAGS = -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX
> > > +HOST_LUA_CFLAGS = -Wall -DLUA_USE_DLOPEN -DLUA_USE_POSIX
> > >  HOST_LUA_MYLIBS = -ldl
> > >  
> > >  define LUA_BUILD_CMDS
> > > @@ -46,14 +43,6 @@ define HOST_LUA_BUILD_CMDS
> > >  	PKG_VERSION=$(LUA_VERSION) -C $(@D)/src all
> > >  endef
> > >  
> > > -ifeq ($(BR2_PACKAGE_LUA_SHARED_LIBRARY),y)
> > > -define LUA_INSTALL_STAGING_SHARED_LIB
> > > -	$(INSTALL) -m 0755 -D $(@D)/src/liblua.so.$(LUA_VERSION) \
> > > -		$(STAGING_DIR)/usr/lib/liblua.so.$(LUA_VERSION)
> > > -	ln -sf liblua.so.$(LUA_VERSION) $(STAGING_DIR)/usr/lib/liblua.so
> > > -endef
> > > -endif
> > > -
> > >  define LUA_INSTALL_STAGING_CMDS
> > >  	$(INSTALL) -m 0644 -D $(@D)/etc/lua.pc \
> > >  		$(STAGING_DIR)/usr/lib/pkgconfig/lua.pc
> > > @@ -78,18 +67,9 @@ define LUA_INSTALL_COMPILER
> > >  endef
> > >  endif
> > >  
> > > -ifeq ($(BR2_PACKAGE_LUA_SHARED_LIBRARY),y)
> > >  define LUA_INSTALL_LIBRARY
> > > -	$(INSTALL) -m 0755 -D $(@D)/src/liblua.so.$(LUA_VERSION) \
> > > -		$(TARGET_DIR)/usr/lib/liblua.so.$(LUA_VERSION)
> > > -	ln -sf liblua.so.$(LUA_VERSION) $(TARGET_DIR)/usr/lib/liblua.so
> > >  	$(INSTALL) -m 0644 -D $(@D)/src/liblua.a $(TARGET_DIR)/usr/lib/liblua.a
> > >  endef
> > > -else
> > > -define LUA_INSTALL_LIBRARY
> > > -	$(INSTALL) -m 0644 -D $(@D)/src/liblua.a $(TARGET_DIR)/usr/lib/liblua.a
> > > -endef
> > > -endif
> > >  
> > >  ifeq ($(BR2_HAVE_DEVFILES),y)
> > >  define LUA_INSTALL_DEVFILES
> > > @@ -112,9 +92,6 @@ endef
> > >  define HOST_LUA_INSTALL_CMDS
> > >  	$(INSTALL) -m 0755 -D $(@D)/src/lua $(HOST_DIR)/usr/bin/lua
> > >  	$(INSTALL) -m 0755 -D $(@D)/src/luac $(HOST_DIR)/usr/bin/luac
> > > -	$(INSTALL) -m 0755 -D $(@D)/src/liblua.so.$(LUA_VERSION) \
> > > -		$(HOST_DIR)/usr/lib/liblua.so.$(LUA_VERSION)
> > > -	ln -sf liblua.so.$(LUA_VERSION) $(HOST_DIR)/usr/lib/liblua.so
> > >  	$(INSTALL) -m 0644 -D $(@D)/src/liblua.a $(HOST_DIR)/usr/lib/liblua.a
> > >  	$(INSTALL) -m 0644 -D $(@D)/etc/lua.pc \
> > >  		$(HOST_DIR)/usr/lib/pkgconfig/lua.pc
> > > @@ -132,8 +109,7 @@ LUA_INSTALLED_FILES = \
> > >  	/usr/lib/pkgconfig/lua.pc \
> > >  	/usr/bin/lua \
> > >  	/usr/bin/luac \
> > > -	/usr/lib/liblua.a \
> > > -	/usr/lib/liblua.so*
> > > +	/usr/lib/liblua.a
> > >  
> > >  define LUA_UNINSTALL_STAGING_CMDS
> > >  	for i in $(LUA_INSTALLED_FILES); do \
> > 
> > 
> > 
> > -- 
> > Thomas Petazzoni, Free Electrons
> > Kernel, drivers, real-time and embedded Linux
> > development, consulting, training and support.
> > http://free-electrons.com
> > 
> > 
> > ------------------------------
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> > 
> > End of buildroot Digest, Vol 86, Issue 78
> > *****************************************
>  		 	   		  
> -------------- next part --------------
> An HTML attachment was scrubbed...
> URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130813/0c8b7fdf/attachment.html>
> 
> ------------------------------
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> End of buildroot Digest, Vol 86, Issue 79
> *****************************************
 		 	   		  
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130814/bfe28a24/attachment-0001.html>
