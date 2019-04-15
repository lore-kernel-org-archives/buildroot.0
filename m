From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 15 Apr 2019 23:21:39 +0200
Subject: [Buildroot] [git commit] infra/pkg-download: get rid of the FLOCK
 variable
Message-ID: <20190415214606.72A088B806@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b33a74450341f8bffcdb98df3f5b33d028ec9f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The FLOCK variable is context-dependent, and expects the PKG
variable to be set to the current package.

This is not so nice. Besides, it is used in a single location.

Get rid of this intermediate variable, and directly use flock
where we need it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-download.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 623caf9325..96a12b1f2e 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -18,7 +18,6 @@ export SCP := $(call qstrip,$(BR2_SCP))
 export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
 
 DL_WRAPPER = support/download/dl-wrapper
-FLOCK = flock $($(PKG)_DL_DIR)/
 
 # DL_DIR may have been set already from the environment
 ifeq ($(origin DL_DIR),undefined)
@@ -99,7 +98,7 @@ endif
 
 define DOWNLOAD
 	$(Q)mkdir -p $($(PKG)_DL_DIR)
-	$(Q)$(EXTRA_ENV) $(FLOCK) $(DL_WRAPPER) \
+	$(Q)$(EXTRA_ENV) flock $($(PKG)_DL_DIR)/ $(DL_WRAPPER) \
 		-c '$($(PKG)_DL_VERSION)' \
 		-d '$($(PKG)_DL_DIR)' \
 		-D '$(DL_DIR)' \
