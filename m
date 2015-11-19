From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Nov 2015 22:14:56 +0100
Subject: [Buildroot] [git commit] chrony: bump to version 2.2
Message-ID: <20151201232119.380F97F9FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6cf1554e715222cdfb1fdc6d478f274b353e62e9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the new version, documentation is not generated part of the main
build. This removes the need to alter the Makefile to remove the invoke
on the `chrony.txt` target. Cleanup also explicitly disabling seccomp
(since its experimental) and tomcrypt (Buildroot does not have
libtomcrypt at this time).

[Thomas: use tabs for indentation in the definition of
CHRONY_CONF_OPTS.]

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/chrony/chrony.hash |  6 +++---
 package/chrony/chrony.mk   | 15 +++++++--------
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/package/chrony/chrony.hash b/package/chrony/chrony.hash
index ba7f95e..066ecb5 100644
--- a/package/chrony/chrony.hash
+++ b/package/chrony/chrony.hash
@@ -1,3 +1,3 @@
-# From http://listengine.tuxfamily.org/chrony.tuxfamily.org/chrony-announce/2014/09/msg00000.html
-md5	04ab702fc81150db06809562a9aaed92  chrony-1.31.tar.gz
-sha1	71bb46cad2f15760192795e60efdf23069973908  chrony-1.31.tar.gz
+# From http://listengine.tuxfamily.org/chrony.tuxfamily.org/chrony-announce/2015/10/msg00002.html
+md5  17bc77d3d2ce942675f9600b60452717         chrony-2.2.tar.gz
+sha1 eed81b53ef504430128a3a6fa5b56f7ee2fdf2b1 chrony-2.2.tar.gz
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index 72c4c4b..aa7306f 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -4,12 +4,17 @@
 #
 ################################################################################
 
-CHRONY_VERSION = 1.31
+CHRONY_VERSION = 2.2
 CHRONY_SITE = http://download.tuxfamily.org/chrony
 CHRONY_LICENSE = GPLv2
 CHRONY_LICENSE_FILES = COPYING
 
-CHRONY_CONF_OPTS = --host-system=Linux --host-machine=$(BR2_ARCH) --prefix=/usr
+CHRONY_CONF_OPTS = \
+	--host-system=Linux \
+	--host-machine=$(BR2_ARCH) \
+	--prefix=/usr \
+	--without-seccomp \
+	--without-tomcrypt
 
 ifeq ($(BR2_PACKAGE_LIBNSS),y)
 CHRONY_DEPENDENCIES += host-pkgconf libnss
@@ -23,12 +28,6 @@ else
 CHRONY_CONF_OPTS += --disable-readline
 endif
 
-# Ditch the doc build, needs makeinfo and we don't need them
-define CHRONY_DISABLE_DOCS
-	$(SED) 's/chronyc chrony.txt/chronyc/' $(@D)/Makefile.in
-endef
-CHRONY_POST_PATCH_HOOKS += CHRONY_DISABLE_DOCS
-
 define CHRONY_CONFIGURE_CMDS
 	cd $(@D) && $(TARGET_CONFIGURE_OPTS) ./configure $(CHRONY_CONF_OPTS)
 endef
