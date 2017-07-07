From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu,  6 Jul 2017 23:22:36 -0300
Subject: [Buildroot] [PATCH 1/7] linux-pam: introduce
	BR2_PACKAGE_LINUX_PAM_ARCH_SUPPORTS
In-Reply-To: <20170707022242.20128-1-casantos@datacom.ind.br>
References: <20170707022242.20128-1-casantos@datacom.ind.br>
Message-ID: <20170707022242.20128-2-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This will allow us to use the hidden option in dependent packages,
instead of repeating the dependencies in each Config.in file.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/linux-pam/Config.in | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/package/linux-pam/Config.in b/package/linux-pam/Config.in
index 33e5154..0daffe4 100644
--- a/package/linux-pam/Config.in
+++ b/package/linux-pam/Config.in
@@ -1,9 +1,20 @@
-config BR2_PACKAGE_LINUX_PAM
-	bool "linux-pam"
+# Use this option instead of duplicating the dependencies in each
+# dependent package.
+#
+# If you change these dependencies then update the comment below
+# and the # corresponding ones in other Config.in files.
+#
+config BR2_PACKAGE_LINUX_PAM_ARCH_SUPPORTS
+	bool
+	default y
 	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR)
 	depends on !BR2_STATIC_LIBS
 	depends on !BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_USE_MMU # fork()
+
+config BR2_PACKAGE_LINUX_PAM
+	bool "linux-pam"
+	depends on BR2_PACKAGE_LINUX_PAM_ARCH_SUPPORTS
 	select BR2_PACKAGE_FLEX
 	help
 	  A Security Framework that Provides Authentication for Applications
@@ -11,5 +22,4 @@ config BR2_PACKAGE_LINUX_PAM
 	  http://linux-pam.org
 
 comment "linux-pam needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library"
-	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
-		|| BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
+	depends on !BR2_PACKAGE_LINUX_PAM_ARCH_SUPPORTS
-- 
2.9.4
