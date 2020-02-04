From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue,  4 Feb 2020 16:41:47 +0100
Subject: [Buildroot] [PATCH] package/libxml2: add upstream security fix for
 CVE-2020-7595
Message-ID: <20200204154148.23603-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2020-7595: xmlStringLenDecodeEntities in parser.c in libxml2
2.9.10 has an infinite loop in a certain end-of-file situation.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...e-loop-in-xmlStringLenDecodeEntities.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/libxml2/0001-Fix-infinite-loop-in-xmlStringLenDecodeEntities.patch

diff --git a/package/libxml2/0001-Fix-infinite-loop-in-xmlStringLenDecodeEntities.patch b/package/libxml2/0001-Fix-infinite-loop-in-xmlStringLenDecodeEntities.patch
new file mode 100644
index 0000000000..a79adc3f85
--- /dev/null
+++ b/package/libxml2/0001-Fix-infinite-loop-in-xmlStringLenDecodeEntities.patch
@@ -0,0 +1,36 @@
+From 0e1a49c8907645d2e155f0d89d4d9895ac5112b5 Mon Sep 17 00:00:00 2001
+From: Zhipeng Xie <xiezhipeng1@huawei.com>
+Date: Thu, 12 Dec 2019 17:30:55 +0800
+Subject: [PATCH] Fix infinite loop in xmlStringLenDecodeEntities
+
+When ctxt->instate == XML_PARSER_EOF,xmlParseStringEntityRef
+return NULL which cause a infinite loop in xmlStringLenDecodeEntities
+
+Found with libFuzzer.
+
+Fixes CVE-2020-7595: xmlStringLenDecodeEntities in parser.c in libxml2
+2.9.10 has an infinite loop in a certain end-of-file situation.
+
+Signed-off-by: Zhipeng Xie <xiezhipeng1@huawei.com>
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ parser.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/parser.c b/parser.c
+index d1c31963..a34bb6cd 100644
+--- a/parser.c
++++ b/parser.c
+@@ -2646,7 +2646,8 @@ xmlStringLenDecodeEntities(xmlParserCtxtPtr ctxt, const xmlChar *str, int len,
+     else
+         c = 0;
+     while ((c != 0) && (c != end) && /* non input consuming loop */
+-	   (c != end2) && (c != end3)) {
++           (c != end2) && (c != end3) &&
++           (ctxt->instate != XML_PARSER_EOF)) {
+ 
+ 	if (c == 0) break;
+         if ((c == '&') && (str[1] == '#')) {
+-- 
+2.20.1
+
-- 
2.20.1
