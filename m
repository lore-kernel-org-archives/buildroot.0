From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 18 Jan 2015 20:53:07 +0100
Subject: [Buildroot] [PATCH v2 2/5] package/rpm: add gettext dependency
In-Reply-To: <1421610790-18508-1-git-send-email-romain.naour@openwide.fr>
References: <1421610790-18508-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1421610790-18508-2-git-send-email-romain.naour@openwide.fr>
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

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v2: selected packages are already sorted by the first
    patch. (Yann E. MORIN)
---
 package/rpm/Config.in | 1 +
 package/rpm/rpm.mk    | 4 ++++
 2 files changed, 5 insertions(+)

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
-- 
1.9.3
