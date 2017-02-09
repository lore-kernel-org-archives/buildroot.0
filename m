From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  9 Feb 2017 15:32:30 +0200
Subject: [Buildroot] [PATCH] ed: security bump to version 1.14.1
Message-ID: <6796986f067dee849f76751df0c57bbf28d30492.1486647150.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2017-5357: crash with some malformed commands.

Upstream now provides .tar.lz archive. Add the necessary extract command.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/ed/ed.hash | 6 ++++--
 package/ed/ed.mk   | 9 ++++++++-
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/package/ed/ed.hash b/package/ed/ed.hash
index 7871fb11bf53..22c1e671dc14 100644
--- a/package/ed/ed.hash
+++ b/package/ed/ed.hash
@@ -1,2 +1,4 @@
-# From http://lists.gnu.org/archive/html/bug-ed/2013-06/msg00001.html
-md5	565b6d1d5a9a8816b9b304fc4ed9405d	ed-1.9.tar.gz
+# From http://lists.gnu.org/archive/html/bug-ed/2017-01/msg00002.html
+sha1	a91f785f7e16dc68e1c9c86d532ebd9698171ba0	ed-1.14.1.tar.lz
+# Locally computed
+sha256	ffb97eb8f2a2b5a71a9b97e3872adce953aa1b8958e04c5b7bf11d556f32552a	ed-1.14.1.tar.lz
diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index 36f2f2ed299d..50adeb4ec5b4 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -4,14 +4,21 @@
 #
 ################################################################################
 
-ED_VERSION = 1.9
+ED_VERSION = 1.14.1
 ED_SITE = $(BR2_GNU_MIRROR)/ed
+ED_SOURCE = ed-$(ED_VERSION).tar.lz
 ED_CONF_OPTS = \
 	CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
 	LDFLAGS="$(TARGET_LDFLAGS)"
+ED_DEPENDENCIES = host-lzip
 ED_LICENSE = GPLv3+
 ED_LICENSE_FILES = COPYING
 
+define ED_EXTRACT_CMDS
+	$(HOST_DIR)/usr/bin/lzip -d -c $(DL_DIR)/$(ED_SOURCE) | \
+		tar --strip-components=1 -C $(@D) $(TAR_OPTIONS) -
+endef
+
 define ED_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_MAKE_ENV) ./configure \
-- 
2.11.0
