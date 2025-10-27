Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A6BCCF9E5
	for <buildroot@archiver.kernel.org>; Mon, 27 Oct 2025 20:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FB16613EE;
	Mon, 27 Oct 2025 20:47:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uboBD7HP_llM; Mon, 27 Oct 2025 20:47:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 816B3613F1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 816B3613F1;
	Mon, 27 Oct 2025 20:47:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 64079976
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 20:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49E2C84499
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 20:47:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KdJZ-qM_ltLX for <buildroot@buildroot.org>;
 Mon, 27 Oct 2025 20:47:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CC2E84495
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CC2E84495
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 20:47:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 551C78790C; Mon, 27 Oct 2025 20:47:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 27 Oct 2025 21:44:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 98ee49460ef7d3319e0ffe5ca2c513c24e311b53
X-Git-Newrev: b3bdf2f152f5821d93707f03b7765b0ce20440f6
X-Patchwork-Hint: ignore
Message-Id: <20251027204719.551C78790C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xmlstarlet: Fix build with
 libxml2-2.14+
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b3bdf2f152f5821d93707f03b7765b0ce20440f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0002-xml_pyx-remove-ATTRIBUTE_UNUSED.patch     | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/package/xmlstarlet/0002-xml_pyx-remove-ATTRIBUTE_UNUSED.patch b/package/xmlstarlet/0002-xml_pyx-remove-ATTRIBUTE_UNUSED.patch
new file mode 100644
index 0000000000..dd7472301e
--- /dev/null
+++ b/package/xmlstarlet/0002-xml_pyx-remove-ATTRIBUTE_UNUSED.patch
@@ -0,0 +1,49 @@
+From 6b3ca3549abb998947088bdf264d65a0a86684cd Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 12 Oct 2025 18:38:54 +0200
+Subject: [PATCH] xml_pyx: remove ATTRIBUTE_UNUSED
+
+This define was removed in libxml2 2.14.0:
+https://gitlab.gnome.org/GNOME/libxml2/-/commit/208f27f9641a59863ce1f7d4992df77f7eb0ea9d
+
+Upstream: https://sourceforge.net/p/xmlstar/patches/23/
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/xml_pyx.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/xml_pyx.c b/src/xml_pyx.c
+index ab295f1..8adc028 100644
+--- a/src/xml_pyx.c
++++ b/src/xml_pyx.c
+@@ -200,7 +200,7 @@ pyxExternalEntityReferenceHandler(void* userData,
+ }
+ 
+ static void
+-pyxExternalSubsetHandler(void *ctx ATTRIBUTE_UNUSED, const xmlChar *name,
++pyxExternalSubsetHandler(void *ctx, const xmlChar *name,
+                          const xmlChar *ExternalID, const xmlChar *SystemID)
+ {
+     fprintf(stdout, "D %s PUBLIC", name); /* TODO: re-check */
+@@ -215,7 +215,7 @@ pyxExternalSubsetHandler(void *ctx ATTRIBUTE_UNUSED, const xmlChar *name,
+ }
+ 
+ static void
+-pyxCommentHandler(void *ctx ATTRIBUTE_UNUSED, const xmlChar *value)
++pyxCommentHandler(void *ctx, const xmlChar *value)
+ {
+     fprintf(stdout,"C");
+     SanitizeData(value, xmlStrlen(value));
+@@ -223,7 +223,7 @@ pyxCommentHandler(void *ctx ATTRIBUTE_UNUSED, const xmlChar *value)
+ }
+ 
+ static void
+-pyxCdataBlockHandler(void *ctx ATTRIBUTE_UNUSED, const xmlChar *value, int len)
++pyxCdataBlockHandler(void *ctx, const xmlChar *value, int len)
+ {
+     fprintf(stdout,"[");
+     SanitizeData(value, len);
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
