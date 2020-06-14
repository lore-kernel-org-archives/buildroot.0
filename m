From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jun 2020 11:42:41 +0200
Subject: [Buildroot] [git commit] package/iwd: needs dbus (runtime)
Message-ID: <20200614094159.A406282602@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6f5f6bcd897871a99cb7b6220f94f101ea5212c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes (on startup):

  $ usr/libexec/iwd
  Wireless daemon version 1.7
  Failed to initialize D-Bus

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[yann.morin.1998 at free.fr:
  - move MMU dependency first
  - split long line in comment dependencies
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/iwd/Config.in | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/iwd/Config.in b/package/iwd/Config.in
index eff24a8599..ec53d13047 100644
--- a/package/iwd/Config.in
+++ b/package/iwd/Config.in
@@ -1,16 +1,20 @@
 config BR2_PACKAGE_IWD
 	bool "iwd"
+	depends on BR2_USE_MMU # dbus
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # ell
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12 # ell
 	depends on !BR2_STATIC_LIBS # ell
 	depends on BR2_USE_WCHAR # ell
+	select BR2_PACKAGE_DBUS # runtime
 	select BR2_PACKAGE_ELL
 	help
 	  iNet Wireless daemon (iwd)
 
 	  https://iwd.wiki.kernel.org/
 
-comment "iwd needs a toolchain w/ dynamic library, wchar, headers >= 4.12"
+comment "iwd needs a toolchain w/ threads, dynamic library, wchar, headers >= 4.12"
+	depends on BR2_USE_MMU # dbus
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # ell
-	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
