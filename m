From: Martin Banky <martin.banky@gmail.com>
Date: Sat,  2 Oct 2010 15:06:23 -0700
Subject: [Buildroot] [PATCH 1/2] libosip2: change site location and bump to
	3.3.0
In-Reply-To: <1286057184-3486-1-git-send-email-Martin.Banky@gmail.com>
References: <1286057184-3486-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1286057184-3486-2-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Change the site location to debian mirror to get the latest debian patches.

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/libosip2/libosip2.mk |   26 ++++++++++++++++++--------
 1 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/package/libosip2/libosip2.mk b/package/libosip2/libosip2.mk
index 441b84c..aa15332 100644
--- a/package/libosip2/libosip2.mk
+++ b/package/libosip2/libosip2.mk
@@ -3,14 +3,24 @@
 # libosip2
 #
 #############################################################
-LIBOSIP2_VERSION=3.1.0
-LIBOSIP2_SOURCE=libosip2-$(LIBOSIP2_VERSION).tar.gz
-LIBOSIP2_SITE=http://www.antisip.com/download/exosip2
-LIBOSIP2_INSTALL_STAGING=YES
+LIBOSIP2_VERSION = 3.3.0
+LIBOSIP2_SOURCE = libosip2_$(LIBOSIP2_VERSION).orig.tar.gz
+LIBOSIP2_PATCH = libosip2_$(LIBOSIP2_VERSION)-1.diff.gz
+LIBOSIP2_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/libo/libosip2
+LIBOSIP2_INSTALL_STAGING = YES
 
-LIBOSIP2_CONF_OPT = \
-	--with-gnu-ld \
-	--enable-shared \
-	--enable-static
+ifneq ($(LIBOSIP2_PATCH),)
+define LIBOSIP2_DEBIAN_PATCHES
+	if [ -d $(@D)/debian/patches ]; then \
+		(cd $(@D)/debian/patches && for i in *; \
+		 do $(SED) 's,^\+\+\+ .*cvs-$(LIBOSIP2_VERSION)/,+++ cvs-$(LIBOSIP2_VERSION)/,' $$i; \
+		 done; \
+		); \
+		toolchain/patch-kernel.sh $(@D) $(@D)/debian/patches \*; \
+	fi
+endef
+endif
+
+LIBOSIP2_POST_PATCH_HOOKS += LIBOSIP2_DEBIAN_PATCHES
 
 $(eval $(call AUTOTARGETS,package,libosip2))
-- 
1.7.3.1
