From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Tue, 9 Sep 2014 18:29:31 +0000
Subject: [Buildroot] [PATCH] openssh: fix static linking
Message-ID: <F9C551623D2CBB4C9488801D14F864C68C8AE2F4@ex-mb3.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When BR2_PREFER_STATIC_LIB is set, openssl is a static library, openssh
attempts to build dynamically as the LDFLAGS are dropped out of this build.
If PREFER_STATIC is set, add back in --static to the LDFLAGS of openssh
to make the linker happy.

Signed-off-by:  Andy Kennedy <andy.kennedy@adtran.com>
---
diff -Naur a/package/openssh/openssh.mk b/package/openssh/openssh.mk
--- a/package/openssh/openssh.mk	2014-02-27 14:51:23.000000000 -0600
+++ b/package/openssh/openssh.mk	2014-09-09 12:09:57.043850866 -0500
@@ -6,10 +6,18 @@
 
 OPENSSH_VERSION = 6.5p1
 OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
-OPENSSH_CONF_ENV = LD="$(TARGET_CC)" LDFLAGS="$(TARGET_CFLAGS)"
+OPENSSH_CONF_ENV = LD="$(TARGET_CC)"
 OPENSSH_CONF_OPT = --disable-lastlog --disable-utmp \
 		--disable-utmpx --disable-wtmp --disable-wtmpx --disable-strip
 
+OPENSSH_LDFLAGS_FOR_CONF = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+OPENSSH_LDFLAGS_FOR_CONF += --static
+endif
+
+OPENSSH_CONFIGURE_ENV += LDFLAGS="$(OPENSSH_LDFLAGS_FOR_CONF)"
+
 OPENSSH_DEPENDENCIES = zlib openssl
 
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
