From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 May 2017 22:36:02 +0200
Subject: [Buildroot] [git commit] swupdate: bump to version 2017.04
Message-ID: <20170601202859.05661818F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e2f34a5ae290d198593dc187f0141a5b39f1b0a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add optional dependency on zeromq which was already added in version
2016.10.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/swupdate/Config.in     | 2 ++
 package/swupdate/swupdate.hash | 2 +-
 package/swupdate/swupdate.mk   | 9 ++++++++-
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
index d9ef1bc..dbc69f1 100644
--- a/package/swupdate/Config.in
+++ b/package/swupdate/Config.in
@@ -32,6 +32,8 @@ config BR2_PACKAGE_SWUPDATE
 	    archives.
 	  * Select BR2_PACKAGE_UBOOT_TOOLS and BR2_PACKAGE_ZLIB to add support
 	    for setting the U-Boot environment.
+	  * Select BR2_PACKAGE_ZEROMQ to add support for using a remote
+	    handler.
 
 	  https://sbabic.github.io/swupdate
 
diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
index d4e8833..5bdd9bf 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  ce28348e98aa5657154d2eacc2e8a9b114ba50a937531b010872c8eb6fd72b23  swupdate-2017.01.tar.gz
+sha256  d5a4ff243bae865313b808aad57efa6400d41e83c49266a3a14a725d0c30d240  swupdate-2017.04.tar.gz
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 335ec90..560a2d4 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWUPDATE_VERSION = 2017.01
+SWUPDATE_VERSION = 2017.04
 SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
 SWUPDATE_LICENSE = GPL-2.0+, MIT, Public Domain
 SWUPDATE_LICENSE_FILES = COPYING
@@ -71,6 +71,13 @@ else
 SWUPDATE_MAKE_ENV += HAVE_LIBUBOOTENV=n
 endif
 
+ifeq ($(BR2_PACKAGE_ZEROMQ),y)
+SWUPDATE_DEPENDENCIES += zeromq
+SWUPDATE_MAKE_ENV += HAVE_LIBZEROMQ=y
+else
+SWUPDATE_MAKE_ENV += HAVE_LIBZEROMQ=n
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 SWUPDATE_DEPENDENCIES += zlib
 SWUPDATE_MAKE_ENV += HAVE_ZLIB=y
