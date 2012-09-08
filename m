From: Dmitry <golubovsky@gmail.com>
Date: Sat,  8 Sep 2012 00:21:04 -0400
Subject: [Buildroot] [PATCH 2/4] Make Berkeley DB a dependency of linux-pam
	and make sure it is selected
In-Reply-To: <1347078066-25257-1-git-send-email-golubovsky@gmail.com>
References: <1347078066-25257-1-git-send-email-golubovsky@gmail.com>
Message-ID: <1347078066-25257-2-git-send-email-golubovsky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The pam_userdb module is used to verify a username/password pair
against values stored in a Berkeley DB database. The database is
indexed by the username, and the data fields corresponding to the
username keys are the passwords (from man 8 pam_userdb).

Signed-off-by: Dmitry <golubovsky@gmail.com>
---
 package/linux-pam/Config.in    |    1 +
 package/linux-pam/linux-pam.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/linux-pam/Config.in b/package/linux-pam/Config.in
index 722b875..65e7b69 100644
--- a/package/linux-pam/Config.in
+++ b/package/linux-pam/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LINUX_PAM
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_FLEX
 	select BR2_PACKAGE_FLEX_LIBFL
+	select BR2_PACKAGE_BERKELEYDB
 	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR)
 	help
 	  A Security Framework that Provides Authentication for Applications
diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index 48cb073..5e0ecf0 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -15,7 +15,7 @@ LINUX_PAM_CONF_OPT = \
 	--disable-regenerate-docu \
 	--enable-securedir=/lib/security \
 	--libdir=/lib
-LINUX_PAM_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) flex
+LINUX_PAM_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) flex berkeleydb
 LINUX_PAM_AUTORECONF = YES
 LINUX_PAM_LICENSE = BSD-3c
 LINUX_PAM_LICENSE_FILES = Copyright
-- 
1.7.2.5
