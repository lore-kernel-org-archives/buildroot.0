From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jan 2014 23:47:57 +0100
Subject: [Buildroot] [git commit] libshairplay: new package
Message-ID: <20140122224834.D4E3F9C5D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ac37a9b42f821ad9f72123b3ab411382b3aafcf8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libshairplay is a client library that emulates an airplay server
This package was originally found at : https://github.com/huceke/buildroot-rbp
By gimli <ebsi4711@gmail.com>

[Peter: fix whitespace, needs threads, host-pkgconf and optionally libao]
Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: gimli <ebsi4711@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                    |    1 +
 package/libshairplay/Config.in       |   12 ++++++++++++
 package/libshairplay/libshairplay.mk |   15 +++++++++++++++
 3 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index fcbf720..3bf3434 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -682,6 +682,7 @@ source "package/libosip2/Config.in"
 source "package/libpcap/Config.in"
 source "package/librsync/Config.in"
 source "package/libsocketcan/Config.in"
+source "package/libshairplay/Config.in"
 source "package/libsoup/Config.in"
 source "package/libtirpc/Config.in"
 source "package/libtorrent/Config.in"
diff --git a/package/libshairplay/Config.in b/package/libshairplay/Config.in
new file mode 100644
index 0000000..bcdad3f
--- /dev/null
+++ b/package/libshairplay/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LIBSHAIRPLAY
+	bool "libshairplay"
+	depends on BR2_INET_IPV6
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  libshairplay is a client library that emulates an airplay
+	  server.
+
+	  https://github.com/juhovh/shairplay
+
+comment "libshairplay needs a toolchain w/ IPv6, threads"
+	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libshairplay/libshairplay.mk b/package/libshairplay/libshairplay.mk
new file mode 100644
index 0000000..fc397d7
--- /dev/null
+++ b/package/libshairplay/libshairplay.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libshairplay
+#
+################################################################################
+
+LIBSHAIRPLAY_VERSION = 139d5ef55564514c31f02dd82cef91236c9ff523
+LIBSHAIRPLAY_SITE = $(call github,juhovh,shairplay,$(LIBSHAIRPLAY_VERSION))
+LIBSHAIRPLAY_INSTALL_STAGING = YES
+LIBSHAIRPLAY_AUTORECONF = YES
+LIBSHAIRPLAY_LICENSE = MIT, BSD-3c, LGPLv2.1+
+LIBSHAIRPLAY_LICENSE_FILES = LICENSE
+LIBSHAIRPLAY_DEPENDENCIES = host-pkgconf $(if $(BR2_PACKAGE_LIBAO),libao)
+
+$(eval $(autotools-package))
