From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Apr 2014 23:42:17 +0200
Subject: [Buildroot] [PATCH 1/1] dcron: new package
In-Reply-To: <1394613893-26144-1-git-send-email-alvaro.gamez@hazent.com>
References: <1394613893-26144-1-git-send-email-alvaro.gamez@hazent.com>
Message-ID: <20140418234217.6914f6a6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for your contribution. I have a few comments below.

On Wed, 12 Mar 2014 09:44:53 +0100, Alvaro G. M wrote:

> diff --git a/package/dcron/Config.in b/package/dcron/Config.in
> new file mode 100644
> index 0000000..70dadcd
> --- /dev/null
> +++ b/package/dcron/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_DCRON
> +	bool "dcron"

Have you checked that dcron really has no dependencies on toolchain
features? Could you test building it with the following toolchain
configurations:

 http://autobuild.buildroot.org/toolchains/configs/free-electrons/br-arm-basic.config
 http://autobuild.buildroot.org/toolchains/configs/free-electrons/br-arm-full-nothread.config
 http://autobuild.buildroot.org/toolchains/configs/free-electrons/bfin-uclinux.config


> diff --git a/package/dcron/dcron.mk b/package/dcron/dcron.mk
> new file mode 100644
> index 0000000..cfff875
> --- /dev/null
> +++ b/package/dcron/dcron.mk
> @@ -0,0 +1,36 @@
> +################################################################################
> +#
> +# dcron
> +#
> +################################################################################
> +
> +DCRON_VERSION = 4.5
> +DCRON_SITE = http://www.jimpryor.net/linux/releases/
> +DCRON_LICENSE = GPLv2

How do you know it's GPLv2 ? Unfortunately the source code isn't very
specific about the version of the GPL license being used. The only
information I've found is:

May be distributed under the GNU General Public License

> +
> +DCRON_MAKE_OPT = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" AR="$(TARGET_AR)"

You should instead use $(TARGET_CONFIGURE_OPTS), which already has all
these definitions.

> +
> +define DCRON_PERMISSIONS
> +/usr/sbin/crond			 f 4755	0 0 - - - - -

Is it really needed to install this daemon suid-root? I don't think we
install other daemons suid-root.

> +/usr/bin/crontab		 f 755  0 0 - - - - -
> +/etc/cron.d/system		 f 755  0 0 - - - - -

These are not needed, as these permissions are normal ones, that
can simply be defined by installation commands (below).

> +endef
> +
> +define DCRON_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) $(DCRON_MAKE_OPT)

Is DESTDIR= really needed during the build step?

Also, use TARGET_CONFIGURE_OPTS instead of DCRON_MAKE_OPT.

> +endef
> +
> +define DCRON_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m0700 $(@D)/crond $(TARGET_DIR)/usr/sbin/crond

Use -D

> +	$(INSTALL) -m4755 $(@D)/crontab $(TARGET_DIR)/usr/bin/crontab

Ditto. And why 4755 instead of 755 ?

> +	$(INSTALL) -D -m0644 $(@D)/extra/root.crontab $(TARGET_DIR)/etc/cron.d/system
> +	$(INSTALL) -d -m0755 $(TARGET_DIR)/var/spool/cron/crontabs \
> +	        $(TARGET_DIR)/etc/cron.daily $(TARGET_DIR)/etc/cron.hourly \
> +	        $(TARGET_DIR)/etc/cron.monthly $(TARGET_DIR)/etc/cron.weekly
> +endef
> +
> +define DCRON_CLEAN_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) clean
> +endef

<pkg>_CLEAN_CMDS no longer exist, so this part should be removed.

Could you take these comments into account and submit an updated
version?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
