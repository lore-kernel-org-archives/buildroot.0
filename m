From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 24 Oct 2014 23:06:45 -0300
Subject: [Buildroot] [PATCH] coreutils: add optionals, use single binary
Message-ID: <1414202806-12495-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add proper support for optional libraries: acl, attr, gmp & libcap.

Also build the single binary as pointed out by P?draig Brady for some
neat space savings.
Use the shebang (default) method since it allows us to move binaries
into other directories to suit our needs whereas for symlink that
wouldn't be so easy.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/coreutils/coreutils.mk | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

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
-- 
2.0.4
