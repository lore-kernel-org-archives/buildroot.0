From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Jul 2014 22:20:08 +0200
Subject: [Buildroot] [git commit] linux-pam: unavailable for static builds
Message-ID: <20140731202112.1F7209D348@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2df1a57ef21b2e4a06e64f678b5ceef8217d9c29
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/3bb/3bb8d4662995a11e8e6cc5fdaaba9e25d4c0e0ec/

[Thomas: add more details about the non availability for static builds
as a comment in the Config.in file.]

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-pam/Config.in  |   12 ++++++++++--
 package/rsh-redone/Config.in |   16 ++++++++++------
 package/util-linux/Config.in |   16 ++++++++++------
 3 files changed, 30 insertions(+), 14 deletions(-)

diff --git a/package/linux-pam/Config.in b/package/linux-pam/Config.in
index 88bdd4f..c2cfdc0 100644
--- a/package/linux-pam/Config.in
+++ b/package/linux-pam/Config.in
@@ -3,10 +3,18 @@ config BR2_PACKAGE_LINUX_PAM
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_FLEX
 	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR)
+	# While linux-pam does have some support for statically linked
+	# modules (through --enable-static-modules), it doesn't work
+	# properly due to a build cycle between libpam and
+	# modules. See
+	# https://lists.fedorahosted.org/pipermail/linux-pam-commits/2012-February/000105.html
+	# for details.
+	depends on !BR2_PREFER_STATIC_LIB
 	help
 	  A Security Framework that Provides Authentication for Applications
 
 	  http://linux-pam.org
 
-comment "linux-pam needs a toolchain w/ wchar, locale"
-	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR)
+comment "linux-pam needs a toolchain w/ wchar, locale, dynamic library"
+	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
+		|| BR2_PREFER_STATIC_LIB
diff --git a/package/rsh-redone/Config.in b/package/rsh-redone/Config.in
index f636e2f..c8f2f51 100644
--- a/package/rsh-redone/Config.in
+++ b/package/rsh-redone/Config.in
@@ -14,21 +14,25 @@ config BR2_PACKAGE_RSH_REDONE_RLOGIN
 
 config BR2_PACKAGE_RSH_REDONE_RLOGIND
 	bool "rlogind"
-	select BR2_PACKAGE_LINUX_PAM
+	depends on !BR2_PREFER_STATIC_LIB
 	depends on BR2_ENABLE_LOCALE && BR2_USE_WCHAR
+	select BR2_PACKAGE_LINUX_PAM
 
-comment "rlogind needs a toolchain w/ wchar, locale"
-	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR)
+comment "rlogind needs a toolchain w/ wchar, locale, dynamic library"
+	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
+		|| BR2_PREFER_STATIC_LIB
 
 config BR2_PACKAGE_RSH_REDONE_RSH
 	bool "rsh"
 
 config BR2_PACKAGE_RSH_REDONE_RSHD
 	bool "rshd"
-	select BR2_PACKAGE_LINUX_PAM
 	depends on BR2_ENABLE_LOCALE && BR2_USE_WCHAR
+	depends on !BR2_PREFER_STATIC_LIB
+	select BR2_PACKAGE_LINUX_PAM
 
-comment "rshd needs a toolchain w/ wchar, locale"
-	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR)
+comment "rshd needs a toolchain w/ wchar, locale, dynamic library"
+	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
+		|| BR2_PREFER_STATIC_LIB
 
 endif
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 28bda11..934021a 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -58,13 +58,15 @@ config BR2_PACKAGE_UTIL_LINUX_ARCH
 
 config BR2_PACKAGE_UTIL_LINUX_CHFN_CHSH
 	bool "chfn/chsh"
-	select BR2_PACKAGE_LINUX_PAM
 	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
+	depends on !BR2_PREFER_STATIC_LIB
+	select BR2_PACKAGE_LINUX_PAM
 	help
 	  Change login shell, real user name and information
 
-comment "chfn/chsh needs a toolchain w/ wchar, locale"
-	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR)
+comment "chfn/chsh needs a toolchain w/ wchar, locale, dynamic library"
+	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
+		|| BR2_PREFER_STATIC_LIB
 
 config BR2_PACKAGE_UTIL_LINUX_CRAMFS
 	bool "cramfs utilities"
@@ -100,13 +102,15 @@ config BR2_PACKAGE_UTIL_LINUX_KILL
 
 config BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS
 	bool "login utilities"
-	depends on BR2_ENABLE_LOCALE # linux-pam
+	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
+	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_PACKAGE_LINUX_PAM
 	help
 	  Build login utilities (last, login, su, sulogin)
 
-comment "login utilities needs a toolchain w/ locale"
-	depends on !BR2_ENABLE_LOCALE
+comment "login utilities needs a toolchain w/ wchar, locale, dynamic library"
+	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
+		|| BR2_PREFER_STATIC_LIB
 
 config BR2_PACKAGE_UTIL_LINUX_LOSETUP
 	bool "losetup"
