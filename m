From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 27 Jan 2009 18:03:14 +0100
Subject: [Buildroot] [PATCH] Add radvd to the list of packages
In-Reply-To: <200901271757.28001.amand.tihon@alrj.org> (Amand Tihon's message
	of "Tue\, 27 Jan 2009 17\:57\:19 +0100")
References: <200901271757.28001.amand.tihon@alrj.org>
Message-ID: <87eiyoznot.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Amand" == Amand Tihon <amand.tihon@alrj.org> writes:

 Amand> Add radvd, the IPv6 router advertisement daemon.
 Amand> Signed-off-by: Amand Tihon <amand.tihon@alrj.org>
 Amand> ---

 Amand> Note that it has only been tested on avr32 (ngw100) using
 Amand> Atmel's latest stable buildroot (v2.3.0). A basic init script
 Amand> is included.

I'll take a closer look at this after the release, but here's a few
comments:

 Amand> +++ b/package/radvd/Config.in
 Amand> @@ -0,0 +1,9 @@
 Amand> +config BR2_PACKAGE_RADVD
 Amand> +	bool "radvd"
 Amand> +	default n
 Amand> +	select BR2_PACKAGE_FLEX
 Amand> +	depends on BR2_PACKAGE_KMOD_IPV6

KMOD_IPV6 - What's that?

I would have expected a depends on BR2_INET_IPV6

 Amand> +++ b/package/radvd/radvd-1.2-avr32.patch
 Amand> @@ -0,0 +1,21 @@
 Amand> +diff -ru radvd-1.2_vanilla/config.sub radvd-1.2/config.sub
 Amand> +--- radvd-1.2_vanilla/config.sub	2003-11-21 15:53:23.000000000 +0100

Isn't that handled by the CONFIG_UPDATE stuff?

 Amand> diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
 Amand> new file mode 100644
 Amand> index 0000000..29f4d8d
 Amand> --- /dev/null
 Amand> +++ b/package/radvd/radvd.mk
 Amand> @@ -0,0 +1,64 @@
 Amand> +#############################################################
 Amand> +#
 Amand> +# radvd
 Amand> +#
 Amand> +#############################################################
 Amand> +
 Amand> +RADVD_VERSION=1.2
 Amand> +RADVD_SOURCE=radvd-$(RADVD_VERSION).tar.gz
 Amand> +RADVD_SITE=http://www.litech.org/radvd/dist/
 Amand> +RADVD_DIR=$(BUILD_DIR)/radvd-$(RADVD_VERSION)
 Amand> +RADVD_CAT:=$(ZCAT)
 Amand> +
 Amand> +$(DL_DIR)/$(RADVD_SOURCE):
 Amand> +	$(WGET) -P $(DL_DIR) $(RADVD_SITE)/$(RADVD_SOURCE)
 Amand> +
 Amand> +$(RADVD_DIR)/.unpacked: $(DL_DIR)/$(RADVD_SOURCE)

Please use Makefile.autotools.in instead of adding a new old-style
package.

-- 
Bye, Peter Korsgaard
