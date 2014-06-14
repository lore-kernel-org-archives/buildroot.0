From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Jun 2014 19:51:26 +0200
Subject: [Buildroot] [PATCH v2 1/1] dcron: new package
In-Reply-To: <1400660768-2472-1-git-send-email-alvaro.gamez@hazent.com>
References: <1400660768-2472-1-git-send-email-alvaro.gamez@hazent.com>
Message-ID: <20140614195126.1cea4726@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alvaro G. M,

Thanks for this patch. A couple of comments below.

On Wed, 21 May 2014 10:26:08 +0200, Alvaro G. M wrote:
> Signed-off-by: Alvaro G. M <alvaro.gamez@hazent.com>
> ---
> This version of the patch solves the whole lot of problems noted before.
> This patch, as is, would enable a system level cron daemon with hourly,
> daily, weekly and monthly crontabs.
> 
> However, it doesn't allow non root users to create their own crontab file.
> This is because /var/spool/cron/crontabs is non user writable.
> 
> Typically, a crontab group is created on the system and users allowed to
> create crontab entries are added into this group, while crontab executable
> is owned by root:crontab with sgid bit enabled.

Probably, this should be explained in the help text of the Config.in
option for the package.

>  package/Config.in       |  1 +
>  package/dcron/Config.in |  9 +++++++++
>  package/dcron/dcron.mk  | 22 ++++++++++++++++++++++
>  3 files changed, 32 insertions(+)
>  create mode 100644 package/dcron/Config.in
>  create mode 100644 package/dcron/dcron.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 7800f23..3145bf9 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1090,6 +1090,7 @@ source "package/bootutils/Config.in"
>  source "package/coreutils/Config.in"
>  endif
>  source "package/cpuload/Config.in"
> +source "package/dcron/Config.in"

It would be good to rebase on top of the latest master, we have changed
the package/Config.in indentation.

>  source "package/dsp-tools/Config.in"
>  source "package/htop/Config.in"
>  source "package/iprutils/Config.in"
> diff --git a/package/dcron/Config.in b/package/dcron/Config.in
> new file mode 100644
> index 0000000..fea2693
> --- /dev/null
> +++ b/package/dcron/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_DCRON
> +	bool "dcron"
> +	depends on BR2_USE_MMU # fork()
> +	help
> +	  dcron is a time-based job scheduler with anacron-like features.
> +	  It works as a background daemon that parses individual crontab
> +	  files and executes commands on behalf of the users in question.
> +
> +	  http://www.jimpryor.net/linux/dcron.html
> diff --git a/package/dcron/dcron.mk b/package/dcron/dcron.mk
> new file mode 100644
> index 0000000..221e0d5
> --- /dev/null
> +++ b/package/dcron/dcron.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# dcron
> +#
> +################################################################################
> +
> +DCRON_VERSION = 4.5
> +DCRON_SITE = http://www.jimpryor.net/linux/releases/
> +DCRON_LICENSE = GPL

Would be good to add a comment above this saying:

# The source code does not specify the version of the GPL that is used.

> +define DCRON_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
> +endef
> +
> +define DCRON_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m0644 $(@D)/extra/root.crontab $(TARGET_DIR)/etc/cron.d/system
> +	$(INSTALL) -d -m0755 $(TARGET_DIR)/var/spool/cron/crontabs \
> +	        $(TARGET_DIR)/etc/cron.daily $(TARGET_DIR)/etc/cron.hourly \
> +	        $(TARGET_DIR)/etc/cron.monthly $(TARGET_DIR)/etc/cron.weekly
> +endef

And so there is nothing that installs the crond and crontab programs
that are built by the dcron sources, so I don't see how this package can
work.

In addition, since crond and crontab also exists in Busybox, this
package should do:

ifeq ($(BR2_PACKAGE_BUSYBOX),y)
DCRON_DEPENDENCIES += busybox
endif

to ensure that dcron is built *after* Busybox and that therefore, its
files override the ones installed by Busybox.

And for the same reason, the 'source "package/dcron/Config.in"' in
package/Config.in should be enclosed in a:

if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
...
endif

clause.

Could you fix those issues and post an updated version of your patch?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
