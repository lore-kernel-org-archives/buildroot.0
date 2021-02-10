From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 11 Feb 2021 00:16:34 +0100
Subject: [Buildroot] [PATCH/next v1 1/7] package/libubox: bump version to
 5bc0146a
Message-ID: <20210210231640.5262-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- change download url to https

- update homepage url (the old one returns 404 - No projects found)

- add hash file

- delete 0001-blobmsg-fix-array-out-of-bounds-GCC-10-warning.patch
  (from upstream [1])

[1] https://git.openwrt.org/?p=project/libubox.git;a=commit;h=eb7eb6393d47a918c420f5b287946dbd6c0d5f57

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...x-array-out-of-bounds-GCC-10-warning.patch | 47 -------------------
 package/libubox/Config.in                     |  2 +-
 package/libubox/libubox.hash                  |  2 +
 package/libubox/libubox.mk                    |  5 +-
 4 files changed, 6 insertions(+), 50 deletions(-)
 delete mode 100644 package/libubox/0001-blobmsg-fix-array-out-of-bounds-GCC-10-warning.patch
 create mode 100644 package/libubox/libubox.hash

diff --git a/package/libubox/0001-blobmsg-fix-array-out-of-bounds-GCC-10-warning.patch b/package/libubox/0001-blobmsg-fix-array-out-of-bounds-GCC-10-warning.patch
deleted file mode 100644
index 09128db9e2..0000000000
--- a/package/libubox/0001-blobmsg-fix-array-out-of-bounds-GCC-10-warning.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From eb7eb6393d47a918c420f5b287946dbd6c0d5f57 Mon Sep 17 00:00:00 2001
-From: =?utf8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
-Date: Wed, 25 Dec 2019 10:27:59 +0100
-Subject: [PATCH] blobmsg: fix array out of bounds GCC 10 warning
-MIME-Version: 1.0
-Content-Type: text/plain; charset=utf8
-Content-Transfer-Encoding: 8bit
-
-Fixes following warning reported by GCC 10.0.0 20191203:
-
- blobmsg.c:234:2: error: 'strcpy' offset 6 from the object at 'attr' is out of the bounds of referenced subobject 'name' with type 'uint8_t[0]' {aka 'unsigned char[0]'} at offset 6 [-Werror=array-bounds]
-   234 |  strcpy((char *) hdr->name, (const char *)name);
-       |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
- In file included from blobmsg.c:16:
- blobmsg.h:42:10: note: subobject 'name' declared here
-    42 |  uint8_t name[];
-       |          ^~~~
-
-Reported-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Petr ??tetiar <ynezz@true.cz>
-[Retrieved from:
-https://git.openwrt.org/?p=project/libubox.git;a=commit;h=eb7eb6393d47a918c420f5b287946dbd6c0d5f57]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- blobmsg.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/blobmsg.c b/blobmsg.c
-index 48dba81..37821c3 100644
---- a/blobmsg.c
-+++ b/blobmsg.c
-@@ -240,7 +240,10 @@ blobmsg_new(struct blob_buf *buf, int type, const char *name, int payload_len, v
- 	attr->id_len |= be32_to_cpu(BLOB_ATTR_EXTENDED);
- 	hdr = blob_data(attr);
- 	hdr->namelen = cpu_to_be16(namelen);
--	strcpy((char *) hdr->name, (const char *)name);
-+
-+	memcpy(hdr->name, name, namelen);
-+	hdr->name[namelen] = '\0';
-+
- 	pad_end = *data = blobmsg_data(attr);
- 	pad_start = (char *) &hdr->name[namelen];
- 	if (pad_start < pad_end)
--- 
-2.20.1
-
diff --git a/package/libubox/Config.in b/package/libubox/Config.in
index 25ef4bb89a..1f0b691e13 100644
--- a/package/libubox/Config.in
+++ b/package/libubox/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_LIBUBOX
 	  also be used for the same purposes in projects other
 	  than OpenWrt.
 
-	  http://nbd.name/gitweb.cgi?p=luci2/libubox.git;a=summary
+	  https://openwrt.org/docs/techref/libubox
 
 comment "libubox needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
diff --git a/package/libubox/libubox.hash b/package/libubox/libubox.hash
new file mode 100644
index 0000000000..fd4c5a4a39
--- /dev/null
+++ b/package/libubox/libubox.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  e383caf80a241e9711ab0c58a5e8f4d16479693be1e44ffb6cc716a185e7e303  libubox-5bc0146a1d6474d339c4ade9a227f32cc27a8b93-br1.tar.gz
diff --git a/package/libubox/libubox.mk b/package/libubox/libubox.mk
index d3e3b709dc..4626659158 100644
--- a/package/libubox/libubox.mk
+++ b/package/libubox/libubox.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LIBUBOX_VERSION = 723730214732862de7e892bae2f7a7889e66bf1b
-LIBUBOX_SITE = git://git.openwrt.org/project/libubox.git
+LIBUBOX_VERSION = 5bc0146a1d6474d339c4ade9a227f32cc27a8b93
+LIBUBOX_SITE = https://git.openwrt.org/project/libubox.git
+LIBUBOX_SITE_METHOD = git
 LIBUBOX_LICENSE = ISC, BSD-3-Clause
 LIBUBOX_INSTALL_STAGING = YES
 LIBUBOX_DEPENDENCIES = $(if $(BR2_PACKAGE_JSON_C),json-c)
-- 
2.30.0
