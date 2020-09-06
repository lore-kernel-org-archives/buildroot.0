From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Sep 2020 09:31:42 +0200
Subject: [Buildroot] [git commit] package/netperf: fix build with gcc 10
Message-ID: <20200906073227.245218812A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=29cb5d4eed4c8eabb450ca01753f761f0ccf6ffb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/547d9a803375cce93b8e3e7a59243190b71c7688

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...nettest_omni.c-fix-compilation-with-GCC10.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/netperf/0001-src-nettest_omni.c-fix-compilation-with-GCC10.patch b/package/netperf/0001-src-nettest_omni.c-fix-compilation-with-GCC10.patch
new file mode 100644
index 0000000000..261dfe9a0e
--- /dev/null
+++ b/package/netperf/0001-src-nettest_omni.c-fix-compilation-with-GCC10.patch
@@ -0,0 +1,42 @@
+From b2fd0f324002d0cf52ae905b2a469bf1067f182a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 5 Sep 2020 14:30:20 +0200
+Subject: [PATCH] src/nettest_omni.c: fix compilation with GCC10
+
+GCC10 defaults to -fno-common, which breaks compilation when there are
+multiple definitions of implicit "extern" variables. Remove the extra
+definitions.
+
+Fix #42
+
+Signed-off-by: Tony Ambardar <itugrok@yahoo.com>
+[Retrieved from:
+https://github.com/openwrt/packages/blob/master/net/netperf/patches/010-gcc10_multiple_definition_fix.patch]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/HewlettPackard/netperf/pull/48]
+---
+ src/nettest_omni.c | 8 --------
+ 1 file changed, 8 deletions(-)
+
+diff --git a/src/nettest_omni.c b/src/nettest_omni.c
+index 852eeb1..862088a 100644
+--- a/src/nettest_omni.c
++++ b/src/nettest_omni.c
+@@ -458,14 +458,6 @@ static int client_port_max = 65535;
+ 
+  /* different options for the sockets				*/
+ 
+-int
+-  loc_nodelay,		/* don't/do use NODELAY	locally		*/
+-  rem_nodelay,		/* don't/do use NODELAY remotely	*/
+-  loc_sndavoid,		/* avoid send copies locally		*/
+-  loc_rcvavoid,		/* avoid recv copies locally		*/
+-  rem_sndavoid,		/* avoid send copies remotely		*/
+-  rem_rcvavoid; 	/* avoid recv_copies remotely		*/
+-
+ extern int
+   loc_tcpcork,
+   rem_tcpcork,
+-- 
+2.28.0
+
