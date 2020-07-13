From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jul 2020 08:37:19 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/iwd: needs dbus
 (runtime)
Message-ID: <20200713063558.ED3EB817CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d0f1d375ad3f0f77183397986b522e168601bae7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

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
(cherry picked from commit 6f5f6bcd897871a99cb7b6220f94f101ea5212c8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iwd/Config.in | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/iwd/Config.in b/package/iwd/Config.in
index c790f3dba1..ed1ae8f56e 100644
--- a/package/iwd/Config.in
+++ b/package/iwd/Config.in
@@ -1,14 +1,18 @@
 config BR2_PACKAGE_IWD
 	bool "iwd"
+	depends on BR2_USE_MMU # dbus
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # ell
 	depends on !BR2_STATIC_LIBS # ell
 	depends on BR2_USE_WCHAR # ell
+	select BR2_PACKAGE_DBUS # runtime
 	select BR2_PACKAGE_ELL
 	help
 	  iNet Wireless daemon (iwd)
 
 	  https://iwd.wiki.kernel.org/
 
-comment "iwd needs a toolchain w/ dynamic library, wchar"
+comment "iwd needs a toolchain w/ threads, dynamic library, wchar"
+	depends on BR2_USE_MMU # dbus
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # ell
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
