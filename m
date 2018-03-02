From: Baruch Siach <baruch@tkos.co.il>
Date: Fri,  2 Mar 2018 06:40:34 +0200
Subject: [Buildroot] [PATCH next] autofs: disable for musl
Message-ID: <d54d651ab276a4ae248de1c302788d3960103ff8.1519965634.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

autofs requires nsswitch which musl libc does not implement. Commit
873040371b14 (autofs: allow to use libtirpc) removed the
BR2_TOOLCHAIN_HAS_NATIVE_RPC dependency, making autofs available for
musl. Disable musl explicitly.

Fixes:
http://autobuild.buildroot.net/results/a54/a549b62fbf03474ffd8586869637d083de275091/
http://autobuild.buildroot.net/results/b32/b3276b2cbd1e1c260f8df4c3945f51ddc09d492f/
http://autobuild.buildroot.net/results/10b/10b5c5b13971214d0439b715f1a46c78a5249309/

Cc: Waldemar Brodkorb <wbx@openadk.org>
Cc: Jonathan Ben Avraham <yba@tkos.co.il>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/autofs/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/autofs/Config.in b/package/autofs/Config.in
index efb0ec28ee7d..8bb5fe276f65 100644
--- a/package/autofs/Config.in
+++ b/package/autofs/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_AUTOFS
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS # dlfcn
+	depends on !BR2_TOOLCHAIN_USES_MUSL # nsswitch
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
 	  Autofs controls the operation of the automount daemons. The
@@ -15,6 +16,7 @@ config BR2_PACKAGE_AUTOFS
 
 	  http://www.linuxfromscratch.org/blfs/view/svn/general/autofs.html
 
-comment "autofs needs a toolchain w/ NPTL and dynamic library"
+comment "autofs needs a glibc or uClibc toolchain w/ NPTL and dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
+		|| BR2_TOOLCHAIN_USES_MUSL
-- 
2.16.1
