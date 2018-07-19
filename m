From: Hollis Blanchard <hollis_blanchard@mentor.com>
Date: Thu, 19 Jul 2018 10:20:42 -0700
Subject: [Buildroot] [PATCH 1 of 3] host-acl: build fix on RHEL6 hosts (GCC
 4.4.7)
Message-ID: <05bbe42a7a77f46daa8a.1532020842@cveaol6qa08.wv.mentorg.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This didn't introduce any build warnings, FWIW.

Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>

diff --git a/package/acl/0001-pragma-gcc-diagnostic-in-fn.patch b/package/acl/0001-pragma-gcc-diagnostic-in-fn.patch
new file mode 100644
--- /dev/null
+++ b/package/acl/0001-pragma-gcc-diagnostic-in-fn.patch
@@ -0,0 +1,21 @@
+build with old GCC versions
+
+GCC 4.4.7, as found in RHEL6, reports:
+	libacl/acl_from_text.c:307: error: #pragma GCC diagnostic not allowed inside functions
+
+Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>
+
+--- host-acl-2.2.53/libacl/acl_from_text.c.orig	2018-07-19 09:15:40.425940094 -0700
++++ host-acl-2.2.53/libacl/acl_from_text.c	2018-07-19 09:15:50.777940093 -0700
+@@ -304,11 +304,8 @@
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
