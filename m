From: Joshua Henderson <joshua.henderson@microchip.com>
Date: Thu, 22 Mar 2018 09:24:26 -0700
Subject: [Buildroot] [PATCH] sam-ba: use correct host arch binary for sam-ba
 symlink
Message-ID: <1521735866-15288-1-git-send-email-joshua.henderson@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make the symlink created in the host/bin directory point to the right host arch
binary.  This takes into account using the 32 bit or 64 bit binary.

Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
---
 package/sam-ba/sam-ba.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
index 244ede3..3ad98e0 100644
--- a/package/sam-ba/sam-ba.mk
+++ b/package/sam-ba/sam-ba.mk
@@ -23,10 +23,16 @@ endef
 # then create a symbolic link from $(HOST_DIR)/bin to the
 # application binary, for easier usage.
 
+ifeq ($(HOSTARCH),x86_64)
+SAM_BA_BIN_NAME=sam-ba_64
+else
+SAM_BA_BIN_NAME=sam-ba
+endif
+
 define HOST_SAM_BA_INSTALL_CMDS
 	mkdir -p $(HOST_DIR)/opt/sam-ba/
 	cp -a $(@D)/* $(HOST_DIR)/opt/sam-ba/
-	ln -sf ../../opt/sam-ba/sam-ba $(HOST_DIR)/bin/sam-ba
+	ln -sf ../opt/sam-ba/$(SAM_BA_BIN_NAME) $(HOST_DIR)/bin/sam-ba
 endef
 
 $(eval $(host-generic-package))
-- 
2.7.4
