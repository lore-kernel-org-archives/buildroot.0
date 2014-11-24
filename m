From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 24 Nov 2014 14:57:00 +0100
Subject: [Buildroot] [PATCH v4 next 3/5] support/download: pass the quiet
	flag to the hg download helper
In-Reply-To: <1416837422-1977-1-git-send-email-fabio.porcedda@gmail.com>
References: <1416837422-1977-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1416837422-1977-4-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To be coherent to others download helper, instead of adding the "QUIET"
variable to the "HG" variable, pass the "QUIET" variable to the hg
download helper.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---

Notes:
    v4:
     - add this patch

 package/pkg-download.mk | 5 +++--
 support/download/hg     | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index a8a042b..1aeea3a 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -13,7 +13,7 @@ export SVN := $(call qstrip,$(BR2_SVN))
 export CVS := $(call qstrip,$(BR2_CVS))
 export BZR := $(call qstrip,$(BR2_BZR))
 export GIT := $(call qstrip,$(BR2_GIT))
-export HG := $(call qstrip,$(BR2_HG)) $(QUIET)
+export HG := $(call qstrip,$(BR2_HG))
 export SCP := $(call qstrip,$(BR2_SCP)) $(QUIET)
 SSH := $(call qstrip,$(BR2_SSH)) $(QUIET)
 export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
@@ -194,7 +194,8 @@ define DOWNLOAD_HG
 		$(DL_DIR)/$($(PKG)_SOURCE) \
 		$($(PKG)_SITE) \
 		$($(PKG)_DL_VERSION) \
-		$($(PKG)_BASE_NAME)
+		$($(PKG)_BASE_NAME) \
+		$(QUIET)
 endef
 
 # TODO: improve to check that the given PKG_DL_VERSION exists on the remote
diff --git a/support/download/hg b/support/download/hg
index 66bd2ed..1047483 100755
--- a/support/download/hg
+++ b/support/download/hg
@@ -16,9 +16,10 @@ output="${1}"
 repo="${2}"
 cset="${3}"
 basename="${4}"
+quiet="${5}"
 
-${HG} clone --noupdate --rev "${cset}" "${repo}" "${basename}"
+${HG} ${quiet} clone --noupdate --rev "${cset}" "${repo}" "${basename}"
 
-${HG} archive --repository "${basename}" --type tgz \
+${HG} ${quiet} archive --repository "${basename}" --type tgz \
               --prefix "${basename}" --rev "${cset}" \
               "${output}"
-- 
2.1.3
