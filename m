From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  2 Jul 2018 23:11:36 +0200
Subject: [Buildroot] [PATCH 02/50] package/busybox: invert dependency with
 whois
In-Reply-To: <cover.1530565933.git.yann.morin.1998@free.fr>
References: <cover.1530565933.git.yann.morin.1998@free.fr>
Message-ID: <1e7004626aabd236f49c84b31b1b94e0e3a7c673.1530565933.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/busybox/busybox.mk | 4 ++++
 package/whois/whois.mk     | 3 +--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index c566cdc3d6..2b60a7faef 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -20,6 +20,10 @@ BUSYBOX_CFLAGS = \
 BUSYBOX_LDFLAGS = \
 	$(TARGET_LDFLAGS)
 
+# Packages that provide commands that may also be busybox applets:
+BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_WHOIS),whois)
+
 # Link against libtirpc if available so that we can leverage its RPC
 # support for NFS mounting with BusyBox
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index c9203d8c0d..6b6069c51a 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -7,8 +7,7 @@
 WHOIS_VERSION = 5.3.1
 WHOIS_SITE = http://snapshot.debian.org/archive/debian/20180522T155750Z/pool/main/w/whois
 WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
-# take precedence over busybox implementation
-WHOIS_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox) $(TARGET_NLS_DEPENDENCIES)
+WHOIS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 WHOIS_MAKE_ENV = $(TARGET_MAKE_ENV)
 WHOIS_MAKE_OPTS = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
 	LIBS="$(WHOIS_EXTRA_LIBS)"
-- 
2.14.1
