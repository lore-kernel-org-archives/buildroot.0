From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 25 Apr 2012 14:25:25 +0200
Subject: [Buildroot] [PATCH 2/2] Add Netatalk
In-Reply-To: <1335355284-1347-2-git-send-email-maxime.hadjinlian@gmail.com>
References: <1335355284-1347-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1335355284-1347-2-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <4F97ED35.70305@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 25/04/2012 14:01, Maxime Hadjinlian a ?crit :
> This patch add the Netatalk package to Buildroot.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/Config.in            |    1 +
>  package/netatalk/Config.in   |   10 ++++++++++
>  package/netatalk/S50netatalk |   44 ++++++++++++++++++++++++++++++++++++++++++
>  package/netatalk/netatalk.mk |   31 +++++++++++++++++++++++++++++
>  4 files changed, 86 insertions(+)
>  create mode 100644 package/netatalk/Config.in
>  create mode 100755 package/netatalk/S50netatalk
>  create mode 100644 package/netatalk/netatalk.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 5ae1c81..7c19ed9 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -487,6 +487,7 @@ source "package/netcat/Config.in"
>  source "package/netkitbase/Config.in"
>  source "package/netkittelnet/Config.in"
>  endif
> +source "package/netatalk/Config.in"
>  source "package/netplug/Config.in"
>  source "package/netsnmp/Config.in"
>  source "package/netstat-nat/Config.in"
> diff --git a/package/netatalk/Config.in b/package/netatalk/Config.in
> new file mode 100644
> index 0000000..1459246
> --- /dev/null
> +++ b/package/netatalk/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_NETATALK
> +	bool "netatalk"
> +	select BR2_PACKAGE_BERKELEYDB
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_LIBGCRYPT
> +	select BR2_PACKAGE_LIBGPG_ERROR
> +	help
> +	  Netatalk can be used to turn a *NIX machine into an extremely 
> +	  high-performance and reliable file server for Macintosh computers.

You need to add an extra line here

> +	  http://netatalk.sourceforge.net/
> diff --git a/package/netatalk/S50netatalk b/package/netatalk/S50netatalk
> new file mode 100755
> index 0000000..89dd214
> --- /dev/null
> +++ b/package/netatalk/S50netatalk
> @@ -0,0 +1,44 @@
> +#!/bin/sh 
> +# 
> +# Start netatalk daemon  (aftpd && cnid_metad)
> +#
> +
> +# Guard to prevent execution if netatalk was removed.
> +test -x /usr/sbin/afpd || exit 0
> +test -x /usr/sbin/cnid_metad || exit 0
> +

Why do you need this ? I guess that if netatalk was removed from
buildroot, the script wouldn't be there in the first place

> +AFPD_UAMLIST="-U uams_dhx2.so,uams_clrtxt.so"
> +netatalk_start() {
> +    echo "Starting afpd"
> +    # prepare startup of file services
> +    echo -n " cnid_metad"
> +    /usr/sbin/cnid_metad -l log_note
> +    /usr/sbin/afpd $AFPD_UAMLIST -g nobody -c 50
> +    echo -n " afpd"
> +}
> +case "$1" in
> +    start)
> +        echo -n "Starting Netatalk services (this will take a while): "
> +        netatalk_startup

I guess you mean start() here right ?

> +        echo "."
> +    ;; 
> +    stop)
> +        echo -n "Stopping Netatalk Daemons:"
> +        echo -n " afpd"
> +        start-stop-daemon --stop --quiet --oknodo --exec /usr/sbin/afpd
> +        echo -n " cnid_metad"
> +        start-stop-daemon --stop --quiet --oknodo --exec /usr/sbin/cnid_metad
> +    ;; 

If you use start-stop-daemon in the stop function, why not use it as
well in the start function ? :)

> +    restart)
> +        netatalk_start()
> +        netatalk_stop()

I don't see this function defined neither...

> +    ;; 
> +    *) 
> +        echo $"Usage: $0 {start|stop|restart}"
> +        exit 1
> +esac
> +
> +exit $?
> diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
> new file mode 100644
> index 0000000..786721f
> --- /dev/null
> +++ b/package/netatalk/netatalk.mk
> @@ -0,0 +1,31 @@
> +#############################################################
> +#
> +# netatalk
> +#
> +#############################################################
> +NETATALK_VERSION = 2.2.2
> +NETATALK_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/netatalk/netatalk/$(NETATALK_VERSION)/
> +NETATALK_SOURCE = netatalk-$(NETATALK_VERSION).tar.bz2
> +
> +NETALATK_DEPENDENCIES = openssl berkeleydb libgcrypt libgpg-error
> +NETATALK_CONF_OPT += --sysconfdir=/etc \
> +	--with-cnid-cdb-backend \
> +	--disable-cups \
> +	--with-bdb=$(STAGING_DIR)/usr \
> +	--disable-cups \

We do have cups in the packages too, so maybe we could add something like:
ifeq ($(BR2_PACKAGE_CUPS),y)
    NETATALK_DEPENDENCIES += cups
    NETATALK_CONF_OPT += --enable-cups
else
    NETATALK_CONF_OPT += --disable-cups
endif

> +	--disable-zeroconf \
> +	--with-ssl-dir=$(STAGING_DIR)/usr \
> +	--with-libgcrypt-dir=$(STAGING_DIR)/usr \
> +	--with-shadow \
> +	--disable-shell-check \
> +	--without-pam
> +
> +define NETATALK_INSTALL_EXTRA_FILES
> +	[ -f $(TARGET_DIR)/etc/init.d/S50netatalk ] || \
> +		$(INSTALL) -m 0755 -D package/netatalk/S50netatalk \
> +			$(TARGET_DIR)/etc/init.d/S50netatalk
> +endef
> +
> +NETATALK_POST_INSTALL_TARGET_HOOKS += NETATALK_INSTALL_EXTRA_FILES
> +
> +$(eval $(call AUTOTARGETS))

Thanks,
Maxime

-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
