From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 13 Sep 2020 18:49:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/supertux: needs -fPIC
Message-ID: <20200913164937.2684977-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add -fPIC to CFLAGS (and CXXFLAGS for consistency) to avoid the
following build failure:

/home/peko/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/8.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: CMakeFiles/sq_static.dir/sq.c.o: relocation R_X86_64_32 against `.rodata.str1.8' can not be used when making a PIE object; recompile with -fPIC
/home/peko/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/8.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: final link failed: nonrepresentable section on output
collect2: error: ld returned 1 exit status

Fixes:
 - http://autobuild.buildroot.org/results/46e8f5e622ce450a89bc6d70f4bfd38182557901
 - http://autobuild.buildroot.org/results/a43720492d817e4555d728546da9114e3ccba952

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/supertux/supertux.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/supertux/supertux.mk b/package/supertux/supertux.mk
index 3587aefe3a..14b7ed535f 100644
--- a/package/supertux/supertux.mk
+++ b/package/supertux/supertux.mk
@@ -30,7 +30,8 @@ SUPERTUX_DEPENDENCIES = host-pkgconf boost freetype libcurl libgl libglew \
 # ENABLE_OPENGLES2=OFF: Disable opengles2 for now.
 SUPERTUX_CONF_OPTS += \
 	-DCMAKE_BUILD_TYPE=Release \
-	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -DGLEW_NO_GLU" \
+	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -DGLEW_NO_GLU -fPIC" \
+	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -DGLEW_NO_GLU -fPIC" \
 	-DENABLE_BOOST_STATIC_LIBS=OFF \
 	-DBUILD_DOCUMENTATION=OFF \
 	-DENABLE_OPENGL=ON \
-- 
2.28.0
