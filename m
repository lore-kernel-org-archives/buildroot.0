From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 26 Jul 2018 22:50:44 -0500
Subject: [Buildroot] [PATCH] package/uboot-tools: version.h collision
Message-ID: <20180727035044.4313-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On some systems the host system or even the cross sysroot can
contain a version.h.  This leads to the wrong file being picked
up and a PLAIN_VERSION undefined error.

This workaround symlinks the version.h into the tool folder to
allow reordering of search folders.

Fixes
http://autobuild.buildroot.net/results/770/7702d5df36a6532aafdbe6e9e62709bbfa058b54/build-end.log
http://autobuild.buildroot.net/results/e34/e3401027d2fb3ce565ca9e2456a427afd3610a87/build-end.log
... additional can be found with these queries ...
http://autobuild.buildroot.net/?reason=uboot-tools-2018.03
http://autobuild.buildroot.net/?reason=uboot-tools-2018.05

Upstream: https://lists.denx.de/pipermail/u-boot/2018-July/336283.html

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 ...rsion.h-workaround-sysroot-inc-order.patch | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 package/uboot-tools/0004-include-version.h-workaround-sysroot-inc-order.patch

diff --git a/package/uboot-tools/0004-include-version.h-workaround-sysroot-inc-order.patch b/package/uboot-tools/0004-include-version.h-workaround-sysroot-inc-order.patch
new file mode 100644
index 0000000000..89cec5bb34
--- /dev/null
+++ b/package/uboot-tools/0004-include-version.h-workaround-sysroot-inc-order.patch
@@ -0,0 +1,53 @@
+From 546ab8f1e4b91f12b4cc1b4b73bb89a1645a99a4 Mon Sep 17 00:00:00 2001
+From: Matt Weber <matthew.weber@rockwellcollins.com>
+Date: Thu, 26 Jul 2018 22:16:17 -0500
+Subject: [PATCH] include/version.h: workaround sysroot inc order
+
+On some systems the host system or even the cross sysroot can
+contain a version.h.  This leads to the wrong file being picked
+up and a PLAIN_VERSION undefined error.
+
+This workaround symlinks the version.h into the tool folder to
+allow reordering of search folders.
+
+Fixes
+http://autobuild.buildroot.net/results/770/7702d5df36a6532aafdbe6e9e62709bbfa058b54/build-end.log
+http://autobuild.buildroot.net/results/e34/e3401027d2fb3ce565ca9e2456a427afd3610a87/build-end.log
+... additional can be found with these queries ...
+http://autobuild.buildroot.net/?reason=uboot-tools-2018.03
+http://autobuild.buildroot.net/?reason=uboot-tools-2018.05
+
+Upstream: https://lists.denx.de/pipermail/u-boot/2018-July/336283.html
+
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+---
+ tools/env/Makefile | 3 ++-
+ tools/version.h    | 1 +
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+ create mode 120000 tools/version.h
+
+diff --git a/tools/env/Makefile b/tools/env/Makefile
+index 95a03c9..865fbc3 100644
+--- a/tools/env/Makefile
++++ b/tools/env/Makefile
+@@ -11,7 +11,8 @@
+ override HOSTCC = $(CC)
+ 
+ # Compile for a hosted environment on the target
+-HOST_EXTRACFLAGS  = $(patsubst -I%,-idirafter%, $(filter -I%, $(UBOOTINCLUDE))) \
++HOST_EXTRACFLAGS  = -I$(srctree)/tools \
++		$(patsubst -I%,-idirafter%, $(filter -I%, $(UBOOTINCLUDE))) \
+ 		-idirafter $(srctree)/tools/env \
+ 		-DUSE_HOSTCC \
+ 		-DTEXT_BASE=$(TEXT_BASE)
+diff --git a/tools/version.h b/tools/version.h
+new file mode 120000
+index 0000000..bb57607
+--- /dev/null
++++ b/tools/version.h
+@@ -0,0 +1 @@
++../include/version.h
+\ No newline at end of file
+-- 
+2.17.0
+
-- 
2.17.0
