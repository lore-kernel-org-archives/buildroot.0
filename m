From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Apr 2010 23:40:49 +0200
Subject: [Buildroot] [PATCH 08/19] packages: handle interrupted downloads
In-Reply-To: <cover.1272490771.git.thomas.petazzoni@free-electrons.com>
References: <cover.1272490771.git.thomas.petazzoni@free-electrons.com>
Message-ID: <26f6da8ae60676fbdc21ce33574848fe35cb9749.1272490771.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, when package downloads are interrupted, next time you run
Buildroot, it thinks that the download is complete (the file is
present in $(DL_DIR), isn't it ?), which leads Buildroot to extract an
invalid tarball.

Therefore, the DOWNLOAD macro is enhanced to download the file under a
temporary name, and to rename it to the correct name one the download
has completed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.package.in |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index e98fda8..8fa82a0 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -51,14 +51,18 @@ TERM_RESET := $(shell tput rmso)
 # $(call DOWNLOAD,$(FOO_SITE),$(FOO_SOURCE))
 ################################################################################
 
-# support make source-check/external-deps
+# In order to avoid interrupted downloaded being considered as
+# complete, we download under a temporary name and rename once the
+# download is completed. The SPIDER thing is here to support make
+# source-check/external-deps
 ifneq ($(SPIDER),)
 DOWNLOAD=$(WGET) -P $(DL_DIR) $(1)/$(2)
 else
 define DOWNLOAD
 	$(Q)test -e $(DL_DIR)/$(2) || \
+	(rm -f $(DL_DIR)/$(2).tmp &&   \
 	for site in $(call qstrip,$(BR2_PRIMARY_SITE)) $(1) $(call qstrip,$(BR2_BACKUP_SITE)); \
-	do $(WGET) -P $(DL_DIR) $$site/$(2) && exit; done
+	do $(WGET) -O $(DL_DIR)/$(2).tmp $$site/$(2) && mv $(DL_DIR)/$(2).tmp $(DL_DIR)/$(2) && exit; done)
 endef
 endif
 
-- 
1.6.3.3
