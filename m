From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Nov 2020 10:01:26 +0100
Subject: [Buildroot] [git commit] package/frr: fix detection of host-python3
Message-ID: <20201101084844.A12D786248@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad68e6fb029f3363a709bdd5dca3efca382f14fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an upstream patch to fix detection of host-python3 and avoid the
following failure because of missing --embed flag:

configure:22276: checking python interpreter python3
configure:22278: "$PYTHON" -c 'import sys; open("conftest.pyver", "w").write(sys.executable or ""); sys.exit(not (sys.version_info.major == 2 and sys.version_info.minor >= 7))'
configure:22281: $? = 1
configure:22287: "$PYTHON" -c 'import sys; open("conftest.pyver", "w").write(sys.executable or ""); sys.exit(not ((sys.version_info.major == 3 and sys.version_info.minor >= 2) or sys.version_info.major > 3))'
configure:22290: $? = 0
configure:22310: result: /home/buildroot/autobuild/run/instance-1/output-1/host/bin/python3 (python3)
py_abi= py_ldver=3.9 py_ver=3.9 py_bindir=/home/buildroot/autobuild/run/instance-1/output-1/host/bin/
configure:22326: checking whether /home/buildroot/autobuild/run/instance-1/output-1/host/bin/python3.9-config is available
configure:22329: result: yes
configure:22339: checking whether /home/buildroot/autobuild/run/instance-1/output-1/host/bin/python3.9-config provides a working build environment
configure:22376: /usr/bin/gcc -std=gnu11 -o conftest -O2 -I/home/buildroot/autobuild/run/instance-1/output-1/host/include -fno-omit-frame-pointer -funwind-tables -Wall -Wextra -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Wundef -Wno-unused-result -Wno-unused-parameter -Wno-missing-field-initializers -pthread -I/home/buildroot/autobuild/run/instance-1/output-1/host/include/python3.9 -I/home/buildroot/autobuild/run/instance-1/output-1/host/include/python3.9 -I/home/buildroot/autobuild/run/instance-1/output-1/host/include -L/home/buildroot/autobuild/run/instance-1/output-1/host/lib -Wl,-rpath,/home/buildroot/autobuild/run/instance-1/output-1/host/lib conftest.c    -L/home/buildroot/autobuild/run/instance-1/output-1/host/lib  -lcrypt -lpthread -ldl  -lutil -lm -lm  >&5
/tmp/ccrVSMCb.o: In function `main':
conftest.c:(.text.startup+0x5): undefined reference to `Py_Initialize'

Fixes:
 - http://autobuild.buildroot.org/results/d33293bfb2f8d558efa2d83e5cb71226d3e65c7f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...find-all-future-minor-versions-of-python3.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/frr/0001-build-find-all-future-minor-versions-of-python3.patch b/package/frr/0001-build-find-all-future-minor-versions-of-python3.patch
new file mode 100644
index 0000000000..1eb693703b
--- /dev/null
+++ b/package/frr/0001-build-find-all-future-minor-versions-of-python3.patch
@@ -0,0 +1,30 @@
+From 838cb35e08eb98acbc27637808162105ae2c4549 Mon Sep 17 00:00:00 2001
+From: Michal Ruprich <michalruprich@gmail.com>
+Date: Wed, 17 Jun 2020 13:47:30 +0200
+Subject: [PATCH] build: find all future minor versions of python3
+
+This way we can find every python from 3.8 further
+
+Signed-off-by: Michal Ruprich <michalruprich@gmail.com>
+
+[Retrieved from:
+https://github.com/FRRouting/frr/commit/838cb35e08eb98acbc27637808162105ae2c4549]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ m4/ax_python.m4 | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/m4/ax_python.m4 b/m4/ax_python.m4
+index 9f43ea0ab12..91d12b99b43 100644
+--- a/m4/ax_python.m4
++++ b/m4/ax_python.m4
+@@ -186,7 +186,8 @@ AC_REQUIRE([PKG_PROG_PKG_CONFIG])dnl
+       AC_MSG_RESULT([yes])
+ 
+       PYTHON_CFLAGS="`\"$pycfg\" --includes`"
+-      if test x"${py_ver}" = x"3.8" || test x"{py_ver}" = x"3.9"; then
++      minor_ver=${py_ver#*\.}
++      if test $((minor_ver)) -gt 7; then
+         PYTHON_LIBS="`\"$pycfg\" --ldflags --embed`"
+       else
+         PYTHON_LIBS="`\"$pycfg\" --ldflags`"
