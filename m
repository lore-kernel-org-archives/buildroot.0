From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 May 2016 22:00:30 +0200
Subject: [Buildroot] [git commit] mtr: bump to latest git version (newdns
	branch)
Message-ID: <20160515200042.EC6A0807C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0490a09fd73d45f0832e179074cdbe514deb977e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes the musl build issues and the need to specially patch for
uClibc at the same time. Fixes:
http://autobuild.buildroot.net/results/deb/debeb3ded02c3de63182c3433ff02062192d3fd1/

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mtr/mtr.hash |  2 ++
 package/mtr/mtr.mk   | 12 +-----------
 2 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/package/mtr/mtr.hash b/package/mtr/mtr.hash
new file mode 100644
index 0000000..f3df81f
--- /dev/null
+++ b/package/mtr/mtr.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	12a6a94c0ec04d508de27eda5f5ba91f50d4b5fe74a98aca0973e2c16a42555a	mtr-66de3ecbab28b054b868a73fbb57f30549d770ac.tar.gz
diff --git a/package/mtr/mtr.mk b/package/mtr/mtr.mk
index 3f73a5f..5ee6124 100644
--- a/package/mtr/mtr.mk
+++ b/package/mtr/mtr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MTR_VERSION = v0.86
+MTR_VERSION = 66de3ecbab28b054b868a73fbb57f30549d770ac
 MTR_SITE = $(call github,traviscross,mtr,$(MTR_VERSION))
 MTR_AUTORECONF = YES
 MTR_CONF_OPTS = --without-gtk
@@ -12,14 +12,4 @@ MTR_DEPENDENCIES = host-pkgconf $(if $(BR2_PACKAGE_NCURSES),ncurses)
 MTR_LICENSE = GPLv2
 MTR_LICENSE_FILES = COPYING
 
-# uClibc has res_ninit but not res_nmkquery
-ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
-define MTR_DISABLE_RES_NINIT
-	$(SED) 's/#ifdef res_ninit/#if 0/' \
-		$(@D)/dns.c
-endef
-endif
-
-MTR_POST_PATCH_HOOKS += MTR_DISABLE_RES_NINIT
-
 $(eval $(autotools-package))
