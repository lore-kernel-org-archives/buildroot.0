From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 30 Jun 2020 22:11:11 +0200
Subject: [Buildroot] [git commit] package/poco: add
 BR2_PACKAGE_POCO_ARCH_SUPPORTS
Message-ID: <20200630200854.ECAE186175@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f733a4de7da15f207cb1b20815d5abaf67f7b5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 0737f48c5f (package/poco: disable build for riscv) did not
propagate the new dependency on BR2_riscv to the comment.

Introduce BR2_PACKAGE_POCO_ARCH_SUPPORTS to solve this issue.

Signed-off-by: Julien Olivain <juju@cotds.org>
[yann.morin.1998 at free.fr:
  - reword the commit log
  - use separate 'depend on !arch'
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/poco/Config.in | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/package/poco/Config.in b/package/poco/Config.in
index f8f921de04..05e56eb6b8 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -1,3 +1,13 @@
+config BR2_PACKAGE_POCO_ARCH_SUPPORTS
+	bool
+	default y
+	depends on !BR2_arc
+	depends on !BR2_microblaze
+	depends on !BR2_mipsel
+	depends on !BR2_or1k
+	depends on !BR2_riscv
+	depends on !BR2_xtensa
+
 config BR2_PACKAGE_POCO
 	bool "poco"
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -5,8 +15,7 @@ config BR2_PACKAGE_POCO
 	# pthread_condattr_setclock
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_STATIC_LIBS # dlopen()
-	depends on !(BR2_arc || BR2_microblaze || BR2_mipsel \
-		|| BR2_or1k || BR2_riscv || BR2_xtensa)
+	depends on BR2_PACKAGE_POCO_ARCH_SUPPORTS
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_PCRE
 	help
@@ -85,5 +94,4 @@ endif # BR2_PACKAGE_POCO
 comment "poco needs a toolchain w/ wchar, NPTL, C++, dynamic library"
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
-	depends on !(BR2_arc || BR2_microblaze || BR2_mipsel \
-		|| BR2_or1k || BR2_xtensa)
+	depends on BR2_PACKAGE_POCO_ARCH_SUPPORTS
