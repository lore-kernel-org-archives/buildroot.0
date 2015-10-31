From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 31 Oct 2015 15:33:55 +0100
Subject: [Buildroot] [PATCH] package/nodejs: more python3 fixes
Message-ID: <1446302035-22083-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

nodejs' build system can not work with python3.

Complement the existing patch to use a variable instead of hard-coding
python.

Fixes:
    http://autobuild.buildroot.org/results/406/406291bf7c61a80ed4a8d14d9a3887f51a1b2254/
    http://autobuild.buildroot.org/results/ff9/ff97f452b875d8b1fb78561609742a233b80e0d3/
    http://autobuild.buildroot.org/results/7ad/7adb96b45cb539c46940908d4ce9ca78b6a84d81/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 ...e-a-python-variable-instead-of-hardcoding-Python.patch | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/package/nodejs/4.1.2/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch b/package/nodejs/4.1.2/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
index 2e266af..3104644 100644
--- a/package/nodejs/4.1.2/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
+++ b/package/nodejs/4.1.2/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
@@ -14,7 +14,7 @@ the nodejs build system.
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 [Martin: adapt to 0.12.5]
 Signed-off-by: Martin Bark <martin@barkynet.com>
-[yann.morin.1998 at free.fr: adapat to 4.1.2]
+[yann.morin.1998 at free.fr: adapt to 4.1.2]
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 ---
  deps/v8/tools/gyp/v8.gyp | 8 ++++----
@@ -86,3 +86,16 @@ index c703155..06c0b2b 100644
                '../../tools/gen-postmortem-metadata.py',
                '<@(_outputs)',
                '<@(heapobject_files)'
+diff --git a/deps/v8/build/toolchain.gypi b/deps/v8/build/toolchain.gypi
+index c703155..06c0b2b 100644
+--- a/deps/v8/build/toolchain.gypi
++++ b/deps/v8/build/toolchain.gypi
+@@ -38,7 +38,7 @@
+     'ubsan%': 0,
+     'ubsan_vptr%': 0,
+     'v8_target_arch%': '<(target_arch)',
+-    'v8_host_byteorder%': '<!(python -c "import sys; print sys.byteorder")',
++    'v8_host_byteorder%': '<!(<(python) -c "import sys; print sys.byteorder")',
+     # Native Client builds currently use the V8 ARM JIT and
+     # arm/simulator-arm.cc to defer the significant effort required
+     # for NaCl JIT support. The nacl_target_arch variable provides
-- 
1.9.1
