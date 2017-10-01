From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  1 Oct 2017 17:21:30 +0200
Subject: [Buildroot] [PATCH] package/urg: fix extraction commands
Message-ID: <20171001152130.2454-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the extraction commands entirely remove the urg directory,
which means the downloaded stamp will get removed, and thus a subsequent
build would try to re-download it.

It turns out that the directory extrqated by urg is already correctly
named, so we just need to extract out of the build directory. This
highly simplifies the command.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
---
 package/urg/urg.mk | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/urg/urg.mk b/package/urg/urg.mk
index 4a41779709..966627fe36 100644
--- a/package/urg/urg.mk
+++ b/package/urg/urg.mk
@@ -25,10 +25,7 @@ endif
 URG_CONFIG_SCRIPTS = c_urg-config urg-config
 
 define URG_EXTRACT_CMDS
-	$(RM) -rf $(URG_DIR)
-	$(UNZIP) -d $(BUILD_DIR)/ $(DL_DIR)/$(URG_SOURCE)
-	test -d $(URG_DIR) || \
-		mv $(BUILD_DIR)/$(subst .zip,,$(URG_SOURCE)) $(URG_DIR)
+	$(UNZIP) -d $(BUILD_DIR) $(DL_DIR)/$(URG_SOURCE)
 endef
 
 $(eval $(autotools-package))
-- 
2.11.0
