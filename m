From: Michael Vetter <jubalh@iodoru.org>
Date: Mon,  2 Dec 2019 10:51:42 +0100
Subject: [Buildroot] [PATCH 3/3] package/jasper: Apply fix for CVE-2018-19540
In-Reply-To: <20191202095142.15115-1-jubalh@iodoru.org>
References: <20191202095142.15115-1-jubalh@iodoru.org>
Message-ID: <20191202095142.15115-3-jubalh@iodoru.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add 0003-test-asclen-CVE-2018-19540.patch:
If txtdesc->asclen is < 1, the array index of
txtdesc->ascdata will be negative which causes the heap based overflow.

Patch was proposed upstream[1] but upstream is very inactive. Linux
distributions use the same fix to patch their packages.

1: https://github.com/mdadams/jasper/pull/198
Signed-off-by: Michael Vetter <jubalh@iodoru.org>
---
 .../jasper/0003-test-asclen-CVE-2018-19540.patch   | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/jasper/0003-test-asclen-CVE-2018-19540.patch

diff --git a/package/jasper/0003-test-asclen-CVE-2018-19540.patch b/package/jasper/0003-test-asclen-CVE-2018-19540.patch
new file mode 100644
index 0000000000..ea73d5d781
--- /dev/null
+++ b/package/jasper/0003-test-asclen-CVE-2018-19540.patch
@@ -0,0 +1,28 @@
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
-- 
2.16.4
