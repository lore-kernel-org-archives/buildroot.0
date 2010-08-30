From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Aug 2010 23:15:18 +0200
Subject: [Buildroot] [PATCH 1/1] Fix ldconfig call in target-finalize
In-Reply-To: <cover.1283202909.git.thomas.petazzoni@free-electrons.com>
References: <cover.1283202909.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4ccde7fabbeb41472a0e662be4bc60707e099a02.1283202909.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Recent versions of ldconfig require the directory /var/lib/ldconfig,
otherwise they bail out with an error. Moreover, having a
/etc/ld.so.conf file also avoids a warning.

In addition to this, we remove the redirection of stderr, so that
errors remain visible to the user.

Thanks to Baruch Siach, Andy Gibbs and Darcy Watkins for investigating
the issue and proposing solutions.

This fixes the build on recent distributions such as Fedora 13 or
Gentoo.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index d37d81f..462d974 100644
--- a/Makefile
+++ b/Makefile
@@ -400,13 +400,17 @@ ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 	rm -rf $(TARGET_DIR)/usr/share/gtk-doc
 endif
 	find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIPCMD) 2>/dev/null || true
+	mkdir -p $(TARGET_DIR)/etc
+	# Mandatory configuration file and auxilliary cache directory
+	# for recent versions of ldconfig
+	touch $(TARGET_DIR)/etc/ld.so.conf
+	mkdir -p $(TARGET_DIR)/var/cache/ldconfig
 	if [ -x "$(TARGET_CROSS)ldconfig" ]; \
 	then \
-		$(TARGET_CROSS)ldconfig -r $(TARGET_DIR) 2>/dev/null; \
+		$(TARGET_CROSS)ldconfig -r $(TARGET_DIR); \
 	else \
-		/sbin/ldconfig -r $(TARGET_DIR) 2>/dev/null; \
+		/sbin/ldconfig -r $(TARGET_DIR); \
 	fi
-	mkdir -p $(TARGET_DIR)/etc
 	echo $(BR2_VERSION)$(shell $(TOPDIR)/scripts/setlocalversion) > \
 		$(TARGET_DIR)/etc/br-version
 
-- 
1.7.0.4
