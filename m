From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 21:25:41 +0100
Subject: [Buildroot] [git commit] package/libdrm: adjust patch switching to
 pkg-config for libatomic_ops
Message-ID: <20180107203114.77E9E83B3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a27ef82d51591405e20ab57779fe9dffdb66e42b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit fa6c7d165971e1f70b9ac94bae9cd1fd9180c072 ("libdrm: fix
libatomic_ops linking"), a patch was added to switch to
PKG_CHECK_MODULES() to detect libatomic_ops instead of
AC_CHECK_HEADER.

However, as explained in
https://autotools.io/pkgconfig/pkg_check_modules.html:

"In contrast with almost all of the original macros, though, the default
 action-if-not-found will end the execution with an error for not having
 found the dependency."

This makes the configure script bail out when libatomic_ops is not
available, which is not what we want in libdrm's configure
script. This commit adjusts the PKG_CHECK_MODULES() call to avoid
failing.

Fixes:

  http://autobuild.buildroot.net/results/cea/cea777dc997f86c1122c8b818d264215a0e77e5a/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0003-configure-Makefile.am-use-pkg-config-to-discover-lib.patch   | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libdrm/0003-configure-Makefile.am-use-pkg-config-to-discover-lib.patch b/package/libdrm/0003-configure-Makefile.am-use-pkg-config-to-discover-lib.patch
index 20bb0a3..0fbe77e 100644
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
