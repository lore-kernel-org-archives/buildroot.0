From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  5 May 2015 00:12:27 +0200
Subject: [Buildroot] [PATCHv2] package/neard: needs shared libs
Message-ID: <1430777547-30022-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

neard uses dlopen(), so needs shared libs.

Fixes:
    http://autobuild.buildroot.org/results/0a4/0a466cde55c5e128a2e201924f80f0ec6b8b5c2a/

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Changes v1 -> v2:
  - update comment

---
Note: the only package that selects neard is connman, and it already
depends on !static.
---
 package/neard/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/neard/Config.in b/package/neard/Config.in
index ed20e06..353d1af 100644
--- a/package/neard/Config.in
+++ b/package/neard/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_NEARD
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl, dbus, libglib2
 	depends on BR2_USE_MMU # dbus, libglib2
+	depends on !BR2_STATIC_LIBS # dlopen
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBNL
@@ -23,6 +24,6 @@ config BR2_PACKAGE_NEARD_TOOLS
 
 endif
 
-comment "neard needs a toolchain w/ wchar, threads"
+comment "neard needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-- 
1.9.1
