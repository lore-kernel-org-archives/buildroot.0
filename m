From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Apr 2019 13:51:18 +0200
Subject: [Buildroot] [PATCH 03/10] infra/pkg-download: get rid of the FLOCK
 variable
In-Reply-To: <cover.1554637858.git.yann.morin.1998@free.fr>
References: <cover.1554637858.git.yann.morin.1998@free.fr>
Message-ID: <a788ed837b5b0d959ce67818571d2e71409bc3e6.1554637858.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The FLOCK variable is context-dependent, and expects the PKG
variable to be set to the current package.

This is not so nice. Besides, it is used in a single location.

Get rid of this intermediate variable, and directly use flock
where we need it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-download.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 611df5f982..b8adb0ca05 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -18,7 +18,6 @@ export SCP := $(call qstrip,$(BR2_SCP))
 export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
 
 DL_WRAPPER = support/download/dl-wrapper
-FLOCK = flock $($(PKG)_DL_DIR)/
 
 # DL_DIR may have been set already from the environment
 ifeq ($(origin DL_DIR),undefined)
@@ -97,7 +96,7 @@ endif
 
 define DOWNLOAD
 	$(Q)mkdir -p $($(PKG)_DL_DIR)
-	$(Q)$(EXTRA_ENV) $(FLOCK) $(DL_WRAPPER) \
+	$(Q)$(EXTRA_ENV) flock $($(PKG)_DL_DIR)/ $(DL_WRAPPER) \
 		-c '$($(PKG)_DL_VERSION)' \
 		-d '$($(PKG)_DL_DIR)' \
 		-D '$(DL_DIR)' \
-- 
2.14.1
