From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Jul 2010 23:48:55 +0200
Subject: [Buildroot] [PATCH 12/19] samba: remove swat documentation when not
	needed
In-Reply-To: <cover.1280440124.git.thomas.petazzoni@free-electrons.com>
References: <cover.1280440124.git.thomas.petazzoni@free-electrons.com>
Message-ID: <9e06a8561665feb2c41e7a608b6849ac49ef0265.1280440124.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When SWAT (the Web administration tool of Samba) is enabled, which is
the default when one enables samba in Buildroot, a lot of
documentation gets installed in /usr/swat (~15 MB). This patch fixes
this by removing the documentation when BR2_HAVE_DOCUMENTATION is not
set.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/samba/samba.mk |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index 1c59070..44f7fde 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -161,6 +161,17 @@ $(SAMBA_HOOK_POST_INSTALL):
 	# remove unneeded
 	rm -f $(addprefix $(TARGET_DIR)/, $(SAMBA_BINTARGETS_))
 	rm -f $(addprefix $(TARGET_DIR)/, $(SAMBA_TXTTARGETS_))
+ifeq ($(BR2_PACKAGE_SAMBA_SWAT),y)
+ifneq ($(BR2_HAVE_DOCUMENTATION),y)
+	# Remove the documentation
+	rm -rf $(TARGET_DIR)/usr/swat/help/manpages
+	rm -rf $(TARGET_DIR)/usr/swat/help/Samba3*
+	rm -rf $(TARGET_DIR)/usr/swat/using_samba/
+	# Removing the welcome.html file will make swat default to
+	# welcome-no-samba-doc.html
+	rm -rf $(TARGET_DIR)/usr/swat/help/welcome.html
+endif
+endif
 	# strip binaries
 	$(STRIPCMD) $(STRIP_STRIP_ALL) $(addprefix $(TARGET_DIR)/, $(SAMBA_BINTARGETS_y))
 	# install start/stop script
-- 
1.7.0.4
