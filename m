From: Alexander Egorenkov <egorenar-dev@posteo.net>
Date: Thu, 10 Sep 2020 09:09:05 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/makedumpfile: fix build for
 powerpc target
Message-ID: <20200910070905.11891-1-egorenar-dev@posteo.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.net/results/e480858d63285e9bf79a4a96dae802ef2ce605c2

Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
---
 package/makedumpfile/makedumpfile.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/makedumpfile/makedumpfile.mk b/package/makedumpfile/makedumpfile.mk
index 1876e1158a..8077664892 100644
--- a/package/makedumpfile/makedumpfile.mk
+++ b/package/makedumpfile/makedumpfile.mk
@@ -15,9 +15,16 @@ MAKEDUMPFILE_DEPENDENCIES += lzo
 MAKEDUMPFILE_MAKE_OPTS += USELZO=on
 endif
 
+ifeq ($(BR2_powerpc),y)
+MAKEDUMPFILE_TARGET = powerpc32
+else
+MAKEDUMPFILE_TARGET = $(BR2_ARCH)
+endif
+
+
 define MAKEDUMPFILE_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		TARGET=$(BR2_ARCH) LINKTYPE=dynamic
+		TARGET=$(MAKEDUMPFILE_TARGET) LINKTYPE=dynamic
 endef
 
 define MAKEDUMPFILE_INSTALL_TARGET_CMDS
-- 
2.28.0
