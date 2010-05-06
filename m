From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Thu,  6 May 2010 21:12:49 +0200
Subject: [Buildroot] [PATCH] package: Add staging libraries paths in target
	LDFLAGS
Message-ID: <1273173169-32078-1-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Recently some problem have been raised about libtooled packages trying
to link with host's libraries. The problem is that at some point in
the compilation process, options like "-rpath /usr/lib" are added to
the link flags. It seems libtool add the -L$(DIR) if -rpath $(DIR).

The short term fix is to add the -L$(STAGING_DIR)/lib and
-L$(STAGING_DIR)/usr/lib options to TARGET_LDFLAGS variable (it's
already done for buildroot generated toolchains). This way, the linker
will look at $(STAGING_DIR)/* libraries paths first, and try to link
with them. It remains that the linker will fail if a "-L/usr/lib"
option is found before the "-L$(STAGING_DIR)/lib
-L$(STAGING_DIR)/usr/lib" options. Hopefully it's not the case.

The long term fix would be to teach libtool about sysroots, which is a
complicated task for many reasons.

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/Makefile.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index eab9168..d8c9ecb 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -92,7 +92,7 @@ endif
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
 TARGET_CFLAGS+=--sysroot $(STAGING_DIR)/
 TARGET_CXXFLAGS=$(TARGET_CFLAGS)
-TARGET_LDFLAGS=--sysroot $(STAGING_DIR)/
+TARGET_LDFLAGS=--sysroot $(STAGING_DIR)/ -L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib
 endif
 #########################################################################
 
-- 
1.7.0.4
