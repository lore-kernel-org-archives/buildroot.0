From: Samuel Martin <s.martin49@gmail.com>
Date: Mon,  1 Feb 2016 16:53:32 +0100
Subject: [Buildroot] [PATCH v6 04/13] core: staging symlink uses a relative
	path when possible
In-Reply-To: <1454342021-22960-1-git-send-email-s.martin49@gmail.com>
References: <1454342021-22960-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1454342021-22960-5-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A step forward toward a relocatable SDK.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v5->v6:
- no changes

changes v4->v5:
- add support when BR2_HOST_DIR is set somewhere out of BASE_DIR

changes v3->v4:
- no change

changes v2->v3:
- no change
---
 Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index 10193ba..7c87177 100644
--- a/Makefile
+++ b/Makefile
@@ -518,7 +518,11 @@ $(BUILD_DIR) $(TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIS
 # Populating the staging with the base directories is handled by the skeleton package
 $(STAGING_DIR):
 	@mkdir -p $(STAGING_DIR)
+ifeq ($(BASE_DIR)/host/$(STAGING_SUBDIR),$(STAGING_DIR))
+	@ln -snf host/$(STAGING_SUBDIR) $(BASE_DIR)/staging
+else
 	@ln -snf $(STAGING_DIR) $(BASE_DIR)/staging
+endif
 
 RSYNC_VCS_EXCLUSIONS = \
 	--exclude .svn --exclude .git --exclude .hg --exclude .bzr \
-- 
2.7.0
