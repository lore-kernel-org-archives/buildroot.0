From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  9 Jan 2015 18:03:25 +0100
Subject: [Buildroot] [PATCH] package/xz-utils: does not require threads
Message-ID: <1420823005-950-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 799c12e (xz-utils: needs threads) tried to fix an autobuild
failure by requiring threads. But xz-utils can be configured without
thread support (even though it is one of the most prominent
selling-points of the latest release!).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/xz/Config.in | 4 ----
 package/xz/xz.mk     | 2 ++
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/xz/Config.in b/package/xz/Config.in
index 55beb42..50116f2 100644
--- a/package/xz/Config.in
+++ b/package/xz/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XZ
 	bool "xz-utils"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  XZ is the successor to the Lempel-Ziv/Markov-chain Algorithm
 	  compression format, which provides memory-hungry but powerful
@@ -13,6 +12,3 @@ config BR2_PACKAGE_XZ
 	  package.
 
 	  http://tukaani.org/xz/
-
-comment "xz-utils needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 24b1adb..11c15fa 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -12,5 +12,7 @@ XZ_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 XZ_LICENSE = GPLv2+ GPLv3+ LGPLv2.1+
 XZ_LICENSE_FILES = COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
 
+XZ_CONF_OPTS = --enable-threads=$(if $(BR2_TOOLCHAIN_HAS_THREADS),yes,no)
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.9.1
