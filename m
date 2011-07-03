From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 03 Jul 2011 22:35:31 +0200
Subject: [Buildroot] [PATCH 2/6] Add the stunnel package
In-Reply-To: <1309355181-21048-2-git-send-email-maxime.ripard@free-electrons.com>
 (Maxime Ripard's message of "Wed, 29 Jun 2011 15:46:17 +0200")
References: <1309355181-21048-2-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <87liwf14rw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

 Maxime> Stunnel is an SSL tunnelling proxy.
 Maxime> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks, committed with a few tweaks (see below).

 Maxime> ---
 Maxime>  package/Config.in          |    1 +
 Maxime>  package/stunnel/Config.in  |    6 ++++++
 Maxime>  package/stunnel/S50stunnel |   37 +++++++++++++++++++++++++++++++++++++
 Maxime>  package/stunnel/stunnel.mk |   22 ++++++++++++++++++++++
 Maxime>  4 files changed, 66 insertions(+), 0 deletions(-)
 Maxime>  create mode 100644 package/stunnel/Config.in
 Maxime>  create mode 100644 package/stunnel/S50stunnel
 Maxime>  create mode 100644 package/stunnel/stunnel.mk

 Maxime> diff --git a/package/Config.in b/package/Config.in
 Maxime> index 8f1f030..1a4815a 100644
 Maxime> --- a/package/Config.in
 Maxime> +++ b/package/Config.in
 Maxime> @@ -441,6 +441,7 @@ source "package/ser2net/Config.in"
 Maxime>  source "package/socat/Config.in"
 Maxime>  source "package/spawn-fcgi/Config.in"
 Maxime>  source "package/squid/Config.in"
 Maxime> +source "package/stunnel/Config.in"
 Maxime>  source "package/tcpdump/Config.in"
 Maxime>  source "package/tcpreplay/Config.in"
 Maxime>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 Maxime> diff --git a/package/stunnel/Config.in b/package/stunnel/Config.in
 Maxime> new file mode 100644
 Maxime> index 0000000..b3603ed
 Maxime> --- /dev/null
 Maxime> +++ b/package/stunnel/Config.in
 Maxime> @@ -0,0 +1,6 @@
 Maxime> +config BR2_PACKAGE_STUNNEL
 Maxime> +	bool "stunnel"
 Maxime> +	depends on BR2_PACKAGE_OPENSSL

We normally use select to library packages so you don't need to hunt
around enabling packages to be able to see the stunnel package.


 Maxime> +	help
 Maxime> +	  Stunnel is a program that wraps any TCP connection with an SSL
 Maxime> +	  connection.

We normally add the URL to the upstream project here.


 Maxime> diff --git a/package/stunnel/S50stunnel b/package/stunnel/S50stunnel
 Maxime> new file mode 100644
 Maxime> index 0000000..394eb82
 Maxime> --- /dev/null
 Maxime> +++ b/package/stunnel/S50stunnel
 Maxime> @@ -0,0 +1,37 @@
 Maxime> +#!/bin/sh
 Maxime> +#
 Maxime> +# Starts stunnel
 Maxime> +#
 Maxime> +
 Maxime> +start() {
 Maxime> + 	echo -n "Starting stunnel: "

You have a mix of spaces and tabs here causing git to complain:

/home/peko/source/buildroot/.git/rebase-apply/patch:47: space before tab in indent.
 	echo -n "Starting stunnel: "


 Maxime> +++ b/package/stunnel/stunnel.mk
 Maxime> @@ -0,0 +1,22 @@
 Maxime> +#############################################################
 Maxime> +#
 Maxime> +# stunnel
 Maxime> +#
 Maxime> +#############################################################
 Maxime> +
 Maxime> +STUNNEL_VERSION = 4.36
 Maxime> +STUNNEL_SITE = http://ftp.nluug.nl/pub/networking/stunnel/obsolete/4.x/
 Maxime> +STUNNEL_DEPENDENCIES = openssl
 Maxime> +
 Maxime> +STUNNEL_CONF_OPT += \
 Maxime> +	--with-ssl=$(STAGING_DIR)/usr \
 Maxime> +	--with-threads=fork
 Maxime> +
 Maxime> +define STUNNEL_INSTALL_CONF_SCRIPT
 Maxime> +	$(INSTALL) -m 0755 -D package/stunnel/S50stunnel $(TARGET_DIR)/etc/init.d/S50stunnel
 Maxime> +	$(INSTALL) -m 0644 -D $(@D)/tools/stunnel.conf $(TARGET_DIR)/etc/stunnel/stunnel.conf

Two issues:
 - People might want to use a different configuration, so you should
   only install stunnel.conf if it isn't already present in rootfs skeleton

 - Stunnel itself seems to install stunnel.conf-sample, which is similar
   but not identical to this. We should remove one of them.

-- 
Bye, Peter Korsgaard
