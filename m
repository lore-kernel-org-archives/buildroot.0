From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 10:44:00 +0200
Subject: [Buildroot] [git commit] coreutils: add optionals, use single binary
Message-ID: <20141025084803.F1129B0E77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=03f87430e54d11912e707cad105fc4f2a2590aba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add proper support for optional libraries: acl, attr, gmp & libcap.

Also build the single binary as pointed out by P??draig Brady for some
neat space savings.
Use the shebang (default) method since it allows us to move binaries
into other directories to suit our needs whereas for symlink that
wouldn't be so easy.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/coreutils/coreutils.mk |   26 +++++++++++++++++++++++++-
 1 files changed, 25 insertions(+), 1 deletions(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 54c7892..1a25a3a 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -20,6 +20,30 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 COREUTILS_DEPENDENCIES = busybox
 endif
 
+ifeq ($(BR2_PACKAGE_ACL),y)
+COREUTILS_DEPENDENCIES += acl
+else
+COREUTILS_CONF_OPTS += --disable-acl
+endif
+
+ifeq ($(BR2_PACKAGE_ATTR),y)
+COREUTILS_DEPENDENCIES += attr
+else
+COREUTILS_CONF_OPTS += --disable-xattr
+endif
+
+ifeq ($(BR2_PACKAGE_GMP),y)
+COREUTILS_DEPENDENCIES += gmp
+else
+COREUTILS_CONF_OPTS += --without-gmp
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+COREUTILS_DEPENDENCIES += libcap
+else
+COREUTILS_CONF_OPTS += --disable-libcap
+endif
+
 COREUTILS_BIN_PROGS = cat chgrp chmod chown cp date dd df dir echo false \
 	ln ls mkdir mknod mv pwd rm rmdir vdir sleep stty sync touch true \
 	uname join
@@ -61,7 +85,7 @@ COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
 		utils_cv_localtime_cache=no \
 		PERL=missing
 
-COREUTILS_CONF_OPTS = --disable-rpath
+COREUTILS_CONF_OPTS = --disable-rpath --enable-single-binary=shebangs
 
 define COREUTILS_POST_INSTALL
 	# some things go in root rather than usr
