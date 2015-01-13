From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 13 Jan 2015 20:40:07 +0100
Subject: [Buildroot] [PATCH v3 7/7] linux: install dtc only in case package
	host dtc is not selected
In-Reply-To: <1421178007-11877-1-git-send-email-ps.report@gmx.net>
References: <1421178007-11877-1-git-send-email-ps.report@gmx.net>
Message-ID: <1421178007-11877-8-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Suggested by Matthew Weber (see [1]) to avoid double installation
of host dtc.

[1] http://lists.busybox.net/pipermail/buildroot/2015-January/117121.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 linux/linux.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 8256641..de15650 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -284,13 +284,14 @@ endef
 endif
 
 
+ifeq ($BR2_PACKAGE_HOST_DTC,)
 define LINUX_INSTALL_HOST_TOOLS
 	# Installing dtc (device tree compiler) as host tool, if selected
 	if grep -q "CONFIG_DTC=y" $(@D)/.config; then 	\
 		$(INSTALL) -D -m 0755 $(@D)/scripts/dtc/dtc $(HOST_DIR)/usr/bin/dtc ;	\
 	fi
 endef
-
+endif
 
 define LINUX_INSTALL_IMAGES_CMDS
 	cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
-- 
2.1.2
