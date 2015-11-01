From: Remi Pommarel <repk@triplefau.lt>
Date: Sun,  1 Nov 2015 21:36:21 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/git: Add needed library for
	static compilation
In-Reply-To: <1446410183-7798-1-git-send-email-repk@triplefau.lt>
References: <1446410183-7798-1-git-send-email-repk@triplefau.lt>
Message-ID: <1446410183-7798-2-git-send-email-repk@triplefau.lt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add missing ssl crypto libraries in LIBS variable used by configure.

A statically compiled libcurl need to be linked with some libraries to get all
its undefined symbols resolved. Indeed when libcurl supports openssl it needs
-lssl to satisfy all its dependencies, the same goes for crypto symbols.

Configure uses LIBS variable to get additional library when it compile
applilcations to probe for features.

Signed-off-by: Remi Pommarel <repk@triplefau.lt>
---
 package/git/git.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.mk b/package/git/git.mk
index 2bd6a01..6e1b44b 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -14,7 +14,7 @@ GIT_DEPENDENCIES = zlib host-gettext
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 GIT_DEPENDENCIES += openssl
 GIT_CONF_OPTS += --with-openssl
-GIT_CONF_ENV_LIBS += $(if $(BR2_STATIC_LIBS),-lz)
+GIT_CONF_ENV_LIBS += $(if $(BR2_STATIC_LIBS),-lssl -lcrypto -lz)
 else
 GIT_CONF_OPTS += --without-openssl
 endif
@@ -57,7 +57,7 @@ endif
 
 # assume yes for these tests, configure will bail out otherwise
 # saying error: cannot run test program while cross compiling
-GIT_CONF_ENV = \
+GIT_CONF_ENV += \
 	ac_cv_fread_reads_directories=yes \
 	ac_cv_snprintf_returns_bogus=yes LIBS='$(GIT_CONF_ENV_LIBS)'
 
-- 
2.0.1
