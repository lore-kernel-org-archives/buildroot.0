From: Remi Pommarel <repk@triplefau.lt>
Date: Mon, 26 Oct 2015 22:06:08 +0100
Subject: [Buildroot] [PATCH 1/3] package/git: Add needed library for static
	compilation
In-Reply-To: <1445893570-12977-1-git-send-email-repk@triplefau.lt>
References: <1445893570-12977-1-git-send-email-repk@triplefau.lt>
Message-ID: <1445893570-12977-2-git-send-email-repk@triplefau.lt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add missing ssl, zlib and gettext library for static compilation support.

A statically compiled libcurl need to be linked with some libraries to get all
its undefined symbols resolved. Indeed when libcurl supports openssl it needs
-lssl to satisfy all its dependencies, the same goes for gettext and zlib
symbols.

Signed-off-by: Remi Pommarel <repk@triplefau.lt>
---
 package/git/git.mk | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/package/git/git.mk b/package/git/git.mk
index 2bd6a01..942f29f 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -14,7 +14,7 @@ GIT_DEPENDENCIES = zlib host-gettext
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 GIT_DEPENDENCIES += openssl
 GIT_CONF_OPTS += --with-openssl
-GIT_CONF_ENV_LIBS += $(if $(BR2_STATIC_LIBS),-lz)
+GIT_CONF_ENV_LIBS += $(if $(BR2_STATIC_LIBS),-lssl -lcrypto)
 else
 GIT_CONF_OPTS += --without-openssl
 endif
@@ -55,9 +55,20 @@ else
 GIT_CONF_OPTS += --without-tcltk
 endif
 
+ifeq ($(BR2_PACKAGE_GETTEXT),y)
+GIT_DEPENDENCIES += gettext
+GIT_CONF_ENV += ac_cv_lib_c_gettext=no
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+GIT_DEPENDENCIES += zlib
+GIT_CONF_ENV_LIBS += -lz
+endif
+
+
 # assume yes for these tests, configure will bail out otherwise
 # saying error: cannot run test program while cross compiling
-GIT_CONF_ENV = \
+GIT_CONF_ENV += \
 	ac_cv_fread_reads_directories=yes \
 	ac_cv_snprintf_returns_bogus=yes LIBS='$(GIT_CONF_ENV_LIBS)'
 
-- 
2.0.1
