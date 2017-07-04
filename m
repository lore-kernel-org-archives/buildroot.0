From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:48:29 +0200
Subject: [Buildroot] [PATCH 049/100] linux-pam: use the new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-50-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - using TARGET_NLS_LIBS to force linking against libintl

 - dropping BR2_PACKAGE_GETTEXT selection

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-pam/Config.in    | 1 -
 package/linux-pam/linux-pam.mk | 9 +++------
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/package/linux-pam/Config.in b/package/linux-pam/Config.in
index ab7cf55..33e5154 100644
--- a/package/linux-pam/Config.in
+++ b/package/linux-pam/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_LINUX_PAM
 	depends on !BR2_STATIC_LIBS
 	depends on !BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_FLEX
 	help
 	  A Security Framework that Provides Authentication for Applications
diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index fb2f99c..5c80e78 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -16,15 +16,12 @@ LINUX_PAM_CONF_OPTS = \
 	--disable-regenerate-docu \
 	--enable-securedir=/lib/security \
 	--libdir=/lib
-LINUX_PAM_DEPENDENCIES = flex host-flex host-pkgconf
+LINUX_PAM_DEPENDENCIES = flex host-flex host-pkgconf \
+	$(TARGET_NLS_DEPENDENCIES)
 LINUX_PAM_AUTORECONF = YES
 LINUX_PAM_LICENSE = BSD-3-Clause
 LINUX_PAM_LICENSE_FILES = Copyright
-
-ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
-LINUX_PAM_DEPENDENCIES += gettext
-LINUX_PAM_MAKE_OPTS += LIBS=-lintl
-endif
+LINUX_PAM_MAKE_OPTS += LIBS=$(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 LINUX_PAM_CONF_OPTS += --enable-selinux
-- 
2.9.4
