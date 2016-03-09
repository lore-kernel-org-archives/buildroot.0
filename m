From: Samuel Martin <s.martin49@gmail.com>
Date: Wed,  9 Mar 2016 23:58:46 +0100
Subject: [Buildroot] [PATCH v7 05/18] core: make staging *-config scripts
	relocatable
In-Reply-To: <1457564339-27294-1-git-send-email-s.martin49@gmail.com>
References: <1457564339-27294-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1457564339-27294-6-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change adjusts the _CONFIG_SCRIPTS hook to set add {exec_,}prefix computed
relatively to the script location.

This patch hook only fixes *-config scripts located in the staging area,
the target ones are already removed. A follow-up change will fix those
from the HOST_DIR location.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v6->v7:
- none

changes v5->v6:
- new patch
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 3904c09..ffa21ee 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -240,7 +240,7 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 		$(call MESSAGE,"Fixing package configuration files") ;\
 			$(SED)  "s,$(BASE_DIR), at BASE_DIR@,g" \
 				-e "s,$(STAGING_DIR), at STAGING_DIR@,g" \
-				-e "s,^\(exec_\)\?prefix=.*,\1prefix=@STAGING_DIR@/usr,g" \
+				-e "s,^\(exec_\)\?prefix=.*,\1prefix=\`dirname \$$0\`/../../usr,g" \
 				-e "s,-I/usr/,-I at STAGING_DIR@/usr/,g" \
 				-e "s,-L/usr/,-L at STAGING_DIR@/usr/,g" \
 				-e "s, at STAGING_DIR@,$(STAGING_DIR),g" \
-- 
2.7.2
