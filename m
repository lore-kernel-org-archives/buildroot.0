Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36A6CCD183
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 21:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A60168211B;
	Mon, 13 Oct 2025 21:09:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kvEZt7wKFuK3; Mon, 13 Oct 2025 21:09:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 714C781569
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 714C781569;
	Mon, 13 Oct 2025 21:09:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C888294
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 21:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA41F414D2
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 21:09:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F0YiBUIdGc_I for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 21:09:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5667241071
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5667241071
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5667241071
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 21:09:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BE4B5A4C66BA;
 Mon, 13 Oct 2025 23:09:40 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48492)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v8PnY-000000005i3-0NDt;
 Mon, 13 Oct 2025 21:09:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Mon, 13 Oct 2025 23:09:38 +0200
Message-ID: <20251013210940.511743-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760389780;
 bh=jd7z80MaV7hA4/QyEp12j4bAZbrVXWOVv15u2e15AjU=;
 h=From:To:Cc:Subject:Date:From;
 b=Y2aSTOICa4QUJt10tKd4LKFbxVtcBU/EbTBEkGRMthFQygDWq6HYRzXmjpcxlOKjZ
 f5EMEfAGZqWlmYjICXLGQVdFBVmEu/X1xdPfxWbeLFnebSope0pnf9GwE8mnIEnInT
 ZMKMzXqH85hICQpdG3bE6JfJm9WhYjPplZD/G108WUKawNMEt5BhiqIczaajBgt+BO
 OyV5vxOm5b4c+cD3aeyRHnxWCkWCLgjplQd1Jotukku7by7Dti9PRUIrtceBaRia9a
 62gp0R7JOij0BgVXVZHRPmFRb3shVwr65lTU/XrPPemzI+4XcM9pz8NGDtCb9GFJ2Y
 WUBKva3hnVFFA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=Y2aSTOIC
Subject: [Buildroot] [PATCH 1/3] package/xmlstarlet: Fix build with
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...0002-xml_pyx-remove-ATTRIBUTE_UNUSED.patch | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 package/xmlstarlet/0002-xml_pyx-remove-ATTRIBUTE_UNUSED.patch

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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
