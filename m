From: Julien Olivain <juju@cotds.org>
Date: Tue, 30 Jun 2020 19:34:32 +0200
Subject: [Buildroot] [PATCH v2 1/4] package/poco: add
 BR2_PACKAGE_POCO_ARCH_SUPPORTS
In-Reply-To: <20200629210735.179913-1-juju@cotds.org>
References: <20200629210735.179913-1-juju@cotds.org>
Message-ID: <20200630173435.7828-1-juju@cotds.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change is motivated by a misalignment of the Kconfig package and
comment dependencies, introduced in commit 0737f48c5f "package/poco:
disable build for riscv" (BR_riscv was missing in the comment).
Introducing BR2_PACKAGE_POCO_ARCH_SUPPORTS solve this issue.

Signed-off-by: Julien Olivain <juju@cotds.org>
---
Changes v1 -> v2:
Suggested by Thomas:
  - introduce _ARCH_SUPPORTS to prevent duplicating dependency conditions
---
 package/poco/Config.in | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/poco/Config.in b/package/poco/Config.in
index f8f921de04..13f7b3b0a3 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -1,3 +1,8 @@
+config BR2_PACKAGE_POCO_ARCH_SUPPORTS
+	bool
+	default y if !(BR2_arc || BR2_microblaze || BR2_mipsel \
+		|| BR2_or1k || BR2_riscv || BR2_xtensa)
+
 config BR2_PACKAGE_POCO
 	bool "poco"
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -5,8 +10,7 @@ config BR2_PACKAGE_POCO
 	# pthread_condattr_setclock
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_STATIC_LIBS # dlopen()
-	depends on !(BR2_arc || BR2_microblaze || BR2_mipsel \
-		|| BR2_or1k || BR2_riscv || BR2_xtensa)
+	depends on BR2_PACKAGE_POCO_ARCH_SUPPORTS
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_PCRE
 	help
@@ -85,5 +89,4 @@ endif # BR2_PACKAGE_POCO
 comment "poco needs a toolchain w/ wchar, NPTL, C++, dynamic library"
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
-	depends on !(BR2_arc || BR2_microblaze || BR2_mipsel \
-		|| BR2_or1k || BR2_xtensa)
+	depends on BR2_PACKAGE_POCO_ARCH_SUPPORTS
-- 
2.26.2
