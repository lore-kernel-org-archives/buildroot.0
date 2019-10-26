From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Sat, 26 Oct 2019 10:30:06 -0500
Subject: [Buildroot] [PATCH] package/meson: force ext static libs when
 BR2_STATIC_LIBS
Message-ID: <20191026153006.25122-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a case in the library pattern logic to prefer static
libraries when the Meson Core option for "default_library" is set to
solely static.

The existing library search order makes sense for cases of shared and
shared / static mixed. However if using a prebuilt cross-toolchain,
they usually provide both a static and shared version of sysroot
libraries. This presents a problem in a complete static build where
there won't be shared libraries at runtime and during build time there
are failures like "ld: attempted static link of dynamic object".

Bug:
https://github.com/mesonbuild/meson/issues/6108

Fixes:
http://autobuild.buildroot.net/results/db1740b4777f436324218c52bc7b08e5c21b667d/
http://autobuild.buildroot.net/results/c17/c17bbb12d9deadd64a441b36e324cfbbe8aba5be/

Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 ...tic-libs-when-default-library-static.patch | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/meson/0003-Prefer-ext-static-libs-when-default-library-static.patch

diff --git a/package/meson/0003-Prefer-ext-static-libs-when-default-library-static.patch b/package/meson/0003-Prefer-ext-static-libs-when-default-library-static.patch
new file mode 100644
index 0000000000..798cd65299
--- /dev/null
+++ b/package/meson/0003-Prefer-ext-static-libs-when-default-library-static.patch
@@ -0,0 +1,45 @@
+From b390f29b9e0170d5bf410f4bef5a697655857633 Mon Sep 17 00:00:00 2001
+From: Matt Weber <matthew.weber@rockwellcollins.com>
+Date: Sat, 26 Oct 2019 09:17:29 -0500
+Subject: [PATCH] Prefer ext static libs when --default-library=static
+
+This patch adds a case in the library pattern logic to prefer static
+libraries when the Meson Core option for "default_library" is set to
+solely static.
+
+The existing library search order makes sense for cases of shared and
+shared / static mixed. However if using a prebuilt cross-toolchain,
+they usually provide both a static and shared version of sysroot
+libraries. This presents a problem in a complete static build where
+there won't be shared libraries at runtime and during build time there
+are failures like "ld: attempted static link of dynamic object".
+
+Bug:
+https://github.com/mesonbuild/meson/issues/6108
+
+Fixes:
+http://autobuild.buildroot.net/results/db1740b4777f436324218c52bc7b08e5c21b667d/
+http://autobuild.buildroot.net/results/c17/c17bbb12d9deadd64a441b36e324cfbbe8aba5be/
+
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+---
+ mesonbuild/compilers/mixins/clike.py | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/mesonbuild/compilers/mixins/clike.py b/mesonbuild/compilers/mixins/clike.py
+index 5d50b7d..8f5f1c6 100644
+--- a/mesonbuild/compilers/mixins/clike.py
++++ b/mesonbuild/compilers/mixins/clike.py
+@@ -858,6 +858,9 @@ class CLikeCompiler:
+         elif env.machines[self.for_machine].is_cygwin():
+             shlibext = ['dll', 'dll.a']
+             prefixes = ['cyg'] + prefixes
++        elif env.coredata.get_builtin_option('default_library') == 'static':
++            # Linux/BSDs
++            shlibext = ['a']
+         else:
+             # Linux/BSDs
+             shlibext = ['so']
+-- 
+2.17.1
+
-- 
2.17.1
