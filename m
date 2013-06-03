From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 3 Jun 2013 22:52:24 +0200
Subject: [Buildroot] [git commit] git: needs libiconv on toolchains without
	locale support
Message-ID: <20130603205512.088C29A894@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=34dae9ac288031f869ae808ebd70b2d965b3df3d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/git/Config.in |    1 +
 package/git/git.mk    |    3 ++-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/git/Config.in b/package/git/Config.in
index dc342aa..931d460 100644
--- a/package/git/Config.in
+++ b/package/git/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_GIT
 	bool "git"
 	depends on BR2_LARGEFILE
 	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Git is a free and open source distributed version control system
 	  designed to handle everything from small to very large projects.
diff --git a/package/git/git.mk b/package/git/git.mk
index 6bc9761..7e2f114 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -40,6 +40,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 	GIT_DEPENDENCIES += libiconv
+	GIT_CONF_ENV += LIBS=-liconv
 	GIT_CONF_OPT += --with-iconv=/usr/lib
 else
 	GIT_CONF_OPT += --without-iconv
@@ -54,7 +55,7 @@ endif
 
 # assume yes for these tests, configure will bail out otherwise
 # saying error: cannot run test program while cross compiling
-GIT_CONF_ENV = 	ac_cv_fread_reads_directories=yes \
+GIT_CONF_ENV += ac_cv_fread_reads_directories=yes \
 	ac_cv_snprintf_returns_bogus=yes
 
 $(eval $(autotools-package))
