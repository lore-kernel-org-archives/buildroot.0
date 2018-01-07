From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 Jan 2018 18:07:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/libdrm: PKG_CHECK_MODULES should
 not fail when libatomic_ops is missing
Message-ID: <20180107170738.21617-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

According to https://autotools.io/pkgconfig/pkg_check_modules.html
"In contrast with almost all of the original macros, though, the default
 action-if-not-found will end the execution with an error for not having
 found the dependency."

Fixes
http://autobuild.buildroot.net/results/cea/cea777dc997f86c1122c8b818d264215a0e77e5a/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0003-configure-Makefile.am-use-pkg-config-to-discover-lib.patch   | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libdrm/0003-configure-Makefile.am-use-pkg-config-to-discover-lib.patch b/package/libdrm/0003-configure-Makefile.am-use-pkg-config-to-discover-lib.patch
index 20bb0a36d3..0fbe77ef7c 100644
--- a/package/libdrm/0003-configure-Makefile.am-use-pkg-config-to-discover-lib.patch
+++ b/package/libdrm/0003-configure-Makefile.am-use-pkg-config-to-discover-lib.patch
@@ -23,6 +23,8 @@ and we don't link against it.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+[Bernd: PKG_CHECK_MODULES should not fail when libatomic_ops is missing]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
  amdgpu/Makefile.am    | 2 +-
  configure.ac          | 2 +-
@@ -57,7 +59,7 @@ index 35378b33..501d0871 100644
  
  	if test "x$drm_cv_atomic_primitives" = "xnone"; then
 -		AC_CHECK_HEADER([atomic_ops.h], drm_cv_atomic_primitives="libatomic-ops")
-+		PKG_CHECK_MODULES(ATOMIC_OPS, [atomic_ops], drm_cv_atomic_primitives="libatomic-ops")
++		PKG_CHECK_MODULES(ATOMIC_OPS, [atomic_ops], drm_cv_atomic_primitives="libatomic-ops", true)
  	fi
  
  	# atomic functions defined in <atomic.h> & libc on Solaris
-- 
2.11.0
