From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 Sep 2015 11:37:09 +0200
Subject: [Buildroot] [git commit] uclibc: symlinks are now automatically
	created by uClibc-ng makefile
Message-ID: <20150906093845.7B9C2800FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d1e19882be8676e6a7f451517d786703c6ccd6cb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

So the workaround can be dropped now that we've moved to uClibc-ng 1.0.6.

[Peter: Extend commit message]
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uclibc/uclibc.mk |   15 ---------------
 1 files changed, 0 insertions(+), 15 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index a2ba230..eaac9dc 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -434,21 +434,6 @@ define UCLIBC_INSTALL_UTILS_TARGET
 endef
 endif
 
-# gcc produces binaries that use ld{64,}-uClibc.so.0 as the program
-# interpreter, but since uClibc-ng version is 1.0.0, it generates
-# ld{64,}-uClibc.so.1. In order to avoid changing gcc, we simply
-# create the necessary symbolic links here.
-ifeq ($(BR2_UCLIBC_VERSION_NG),y)
-define UCLIBC_INSTALL_LDSO_SYMLINKS
-	if [ -e $(TARGET_DIR)/lib/ld64-uClibc.so.1 ]; then \
-		(cd $(TARGET_DIR)/lib;ln -sf ld64-uClibc.so.1 ld64-uClibc.so.0) \
-	fi
-	if [ -e $(TARGET_DIR)/lib/ld-uClibc.so.1 ]; then \
-		(cd $(TARGET_DIR)/lib;ln -sf ld-uClibc.so.1 ld-uClibc.so.0) \
-	fi
-endef
-endif
-
 define UCLIBC_INSTALL_TARGET_CMDS
 	$(MAKE1) -C $(@D) \
 		$(UCLIBC_MAKE_FLAGS) \
