From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 21:15:31 +0100
Subject: [Buildroot] [git commit] libxslt: add upstream security fix
Message-ID: <20161109201549.69E978199C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3ded6e5e3909f1a519abbf58f386f31eba7fc806
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2016-4738 - heap overread.

https://www.debian.org/security/2016/dsa-3709

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ap-overread-in-xsltFormatNumberConversion.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/libxslt/0001-Fix-heap-overread-in-xsltFormatNumberConversion.patch b/package/libxslt/0001-Fix-heap-overread-in-xsltFormatNumberConversion.patch
new file mode 100644
index 0000000..1ad494a
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
