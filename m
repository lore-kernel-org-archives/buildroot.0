From: Brendan Heading <brendanheading@gmail.com>
Date: Thu, 20 Aug 2015 19:58:54 +0100
Subject: [Buildroot] [PATCH 1/1] packages/linux-pam: disable when using musl
Message-ID: <1440097134-32316-1-git-send-email-brendanheading@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes: http://autobuild.buildroot.net/results/e33/e337d69420ad00b2cc4017d639a31803926f2353/

linux-pam needs some surgery to build under musl, so for the time being
disable it until the issues are solved. Also disables dependent package
python-pam, and dependent suboptions under openvmtools, rsh-redone and
util-linux.

Signed-off-by: Brendan Heading <brendanheading@gmail.com>
---
 package/linux-pam/Config.in   | 3 ++-
 package/openvmtools/Config.in | 3 ++-
 package/python-pam/Config.in  | 4 +++-
 package/rsh-redone/Config.in  | 6 ++++--
 package/util-linux/Config.in  | 3 ++-
 5 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/package/linux-pam/Config.in b/package/linux-pam/Config.in
index 6b92886..8cedd04 100644
--- a/package/linux-pam/Config.in
+++ b/package/linux-pam/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_LINUX_PAM
 	# https://lists.fedorahosted.org/pipermail/linux-pam-commits/2012-February/000105.html
 	# for details.
 	depends on !BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_USES_MUSL	# linux-pam
 	help
 	  A Security Framework that Provides Authentication for Applications
 
@@ -17,4 +18,4 @@ config BR2_PACKAGE_LINUX_PAM
 
 comment "linux-pam needs a toolchain w/ wchar, locale, dynamic library"
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
-		|| BR2_STATIC_LIBS
+		|| BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/openvmtools/Config.in b/package/openvmtools/Config.in
index 8e22eff..ac6aaca 100644
--- a/package/openvmtools/Config.in
+++ b/package/openvmtools/Config.in
@@ -36,11 +36,12 @@ config BR2_PACKAGE_OPENVMTOOLS_PAM
 	# linux-pam needs locale and wchar, but we already have this
 	# dependency on the main symbol, above.
 	depends on !BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_USES_MUSL	# linux-pam
 	help
 	  Support for PAM in openvmtools
 
 comment "PAM support needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+	depends on BR2_STATIC_LIBS || BR2_TOOLCAHIN_USES_MUSL
 
 endif
 
diff --git a/package/python-pam/Config.in b/package/python-pam/Config.in
index 6c7bc63..5e97b8f 100644
--- a/package/python-pam/Config.in
+++ b/package/python-pam/Config.in
@@ -1,6 +1,7 @@
 comment "python-pam needs a toolchain w/ wchar, locale, dynamic library"
 	depends on BR2_PACKAGE_PYTHON
-	depends on !BR2_ENABLE_LOCALE || !BR2_USE_WCHAR || BR2_STATIC_LIBS
+	depends on !BR2_ENABLE_LOCALE || !BR2_USE_WCHAR || BR2_STATIC_LIBS || \
+		BR2_TOOLCHAIN_USES_MUSL
 
 config BR2_PACKAGE_PYTHON_PAM
 	bool "python-pam"
@@ -8,6 +9,7 @@ config BR2_PACKAGE_PYTHON_PAM
 	depends on BR2_ENABLE_LOCALE # linux-pam
 	depends on BR2_USE_WCHAR # linux-pam
 	depends on !BR2_STATIC_LIBS # linux-pam
+	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
 	select BR2_PACKAGE_LINUX_PAM
 	help
 	  PAM (Pluggable Authentication Module) bindings for Python.
diff --git a/package/rsh-redone/Config.in b/package/rsh-redone/Config.in
index 218b47c..6737ef5 100644
--- a/package/rsh-redone/Config.in
+++ b/package/rsh-redone/Config.in
@@ -16,11 +16,12 @@ config BR2_PACKAGE_RSH_REDONE_RLOGIND
 	bool "rlogind"
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_ENABLE_LOCALE && BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_USES_MUSL	# linux-pam
 	select BR2_PACKAGE_LINUX_PAM
 
 comment "rlogind needs a toolchain w/ wchar, locale, dynamic library"
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
-		|| BR2_STATIC_LIBS
+		|| BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
 
 config BR2_PACKAGE_RSH_REDONE_RSH
 	bool "rsh"
@@ -29,10 +30,11 @@ config BR2_PACKAGE_RSH_REDONE_RSHD
 	bool "rshd"
 	depends on BR2_ENABLE_LOCALE && BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_USES_MUSL	# linux-pam
 	select BR2_PACKAGE_LINUX_PAM
 
 comment "rshd needs a toolchain w/ wchar, locale, dynamic library"
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
-		|| BR2_STATIC_LIBS
+		|| BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
 
 endif
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 39df11c..4db1d3f 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -66,13 +66,14 @@ config BR2_PACKAGE_UTIL_LINUX_CHFN_CHSH
 	bool "chfn/chsh"
 	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
 	depends on !BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_LINUX_PAM
 	help
 	  Change login shell, real user name and information
 
 comment "chfn/chsh needs a toolchain w/ wchar, locale, dynamic library"
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
-		|| BR2_STATIC_LIBS
+		|| BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
 
 config BR2_PACKAGE_UTIL_LINUX_CRAMFS
 	bool "cramfs utilities"
-- 
2.4.3
