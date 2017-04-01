From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 17:56:28 +0200
Subject: [Buildroot] [git commit] dc3dd: add patch to fix autoreconf
Message-ID: <20170401155638.3A62E825FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8607ae919dc70bacfd7041db7aa613e14b2e7463
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a patch to dc3dd that fixes autoreconfiguration.

Fixes:

  http://autobuild.buildroot.net/results/5b73b0d735691c5f63ed9bc3122bc84ea21faae7/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dc3dd/0002-fix-autoreconf.patch | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/dc3dd/0002-fix-autoreconf.patch b/package/dc3dd/0002-fix-autoreconf.patch
new file mode 100644
index 0000000..85e0a36
--- /dev/null
+++ b/package/dc3dd/0002-fix-autoreconf.patch
@@ -0,0 +1,32 @@
+Remove use of AM_C_PROTOTYPES to fix autoreconf
+
+The AM_C_PROTOTYPES macro no longer exists since automake 1.12. It
+existed to support de-ANSI-fication of code using ansi2knr. It was
+simply removed from coreutils m4/jm-macros.m4 in commit
+88873501cff9ed937edf969cedd693517ab0a293, but this change was not
+propagated to dc3dd, causing an autoreconf failure:
+
+configure.ac:45: error: automatic de-ANSI-fication support has been removed
+/home/peko/autobuild/instance-0/output/host/usr/share/aclocal-1.15/obsolete.m4:26: AM_C_PROTOTYPES is expanded from...
+m4/jm-macros.m4:124: gl_CHECK_ALL_TYPES is expanded from...
+m4/jm-macros.m4:22: coreutils_MACROS is expanded from...
+configure.ac:45: the top level
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/m4/jm-macros.m4
+===================================================================
+--- a/m4/jm-macros.m4
++++ b/m4/jm-macros.m4
+@@ -128,11 +128,6 @@
+   dnl whether functions and headers are available, whether they work, etc.
+   AC_REQUIRE([AC_SYS_LARGEFILE])
+ 
+-  dnl This test must precede tests of compiler characteristics like
+-  dnl that for the inline keyword, since it may change the degree to
+-  dnl which the compiler supports such features.
+-  AC_REQUIRE([AM_C_PROTOTYPES])
+-
+   dnl Checks for typedefs, structures, and compiler characteristics.
+   AC_REQUIRE([AC_C_BIGENDIAN])
+   AC_REQUIRE([AC_C_VOLATILE])
