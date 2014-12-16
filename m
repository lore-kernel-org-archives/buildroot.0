From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 15 Dec 2014 21:54:16 -0600
Subject: [Buildroot] [PATCH 24/30] logrotate: selinux support
In-Reply-To: <1418702062-61039-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1418702062-61039-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1418702062-61039-25-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/logrotate/logrotate.mk | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index dc26d85..a7f8290 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -11,8 +11,17 @@ LOGROTATE_LICENSE_FILES = COPYING
 
 LOGROTATE_DEPENDENCIES = popt
 
+LOGROTATE_CFLAGS = $(TARGET_CFLAGS)
+LOGROTATE_LDFLAGS = $(TARGET_LDFLAGS)
+
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+LOGROTATE_DEPENDENCIES += libselinux
+LOGROTATE_CFLAGS += -DWITH_SELINUX=yes
+LOGROTATE_LDFLAGS += -lselinux
+endif
+
 define LOGROTATE_BUILD_CMDS
-	$(MAKE) CC="$(TARGET_CC) $(TARGET_CFLAGS)" LDFLAGS="$(LDFLAGS)" -C $(@D)
+	$(MAKE) CC="$(TARGET_CC) $(LOGROTATE_CFLAGS)" LDFLAGS="$(LOGROTATE_LDFLAGS)" -C $(@D)
 endef
 
 define LOGROTATE_INSTALL_TARGET_CMDS
-- 
1.9.1
