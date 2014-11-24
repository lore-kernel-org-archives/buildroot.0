From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 24 Nov 2014 14:57:02 +0100
Subject: [Buildroot] [PATCH v4 next 5/5] support/download: pass the quiet
	flag to the scp download helper
In-Reply-To: <1416837422-1977-1-git-send-email-fabio.porcedda@gmail.com>
References: <1416837422-1977-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1416837422-1977-6-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To be coherent to others download helper, instead of adding the "QUIET"
variable to the "SCP" variable, pass the "QUIET" variable to the scp
download helper.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---

Notes:
    v4:
     - add this patch

 package/pkg-download.mk | 5 +++--
 support/download/scp    | 3 ++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 074488d..7b9e260 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -14,7 +14,7 @@ export CVS := $(call qstrip,$(BR2_CVS))
 export BZR := $(call qstrip,$(BR2_BZR))
 export GIT := $(call qstrip,$(BR2_GIT))
 export HG := $(call qstrip,$(BR2_HG))
-export SCP := $(call qstrip,$(BR2_SCP)) $(QUIET)
+export SCP := $(call qstrip,$(BR2_SCP))
 SSH := $(call qstrip,$(BR2_SSH)) $(QUIET)
 export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
 
@@ -175,7 +175,8 @@ define DOWNLOAD_SCP
 	test -e $(DL_DIR)/$(2) || \
 	$(EXTRA_ENV) support/download/wrapper scp \
 		$(DL_DIR)/$(2) \
-		'$(call stripurischeme,$(call qstrip,$(1)))' && \
+		'$(call stripurischeme,$(call qstrip,$(1)))' \
+		$(QUIET) && \
 	$(call VERIFY_HASH,$(PKGDIR)/$($(PKG)_NAME).hash,$(DL_DIR)/$(2))
 endef
 
diff --git a/support/download/scp b/support/download/scp
index f3e92f3..cdcf71b 100755
--- a/support/download/scp
+++ b/support/download/scp
@@ -12,5 +12,6 @@ set -e
 
 output="${1}"
 url="${2}"
+quiet="${3}"
 
-${SCP} "${url}" "${output}"
+${SCP} ${quiet} "${url}" "${output}"
-- 
2.1.3
