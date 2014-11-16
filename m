From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Nov 2014 14:29:55 +0100
Subject: [Buildroot] [PATCH] package/libunwind: link to libgcc_s, not libgcc
Message-ID: <1416144595-14637-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Backport a fix from upstream to link against libgcc_s instead of libgcc.

Fixes ltrace build failures:
    http://autobuild.buildroot.net/results/a0c/a0c132f8cdea2c34ceff27606764a60c2853f644/
    http://autobuild.buildroot.net/results/67f/67fbd04d6ae187861fa1bf84d3df1877c7be6fb2/
    http://autobuild.buildroot.net/results/0ca/0ca564101b870e5953acb66ac832ce9e23198392/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 ...isable-tests.patch => 0001-disable-tests.patch} |  0
 ...dd-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch} |  0
 ...-libunwind-to-libgcc_s-rather-than-libgcc.patch | 41 ++++++++++++++++++++++
 3 files changed, 41 insertions(+)
 rename package/libunwind/{libunwind-01-disable-tests.patch => 0001-disable-tests.patch} (100%)
 rename package/libunwind/{libunwind-02-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch => 0002-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch} (100%)
 create mode 100644 package/libunwind/0003-Link-libunwind-to-libgcc_s-rather-than-libgcc.patch

diff --git a/package/libunwind/libunwind-01-disable-tests.patch b/package/libunwind/0001-disable-tests.patch
similarity index 100%
rename from package/libunwind/libunwind-01-disable-tests.patch
rename to package/libunwind/0001-disable-tests.patch
diff --git a/package/libunwind/libunwind-02-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch b/package/libunwind/0002-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch
similarity index 100%
rename from package/libunwind/libunwind-02-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch
rename to package/libunwind/0002-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch
diff --git a/package/libunwind/0003-Link-libunwind-to-libgcc_s-rather-than-libgcc.patch b/package/libunwind/0003-Link-libunwind-to-libgcc_s-rather-than-libgcc.patch
new file mode 100644
index 0000000..7ea2512
--- /dev/null
+++ b/package/libunwind/0003-Link-libunwind-to-libgcc_s-rather-than-libgcc.patch
@@ -0,0 +1,41 @@
+From f1684379dfaf8018d5d4c1945e292a56d0fab245 Mon Sep 17 00:00:00 2001
+From: Thierry Reding <treding@nvidia.com>
+Date: Fri, 27 Jun 2014 08:40:33 +0200
+Subject: [PATCH] Link libunwind to libgcc_s rather than libgcc
+
+For some architectures, -lgcc and -lgcc_s are not equivalent. On ARM for
+example, libgcc_s.so.1 contains some symbols needed by libunwind which
+are not present in libgcc.
+
+This causes the following link error when building the X.Org X server
+with libunwind support:
+
+	  CCLD     Xorg
+	/usr/lib/libunwind.so: undefined reference to `__aeabi_unwind_cpp_pr0'
+	/usr/lib/libunwind.so: undefined reference to `__aeabi_unwind_cpp_pr1'
+
+Linking against libgcc_s explicitly solves this problem.
+
+Signed-off-by: Thierry Reding <treding@nvidia.com>
+[yann.morin.1998 at free.fr: backport to libunwind 1.1]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4e2fd23..a77cf01 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -258,7 +258,7 @@ else
+ 
+ if test x$GCC = xyes -a x$intel_compiler != xyes; then
+   CFLAGS="${CFLAGS} -fexceptions -Wall -Wsign-compare"
+-  LIBCRTS="-lgcc"
++  LIBCRTS="-lgcc_s"
+ fi
+ AC_MSG_RESULT([$intel_compiler])
+ 
+-- 
+1.9.1
+
-- 
1.9.1
