From: Baruch Siach <baruch@tkos.co.il>
Date: Fri,  9 Feb 2018 11:07:58 +0200
Subject: [Buildroot] [PATCH] libxml2: add security fix
Message-ID: <1f304b7afb41b9d40ca50de930b2cbd2cda740cf.1518167278.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CVE-2017-8872: An attackers can cause a denial of service (buffer
over-read) or information disclosure.

Patch from the upstream bug tracker.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libxml2/0001-CVE-2017-8872.patch | 33 ++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/libxml2/0001-CVE-2017-8872.patch

diff --git a/package/libxml2/0001-CVE-2017-8872.patch b/package/libxml2/0001-CVE-2017-8872.patch
new file mode 100644
index 000000000000..b7a75c19a74f
--- /dev/null
+++ b/package/libxml2/0001-CVE-2017-8872.patch
@@ -0,0 +1,33 @@
+From 8b329effb610f4138e4e680f6a6867570f6d6179 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Fri, 9 Feb 2018 10:58:11 +0200
+Subject: [PATCH] CVE-2017-8872
+
+Taken from attachment to upstream bug report comment #9.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=775200#c9
+https://bugzilla.gnome.org/attachment.cgi?id=366193&action=diff
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+ parser.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/parser.c b/parser.c
+index 1c5e036ea265..025111067ae8 100644
+--- a/parser.c
++++ b/parser.c
+@@ -12467,6 +12467,10 @@ xmlHaltParser(xmlParserCtxtPtr ctxt) {
+ 	ctxt->input->cur = BAD_CAST"";
+ 	ctxt->input->base = ctxt->input->cur;
+         ctxt->input->end = ctxt->input->cur;
++    if (ctxt->input->buf)
++        xmlBufEmpty (ctxt->input->buf->buffer);
++    else
++        ctxt->input->length = 0;
+     }
+ }
+ 
+-- 
+2.15.1
+
-- 
2.15.1
