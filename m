From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Feb 2015 22:54:10 +0100
Subject: [Buildroot] [git commit] package/rpm: add gettext dependency
Message-ID: <20150201215508.3885A8011C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=652414095e85e6da906f99da6a184f8a31177b60
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

rpm check for libintl library if BR2_NEEDS_GETTEXT_IF_LOCALE is set.

checking for GNU gettext in libintl... yes
checking whether to use NLS... yes
checking where the gettext function comes from... external libintl
checking how to link with libintl... -lintl

But the dependency on gettext package is missing to ensures
reproducible builds.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rpm/Config.in |    1 +
 package/rpm/rpm.mk    |    4 ++++
 2 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/rpm/Config.in b/package/rpm/Config.in
index 379b15b..5ec4167 100644
--- a/package/rpm/Config.in
+++ b/package/rpm/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_RPM
 	depends on BR2_TOOLCHAIN_HAS_THREADS # beecrypt
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_BEECRYPT
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_NEON
 	select BR2_PACKAGE_NEON_SSL
 	select BR2_PACKAGE_NEON_XML
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
