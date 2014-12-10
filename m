From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 10 Dec 2014 12:41:42 +0000
Subject: [Buildroot] [PATCH] gnupg2: fix linking with intl
Message-ID: <1418215302-31208-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gnupg2 needs to link with intl if the toolchain needs gettext and
locale is set. Otherwise we will see an error like this one:

libgpg-error.a(libgpg_error_la-strsource.o): In function
`gpg_strsource':
strsource.c:(.text+0x4c): undefined reference to `libintl_dgettext'

Fixes:
  http://autobuild.buildroot.net/results/9aa/9aaca74dd3a1f82e12358530db4d5d17eb833f7f/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/gnupg2/Config.in |    1 +
 package/gnupg2/gnupg2.mk |    5 +++++
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/gnupg2/Config.in b/package/gnupg2/Config.in
index d24eaae..92125d1 100644
--- a/package/gnupg2/Config.in
+++ b/package/gnupg2/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_GNUPG2
 	select BR2_PACKAGE_LIBPTHSEM
 	select BR2_PACKAGE_LIBPTHSEM_COMPAT
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	depends on BR2_USE_MMU # libassuan
 	help
 	  GnuPG is the GNU project's complete and free implementation
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 2d133aa..aabebd7 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -20,6 +20,11 @@ GNUPG2_CONF_OPTS = \
 	--with-pth-prefix=$(STAGING_DIR)/usr
 GNUPG2_CONF_ENV = gl_cv_header_working_stdint_h=yes
 
+ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
+GNUPG2_DEPENDENCIES += gettext
+GNUPG2_CONF_ENV += LIBS=-lintl
+endif
+
 ifneq ($(BR2_PACKAGE_GNUPG2_GPGV2),y)
 define GNUPG2_REMOVE_GPGV2
 	rm -f $(TARGET_DIR)/usr/bin/gpgv2
-- 
1.7.1
