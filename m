From: Diego Hurtado de Mendoza <diego.hdmp@gmail.com>
Date: Wed, 10 Feb 2021 10:13:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/can-utils: enable build using musl
 libc
Message-ID: <20210210091319.1392836-1-diego.hdmp@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From commit 20fb6d3288f3c9aac7975e505d9a25f21f64bdf9 this package was
disabled for musl because can-utils used the error() glibc extension
at that time.

Since then, can-utils fixed compilation on musl by replacing this
error() calls with err().
https://github.com/linux-can/can-utils/pull/163/commits/791b6de78673f005e9748983231f7260f6b69e99

This commit disables the musl check.

Signed-off-by: Diego Hurtado de Mendoza <diego.hdmp@gmail.com>
---
 package/can-utils/Config.in | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/can-utils/Config.in b/package/can-utils/Config.in
index da56378866..bdc84b461a 100644
--- a/package/can-utils/Config.in
+++ b/package/can-utils/Config.in
@@ -1,14 +1,9 @@
 config BR2_PACKAGE_CAN_UTILS
 	bool "can-utils"
 	depends on BR2_USE_MMU # fork()
-	depends on !BR2_TOOLCHAIN_USES_MUSL # error()
 	help
 	  SocketCAN is a set of open source CAN drivers and a
 	  networking stack.
 	  This package provides various tools for this stack.
 
 	  https://github.com/linux-can/can-utils
-
-comment "can-utils needs a glibc or uClibc toolchain"
-	depends on BR2_TOOLCHAIN_USES_MUSL
-	depends on BR2_USE_MMU
-- 
2.30.0
