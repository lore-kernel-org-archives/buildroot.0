From: Hollis Blanchard <hollis_blanchard@mentor.com>
Date: Wed, 29 Jul 2015 11:47:38 -0700
Subject: [Buildroot] [PATCH] Disable e4defrag in host-e2fsprogs
Message-ID: <1438195658-27948-1-git-send-email-hollis_blanchard@mentor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

e4defrag from e2fsprogs 1.42.13 encounters these build errors on RHEL5.8 hosts:
e4defrag.c:197:2: error: #error sync_file_range not available!
e4defrag.c:201:2: error: #error fallocate64 not available!

It's possible to fix these problems, but we don't use it on the host anyways,
so just disable it.

Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>
---
 package/e2fsprogs/e2fsprogs.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index c863f70..2f043ca 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -12,6 +12,10 @@ E2FSPROGS_LICENSE_FILES = COPYING lib/uuid/COPYING lib/ss/mit-sipb-copyright.h l
 E2FSPROGS_INSTALL_STAGING = YES
 E2FSPROGS_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-libs
 
+# e4defrag doesn't build on older systems like RHEL5.x, and we don't need it
+# on the host anyways.
+HOST_E2FSPROGS_CONF_OPTS += --disable-defrag
+
 E2FSPROGS_CONF_OPTS = \
 	$(if $(BR2_STATIC_LIBS),,--enable-elf-shlibs) \
 	$(if $(BR2_PACKAGE_E2FSPROGS_DEBUGFS),,--disable-debugfs) \
-- 
2.3.2
