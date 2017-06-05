From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 11:41:38 +0200
Subject: [Buildroot] [git commit] package/doxygen: bump version to 1.8.13,
	switch to cmake
Message-ID: <20170605095007.E7A9582A3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e43e6bf1ef0081e77fa8b57e017bc502bd5eecd1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Doxygen switched to cmake with release 1.8.10:
http://www.stack.nl/~dimitri/doxygen/manual/changelog.html#log_1_8_10

and added support for flex 2.6.0 with release 1.8.11:
http://www.stack.nl/~dimitri/doxygen/manual/changelog.html#log_1_8_11

Fixes
http://autobuild.buildroot.net/results/ba1/ba1444709523c59393aaaa3710e9933bafacc6b5/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/doxygen/doxygen.hash |  2 +-
 package/doxygen/doxygen.mk   | 19 ++-----------------
 2 files changed, 3 insertions(+), 18 deletions(-)

diff --git a/package/doxygen/doxygen.hash b/package/doxygen/doxygen.hash
index 40cfe16..4cf53e7 100644
--- a/package/doxygen/doxygen.hash
+++ b/package/doxygen/doxygen.hash
@@ -1,2 +1,2 @@
 # Computed locally
-sha256 d4ab6e28d4d45d8956cad17470aade3fbe2356e8f64b92167e738c1887feccec  doxygen-1.8.9.1.src.tar.gz
+sha256 af667887bd7a87dc0dbf9ac8d86c96b552dfb8ca9c790ed1cbffaa6131573f6b  doxygen-1.8.13.src.tar.gz
diff --git a/package/doxygen/doxygen.mk b/package/doxygen/doxygen.mk
index 428747b..10cdcf9 100644
--- a/package/doxygen/doxygen.mk
+++ b/package/doxygen/doxygen.mk
@@ -4,26 +4,11 @@
 #
 ################################################################################
 
-DOXYGEN_VERSION = 1.8.9.1
+DOXYGEN_VERSION = 1.8.13
 DOXYGEN_SOURCE = doxygen-$(DOXYGEN_VERSION).src.tar.gz
 DOXYGEN_SITE = http://ftp.stack.nl/pub/users/dimitri
 DOXYGEN_LICENSE = GPL-2.0
 DOXYGEN_LICENSE_FILES = LICENSE
 HOST_DOXYGEN_DEPENDENCIES = host-flex host-bison
 
-define HOST_DOXYGEN_CONFIGURE_CMDS
-	(cd $(@D); $(HOST_MAKE_ENV) ./configure --shared --prefix=$(HOST_DIR)/usr)
-endef
-
-define HOST_DOXYGEN_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define HOST_DOXYGEN_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
-endef
-
-# Doxygen's configure is a handwritten script, not an autotools-generated one.
-# It doesn't accept host-autotools-package default arguments, so we have to
-# call host-generic-package here.
-$(eval $(host-generic-package))
+$(eval $(host-cmake-package))
