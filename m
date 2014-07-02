From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 02 Jul 2014 07:30:38 +0200
Subject: [Buildroot] [PATCH 1/1] systemd: bump to version 214
In-Reply-To: <1404070537-14255-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1404070537-14255-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <53B398FE.9030200@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/06/14 21:35, Eric Le Bihan wrote:
> This patch bumps systemd to version 214.
> 
> Changes:
> 
> - add new users: systemd-bus-proxy, systemd-network and systemd-resolve.
> - remove gtk-doc patch, as it is no longer needed.
> - force kmod path when configuring.
> - remove attr build dependency.
> 
> Besides:
> 
> - /var/lock no longer needs to be a symlink to /run, as systemd, via
>   tmpfiles.d, will automatically create a symlink to /run/lock at
>   runtime.
> - when using systemd-networkd, /etc/resolv.conf should now be a symlink
>   to /run/systemd/resolve/resolv.conf.

 So, maybe the systemd package should make sure that this is the case? In a
post-install hook for instance?

> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
[snip]
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 95e7214..947bc92 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SYSTEMD_VERSION = 213
> +SYSTEMD_VERSION = 214
>  SYSTEMD_SITE = http://www.freedesktop.org/software/systemd/
>  SYSTEMD_SOURCE = systemd-$(SYSTEMD_VERSION).tar.xz
>  SYSTEMD_LICENSE = LGPLv2.1+; GPLv2+ for udev; MIT-like license for few source files listed in README
> @@ -50,6 +50,9 @@ SYSTEMD_CONF_OPT += \
>  	--disable-dbus \
>  	--without-python
>  
> +SYSTEMD_CONF_ENV = \
> +	ac_cv_path_KMOD=/usr/bin/kmod

 Since we would normally expect this to point into $(HOST_DIR), I think there
should be a comment here.

> +
>  ifeq ($(BR2_PACKAGE_SYSTEMD_COMPAT),y)
>  SYSTEMD_CONF_OPT += --enable-compat-libs
>  else
> @@ -65,7 +68,6 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_ATTR),y)
>  SYSTEMD_CONF_OPT += --enable-attr
> -SYSTEMD_DEPENDENCIES += attr

 Uh? How is it possible to do --enable-attr without depending on attr? Run-time
dependency only? Then this should be explained in a comment.

>  else
>  SYSTEMD_CONF_OPT += --disable-attr
>  endif
> @@ -99,6 +101,9 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
>  SYSTEMD_CONF_OPT += --enable-networkd
> +define SYSTEMD_USER_TIMESYNC

 I don't suppose timesync and networkd are mutually exclusive, so this should be
SYSTEMD_USER_NETWORK and it should be added to SYSTEMD_USERS, below.


 Regards,
 Arnout


> +	systemd-network -1 systemd-network -1 * - - - Network Manager
> +endef
>  else
>  SYSTEMD_CONF_OPT += --disable-networkd
>  define SYSTEMD_INSTALL_SERVICE_NETWORK
> @@ -155,6 +160,8 @@ SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
>  define SYSTEMD_USERS
>  	systemd-journal -1 systemd-journal -1 * /var/log/journal - - Journal
>  	systemd-journal-gateway -1 systemd-journal-gateway -1 * /var/log/journal - - Journal Gateway
> +	systemd-resolve -1 systemd-resolve -1 * - - - Network Name Resolution Manager
> +	systemd-bus-proxy -1 systemd-bus-proxy -1 * - - - Proxy D-Bus messages to/from a bus
>  	$(SYSTEMD_USER_TIMESYNC)
>  endef
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
