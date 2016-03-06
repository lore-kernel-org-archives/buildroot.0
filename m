From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  6 Mar 2016 21:24:20 +0100
Subject: [Buildroot] [PATCH] package/owfs: fix link with FUSE
Message-ID: <1457295860-30898-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

owfs reinvents its own weird and wicked mechanism to find libfuse. It
believes that, by default, FUSE is installed in /usr/local, and forcibly
uses that path to look for headers and libs.

This is obviously wrong in cross-compilation, and triggers our check for
unsafe header/library paths.

The best option to fix that would be to use pkg-config to find FUSE, but
this is a bit involved. Instead, use config options to specify the path
to the headers and libs.

Fixes:
    http://autobuild.buildroot.org/results/2c8/2c8baf6910d7ac2e3c92efa62cc3b9d3737e1fb5/
    http://autobuild.buildroot.org/results/1f9/1f994f53ceca434ebd1d87923f85b5ed71229d94/
    and a few others...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 package/owfs/owfs.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/owfs/owfs.mk b/package/owfs/owfs.mk
index e8c451c..23167f4 100644
--- a/package/owfs/owfs.mk
+++ b/package/owfs/owfs.mk
@@ -17,8 +17,11 @@ OWFS_LICENSE = GPLv2+, LGPLv2 (owtcl)
 OWFS_LICENSE_FILES = COPYING COPYING.LIB
 
 ifeq ($(BR2_PACKAGE_LIBFUSE),y)
-OWFS_CONF_OPTS += --enable-owfs
 OWFS_DEPENDENCIES += libfuse
+OWFS_CONF_OPTS += \
+	--enable-owfs \
+	--with-fuseinclude=$(STAGING_DIR)/usr/include \
+	--with-fuselib=$(STAGING_DIR)/usr/lib
 else
 OWFS_CONF_OPTS += --disable-owfs
 endif
-- 
1.9.1
