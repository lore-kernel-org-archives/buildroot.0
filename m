From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Jan 2019 23:05:33 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] libxml2: security bump to
 version 2.9.9
Message-ID: <20190129220532.5991A82641@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bc2a8fbdabe96206d3f3eb24e99c93757398a085
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

- Fixes CVE-2018-9251 and CVE-2018-14567:
  https://gitlab.gnome.org/GNOME/libxml2/commit/2240fbf5912054af025fb6e01e26375100275e74
- Fixes CVE-2018-14404: https://gitlab.gnome.org/GNOME/libxml2/issues/5
- Remove patch: CVE-2017-8872 was fixed by
  https://gitlab.gnome.org/GNOME/libxml2/issues/26

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit cb3397e633b51a62edc4927e4f2c9350fbec9e65)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libxml2/0001-CVE-2017-8872.patch | 33 --------------------------------
 package/libxml2/libxml2.hash             |  2 +-
 package/libxml2/libxml2.mk               |  2 +-
 3 files changed, 2 insertions(+), 35 deletions(-)

diff --git a/package/libxml2/0001-CVE-2017-8872.patch b/package/libxml2/0001-CVE-2017-8872.patch
deleted file mode 100644
index b7a75c19a7..0000000000
--- a/package/libxml2/0001-CVE-2017-8872.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 8b329effb610f4138e4e680f6a6867570f6d6179 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Fri, 9 Feb 2018 10:58:11 +0200
-Subject: [PATCH] CVE-2017-8872
-
-Taken from attachment to upstream bug report comment #9.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=775200#c9
-https://bugzilla.gnome.org/attachment.cgi?id=366193&action=diff
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
- parser.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/parser.c b/parser.c
-index 1c5e036ea265..025111067ae8 100644
---- a/parser.c
-+++ b/parser.c
-@@ -12467,6 +12467,10 @@ xmlHaltParser(xmlParserCtxtPtr ctxt) {
- 	ctxt->input->cur = BAD_CAST"";
- 	ctxt->input->base = ctxt->input->cur;
-         ctxt->input->end = ctxt->input->cur;
-+    if (ctxt->input->buf)
-+        xmlBufEmpty (ctxt->input->buf->buffer);
-+    else
-+        ctxt->input->length = 0;
-     }
- }
- 
--- 
-2.15.1
-
diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index d114d98060..ce8f5ef7f2 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	0b74e51595654f958148759cfef0993114ddccccbb6f31aee018f3558e8e2732	libxml2-2.9.8.tar.gz
+sha256	94fb70890143e3c6549f265cee93ec064c80a84c42ad0f23e85ee1fd6540a871	libxml2-2.9.9.tar.gz
 # License files, locally calculated
 sha256	c5c63674f8a83c4d2e385d96d1c670a03cb871ba2927755467017317878574bd	COPYING
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 06a802eb10..3b3714fff1 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXML2_VERSION = 2.9.8
+LIBXML2_VERSION = 2.9.9
 LIBXML2_SITE = ftp://xmlsoft.org/libxml2
 LIBXML2_INSTALL_STAGING = YES
 LIBXML2_LICENSE = MIT
