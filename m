From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 03 Apr 2012 22:48:55 +0200
Subject: [Buildroot] [PATCH 1/4] Convert tinyhttpd to gentargets
In-Reply-To: <8089554db519223edcf39ce25f6d0a96bcb00b57.1333443312.git.maxime.ripard@free-electrons.com>
 (Maxime Ripard's message of "Tue, 3 Apr 2012 10:55:29 +0200")
References: <cover.1333443312.git.maxime.ripard@free-electrons.com>
 <cover.1333443312.git.maxime.ripard@free-electrons.com>
 <8089554db519223edcf39ce25f6d0a96bcb00b57.1333443312.git.maxime.ripard@free-electrons.com>
Message-ID: <87k41wwngo.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

 Maxime> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks, committed with minor changes (see below).

 Maxime> -TINYHTTPD_BINARY:=httpd
 Maxime> -TINYHTTPD_TARGET_BINARY:=usr/sbin/tinyhttpd
 Maxime> +TINYHTTPD_VERSION := 0.1.0
 Maxime> +TINYHTTPD_SITE := http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/tinyhttpd/

We normally use '=' instead of ':=' for these.

 
 Maxime> -$(DL_DIR)/$(TINYHTTPD_SOURCE):
 Maxime> -	 $(call DOWNLOAD,$(TINYHTTPD_SITE)/$(TINYHTTPD_SOURCE))
 Maxime> +define TINYHTTPD_BUILD_CMDS
 Maxime> +		$(MAKE1) -C $(@D) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" httpd

A few comments:
 - We normally break long lines like this
 - Makefile is very simple, with a single step so MAKE1 isn't needed
 - Default target builds httpd, so the final 'httpd' isn't needed.

 Maxime> +define TINYHTTPD_INSTALL_TARGET_CMDS
 Maxime> +	$(INSTALL) -m 0755 $(@D)/httpd $(TARGET_DIR)/usr/sbin/
 Maxime>  	$(INSTALL) -m 0755 package/tinyhttpd/S85tinyhttpd $(TARGET_DIR)/etc/init.d
 Maxime>  	mkdir -p $(TARGET_DIR)/var/www
 Maxime> +endef

Please use install -D.
 

-- 
Bye, Peter Korsgaard
