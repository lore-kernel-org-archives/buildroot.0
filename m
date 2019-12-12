From: Jan Kiszka <jan.kiszka@siemens.com>
Date: Thu, 12 Dec 2019 19:44:38 +0100
Subject: [Buildroot] [PATCH 2/4] package/xenomai: Pull from git
In-Reply-To: <cover.1576176280.git.jan.kiszka@siemens.com>
References: <cover.1576176280.git.jan.kiszka@siemens.com>
Message-ID: <5404679c83c28260c53e2fc54cdbeafda2929914.1576176280.git.jan.kiszka@siemens.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jan Kiszka <jan.kiszka@siemens.com>

This allows to pick also git revisions via XENOMAI_VERSION.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 package/xenomai/xenomai.hash |  2 +-
 package/xenomai/xenomai.mk   | 10 ++++++++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/xenomai/xenomai.hash b/package/xenomai/xenomai.hash
index 0fc560f978..83994384eb 100644
--- a/package/xenomai/xenomai.hash
+++ b/package/xenomai/xenomai.hash
@@ -1,2 +1,2 @@
 # Locally computed;
-sha256 9e4b879ee48e6423f76cba5882f41d129164fe977119080ff41ef531ee50dc4e  xenomai-3.0.9.tar.bz2
+sha256 be7a7a453a8d1f0763ed5feb3bee159fe60b8a42326b0ff564e94184bd4d0734  xenomai-v3.0.9.tar.bz2
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index f25adf747b..1d38cffa30 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -6,12 +6,12 @@
 
 XENOMAI_VERSION = $(call qstrip,$(BR2_PACKAGE_XENOMAI_VERSION))
 ifeq ($(XENOMAI_VERSION),)
-XENOMAI_VERSION = 3.0.9
+XENOMAI_VERSION = v3.0.9
 else
 BR_NO_CHECK_HASH_FOR += $(XENOMAI_SOURCE)
 endif
 
-XENOMAI_SITE = http://xenomai.org/downloads/xenomai/stable
+XENOMAI_SITE = https://gitlab.denx.de/Xenomai/xenomai/-/archive/$(XENOMAI_VERSION)
 XENOMAI_SOURCE = xenomai-$(XENOMAI_VERSION).tar.bz2
 XENOMAI_LICENSE = GPL-2.0+ with exception (headers), LGPL-2.1+ (libraries), GPL-2.0+ (kernel), GFDL-1.2+ (docs), GPL-2.0 (ipipe patch, can driver)
 # GFDL is not included but refers to gnu.org
@@ -28,6 +28,12 @@ XENOMAI_INSTALL_STAGING = YES
 XENOMAI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-user
 XENOMAI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-user
 
+define XENOMAI_BOOTSTRAP
+	(cd $(@D); ./scripts/bootstrap)
+endef
+
+XENOMAI_PRE_CONFIGURE_HOOKS += XENOMAI_BOOTSTRAP
+
 XENOMAI_CONF_OPTS += --includedir=/usr/include/xenomai/ --disable-doc-install
 
 ifeq ($(BR2_PACKAGE_XENOMAI_MERCURY),y)
-- 
2.16.4
