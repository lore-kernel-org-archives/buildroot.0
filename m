From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Aug 2016 15:13:03 +0200
Subject: [Buildroot] [git commit] micropython: bump version to v1.8.3
Message-ID: <20160902142940.1FA747FEE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9280bcff708494e7a62eda50ffd378438d247db7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/micropython/micropython.hash | 2 +-
 package/micropython/micropython.mk   | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/micropython/micropython.hash b/package/micropython/micropython.hash
index b3a7c22..ea42bfb 100644
--- a/package/micropython/micropython.hash
+++ b/package/micropython/micropython.hash
@@ -1,2 +1,2 @@
 #locally computed
-sha256 f8ea3faffa797de1a06c16c8f57c784c665b318ca08ac17f74dcbc95322d47de  micropython-v1.6.tar.gz
+sha256 871378fcf1f1042c399896d5673da67d12e1fb36c2e706af289fc959bc8f7a57  micropython-v1.8.3.tar.gz
diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index 853caa2..047e340 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MICROPYTHON_VERSION = v1.6
+MICROPYTHON_VERSION = v1.8.3
 MICROPYTHON_SITE = $(call github,micropython,micropython,$(MICROPYTHON_VERSION))
 MICROPYTHON_LICENSE = MIT
 MICROPYTHON_LICENSE_FILES = LICENSE
@@ -16,14 +16,21 @@ ifeq ($(BR2_i386)$(BR2_x86_64)$(BR2_arm)$(BR2_armeb),)
 MICROPYTHON_CFLAGS = -DMICROPY_GCREGS_SETJMP=1
 endif
 
+# When building from a tarball we don't have some of the dependencies that are in
+# the git repository as submodules
+MICROPYTHON_MAKE_OPTS = MICROPY_PY_BTREE=0
+MICROPYTHON_MAKE_OPTS += MICROPY_PY_USSL=0
+
 define MICROPYTHON_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/unix \
+		$(MICROPYTHON_MAKE_OPTS) \
 		CROSS_COMPILE=$(TARGET_CROSS) \
 		CFLAGS_EXTRA=$(MICROPYTHON_CFLAGS)
 endef
 
 define MICROPYTHON_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/unix \
+		$(MICROPYTHON_MAKE_OPTS) \
 		DESTDIR=$(TARGET_DIR) \
 		PREFIX=$(TARGET_DIR)/usr \
 		install
