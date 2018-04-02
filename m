From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon,  2 Apr 2018 15:09:33 +0200
Subject: [Buildroot] [v5 10/11] download: add flock call before dl-wrapper
In-Reply-To: <20180402130934.19274-1-maxime.hadjinlian@gmail.com>
References: <20180402130934.19274-1-maxime.hadjinlian@gmail.com>
Message-ID: <20180402130934.19274-10-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to introduce the cache mechanisms, we need to have a lock on
the $(LIBFOO_DL_DIR), otherwise it would be impossible to do parallel
download (a shared DL_DIR for two buildroot instances).

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-download.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 85b75cc3e6..9e28eb6cdb 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -19,6 +19,7 @@ SSH := $(call qstrip,$(BR2_SSH))
 export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
 
 DL_WRAPPER = support/download/dl-wrapper
+FLOCK = flock $($(PKG)_DL_DIR)/
 
 # DL_DIR may have been set already from the environment
 ifeq ($(origin DL_DIR),undefined)
@@ -92,7 +93,7 @@ endif
 define DOWNLOAD
 	$(Q)mkdir -p $($(PKG)_DL_DIR)/
 	$(Q)$(if $(filter bzr cvs hg svn,$($(PKG)_SITE_METHOD)),BR_NO_CHECK_HASH_FOR=$(notdir $(1))) \
-	$(EXTRA_ENV) $(DL_WRAPPER) \
+	$(EXTRA_ENV) $(FLOCK) $(DL_WRAPPER) \
 		-c $($(PKG)_DL_VERSION) \
 		-f $(notdir $(1)) \
 		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
-- 
2.16.2
