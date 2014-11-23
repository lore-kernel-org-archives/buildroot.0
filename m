From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Nov 2014 21:38:36 +0100
Subject: [Buildroot] [PATCH 04/51] radvd: use <pkg>_INSTALL_INIT_SYSV
In-Reply-To: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1416775163-20215-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit changes the radvd to use the <pkg>_INSTALL_INIT_SYSV
mechanism instead of using a post install target hook. We also use a
full destination path when calling $(INSTALL).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/radvd/radvd.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index e0d4f69..e65d74a 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -12,10 +12,8 @@ RADVD_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 # For radvd-01-drop-check.patch & radvd-02-drop-stack-protector.patch
 RADVD_AUTORECONF = YES
 
-define RADVD_INSTALL_INITSCRIPT
-	$(INSTALL) -m 0755 package/radvd/S50radvd $(TARGET_DIR)/etc/init.d
+define RADVD_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/radvd/S50radvd $(TARGET_DIR)/etc/init.d/S50radvd
 endef
 
-RADVD_POST_INSTALL_TARGET_HOOKS += RADVD_INSTALL_INITSCRIPT
-
 $(eval $(autotools-package))
-- 
2.1.0
