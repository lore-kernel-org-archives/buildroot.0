From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 19:42:19 +0200
Subject: [Buildroot] [PATCH 33/74] tiff: use correct construct to override
	target installation
In-Reply-To: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
Message-ID: <0958e6109c9ed8c82342d17a1205e3c4b8baa3f0.1284312638.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We also remove the stripping, as it is already done globally.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tiff/tiff.mk |   10 ++++------
 1 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 8db215e..ca6f562 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -17,10 +17,8 @@ TIFF_CONF_OPT = \
 
 TIFF_DEPENDENCIES = host-pkg-config zlib jpeg
 
-$(eval $(call AUTOTARGETS,package,tiff))
-
-$(TIFF_TARGET_INSTALL_TARGET):
-	-cp -a $(TIFF_DIR)/libtiff/.libs/libtiff.so* $(TARGET_DIR)/usr/lib/
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libtiff.so
-	touch $@
+define TIFF_INSTALL_TARGET_CMDS
+	-cp -a $(@D)/libtiff/.libs/libtiff.so* $(TARGET_DIR)/usr/lib/
+endef
 
+$(eval $(call AUTOTARGETS,package,tiff))
-- 
1.7.0.4
