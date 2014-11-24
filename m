From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 24 Nov 2014 14:57:01 +0100
Subject: [Buildroot] [PATCH v4 next 4/5] support/download: pass the quiet
	flag to the wget download helper
In-Reply-To: <1416837422-1977-1-git-send-email-fabio.porcedda@gmail.com>
References: <1416837422-1977-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1416837422-1977-5-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To be coherent to others download helper, instead of adding the "QUIET"
variable to the "WGET" variable, pass the "QUIET" variable to the wget
download helper.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---

Notes:
    v4:
     - add this patch

 package/pkg-download.mk | 5 +++--
 support/download/wget   | 3 ++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 1aeea3a..074488d 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -8,7 +8,7 @@
 ################################################################################
 
 # Download method commands
-export WGET := $(call qstrip,$(BR2_WGET)) $(QUIET)
+export WGET := $(call qstrip,$(BR2_WGET))
 export SVN := $(call qstrip,$(BR2_SVN))
 export CVS := $(call qstrip,$(BR2_CVS))
 export BZR := $(call qstrip,$(BR2_BZR))
@@ -213,7 +213,8 @@ define DOWNLOAD_WGET
 	test -e $(DL_DIR)/$(2) || \
 	$(EXTRA_ENV) support/download/wrapper wget \
 		$(DL_DIR)/$(2) \
-		'$(call qstrip,$(1))' && \
+		'$(call qstrip,$(1))' \
+		 $(QUIET) && \
 	$(call VERIFY_HASH,$(PKGDIR)/$($(PKG)_NAME).hash,$(DL_DIR)/$(2))
 endef
 
diff --git a/support/download/wget b/support/download/wget
index 6b73726..eaa150a 100755
--- a/support/download/wget
+++ b/support/download/wget
@@ -12,5 +12,6 @@ set -e
 
 output="${1}"
 url="${2}"
+quiet="${3}"
 
-${WGET} -O "${output}" "${url}"
+${WGET} ${quiet} -O "${output}" "${url}"
-- 
2.1.3
