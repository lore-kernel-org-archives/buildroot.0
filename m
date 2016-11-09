From: Baruch Siach <baruch@tkos.co.il>
Date: Wed,  9 Nov 2016 21:01:56 +0200
Subject: [Buildroot] [PATCH] libxslt: add upstream security fix
Message-ID: <b6f941e11e0f5218d0693af9bd71fafa7e2767c9.1478718116.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2016-4738 - heap overread.

https://www.debian.org/security/2016/dsa-3709

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...ap-overread-in-xsltFormatNumberConversion.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/libxslt/0001-Fix-heap-overread-in-xsltFormatNumberConversion.patch

diff --git a/package/libxslt/0001-Fix-heap-overread-in-xsltFormatNumberConversion.patch b/package/libxslt/0001-Fix-heap-overread-in-xsltFormatNumberConversion.patch
new file mode 100644
index 000000000000..1ad494a6c023
--- /dev/null
+++ b/package/libxslt/0001-Fix-heap-overread-in-xsltFormatNumberConversion.patch
@@ -0,0 +1,35 @@
+From eb1030de31165b68487f288308f9d1810fed6880 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Fri, 10 Jun 2016 14:23:58 +0200
+Subject: [PATCH] Fix heap overread in xsltFormatNumberConversion
+
+An empty decimal-separator could cause a heap overread. This can be
+exploited to leak a couple of bytes after the buffer that holds the
+pattern string.
+
+Found with afl-fuzz and ASan.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Patch status: upstream commit eb1030de311
+
+ libxslt/numbers.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libxslt/numbers.c b/libxslt/numbers.c
+index d1549b46ca26..e78c46b6357b 100644
+--- a/libxslt/numbers.c
++++ b/libxslt/numbers.c
+@@ -1090,7 +1090,8 @@ xsltFormatNumberConversion(xsltDecimalFormatPtr self,
+     }
+ 
+     /* We have finished the integer part, now work on fraction */
+-    if (xsltUTF8Charcmp(the_format, self->decimalPoint) == 0) {
++    if ( (*the_format != 0) &&
++         (xsltUTF8Charcmp(the_format, self->decimalPoint) == 0) ) {
+         format_info.add_decimal = TRUE;
+ 	the_format += xsltUTF8Size(the_format);	/* Skip over the decimal */
+     }
+-- 
+2.10.2
+
-- 
2.10.2
