From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 30 Apr 2012 10:41:16 +0200
Subject: [Buildroot] [PATCH] Add Netatalk
In-Reply-To: <1335426107-4727-1-git-send-email-maxime.hadjinlian@gmail.com>
 (Maxime Hadjinlian's message of "Thu, 26 Apr 2012 09:41:47 +0200")
References: <1335426107-4727-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <87fwbl4no3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 Maxime> This patch add the Netatalk package to Buildroot.

Thanks, committed with some modifications (see below).

 Maxime> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 Maxime> ---
 Maxime>  package/Config.in            |    1 +
 Maxime>  package/netatalk/Config.in   |   10 ++++++++++
 Maxime>  package/netatalk/S50netatalk |   43 ++++++++++++++++++++++++++++++++++++++++++
 Maxime>  package/netatalk/netatalk.mk |   35 ++++++++++++++++++++++++++++++++++
 Maxime>  4 files changed, 89 insertions(+)
 Maxime>  create mode 100644 package/netatalk/Config.in
 Maxime>  create mode 100755 package/netatalk/S50netatalk
 Maxime>  create mode 100644 package/netatalk/netatalk.mk

 Maxime> diff --git a/package/Config.in b/package/Config.in
 Maxime> index 5ae1c81..7c19ed9 100644
 Maxime> --- a/package/Config.in
 Maxime> +++ b/package/Config.in
 Maxime> @@ -487,6 +487,7 @@ source "package/netcat/Config.in"
 Maxime>  source "package/netkitbase/Config.in"
 Maxime>  source "package/netkittelnet/Config.in"
 Maxime>  endif
 Maxime> +source "package/netatalk/Config.in"
 Maxime>  source "package/netplug/Config.in"
 Maxime>  source "package/netsnmp/Config.in"
 Maxime>  source "package/netstat-nat/Config.in"
 Maxime> diff --git a/package/netatalk/Config.in b/package/netatalk/Config.in
 Maxime> new file mode 100644
 Maxime> index 0000000..1459246
 Maxime> --- /dev/null
 Maxime> +++ b/package/netatalk/Config.in
 Maxime> @@ -0,0 +1,10 @@
 Maxime> +config BR2_PACKAGE_NETATALK
 Maxime> +	bool "netatalk"
 Maxime> +	select BR2_PACKAGE_BERKELEYDB
 Maxime> +	select BR2_PACKAGE_OPENSSL
 Maxime> +	select BR2_PACKAGE_LIBGCRYPT
 Maxime> +	select BR2_PACKAGE_LIBGPG_ERROR
 Maxime> +	help
 Maxime> +	  Netatalk can be used to turn a *NIX machine into an extremely 
 Maxime> +	  high-performance and reliable file server for Macintosh computers.
 Maxime> +	  http://netatalk.sourceforge.net/

You have a trailing space in the first help text line and we normally
have an empty line before the URL.

 Maxime> +++ b/package/netatalk/netatalk.mk
 Maxime> @@ -0,0 +1,35 @@
 Maxime> +#############################################################
 Maxime> +#
 Maxime> +# netatalk
 Maxime> +#
 Maxime> +#############################################################
 Maxime> +NETATALK_VERSION = 2.2.2
 Maxime> +NETATALK_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/netatalk/netatalk/$(NETATALK_VERSION)/

Sourceforge recently changed their URL structure, so this doesn't work
anymore.

 Maxime> +NETATALK_SOURCE = netatalk-$(NETATALK_VERSION).tar.bz2
 Maxime> +
 Maxime> +NETATALK_DEPENDENCIES = openssl berkeleydb libgcrypt libgpg-error
 Maxime> +NETATALK_CONF_OPT += --with-cnid-cdb-backend \
 Maxime> +	--with-bdb=$(STAGING_DIR)/usr \
 Maxime> +	--disable-zeroconf \
 Maxime> +	--with-ssl-dir=$(STAGING_DIR)/usr \
 Maxime> +	--with-libgcrypt-dir=$(STAGING_DIR)/usr \
 Maxime> +	--with-shadow \
 Maxime> +	--disable-shell-check \
 Maxime> +	--without-pam

Netatalk uses C99 constructs, so we need to ensure the compiler gets
--std=gnu99 passed.

-- 
Bye, Peter Korsgaard
