From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Oct 2019 21:45:25 +0200
Subject: [Buildroot] [git commit] package/lightning: fix install of
 lightning.h
Message-ID: <20191010193935.36A408C5FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2c166c1939bedb10429155ba05d1696109b093eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/05ebc75598627d2a08e08e194f51cb8464f97b95

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...kefile.am-don-t-install-lightning.h-twice.patch | 38 ++++++++++++++++++++++
 package/lightning/lightning.mk                     |  2 ++
 2 files changed, 40 insertions(+)

diff --git a/package/lightning/0001-include-Makefile.am-don-t-install-lightning.h-twice.patch b/package/lightning/0001-include-Makefile.am-don-t-install-lightning.h-twice.patch
new file mode 100644
index 0000000000..fb5299c25f
--- /dev/null
+++ b/package/lightning/0001-include-Makefile.am-don-t-install-lightning.h-twice.patch
@@ -0,0 +1,38 @@
+From 604c931bc673c507254a84c0f423c9ec8ce6e3a1 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 10 Oct 2019 20:36:46 +0200
+Subject: [PATCH] include/Makefile.am: don't install lightning.h twice
+
+Commit 17164ed32d8f3530153b9cad67a4399c65f24512 added lightning.h to
+nodist_include_HEADERS without removing it from include_HEADERS
+
+This raises the following error on one of the buildroot autobuilders:
+/usr/bin/install -c -m 644 lightning.h '/home/test/autobuild/run/instance-3/output-1/target/usr/include'
+/usr/bin/install -c -m 644 lightning.h '/home/test/autobuild/run/instance-3/output-1/target/usr/include'
+/usr/bin/install: cannot create regular file `/home/test/autobuild/run/instance-3/output-1/target/usr/include/lightning.h': File exists
+
+Fix this by removing lightning.h from include_HEADERS
+
+Fixes:
+ - http://autobuild.buildroot.org/results/05ebc75598627d2a08e08e194f51cb8464f97b95
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/Makefile.am | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/include/Makefile.am b/include/Makefile.am
+index e754dd3..8f91594 100644
+--- a/include/Makefile.am
++++ b/include/Makefile.am
+@@ -14,7 +14,6 @@
+ # License for more details.
+ #
+ 
+-include_HEADERS = lightning.h
+ SUBDIRS =		\
+ 	lightning
+ 
+-- 
+2.23.0
+
diff --git a/package/lightning/lightning.mk b/package/lightning/lightning.mk
index fd6bbcac89..3bd17bef56 100644
--- a/package/lightning/lightning.mk
+++ b/package/lightning/lightning.mk
@@ -9,6 +9,8 @@ LIGHTNING_SITE = $(BR2_GNU_MIRROR)/lightning
 LIGHTNING_LICENSE = LGPL-3.0+
 LIGHTNING_LICENSE_FILES = COPYING.LESSER
 LIGHTNING_INSTALL_STAGING = YES
+# We're patching include/Makefile.am
+LIGHTNING_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_LIGHTNING_DISASSEMBLER),y)
 LIGHTNING_DEPENDENCIES += binutils zlib
