Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BCC7C4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:15:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE72360E96
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:15:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EE72360E96
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8C91401B5;
	Sat, 24 Jul 2021 20:15:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id toTYxT-N-Vlj; Sat, 24 Jul 2021 20:15:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04972400CE;
	Sat, 24 Jul 2021 20:15:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A42761BF27E
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93F79823AA
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:15:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Clcg_1OtU4c3 for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 20:15:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6F6081CDC
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 20:15:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 1E9798894B; Sat, 24 Jul 2021 19:40:58 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 22:14:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 285eb82395a79d64f0ea79a36f584f61ee35fe57
X-Git-Newrev: d7d23710facd789c8986de055e30792af2591f2c
X-Patchwork-Hint: ignore
Message-Id: <20210724194058.1E9798894B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mupdf: fix CVE-2021-3407
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=d7d23710facd789c8986de055e30792af2591f2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A flaw was found in mupdf 1.18.0. Double free of object during
linearization may lead to memory corruption and other potential
consequences.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...ouble-free-of-object-during-linearization.patch | 52 ++++++++++++++++++++++
 package/mupdf/mupdf.mk                             |  3 ++
 2 files changed, 55 insertions(+)

diff --git a/package/mupdf/0001-Bug-703366-Fix-double-free-of-object-during-linearization.patch b/package/mupdf/0001-Bug-703366-Fix-double-free-of-object-during-linearization.patch
new file mode 100644
index 0000000000..a4746961a6
--- /dev/null
+++ b/package/mupdf/0001-Bug-703366-Fix-double-free-of-object-during-linearization.patch
@@ -0,0 +1,52 @@
+From cee7cefc610d42fd383b3c80c12cbc675443176a Mon Sep 17 00:00:00 2001
+From: Robin Watts <Robin.Watts@artifex.com>
+Date: Fri, 22 Jan 2021 17:05:15 +0000
+Subject: [PATCH] Bug 703366: Fix double free of object during linearization.
+
+This appears to happen because we parse an illegal object from
+a broken file and assign it to object 0, which is defined to
+be free.
+
+Here, we fix the parsing code so this can't happen.
+
+[Retrieved from:
+http://git.ghostscript.com/?p=mupdf.git;h=cee7cefc610d42fd383b3c80c12cbc675443176a]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ source/pdf/pdf-parse.c | 6 ++++++
+ source/pdf/pdf-xref.c  | 2 ++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/source/pdf/pdf-parse.c b/source/pdf/pdf-parse.c
+index 7abc8c3d4..5761c3351 100644
+--- a/source/pdf/pdf-parse.c
++++ b/source/pdf/pdf-parse.c
+@@ -749,6 +749,12 @@ pdf_parse_ind_obj(fz_context *ctx, pdf_document *doc,
+ 		fz_throw(ctx, FZ_ERROR_SYNTAX, "expected generation number (%d ? obj)", num);
+ 	}
+ 	gen = buf->i;
++	if (gen < 0 || gen >= 65536)
++	{
++		if (try_repair)
++			*try_repair = 1;
++		fz_throw(ctx, FZ_ERROR_SYNTAX, "invalid generation number (%d)", gen);
++	}
+ 
+ 	tok = pdf_lex(ctx, file, buf);
+ 	if (tok != PDF_TOK_OBJ)
+diff --git a/source/pdf/pdf-xref.c b/source/pdf/pdf-xref.c
+index 1b2bdcd59..30197b4b8 100644
+--- a/source/pdf/pdf-xref.c
++++ b/source/pdf/pdf-xref.c
+@@ -1190,6 +1190,8 @@ pdf_read_new_xref(fz_context *ctx, pdf_document *doc, pdf_lexbuf *buf)
+ 	{
+ 		ofs = fz_tell(ctx, doc->file);
+ 		trailer = pdf_parse_ind_obj(ctx, doc, doc->file, buf, &num, &gen, &stm_ofs, NULL);
++		if (num == 0)
++			fz_throw(ctx, FZ_ERROR_GENERIC, "Trailer object number cannot be 0\n");
+ 	}
+ 	fz_catch(ctx)
+ 	{
+-- 
+2.17.1
+
diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
index b481fb1eae..294cd8a61b 100644
--- a/package/mupdf/mupdf.mk
+++ b/package/mupdf/mupdf.mk
@@ -22,6 +22,9 @@ MUPDF_DEPENDENCIES = \
 	xlib_libX11 \
 	zlib
 
+# 0001-Bug-703366-Fix-double-free-of-object-during-linearization.patch
+MUPDF_IGNORE_CVES += CVE-2021-3407
+
 # The pkg-config name for gumbo-parser is `gumbo`.
 MUPDF_PKG_CONFIG_PACKAGES = \
 	freetype2 \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
