From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 24 May 2020 17:58:18 +0200
Subject: [Buildroot] [PATCH] package/qt5/qt5webengine: don't link with
 libstdc++.a on the host
Message-ID: <20200524155818.126961-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While cross-compiling, qt5webengine is building a host tool but
want to link the libstdc++ statically. This requires to install
libstdc++-static package on the host (Fedora package name).

Otherwise the link fail with:

  [185/185] LINK gn
  FAILED: gn
  /usr/bin/g++ -O3 -fdata-sections -ffunction-sections -Wl,--gc-sections -Wl,-strip-all -Wl,--as-needed -static-libstdc++ -pthread -o gn -Wl,--start-group tools/gn/gn_main.o base.a gn_lib.a -Wl,--end-group -ldl
  /usr/bin/ld?: unable to find -lstdc++
  [...]
  Project ERROR: GN build error!

Add --no-static-libstdc++ argument to gn.pro to link to
libstdc++.so.6 instead of libstdc++.a.

--no-static-libstdc++ has been added by [1] but it force
linking statically by default.

[1] https://github.com/qt/qtwebengine-chromium/commit/cfab9198a9917f42cf08b1caf84ab9b71aac1911#diff-905c8f054808213577c0a92d1b704615

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Ga?l Portay <gael.portay@collabora.com>
---
 ...ro-don-t-link-statically-with-libstc.patch | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 package/qt5/qt5webengine/0001-gn.pro-don-t-link-statically-with-libstc.patch

diff --git a/package/qt5/qt5webengine/0001-gn.pro-don-t-link-statically-with-libstc.patch b/package/qt5/qt5webengine/0001-gn.pro-don-t-link-statically-with-libstc.patch
new file mode 100644
index 0000000000..dff3e6c849
--- /dev/null
+++ b/package/qt5/qt5webengine/0001-gn.pro-don-t-link-statically-with-libstc.patch
@@ -0,0 +1,51 @@
+From 7ae73da23ad998bd1e63ad213cf7a02e61191951 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sat, 23 May 2020 19:01:19 +0200
+Subject: [PATCH] gn.pro: don't link statically with libstc++
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+While cross-compiling, qt5webengine is building a host tool but
+want to link the libstdc++ statically. This requires to install
+libstdc++-static package on the host (Fedora package name).
+
+Otherwise the link fail with:
+
+  [185/185] LINK gn
+  FAILED: gn
+  /usr/bin/g++ -O3 -fdata-sections -ffunction-sections -Wl,--gc-sections -Wl,-strip-all -Wl,--as-needed -static-libstdc++ -pthread -o gn -Wl,--start-group tools/gn/gn_main.o base.a gn_lib.a -Wl,--end-group -ldl
+  /usr/bin/ld?: unable to find -lstdc++
+  [...]
+  Project ERROR: GN build error!
+
+Add --no-static-libstdc++ argument to gn.pro to link to
+libstdc++.so.6 instead of libstdc++.a.
+
+--no-static-libstdc++ has been added by [1] but it force
+linking statically by default.
+
+[1] https://github.com/qt/qtwebengine-chromium/commit/cfab9198a9917f42cf08b1caf84ab9b71aac1911#diff-905c8f054808213577c0a92d1b704615
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ src/buildtools/gn.pro | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/buildtools/gn.pro b/src/buildtools/gn.pro
+index 033202e6..5dd8e241 100644
+--- a/src/buildtools/gn.pro
++++ b/src/buildtools/gn.pro
+@@ -20,7 +20,8 @@ build_pass|!debug_and_release {
+ 
+             gn_gen_args = --no-last-commit-position --out-path $$out_path \
+                           --cc \"$$which($$QMAKE_CC)\" --cxx \"$$which($$QMAKE_CXX)\" \
+-                          --ld \"$$which($$QMAKE_LINK)\"
++                          --ld \"$$which($$QMAKE_LINK)\" \
++                          --no-static-libstdc++
+ 
+             msvc:!clang_cl: gn_gen_args += --use-lto
+ 
+-- 
+2.25.4
+
-- 
2.25.4
