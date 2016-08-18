From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 18 Aug 2016 08:23:45 +0200
Subject: [Buildroot] [PATCH] linux-pam: uses fork() needs MMU
Message-ID: <20160818062345.GA28431@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.net/results/8c9/8c9a5fe52f762b4ff4444cf41efdf0d3cf203986/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/linux-pam/Config.in  | 1 +
 package/nodm/Config.in       | 1 +
 package/python-pam/Config.in | 1 +
 package/rsh-redone/Config.in | 2 ++
 package/util-linux/Config.in | 2 ++
 5 files changed, 7 insertions(+)

diff --git a/package/linux-pam/Config.in b/package/linux-pam/Config.in
index f6cf530..7044073 100644
--- a/package/linux-pam/Config.in
+++ b/package/linux-pam/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_LINUX_PAM
 	# for details.
 	depends on !BR2_STATIC_LIBS
 	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
+	depends on BR2_USE_MMU # fork()
 	help
 	  A Security Framework that Provides Authentication for Applications
 
diff --git a/package/nodm/Config.in b/package/nodm/Config.in
index b8629a2..97ce8c3 100644
--- a/package/nodm/Config.in
+++ b/package/nodm/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_NODM
 	depends on !BR2_STATIC_LIBS # linux-pam
 	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # needs wordexp.h
+	depends on BR2_USE_MMU # linux-pam
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_LINUX_PAM
 	help
diff --git a/package/python-pam/Config.in b/package/python-pam/Config.in
index 497bcd3..02865d0 100644
--- a/package/python-pam/Config.in
+++ b/package/python-pam/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_PYTHON_PAM
 	depends on BR2_PACKAGE_PYTHON # C extension not compatible with python3
 	depends on BR2_ENABLE_LOCALE # linux-pam
 	depends on BR2_USE_WCHAR # linux-pam
+	depends on BR2_USE_MMU # linux-pam
 	depends on !BR2_STATIC_LIBS # linux-pam
 	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
 	select BR2_PACKAGE_LINUX_PAM
diff --git a/package/rsh-redone/Config.in b/package/rsh-redone/Config.in
index 6258369..6a8aec0 100644
--- a/package/rsh-redone/Config.in
+++ b/package/rsh-redone/Config.in
@@ -17,6 +17,7 @@ config BR2_PACKAGE_RSH_REDONE_RLOGIND
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_ENABLE_LOCALE && BR2_USE_WCHAR
 	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
+	depends on BR2_USE_MMU # linux-pam
 	select BR2_PACKAGE_LINUX_PAM
 
 comment "rlogind needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library"
@@ -31,6 +32,7 @@ config BR2_PACKAGE_RSH_REDONE_RSHD
 	depends on BR2_ENABLE_LOCALE && BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS
 	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
+	depends on BR2_USE_MMU # linux-pam
 	select BR2_PACKAGE_LINUX_PAM
 
 comment "rshd needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library"
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 429dfa7..657bcdd 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -63,6 +63,7 @@ config BR2_PACKAGE_UTIL_LINUX_CHFN_CHSH
 	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
 	depends on !BR2_STATIC_LIBS
 	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
+	depends on BR2_USE_MMU # linux-pam
 	select BR2_PACKAGE_LINUX_PAM
 	help
 	  Change login shell, real user name and information
@@ -127,6 +128,7 @@ config BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS
 	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
 	depends on !BR2_STATIC_LIBS
 	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
+	depends on BR2_USE_MMU # linux-pam
 	select BR2_PACKAGE_LINUX_PAM
 	help
 	  Build login utilities (last, login, su, sulogin)
-- 
2.1.4
