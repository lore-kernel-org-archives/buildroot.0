From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 18 Jan 2015 12:34:58 +0100
Subject: [Buildroot] [PATCH 1/3] package/rpm: add gettext dependency
Message-ID: <1421580900-15186-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

rpm check for libintl library if BR2_NEEDS_GETTEXT_IF_LOCALE is set.

checking for GNU gettext in libintl... yes
checking whether to use NLS... yes
checking where the gettext function comes from... external libintl
checking how to link with libintl... -lintl

But the dependency on gettext package is missing to ensures
reproducible builds.

Also, sort selected packages alphabetically in Config.in

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/rpm/Config.in | 7 ++++---
 package/rpm/rpm.mk    | 4 ++++
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/rpm/Config.in b/package/rpm/Config.in
index 620eb1a..5ec4167 100644
--- a/package/rpm/Config.in
+++ b/package/rpm/Config.in
@@ -7,12 +7,13 @@ config BR2_PACKAGE_RPM
 	depends on BR2_TOOLCHAIN_HAS_THREADS # beecrypt
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_BEECRYPT
-	select BR2_PACKAGE_POPT
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_NEON
+	select BR2_PACKAGE_NEON_SSL
 	select BR2_PACKAGE_NEON_XML
 	select BR2_PACKAGE_NEON_ZLIB
-	select BR2_PACKAGE_NEON_SSL
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_ZLIB
 	help
 	  The RPM package management system.
diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index c4215b5..74f5b88 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -26,6 +26,10 @@ RPM_CONF_OPTS = \
 	--with-libbeecrypt=$(STAGING_DIR) \
 	--with-popt=$(STAGING_DIR)
 
+ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
+RPM_DEPENDENCIES += gettext
+endif
+
 ifeq ($(BR2_PACKAGE_PCRE),y)
 RPM_DEPENDENCIES += pcre
 RPM_CONF_OPTS += --with-pcre=external
-- 
1.9.3
