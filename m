From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 11:33:15 +0100
Subject: [Buildroot] [git commit] package/xz-utils: does not require threads
Message-ID: <20150110103357.4427A7FEFE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0dbc17abcb5c254d60a8d59e1ae0d715c2db4324
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 799c12e (xz-utils: needs threads) tried to fix an autobuild
failure by requiring threads. But xz-utils can be configured without
thread support (even though it is one of the most prominent
selling-points of the latest release!).

[Thomas: use --{enable,disable}-threads instead of
--enable-threads={yes,no}, to match what we generally do in most
autotools packages.]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xz/Config.in |    4 ----
 package/xz/xz.mk     |    6 ++++++
 2 files changed, 6 insertions(+), 4 deletions(-)

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
index 24b1adb..413c020 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -12,5 +12,11 @@ XZ_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 XZ_LICENSE = GPLv2+ GPLv3+ LGPLv2.1+
 XZ_LICENSE_FILES = COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+XZ_CONF_OPTS = --enable-threads
+else
+XZ_CONF_OPTS = --disable-threads
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
