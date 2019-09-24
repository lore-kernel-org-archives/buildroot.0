From: Wolfgang Grandegger <wg@grandegger.com>
Date: Tue, 24 Sep 2019 14:29:20 +0200
Subject: [Buildroot] [PATCH v3] exfat,
 exfat-utils: fix the installation path of the helper, utilities
Message-ID: <ffca193d-4266-0806-c766-930ab8330977@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"mount" from the "util-linux" package does expect the helper utilities
in "/sbin" and not "/usr/sbin". We use "--exec-prefix=/" to fix the
issue. The man-pages are then still installed under "/usr/share/man".

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---

Changes since v2:
  "-prefix=/" is ignored. We now use "--exec-prefex", which will still
  install the man-pages under "/usr/share/man".

Changes since v1:
  Use "--prefix=/" to get programs properly installed

 package/exfat-utils/exfat-utils.mk | 2 ++
 package/exfat/exfat.mk             | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/package/exfat-utils/exfat-utils.mk b/package/exfat-utils/exfat-utils.mk
index 62cd471..16d5aa0 100644
--- a/package/exfat-utils/exfat-utils.mk
+++ b/package/exfat-utils/exfat-utils.mk
@@ -9,4 +9,6 @@ EXFAT_UTILS_SITE = https://github.com/relan/exfat/releases/download/v$(EXFAT_UTI
 EXFAT_UTILS_LICENSE = GPL-3.0+
 EXFAT_UTILS_LICENSE_FILES = COPYING
 
+EXFAT_UTILS_CONF_OPTS += --exec-prefix=/
+
 $(eval $(autotools-package))
diff --git a/package/exfat/exfat.mk b/package/exfat/exfat.mk
index b52b197..d8744fe 100644
--- a/package/exfat/exfat.mk
+++ b/package/exfat/exfat.mk
@@ -12,4 +12,6 @@ EXFAT_LICENSE = GPL-3.0+
 EXFAT_LICENSE_FILES = COPYING
 EXFAT_CFLAGS = $(TARGET_CFLAGS) -std=c99
 
+EXFAT_CONF_OPTS += --exec-prefix=/
+
 $(eval $(autotools-package))
-- 
2.7.4
