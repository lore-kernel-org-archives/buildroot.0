From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 8 Jul 2018 12:22:14 +0200
Subject: [Buildroot] [git commit] package/busybox: invert dependency with
 whois
Message-ID: <20180708110809.C7BBF863D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f13a12e2c90d2386263bb41eaa667c9daa0c7a8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/busybox/busybox.mk | 4 ++++
 package/whois/whois.mk     | 3 +--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 948a8313c3..47047d1a81 100644
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
