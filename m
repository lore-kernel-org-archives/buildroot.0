From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 5 Sep 2013 20:04:21 -0500
Subject: [Buildroot] [PATCH 07/10] logrotate: add support for SELinux
In-Reply-To: <1378429464-12546-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1378429464-12546-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <1378429464-12546-8-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 package/logrotate/logrotate.mk |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index f5ef0b9..6db81d1 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -12,8 +12,17 @@ LOGROTATE_LICENSE_FILES = COPYING
 
 LOGROTATE_DEPENDENCIES = popt
 
+LOGROTATE_CFLAGS = $(TARGET_CFLAGS)
+LOGROTATE_LDFLAGS = $(TARGET_LDFLAGS)
+
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+	LOGROTATE_DEPENDENCIES += libselinux
+	LOGROTATE_CFLAGS += -DWITH_SELINUX=yes
+	LOGROTATE_LDFLAGS += -lselinux
+endif
+
 define LOGROTATE_BUILD_CMDS
-	$(MAKE) CC="$(TARGET_CC) $(TARGET_CFLAGS)" LDFLAGS="$(LDFLAGS)" -C $(@D)
+	$(MAKE) CC="$(TARGET_CC) $(LOGROTATE_CFLAGS)" LDFLAGS="$(LOGROTATE_LDFLAGS)" -C $(@D)
 endef
 
 define LOGROTATE_INSTALL_TARGET_CMDS
-- 
1.7.1
