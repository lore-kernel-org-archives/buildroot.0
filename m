From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Jul 2017 16:23:09 +0200
Subject: [Buildroot] [PATCH] libosip2: add upstream security fix
Message-ID: <20170716142309.24699-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2016-10324 - In libosip2 in GNU oSIP 4.1.0, a malformed SIP
message can lead to a heap buffer overflow in the osip_clrncpy() function
defined in osipparser2/osip_port.c.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ort-sr-109133-Heap-buffer-overflow-in-uti.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/libosip2/0001-fix-bug-report-sr-109133-Heap-buffer-overflow-in-uti.patch

diff --git a/package/libosip2/0001-fix-bug-report-sr-109133-Heap-buffer-overflow-in-uti.patch b/package/libosip2/0001-fix-bug-report-sr-109133-Heap-buffer-overflow-in-uti.patch
new file mode 100644
index 0000000000..7f2c2d46d2
--- /dev/null
+++ b/package/libosip2/0001-fix-bug-report-sr-109133-Heap-buffer-overflow-in-uti.patch
@@ -0,0 +1,30 @@
+From 7e0793e15e21f68337e130c67b031ca38edf055f Mon Sep 17 00:00:00 2001
+From: Aymeric Moizard <amoizard@gmail.com>
+Date: Mon, 5 Sep 2016 15:01:53 +0200
+Subject: [PATCH]  * fix bug report: sr #109133: Heap buffer overflow in
+ utility function *osip_clrncpy*    https://savannah.gnu.org/support/?109133
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/osipparser2/osip_port.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/osipparser2/osip_port.c b/src/osipparser2/osip_port.c
+index 0e64147..d8941b0 100644
+--- a/src/osipparser2/osip_port.c
++++ b/src/osipparser2/osip_port.c
+@@ -1291,8 +1291,10 @@ osip_clrncpy (char *dst, const char *src, size_t len)
+ 	char *p;
+ 	size_t spaceless_length;
+ 
+-	if (src == NULL)
++	if (src == NULL || len == 0) {
++		*dst = '\0';
+ 		return NULL;
++	}
+ 
+ 	/* find the start of relevant text */
+	pbeg = src;
+-- 
+2.11.0
+
-- 
2.11.0
