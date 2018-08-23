From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 Aug 2018 23:49:49 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] acl: build fix with GCC
 4.4.7
Message-ID: <20180823214243.758558E474@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e405c55f5e593030af56a340a9f316f2e2d4b20c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

The acl source code uses pragmas inside functions, which is not
supported by gcc 4.4, still in use in older distributions. This commit
adds a patch that drops such pragma. Indeed, this acl is not built
with -Werror, the warning removals are not that important.

Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a957cdfbb69d094cf17909eee64cd11dafdc84ab)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/acl/0001-Build-with-old-GCC-versions.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/acl/0001-Build-with-old-GCC-versions.patch b/package/acl/0001-Build-with-old-GCC-versions.patch
new file mode 100644
index 0000000000..a05ff5d9d3
--- /dev/null
+++ b/package/acl/0001-Build-with-old-GCC-versions.patch
@@ -0,0 +1,32 @@
+From a42519dceef0493ece45538375ae1791313f16d3 Mon Sep 17 00:00:00 2001
+From: Hollis Blanchard <hollis_blanchard@mentor.com>
+Date: Mon, 30 Jul 2018 14:29:46 -0700
+Subject: [PATCH] Remove pragmas inside functions
+
+GCC 4.4.7, as found in RHEL6, reports:
+    libacl/acl_from_text.c:307: error: #pragma GCC diagnostic not allowed inside functions
+
+Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>
+---
+ libacl/acl_from_text.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/libacl/acl_from_text.c b/libacl/acl_from_text.c
+index 09790c9..fb6bc07 100644
+--- a/libacl/acl_from_text.c
++++ b/libacl/acl_from_text.c
+@@ -304,11 +304,8 @@ parse_acl_entry(const char **text_p, acl_t *acl_p)
+ create_entry:
+ 	if (acl_create_entry(acl_p, &entry_d) != 0)
+ 		return -1;
+-#pragma GCC diagnostic push
+-#pragma GCC diagnostic ignored "-Waddress"
+ 	if (acl_copy_entry(entry_d, int2ext(&entry_obj)) != 0)
+ 		return -1;
+-#pragma GCC diagnostic pop
+ 	return 0;
+ 
+ fail:
+-- 
+2.13.0
+
