From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 11 Dec 2014 12:06:51 +0000
Subject: [Buildroot] [PATCH v2] gnupg2: fix linking with intl
Message-ID: <1418299611-50833-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gnupg2 needs to link with intl if the gettext package is selected.
Otherwise we will see an error like this one:

libgpg-error.a(libgpg_error_la-strsource.o): In function
`gpg_strsource':
strsource.c:(.text+0x4c): undefined reference to `libintl_dgettext'

Fixes:
  http://autobuild.buildroot.net/results/9aa/9aaca74dd3a1f82e12358530db4d5d17eb833f7f/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v1 -> v2:
- Remove "select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE" 
  from Config.in
- Replace $(BR2_NEEDS_GETTEXT_IF_LOCALE) with $(BR2_PACKAGE_GETTEXT)
- Amend the commit message according to the new changes

 package/gnupg2/gnupg2.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 2d133aa..69c510e 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -20,6 +20,11 @@ GNUPG2_CONF_OPTS = \
 	--with-pth-prefix=$(STAGING_DIR)/usr
 GNUPG2_CONF_ENV = gl_cv_header_working_stdint_h=yes
 
+ifeq ($(BR2_PACKAGE_GETTEXT),y)
+GNUPG2_DEPENDENCIES += gettext
+GNUPG2_CONF_ENV += LIBS=-lintl
+endif
+
 ifneq ($(BR2_PACKAGE_GNUPG2_GPGV2),y)
 define GNUPG2_REMOVE_GPGV2
 	rm -f $(TARGET_DIR)/usr/bin/gpgv2
-- 
1.7.1
