From: Remi Pommarel <repk@triplefau.lt>
Date: Mon,  2 Nov 2015 09:17:30 +0100
Subject: [Buildroot] [PATCH v3 1/3] package/git: Add needed library for
	static compilation
In-Reply-To: <1446452252-10647-1-git-send-email-repk@triplefau.lt>
References: <1446452252-10647-1-git-send-email-repk@triplefau.lt>
Message-ID: <1446452252-10647-2-git-send-email-repk@triplefau.lt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add missing ssl and crypto libraries in LIBS variable used by configure.

A statically compiled libcurl need to be linked with some libraries to get all
its undefined symbols resolved. Indeed when libcurl supports openssl it needs
-lssl to satisfy all its dependencies, the same goes for crypto symbols.

Configure uses LIBS variable to get additional library when it compile
applilcations to probe for features.

Signed-off-by: Remi Pommarel <repk@triplefau.lt>
---
 package/git/git.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/git/git.mk b/package/git/git.mk
index 2bd6a01..2c404b4 100644
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
-- 
2.0.1
