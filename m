From: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
Date: Tue, 16 Feb 2016 11:48:17 +0530
Subject: [Buildroot] [Buildroot PATCH Selinux v10 02/11] linux-pam: selinux
	audit dependencies
In-Reply-To: <1455603506-26138-1-git-send-email-niranjan.reddy@rockwellcollins.com>
References: <1455603506-26138-1-git-send-email-niranjan.reddy@rockwellcollins.com>
Message-ID: <1455603506-26138-2-git-send-email-niranjan.reddy@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Niranjan <niranjan.reddy@rockwellcollins.com>

Signed-off-by: Niranjan <niranjan.reddy@rockwellcollins.com>

---
Changes v9 -> v10:
  - New patch created for selinux audit dependencies.
  - Added comment to justify that host-linux-pam is needed for creating pam conf files.
  - Updated Indentation and modified as per comments (suggested by Thomas)

Changes v1 -> v9:
  - Did not exist
---
 package/linux-pam/linux-pam.mk | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index 26b627e..c2897df 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -8,15 +8,18 @@ LINUX_PAM_VERSION = 1.1.8
 LINUX_PAM_SOURCE = Linux-PAM-$(LINUX_PAM_VERSION).tar.bz2
 LINUX_PAM_SITE = http://linux-pam.org/library
 LINUX_PAM_INSTALL_STAGING = YES
+# cracklib and libdb are not currently present in buildroot
 LINUX_PAM_CONF_OPTS = \
 	--disable-prelude \
 	--disable-isadir \
 	--disable-nis \
 	--disable-db \
+	--disable-cracklib \
 	--disable-regenerate-docu \
 	--enable-securedir=/lib/security \
 	--libdir=/lib
-LINUX_PAM_DEPENDENCIES = flex host-flex host-pkgconf
+# host-linux-pam is needed for creating pam conf files
+LINUX_PAM_DEPENDENCIES = flex host-flex host-pkgconf host-linux-pam
 LINUX_PAM_AUTORECONF = YES
 LINUX_PAM_LICENSE = BSD-3c
 LINUX_PAM_LICENSE_FILES = Copyright
@@ -26,6 +29,20 @@ LINUX_PAM_DEPENDENCIES += gettext
 LINUX_PAM_MAKE_OPTS += LIBS=-lintl
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+LINUX_PAM_CONF_OPTS += --enable-selinux
+LINUX_PAM_DEPENDENCIES += libselinux
+else
+LINUX_PAM_CONF_OPTS += --disable-selinux
+endif
+
+ifeq ($(BR2_PACKAGE_AUDIT),y)
+LINUX_PAM_CONF_OPTS += --enable-audit
+LINUX_PAM_DEPENDENCIES += audit
+else
+LINUX_PAM_CONF_OPTS += --disable-audit
+endif
+
 # Install default pam config (deny everything)
 define LINUX_PAM_INSTALL_CONFIG
 	$(INSTALL) -m 0644 -D package/linux-pam/other.pam \
-- 
2.5.0
