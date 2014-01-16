From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Thu, 16 Jan 2014 01:15:50 +0100
Subject: [Buildroot] [PATCH v2 07/12] libshairplay: new package
In-Reply-To: <1389831355-19983-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1389831355-19983-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1389831355-19983-8-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libshairplay is a client library that emulates an airplay server
This package was originally found at : https://github.com/huceke/buildroot-rbp
By gimli <ebsi4711@gmail.com>

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: gimli <ebsi4711@gmail.com>
---
Changes v1 -> v2:
  - Fix header (Yann E. Morin)
  - Fix comment on toolchain option (Peter Korsgaard)
---
 package/Config.in                    |  1 +
 package/libshairplay/Config.in       | 12 ++++++++++++
 package/libshairplay/libshairplay.mk | 14 ++++++++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 package/libshairplay/Config.in
 create mode 100644 package/libshairplay/libshairplay.mk

diff --git a/package/Config.in b/package/Config.in
index a5a7572..59a75cd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -682,6 +682,7 @@ source "package/liboping/Config.in"
 source "package/libosip2/Config.in"
 source "package/libpcap/Config.in"
 source "package/librsync/Config.in"
+source "package/libshairplay/Config.in"
 source "package/libsoup/Config.in"
 source "package/libtirpc/Config.in"
 source "package/libtorrent/Config.in"
diff --git a/package/libshairplay/Config.in b/package/libshairplay/Config.in
new file mode 100644
index 0000000..dd94ef2
--- /dev/null
+++ b/package/libshairplay/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LIBSHAIRPLAY
+  bool "libshairplay"
+  select BR2_PACKAGE_OPENSSL
+  depends on BR2_INET_IPV6
+  help
+    libshairplay is a client library that emulates an airplay
+    server
+
+    https://github.com/juhovh/shairplay
+
+comment "libshairplay needs a toolchain w/ IPv6"
+	depends on !BR2_INET_IPV6
diff --git a/package/libshairplay/libshairplay.mk b/package/libshairplay/libshairplay.mk
new file mode 100644
index 0000000..3488c24
--- /dev/null
+++ b/package/libshairplay/libshairplay.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# libshairplay
+#
+################################################################################
+
+LIBSHAIRPLAY_VERSION = 139d5ef55564514c31f02dd82cef91236c9ff523
+LIBSHAIRPLAY_SITE = $(call github,juhovh,shairplay,$(LIBSHAIRPLAY_VERSION))
+LIBSHAIRPLAY_INSTALL_STAGING = YES
+LIBSHAIRPLAY_INSTALL_TARGET = YES
+LIBSHAIRPLAY_AUTORECONF = YES
+LIBSHAIRPORT_LICENSE = MIT
+
+$(eval $(autotools-package))
-- 
1.8.5.2
