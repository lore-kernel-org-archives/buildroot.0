From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Apr 2018 21:37:06 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] libxml2: add security fix
Message-ID: <20180410205255.BFBDF815B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dd364b6d603836abb943e54ca9eee306b7c65ee1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

CVE-2017-8872: An attackers can cause a denial of service (buffer
over-read) or information disclosure.

Patch from the upstream bug tracker.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 86e027f6d3eee30304da6a4fff84c808cd79182f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libxml2/0001-CVE-2017-8872.patch | 33 ++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/libxml2/0001-CVE-2017-8872.patch b/package/libxml2/0001-CVE-2017-8872.patch
new file mode 100644
index 0000000000..b7a75c19a7
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
