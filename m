From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Aug 2016 16:11:46 +0200
Subject: [Buildroot] [git commit] system: sysvinit needs MMU
Message-ID: <20160814141248.89FB28042F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a8546e5847c5281002bfc443a544f2ed8e80601
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It uses spawn() and thus fork(), so it needs an MMU.

Fixes a build issue reported on IRC for a cortex-m4 build:
    http://pastebin.com/dGCsy0sr

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sysvinit/Config.in | 1 +
 system/Config.in           | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/sysvinit/Config.in b/package/sysvinit/Config.in
index ab67ed6..94f1612 100644
--- a/package/sysvinit/Config.in
+++ b/package/sysvinit/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SYSVINIT
 	bool "sysvinit"
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_INIT_SYSV
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
diff --git a/system/Config.in b/system/Config.in
index 5855707..353421a 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -106,6 +106,7 @@ config BR2_INIT_BUSYBOX
 
 config BR2_INIT_SYSV
 	bool "systemV"
+	depends on BR2_USE_MMU # sysvinit
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # sysvinit
 	select BR2_PACKAGE_INITSCRIPTS
 	select BR2_PACKAGE_SYSVINIT
