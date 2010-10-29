From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 29 Oct 2010 13:32:02 +0200
Subject: [Buildroot] [git commit master 1/1] busybox: additional 1.17.3 fixes
Message-ID: <20101029113229.03E988D388@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=19e306338e7fa8fb840f93eccdce897e387739c5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../busybox-1.17.3/busybox-1.17.3-dnsd.patch       |   12 ++++++++++++
 .../busybox-1.17.3/busybox-1.17.3-unicode.patch    |   12 ++++++++++++
 2 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 package/busybox/busybox-1.17.3/busybox-1.17.3-dnsd.patch
 create mode 100644 package/busybox/busybox-1.17.3/busybox-1.17.3-unicode.patch

diff --git a/package/busybox/busybox-1.17.3/busybox-1.17.3-dnsd.patch b/package/busybox/busybox-1.17.3/busybox-1.17.3-dnsd.patch
new file mode 100644
index 0000000..b135c14
--- /dev/null
+++ b/package/busybox/busybox-1.17.3/busybox-1.17.3-dnsd.patch
@@ -0,0 +1,12 @@
+diff -urpN busybox-1.17.3/networking/dnsd.c busybox-1.17.3-dnsd/networking/dnsd.c
+--- busybox-1.17.3/networking/dnsd.c	2010-10-09 21:57:14.000000000 +0200
++++ busybox-1.17.3-dnsd/networking/dnsd.c	2010-10-29 00:37:43.066043841 +0200
+@@ -388,7 +388,7 @@ static int process_packet(struct dns_ent
+ 	query_len = strlen(query_string) + 1;
+ 	/* may be unaligned! */
+ 	unaligned_type_class = (void *)(query_string + query_len);
+-	query_len += sizeof(unaligned_type_class);
++	query_len += sizeof(*unaligned_type_class);
+ 	/* where to append answer block */
+ 	answb = (void *)(unaligned_type_class + 1);
+ 
diff --git a/package/busybox/busybox-1.17.3/busybox-1.17.3-unicode.patch b/package/busybox/busybox-1.17.3/busybox-1.17.3-unicode.patch
new file mode 100644
index 0000000..dc3b02e
--- /dev/null
+++ b/package/busybox/busybox-1.17.3/busybox-1.17.3-unicode.patch
@@ -0,0 +1,12 @@
+diff -urpN busybox-1.17.3/libbb/unicode.c busybox-1.17.3-unicode/libbb/unicode.c
+--- busybox-1.17.3/libbb/unicode.c	2010-10-09 21:58:13.000000000 +0200
++++ busybox-1.17.3-unicode/libbb/unicode.c	2010-10-29 00:48:36.951494079 +0200
+@@ -1006,7 +1006,7 @@ static char* FAST_FUNC unicode_conv_to_p
+ 			}
+ 		}
+ 		if (stats)
+-			stats->byte_count = stats->unicode_count = (d - dst);
++			stats->byte_count = stats->unicode_count = stats->unicode_width = (d - dst);
+ 		return dst;
+ 	}
+ 
-- 
1.7.1
