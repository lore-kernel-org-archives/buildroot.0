From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Jun 2018 10:02:24 +0200
Subject: [Buildroot] [git commit] file: add upstream security fix
Message-ID: <20180615080247.F10A78866C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=89be4c7b0ea4cb650aeaff78b9cf7265a89ba43f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2018-10360: The do_core_note function in readelf.c in
libmagic.a in file 5.33 allows remote attackers to cause a denial of
service (out-of-bounds read and application crash) via a crafted ELF
file.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...d-reading-past-the-end-of-buffer-Rui-Reis.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/file/0001-Avoid-reading-past-the-end-of-buffer-Rui-Reis.patch b/package/file/0001-Avoid-reading-past-the-end-of-buffer-Rui-Reis.patch
new file mode 100644
index 0000000000..daff866692
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
