From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 15 Jun 2018 06:56:48 +0300
Subject: [Buildroot] [PATCH] file: add upstream security fix
Message-ID: <09d9582ecdb7715d356d0eb5bf0bd0f6d6150e03.1529035008.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2018-10360: The do_core_note function in readelf.c in
libmagic.a in file 5.33 allows remote attackers to cause a denial of
service (out-of-bounds read and application crash) via a crafted ELF
file.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...ding-past-the-end-of-buffer-Rui-Reis.patch | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/file/0001-Avoid-reading-past-the-end-of-buffer-Rui-Reis.patch

diff --git a/package/file/0001-Avoid-reading-past-the-end-of-buffer-Rui-Reis.patch b/package/file/0001-Avoid-reading-past-the-end-of-buffer-Rui-Reis.patch
new file mode 100644
index 000000000000..daff866692fc
--- /dev/null
+++ b/package/file/0001-Avoid-reading-past-the-end-of-buffer-Rui-Reis.patch
@@ -0,0 +1,30 @@
+From a642587a9c9e2dd7feacdf513c3643ce26ad3c22 Mon Sep 17 00:00:00 2001
+From: Christos Zoulas <christos@zoulas.com>
+Date: Sat, 9 Jun 2018 16:00:06 +0000
+Subject: [PATCH] Avoid reading past the end of buffer (Rui Reis)
+
+[baruch: drop file version string update hunk]
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit a642587a9c9 in github mirror
+
+ src/readelf.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/readelf.c b/src/readelf.c
+index 79c83f9f5048..1f41b46113c3 100644
+--- a/src/readelf.c
++++ b/src/readelf.c
+@@ -842,7 +842,8 @@ do_core_note(struct magic_set *ms, unsigned char *nbuf, uint32_t type,
+ 
+ 				cname = (unsigned char *)
+ 				    &nbuf[doff + prpsoffsets(i)];
+-				for (cp = cname; *cp && isprint(*cp); cp++)
++				for (cp = cname; cp < nbuf + size && *cp
++				    && isprint(*cp); cp++)
+ 					continue;
+ 				/*
+ 				 * Linux apparently appends a space@the end
+-- 
+2.17.1
+
-- 
2.17.1
