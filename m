From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  6 Jan 2011 15:41:58 -0300
Subject: [Buildroot] [PATCH 2/5] pciutils: SHARED make opt goes for install
	too
In-Reply-To: <1294339321-5659-1-git-send-email-gustavo@zacarias.com.ar>
References: <1294339321-5659-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1294339321-5659-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If we don't pass SHARED when installing we miss the shared library
symlinks (libpci.so & libpci.so.3) thus breaking stuff.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/pciutils/pciutils.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index 6e16300..782d348 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -39,8 +39,10 @@ endef
 
 # Ditch install-lib if SHARED is an option in the future
 define PCIUTILS_INSTALL_TARGET_CMDS
-	$(MAKE) BUILDDIR=$(@D) -C $(@D) PREFIX=$(TARGET_DIR)/usr install
-	$(MAKE) BUILDDIR=$(@D) -C $(@D) PREFIX=$(TARGET_DIR)/usr install-lib
+	$(MAKE) BUILDDIR=$(@D) -C $(@D) PREFIX=$(TARGET_DIR)/usr \
+		SHARED=$(PCIUTILS_SHARED) install
+	$(MAKE) BUILDDIR=$(@D) -C $(@D) PREFIX=$(TARGET_DIR)/usr \
+		SHARED=$(PCIUTILS_SHARED) install-lib
 endef
 
 $(eval $(call GENTARGETS,package,pciutils))
-- 
1.7.2.2
