From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 5 Oct 2019 17:25:04 +0200
Subject: [Buildroot] [git commit] package/suricata: security bump to version
 4.1.5
Message-ID: <20191005152228.40865888C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=37be55a5dbf9ddf88372a3b870a4f9eb87549bdd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop second patch (already in version)
- Add libmaxminddb optional dependency and use --disable-libgeoip to prefer
  maxminddb over geoip, see:
  https://github.com/OISF/suricata/commit/d29072647fa479eb748357a5a75f1ac4206a2cff
  https://github.com/OISF/suricata/commit/c55226b7126079d78e4bf5c6fc290242001954a6
- Disable sphinx-build (to avoid a build failure)
- This release fixes a number of issues found in the 4.1 branch. Some of
  the issues are security issues, so upgrading is highly recommended.
  See https://suricata-ids.org/2019/09/24/suricata-4-1-5-released

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...-packet-fix-build-on-recent-Linux-kernels.patch | 28 ----------------------
 package/suricata/suricata.hash                     |  2 +-
 package/suricata/suricata.mk                       | 18 +++++++++++---
 3 files changed, 16 insertions(+), 32 deletions(-)

diff --git a/package/suricata/0002-af-packet-fix-build-on-recent-Linux-kernels.patch b/package/suricata/0002-af-packet-fix-build-on-recent-Linux-kernels.patch
deleted file mode 100644
index 6547fd57f5..0000000000
--- a/package/suricata/0002-af-packet-fix-build-on-recent-Linux-kernels.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From b37554e0bc3cf383e6547c5c6a69c6f6849c09e3 Mon Sep 17 00:00:00 2001
-From: Eric Leblond <eric@regit.org>
-Date: Wed, 17 Jul 2019 12:35:12 +0200
-Subject: [PATCH] af-packet: fix build on recent Linux kernels
-
-Downloaded from upstream commit
-https://github.com/OISF/suricata/commit/b37554e0bc3cf383e6547c5c6a69c6f6849c09e3
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/source-af-packet.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/source-af-packet.c b/src/source-af-packet.c
-index 2c65ccbcf5..e117d36e5c 100644
---- a/src/source-af-packet.c
-+++ b/src/source-af-packet.c
-@@ -65,6 +65,10 @@
- #include <sys/ioctl.h>
- #endif
- 
-+#if HAVE_LINUX_SOCKIOS_H
-+#include <linux/sockios.h>
-+#endif
-+
- #ifdef HAVE_PACKET_EBPF
- #include "util-ebpf.h"
- #include <bpf/libbpf.h>
diff --git a/package/suricata/suricata.hash b/package/suricata/suricata.hash
index 44ada0115a..dc52999a9d 100644
--- a/package/suricata/suricata.hash
+++ b/package/suricata/suricata.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256 6cda6c80b753ce36483c6be535358b971f3890b9aa27a58c2d2f7e89dd6c6aa0  suricata-4.1.3.tar.gz
+sha256 cee5f6535cd7fe63fddceab62eb3bc66a63fc464466c88ec7a41b7a1331ac74b  suricata-4.1.5.tar.gz
 
 # Hash for license files:
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
index 0491fad6d5..56eb6a706f 100644
--- a/package/suricata/suricata.mk
+++ b/package/suricata/suricata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SURICATA_VERSION = 4.1.3
+SURICATA_VERSION = 4.1.5
 SURICATA_SITE = https://www.openinfosecfoundation.org/download
 SURICATA_LICENSE = GPL-2.0
 SURICATA_LICENSE_FILES = COPYING LICENSE
@@ -24,6 +24,8 @@ SURICATA_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_LZMA),lzma) \
 	pcre
 
+SURICATA_CONF_ENV = ac_cv_path_HAVE_SPHINXBUILD=no
+
 SURICATA_CONF_OPTS = \
 	--disable-gccprotect \
 	--disable-pie \
@@ -44,9 +46,19 @@ else
 SURICATA_CONF_OPTS += --disable-libmagic
 endif
 
-ifeq ($(BR2_PACKAGE_GEOIP),y)
+# --disable-libgeoip disables libgeoip when --enable-geoip is requested.
+# This allows libmaxminddb to be picked up instead of libgeoip when both are
+# installed on the system.
+ifeq ($(BR2_PACKAGE_LIBMAXMINDDB),y)
+SURICATA_DEPENDENCIES += libmaxminddb
+SURICATA_CONF_OPTS += \
+	--enable-geoip \
+	--disable-libgeoip
+else ifeq ($(BR2_PACKAGE_GEOIP),y)
 SURICATA_DEPENDENCIES += geoip
-SURICATA_CONF_OPTS += --enable-geoip
+SURICATA_CONF_OPTS += \
+	--enable-geoip \
+	--enable-libgeoip
 else
 SURICATA_CONF_OPTS += --disable-geoip
 endif
