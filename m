From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Apr 2018 17:48:56 +0200
Subject: [Buildroot] [git commit] download: add flock call before dl-wrapper
Message-ID: <20180402154921.A0DEA8127C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=573f8c750fbd18f2f2de23bfdc8e360ed30a8687
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to introduce the cache mechanisms, we need to have a lock on the
$(LIBFOO_DL_DIR), otherwise it would be impossible to do parallel download
(a shared DL_DIR for two buildroot instances) without risking conflicts.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-download.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 7ca6fcc757..4fdb283acc 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -19,6 +19,7 @@ SSH := $(call qstrip,$(BR2_SSH))
 export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
 
 DL_WRAPPER = support/download/dl-wrapper
+FLOCK = flock $($(PKG)_DL_DIR)/
 
 # DL_DIR may have been set already from the environment
 ifeq ($(origin DL_DIR),undefined)
@@ -93,7 +94,7 @@ define DOWNLOAD
 	$(Q)mkdir -p $($(PKG)_DL_DIR)
 	$(Q)$(if $(filter bzr cvs hg svn,$($(PKG)_SITE_METHOD)),
 		BR_NO_CHECK_HASH_FOR=$(notdir $(call qstrip,$(1)))) \
-	$(EXTRA_ENV) $(DL_WRAPPER) \
+	$(EXTRA_ENV) $(FLOCK) $(DL_WRAPPER) \
 		-c '$($(PKG)_DL_VERSION)' \
 		-f '$(notdir $(1))' \
 		-H '$(PKGDIR)/$($(PKG)_RAWNAME).hash' \
