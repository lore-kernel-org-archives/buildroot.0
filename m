From: Hollis Blanchard <hollis_blanchard@mentor.com>
Date: Mon, 30 Jul 2018 15:02:18 -0700
Subject: [Buildroot] [PATCH v2 3/3] host-acl: build fix for GCC 4.4.7
In-Reply-To: <20180730220218.26454-1-hollis_blanchard@mentor.com>
References: <20180730220218.26454-1-hollis_blanchard@mentor.com>
Message-ID: <20180730220218.26454-3-hollis_blanchard@mentor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This didn't introduce any build warnings with host gcc 4.4.7 or gcc 6.3.0.

Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>
---
 package/acl/0001-Build-with-old-GCC-versions.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/acl/0001-Build-with-old-GCC-versions.patch

diff --git a/package/acl/0001-Build-with-old-GCC-versions.patch b/package/acl/0001-Build-with-old-GCC-versions.patch
new file mode 100644
index 0000000000..3d958bffac
--- /dev/null
+++ b/package/acl/0001-Build-with-old-GCC-versions.patch
@@ -0,0 +1,32 @@
+From a42519dceef0493ece45538375ae1791313f16d3 Mon Sep 17 00:00:00 2001
+From: Hollis Blanchard <hollis_blanchard@mentor.com>
+Date: Mon, 30 Jul 2018 14:29:46 -0700
+Subject: [PATCH] Build with old GCC versions
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
-- 
2.13.0
