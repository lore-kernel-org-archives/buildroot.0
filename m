From: buildroot at heine.tech <buildroot@heine.tech>
Date: Thu, 29 Oct 2020 12:06:33 +0100
Subject: [Buildroot] [PATCH] package/libgpiod: bump version to 1.6
Message-ID: <20201029110632.25856-1-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Michael Nosthoff <buildroot@heine.tech>

* when kernel headers are <5.5 fall back to version 1.4.4
* set url to kernel.org as github is unmaintained and outdated

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/libgpiod/Config.in     | 2 +-
 package/libgpiod/libgpiod.hash | 3 ++-
 package/libgpiod/libgpiod.mk   | 7 ++++++-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/libgpiod/Config.in b/package/libgpiod/Config.in
index 63a7cb6e78..293eef6c89 100644
--- a/package/libgpiod/Config.in
+++ b/package/libgpiod/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_LIBGPIOD
 	  This is a C library that abstracts the GPIO character
 	  device operations on linux.
 
-	  https://github.com/brgl/libgpiod
+	  https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/
 
 if BR2_PACKAGE_LIBGPIOD
 
diff --git a/package/libgpiod/libgpiod.hash b/package/libgpiod/libgpiod.hash
index f0009a7510..b05b4ae231 100644
--- a/package/libgpiod/libgpiod.hash
+++ b/package/libgpiod/libgpiod.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
-sha256 21ae8fd1f8dafc2eb2ba50e652390cf533d21351419a7426255895cb52e21b1c  libgpiod-1.4.1.tar.xz
+sha256 f1cda2789e6a13a92aefc012a76e5a7cc57a1b402d66f71df8719ee314b67699  libgpiod-1.4.4.tar.xz
+sha256 62908023d59e8cbb9137ddd14deec50ced862d8f9b8749f288d3dbe7967151ef  libgpiod-1.6.tar.xz
 # Hash for license file
 sha256 ce64d5f7b49ea6d80fdb6d4cdee6839d1a94274f7493dc797c3b55b65ec8e9ed  COPYING
diff --git a/package/libgpiod/libgpiod.mk b/package/libgpiod/libgpiod.mk
index 2474ab90a2..d5b38a6149 100644
--- a/package/libgpiod/libgpiod.mk
+++ b/package/libgpiod/libgpiod.mk
@@ -4,7 +4,12 @@
 #
 ################################################################################
 
-LIBGPIOD_VERSION = 1.4.1
+# starting with 1.5 libgpiod depends on Headers >= 5.5
+ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5),y)
+LIBGPIOD_VERSION = 1.6
+else
+LIBGPIOD_VERSION = 1.4.4
+endif
 LIBGPIOD_SOURCE = libgpiod-$(LIBGPIOD_VERSION).tar.xz
 LIBGPIOD_SITE = https://www.kernel.org/pub/software/libs/libgpiod
 LIBGPIOD_LICENSE = LGPL-2.1+
-- 
2.25.1
