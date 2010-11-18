From: Mike Frysinger <vapier@gentoo.org>
Date: Wed, 17 Nov 2010 23:00:56 -0500
Subject: [Buildroot] [PATCH 2/2 v2] busybox: let buildroot handle stripping
In-Reply-To: <1289976432-22684-2-git-send-email-vapier@gentoo.org>
References: <1289976432-22684-2-git-send-email-vapier@gentoo.org>
Message-ID: <1290052856-19294-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For some ABI's (like FLAT), we cannot strip busybox as the file format
does not support it and strip will abort with errors like 'File format
not recognized'.  Since the toplevel already takes care of stripping
things, simply disable the busybox step.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
v2
	- drop the strip logic entirely in favor of common toplevel

 package/busybox/busybox.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 5ef1622..92d4ab7 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -124,7 +124,7 @@ define BUSYBOX_BUILD_CMDS
 	$(BUSYBOX_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" ARCH=$(KERNEL_ARCH) \
 		PREFIX="$(TARGET_DIR)" EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
 		CROSS_COMPILE="$(TARGET_CROSS)" CONFIG_PREFIX="$(TARGET_DIR)" \
-		-C $(BUSYBOX_DIR)
+		STRIP=true -C $(BUSYBOX_DIR)
 endef
 
 ifeq ($(BR2_PACKAGE_BUSYBOX_FULLINSTALL),y)
-- 
1.7.3.2
