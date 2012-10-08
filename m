From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 08 Oct 2012 23:14:12 +0200
Subject: [Buildroot] [PATCH 5/6] vpnc: convert to generic-package
	infrastructure
In-Reply-To: <1348266518-27665-6-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Sat, 22 Sep 2012 00:28:37 +0200")
References: <1348266518-27665-1-git-send-email-s.martin49@gmail.com>
 <1348266518-27665-6-git-send-email-s.martin49@gmail.com>
Message-ID: <87r4p81xaz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 Samuel> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 Samuel>  create mode 100644 package/vpnc/vpnc-0.5.3-fix-build.patch

 Samuel> +VPNC_VERSION       = 0.5.3
 Samuel> +VPNC_SITE          = http://www.unix-ag.uni-kl.de/~massar/vpnc
 Samuel> +VPNC_LICENSE       = GPLv2+
 Samuel> +VPNC_LICENSE_FILES = COPYING
 Samuel> +
 Samuel> +VPNC_DEPENDENCIES  = libgcrypt libgpg-error
 Samuel> +
 Samuel> +VPNC_LDFLAGS  = $(TARGET_LDFLAGS) -lgcrypt -lgpg-error
 Samuel> +VPNC_CPPFLAGS = -DVERSION=\\\"$(VPNC_VERSION)\\\"
 Samuel> +
 Samuel> +define VPNC_BUILD_CMDS
 Samuel> +	$(MAKE)	-C $(@D) $(TARGET_CONFIGURE_OPTS) CC="$(TARGET_CC)" \
 Samuel> +		CPPFLAGS="$(VPNC_CPPFLAGS)" CFLAGS="$(TARGET_CFLAGS)" \
 Samuel> +		LDFLAGS="$(VPNC_LDFLAGS)"

CC and CFLAGS are included in TARGET_CONFIGURE_OPTS, so those can be
dropped.

 Samuel> +endef
 Samuel> +
 Samuel> +define VPNC_INSTALL_TARGET_CMDS
 Samuel> +	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(@D)/vpnc
 Samuel> +	$(MAKE) -C $(@D) install $(TARGET_CONFIGURE_OPTS) \
 Samuel> +		CPPFLAGS="$(VPNC_CPPFLAGS)" CFLAGS="$(TARGET_CFLAGS)" \
 Samuel> +		LDFLAGS="$(VPNC_LDFLAGS)" DESTDIR="$(TARGET_DIR)" PREFIX=/usr
 Samuel> +endef

The explicit STRIPCMD shouldn't be used, and CFLAGS can again be
dropped.

Committed with those fixes, thanks.

-- 
Bye, Peter Korsgaard
