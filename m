From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 13 Oct 2019 22:19:33 +0200
Subject: [Buildroot] [git commit] package/clamav: select musl-fts if not
 glibc
Message-ID: <20191013202929.6DA8083C52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=be09d22f50953be08d00c597552e11d788807134
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By selecting musl-fts, a build failure on internal fts is avoided

Fixes:
 - http://autobuild.buildroot.org/results/8f0d45202c9a7dbb4d0c7431040384990f04008b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/clamav/Config.in |  1 +
 package/clamav/clamav.mk | 11 ++++++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/clamav/Config.in b/package/clamav/Config.in
index b3f09aebda..08f3e47461 100644
--- a/package/clamav/Config.in
+++ b/package/clamav/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_CLAMAV
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBMSPACK
 	select BR2_PACKAGE_LIBTOOL
+	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 6500826339..18aedd7591 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -25,10 +25,16 @@ CLAMAV_CONF_ENV = \
 	have_cv_ipv6=yes
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-CLAMAV_CONF_ENV += LIBS=-latomic
+CLAMAV_LIBS += -latomic
 endif
 
-# UCLIBC_HAS_FTS is disabled, therefore disable fanotify (missing fts.h)
+ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
+CLAMAV_DEPENDENCIES += musl-fts
+CLAMAV_LIBS += -lfts
+endif
+
+CLAMAV_CONF_ENV += LIBS="$(CLAMAV_LIBS)"
+
 CLAMAV_CONF_OPTS = \
 	--with-dbdir=/var/lib/clamav \
 	--with-ltdl-include=$(STAGING_DIR)/usr/include \
@@ -40,7 +46,6 @@ CLAMAV_CONF_OPTS = \
 	--disable-zlib-vcheck \
 	--disable-rpath \
 	--disable-clamav \
-	--disable-fanotify \
 	--disable-milter \
 	--disable-llvm \
 	--disable-clamdtop \
