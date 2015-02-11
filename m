From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Feb 2015 12:26:41 +0100
Subject: [Buildroot] [git commit] git: fix static link with openssl
Message-ID: <20150212080451.12ECB8178D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f1cdd306e28cb543714cb392931618be38c43059
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

openssl needs -lz when building statically.

Fixes:
http://autobuild.buildroot.net/results/4b3/4b33f3f415776cf43be0910b583d222711a03cad/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/git/git.mk |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/git/git.mk b/package/git/git.mk
index b5244ac..674095d 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -14,6 +14,7 @@ GIT_DEPENDENCIES = zlib host-gettext
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	GIT_DEPENDENCIES += openssl
 	GIT_CONF_OPTS += --with-openssl
+	GIT_CONF_ENV_LIBS += $(if $(BR2_STATIC_LIBS),-lz)
 else
 	GIT_CONF_OPTS += --without-openssl
 endif
@@ -41,7 +42,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 	GIT_DEPENDENCIES += libiconv
-	GIT_CONF_ENV += LIBS=-liconv
+	GIT_CONF_ENV_LIBS += -liconv
 	GIT_CONF_OPTS += --with-iconv=/usr/lib
 else
 	GIT_CONF_OPTS += --without-iconv
@@ -56,7 +57,7 @@ endif
 
 # assume yes for these tests, configure will bail out otherwise
 # saying error: cannot run test program while cross compiling
-GIT_CONF_ENV += ac_cv_fread_reads_directories=yes \
-	ac_cv_snprintf_returns_bogus=yes
+GIT_CONF_ENV = ac_cv_fread_reads_directories=yes \
+	ac_cv_snprintf_returns_bogus=yes LIBS='$(GIT_CONF_ENV_LIBS)'
 
 $(eval $(autotools-package))
