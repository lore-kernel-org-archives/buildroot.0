From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Nov 2017 21:31:28 +0100
Subject: [Buildroot] [git commit] package/dvb-apps: fix build with kernel
 headers >= 4.14
Message-ID: <20171127202545.39973800E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=827681c2503b3097c7887fe15770c9ca383343ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
    http://autobuild.buildroot.org/results/708/708f11809b2cafc2a3375dc515803c87b376ed4d/
    http://autobuild.buildroot.org/results/6e1/6e161926577355ced82426536227ddd2ba130f06/
    [...]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-utils-fix-build-with-kernel-headers-4.14.patch | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/package/dvb-apps/0005-utils-fix-build-with-kernel-headers-4.14.patch b/package/dvb-apps/0005-utils-fix-build-with-kernel-headers-4.14.patch
new file mode 100644
index 0000000..279cdec
--- /dev/null
+++ b/package/dvb-apps/0005-utils-fix-build-with-kernel-headers-4.14.patch
@@ -0,0 +1,52 @@
+# HG changeset patch
+# User "Yann E. MORIN" <yann.morin.1998@free.fr>
+# Date 1511772629 -3600
+#      Mon Nov 27 09:50:29 2017 +0100
+# Branch yem/fixes
+# Node ID 0848fa96c6eb13cf37249d317eff12cbd2f59ff7
+# Parent  3d43b280298c39a67d1d889e01e173f52c12da35
+utils: fix build with kernel headers >= 4.14
+
+In kernel 4.14, CA_SET_PID was removed, in commit 833ff5e7feda (media:
+ca.h: get rid of CA_SET_PID).
+
+Fix dst-util to not fail the build when this is missing.
+
+Fiuxes build failures such as:
+    http://autobuild.buildroot.org/results/708/708f11809b2cafc2a3375dc515803c87b376ed4d/build-end.log
+    http://autobuild.buildroot.org/results/e39/e3939d44376e92e8a35fb179d9890510334d8304/build-end.log
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff --git a/util/dst-utils/dst_test.c b/util/dst-utils/dst_test.c
+--- a/util/dst-utils/dst_test.c
++++ b/util/dst-utils/dst_test.c
+@@ -111,6 +111,7 @@
+ 	return 0;
+ }
+ 
++#if defined CA_SET_PID
+ static int dst_set_pid(int cafd)
+ {
+ 	if ((ioctl(cafd, CA_SET_PID)) < 0) {
+@@ -120,6 +121,7 @@
+ 
+ 	return 0;
+ }
++#endif
+ 
+ static int dst_get_descr(int cafd)
+ {
+@@ -230,8 +232,12 @@
+ 				dst_reset(cafd);
+ 				break;
+ 			case 'p':
++#if defined CA_SET_PID
+ 				printf("%s: PID\n", __FUNCTION__);
+ 				dst_set_pid(cafd);
++#else
++				printf("%s: PID not supported\n", __FUNCTION__);
++#endif
+ 				break;
+ 			case 'g':
+ 				printf("%s: Get Desc\n", __FUNCTION__);
