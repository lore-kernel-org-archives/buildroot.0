From: Chris Packham <judge.packham@gmail.com>
Date: Tue, 24 Jan 2017 23:14:21 +1300
Subject: [Buildroot] [PATCH 1/3] micropython: bump version to v1.8.7
Message-ID: <20170124101423.11479-1-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The install step now requires CROSS_COMPILE as some C files are
generated at install time. Also remove patches that have been applied
upstream.

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
 package/micropython/micropython.hash | 4 +---
 package/micropython/micropython.mk   | 6 +++---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/micropython/micropython.hash b/package/micropython/micropython.hash
index 28c008d3b..6ab7b10b6 100644
--- a/package/micropython/micropython.hash
+++ b/package/micropython/micropython.hash
@@ -1,4 +1,2 @@
 #locally computed
-sha256 871378fcf1f1042c399896d5673da67d12e1fb36c2e706af289fc959bc8f7a57  micropython-v1.8.3.tar.gz
-sha256 ff3194ebecda99023d7c1bb94d32b31b9491e95a79958a25ffd05213c5553acc  8c6856d2e76c5865d9f30cad2c51615d4a1a1418.patch
-sha256 ac19af8587211d7229074fefa1a3a3c0fe807babc7cf9ce53606f05958699448  a50b26e4b00ed094aa1ac74eac2fc2d8eb9ea1ed.patch
+sha256 55dd751c4c812809841fd06f4729b8341171c4b6c1dc28a9412455282554f8a5  micropython-v1.8.7.tar.gz
diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index 2f47ad899..8336fb436 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -4,13 +4,11 @@
 #
 ################################################################################
 
-MICROPYTHON_VERSION = v1.8.3
+MICROPYTHON_VERSION = v1.8.7
 MICROPYTHON_SITE = $(call github,micropython,micropython,$(MICROPYTHON_VERSION))
 MICROPYTHON_LICENSE = MIT
 MICROPYTHON_LICENSE_FILES = LICENSE
 MICROPYTHON_DEPENDENCIES = host-pkgconf libffi
-MICROPYTHON_PATCH = https://github.com/micropython/micropython/commit/8c6856d2e76c5865d9f30cad2c51615d4a1a1418.patch \
-	https://github.com/micropython/micropython/commit/a50b26e4b00ed094aa1ac74eac2fc2d8eb9ea1ed.patch
 
 # Use fallback implementation for exception handling on architectures that don't
 # have explicit support.
@@ -33,6 +31,8 @@ endef
 define MICROPYTHON_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/unix \
 		$(MICROPYTHON_MAKE_OPTS) \
+		CROSS_COMPILE=$(TARGET_CROSS) \
+		CFLAGS_EXTRA=$(MICROPYTHON_CFLAGS) \
 		DESTDIR=$(TARGET_DIR) \
 		PREFIX=$(TARGET_DIR)/usr \
 		install
-- 
2.11.0.24.ge6920cf
