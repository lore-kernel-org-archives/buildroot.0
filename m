From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Jun 2018 23:26:38 +0200
Subject: [Buildroot] [git commit] wireguard: bump version to 0.0.20180613
Message-ID: <20180620212558.462CE7FEDE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=630fd8785bd6b9cef3ada692989543ed1de6a39e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Contains a fix for a crash when forwarding packets from devices that use
flow offloading and a x86 FPU issue on -rt kernels.

Also add a post-release upstream patch fixing a compilation issue related to
memcpy().

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0001-poly1305-add-missing-string.h-header.patch | 26 ++++++++++++++++++++++
 package/wireguard/wireguard.hash                   |  4 ++--
 package/wireguard/wireguard.mk                     |  2 +-
 3 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/package/wireguard/0001-poly1305-add-missing-string.h-header.patch b/package/wireguard/0001-poly1305-add-missing-string.h-header.patch
new file mode 100644
index 0000000000..8f1bfecb5c
--- /dev/null
+++ b/package/wireguard/0001-poly1305-add-missing-string.h-header.patch
@@ -0,0 +1,26 @@
+From ed04799b1868f45e05d788e614b9b8cfa4fcab46 Mon Sep 17 00:00:00 2001
+From: "Jason A. Donenfeld" <Jason@zx2c4.com>
+Date: Wed, 20 Jun 2018 14:55:24 +0200
+Subject: [PATCH] poly1305: add missing string.h header
+
+Reported-by: Peter Korsgaard <peter@korsgaard.com>
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/crypto/poly1305.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/crypto/poly1305.c b/src/crypto/poly1305.c
+index 26af4ad..65a37d9 100644
+--- a/src/crypto/poly1305.c
++++ b/src/crypto/poly1305.c
+@@ -7,6 +7,7 @@
+ #include "poly1305.h"
+ 
+ #include <linux/kernel.h>
++#include <linux/string.h>
+ 
+ #if defined(CONFIG_X86_64)
+ #include <asm/fpu/api.h>
+-- 
+2.11.0
+
diff --git a/package/wireguard/wireguard.hash b/package/wireguard/wireguard.hash
index 7701424e4e..f7c5e65475 100644
--- a/package/wireguard/wireguard.hash
+++ b/package/wireguard/wireguard.hash
@@ -1,4 +1,4 @@
-# From https://lists.zx2c4.com/pipermail/wireguard/2018-May/002914.html
-sha256 57614239c1f1a99a367f2c816153acda5bffada66a3b8e3b8215f1625784abc9  WireGuard-0.0.20180524.tar.xz
+# From https://lists.zx2c4.com/pipermail/wireguard/2018-June/002984.html
+sha256 c120cdedc3967dcb4ad5c1c7eadd2a1b04ef5dbf2fe60cc8e7c0db337bcda7dc  WireGuard-0.0.20180613.tar.xz
 # Locally calculated
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard/wireguard.mk b/package/wireguard/wireguard.mk
index ee68dc5580..e1c43beea7 100644
--- a/package/wireguard/wireguard.mk
+++ b/package/wireguard/wireguard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_VERSION = 0.0.20180524
+WIREGUARD_VERSION = 0.0.20180613
 WIREGUARD_SITE = https://git.zx2c4.com/WireGuard/snapshot
 WIREGUARD_SOURCE = WireGuard-$(WIREGUARD_VERSION).tar.xz
 WIREGUARD_LICENSE = GPL-2.0
