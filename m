From: Alvaro G. M. <alvaro.gamez@hazent.com>
Date: Tue, 15 Jul 2014 21:10:36 +0200
Subject: [Buildroot] [PATCH v3 1/1] dcron: new package
In-Reply-To: <20140715205633.4730fa1e@free-electrons.com>
References: <1404814892-28531-1-git-send-email-alvaro.gamez@hazent.com>
 <20140715205633.4730fa1e@free-electrons.com>
Message-ID: <1405451436.8571.5.camel@Nokia-N900>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas

Thank you for all your additional fixes. I'll try to make it easier for everyone next time, It seems clear there were too many errors on this small contribution.

I'll take a look at the init script. I hadn't thought about it because I tipically run it directly on inittab.

Regards

On Tue Jul 15 20:56:33 2014 Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> Dear Alvaro G. M,
> 
> On Tue,?  8 Jul 2014 12:21:32 +0200, Alvaro G. M wrote:
> > Signed-off-by: Alvaro G. M <alvaro.gamez@hazent.com>
> 
> I've applied your patch, but had to make a few changes. Moreover, your
> package does not install any init script to start crond. Maybe you
> should cook a followup patch that adds an init script, no?
> 
> > diff --git a/package/Config.in b/package/Config.in
> > index 95c0c8b..3f4384f 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -1124,6 +1124,7 @@ menu "System tools"
> > if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> > ??? source "package/bootutils/Config.in"
> > ??? source "package/coreutils/Config.in"
> > +??? source "package/dcron/Config.in"
> > endif
> > ??? source "package/cpuload/Config.in"
> 
> Alphabetic ordering not respected here.
> 
> > ??? source "package/dsp-tools/Config.in"
> > diff --git a/package/dcron/Config.in b/package/dcron/Config.in
> > new file mode 100644
> > index 0000000..37182de
> > --- /dev/null
> > +++ b/package/dcron/Config.in
> > @@ -0,0 +1,19 @@
> > +config BR2_PACKAGE_DCRON
> > +??? bool "dcron"
> 
> Missing dependency on BR2_USE_MMU, since the package uses the fork()
> system call.
> 
> > +??? help
> > +??? ?  dcron is a time-based job scheduler with anacron-like features.
> > +??? ?  It works as a background daemon that parses individual crontab
> > +??? ?  files and executes commands on behalf of the users in question.
> > +
> > +??? ?  Upon installation, this package will enable a system level cron
> > +??? ?  daemon with hourly, daily, weekly and monthly crontabs.
> > +
> > +??? ?  However, it doesn't allow non root users to create their own
> > +??? ?  crontab file. This is because /var/spool/cron/crontabs is non
> > +??? ?  user writable.
> > +
> > +??? ?  Typically, a crontab group is created on the system and users
> > +??? ?  allowed to create crontab entries are added into this group, while
> > +??? ?  crontab executable is owned by root:crontab with sgid bit enabled.
> 
> Lines too long, I had to rewrap them.
> 
> > diff --git a/package/dcron/dcron.mk b/package/dcron/dcron.mk
> > new file mode 100644
> > index 0000000..20dcf23
> > --- /dev/null
> > +++ b/package/dcron/dcron.mk
> > @@ -0,0 +1,31 @@
> > +################################################################################
> > +#
> > +# dcron
> > +#
> > +################################################################################
> > +
> > +DCRON_VERSION = 4.5
> > +DCRON_SITE = http://www.jimpryor.net/linux/releases/
> > +# The source code does not specify the version of the GPL that is
> > used. +DCRON_LICENSE = GPL
> > +
> > +ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> 
> I added a short comment above this to explain why we're doing this.
> 
> > +DCRON_DEPENDENCIES = busybox
> > +endif
> > +
> > +define DCRON_BUILD_CMDS
> > +??? $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
> > +endef
> > +
> > +define DCRON_INSTALL_TARGET_CMDS
> > +??? $(INSTALL) -D -m0700 $(@D)/crond $(TARGET_DIR)/usr/sbin
> > +??? $(INSTALL) -D -m4755 $(@D)/crontab $(TARGET_DIR)/usr/bin
> 
> On both of those lines, it should have been a full path for the targets.
> 
> Thanks,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140715/cafba3b2/attachment.html>
