From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Thu,  3 Dec 2015 18:25:28 -0200
Subject: [Buildroot] [PATCH] libsemanage: fix build error when linking with
	ustr
Message-ID: <1449174328-8317-1-git-send-email-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable ustr inline functions to avoid multiple definition of symbols error
when linking with ustr.

Fixes:
http://autobuild.buildroot.net/results/e7012c7a734dbdd1c697cf63b6df6e834e8eafc7
http://autobuild.buildroot.net/results/0783a63e4694ffa8463ef5533b635c7e7c43dd42
http://autobuild.buildroot.net/results/40726abf3419a727c5762ef2791dbf53fa1736c0
http://autobuild.buildroot.net/results/a6a0c827c393a5fb41653d71d1ee50df283a32fb
...

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/libsemanage/libsemanage.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index 197c14e4229a..ea9f4c9f67de 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -13,10 +13,15 @@ LIBSEMANAGE_INSTALL_STAGING = YES
 
 LIBSEMANAGE_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS)
 
+# disable ustr inline functions to avoid multiple definition of symbols
+# error when linking
+LIBSEMANAGE_CFLAGS = $(TARGET_CFLAGS) -DUSTR_CONF_COMPILE_USE_INLINE=0
+
 define LIBSEMANAGE_BUILD_CMDS
 	# DESTDIR is needed during the compile to compute library and
 	# header paths.
-	$(MAKE) -C $(@D) $(LIBSEMANAGE_MAKE_OPTS) DESTDIR=$(STAGING_DIR) all
+	$(MAKE) -C $(@D) $(LIBSEMANAGE_MAKE_OPTS) CFLAGS="$(LIBSEMANAGE_CFLAGS)" \
+		DESTDIR=$(STAGING_DIR) all
 endef
 
 define LIBSEMANAGE_INSTALL_STAGING_CMDS
-- 
1.9.1
