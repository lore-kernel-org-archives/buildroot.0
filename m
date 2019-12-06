From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Dec 2019 09:57:46 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/jasper: Apply fix
 for CVE-2018-19540
Message-ID: <20191206085334.73F7981121@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6958a76a81a07b87581bbb4ce2545c90b2977a48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Add 0003-test-asclen-CVE-2018-19540.patch:
If txtdesc->asclen is < 1, the array index of
txtdesc->ascdata will be negative which causes the heap based overflow.

Patch was proposed upstream[1] but upstream is very inactive. Linux
distributions use the same fix to patch their packages.

1: https://github.com/mdadams/jasper/pull/198
Signed-off-by: Michael Vetter <jubalh@iodoru.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 332a851a08153887f68c97f49c7fbdc163f24e5b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../jasper/0003-test-asclen-CVE-2018-19540.patch   | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/jasper/0003-test-asclen-CVE-2018-19540.patch b/package/jasper/0003-test-asclen-CVE-2018-19540.patch
new file mode 100644
index 0000000000..9401da511b
--- /dev/null
+++ b/package/jasper/0003-test-asclen-CVE-2018-19540.patch
@@ -0,0 +1,29 @@
+From e38454aa1a15b78c028a778fc8bfba3587e25c25 Mon Sep 17 00:00:00 2001
+From: Michael Vetter <jubalh@iodoru.org>
+Date: Fri, 15 Mar 2019 11:01:02 +0100
+Subject: [PATCH] Make sure asclen is at least 1
+
+If txtdesc->asclen is < 1, the array index of txtdesc->ascdata will be negative which causes the heap based overflow.
+
+Regards CVE-2018-19540.
+Regards https://github.com/mdadams/jasper/issues/182 bug#3
+Fix by Markus Koschany <apo@debian.org>.
+From https://gist.github.com/apoleon/13598a45bf6522f6a79b77a629205823
+Signed-off-by: Michael Vetter <jubalh@iodoru.org>
+---
+ src/libjasper/base/jas_icc.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/libjasper/base/jas_icc.c b/src/libjasper/base/jas_icc.c
+index 4607930..762c0e8 100644
+--- a/src/libjasper/base/jas_icc.c
++++ b/src/libjasper/base/jas_icc.c
+@@ -1104,6 +1104,8 @@ static int jas_icctxtdesc_input(jas_iccattrval_t *attrval, jas_stream_t *in,
+ 	if (jas_stream_read(in, txtdesc->ascdata, txtdesc->asclen) !=
+ 	  JAS_CAST(int, txtdesc->asclen))
+ 		goto error;
++	if (txtdesc->asclen < 1)
++		goto error;
+ 	txtdesc->ascdata[txtdesc->asclen - 1] = '\0';
+ 	if (jas_iccgetuint32(in, &txtdesc->uclangcode) ||
+ 	  jas_iccgetuint32(in, &txtdesc->uclen))
