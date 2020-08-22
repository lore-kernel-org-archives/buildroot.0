From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 22 Aug 2020 11:28:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/libubox: fix build with gcc 10
Message-ID: <20200822092816.3158-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/aef10cc43f6c34f106624588ae2a1131520ee066

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...x-array-out-of-bounds-GCC-10-warning.patch | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/libubox/0001-blobmsg-fix-array-out-of-bounds-GCC-10-warning.patch

diff --git a/package/libubox/0001-blobmsg-fix-array-out-of-bounds-GCC-10-warning.patch b/package/libubox/0001-blobmsg-fix-array-out-of-bounds-GCC-10-warning.patch
new file mode 100644
index 0000000000..09128db9e2
--- /dev/null
+++ b/package/libubox/0001-blobmsg-fix-array-out-of-bounds-GCC-10-warning.patch
@@ -0,0 +1,47 @@
+From eb7eb6393d47a918c420f5b287946dbd6c0d5f57 Mon Sep 17 00:00:00 2001
+From: =?utf8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
+Date: Wed, 25 Dec 2019 10:27:59 +0100
+Subject: [PATCH] blobmsg: fix array out of bounds GCC 10 warning
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf8
+Content-Transfer-Encoding: 8bit
+
+Fixes following warning reported by GCC 10.0.0 20191203:
+
+ blobmsg.c:234:2: error: 'strcpy' offset 6 from the object at 'attr' is out of the bounds of referenced subobject 'name' with type 'uint8_t[0]' {aka 'unsigned char[0]'} at offset 6 [-Werror=array-bounds]
+   234 |  strcpy((char *) hdr->name, (const char *)name);
+       |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+ In file included from blobmsg.c:16:
+ blobmsg.h:42:10: note: subobject 'name' declared here
+    42 |  uint8_t name[];
+       |          ^~~~
+
+Reported-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Petr ??tetiar <ynezz@true.cz>
+[Retrieved from:
+https://git.openwrt.org/?p=project/libubox.git;a=commit;h=eb7eb6393d47a918c420f5b287946dbd6c0d5f57]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ blobmsg.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/blobmsg.c b/blobmsg.c
+index 48dba81..37821c3 100644
+--- a/blobmsg.c
++++ b/blobmsg.c
+@@ -240,7 +240,10 @@ blobmsg_new(struct blob_buf *buf, int type, const char *name, int payload_len, v
+ 	attr->id_len |= be32_to_cpu(BLOB_ATTR_EXTENDED);
+ 	hdr = blob_data(attr);
+ 	hdr->namelen = cpu_to_be16(namelen);
+-	strcpy((char *) hdr->name, (const char *)name);
++
++	memcpy(hdr->name, name, namelen);
++	hdr->name[namelen] = '\0';
++
+ 	pad_end = *data = blobmsg_data(attr);
+ 	pad_start = (char *) &hdr->name[namelen];
+ 	if (pad_start < pad_end)
+-- 
+2.20.1
+
-- 
2.28.0
