Return-Path: <SRS0=/mEu=MO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90718C6377D
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 05:31:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20E0061241
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 05:31:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20E0061241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF62B40156;
	Thu, 22 Jul 2021 05:31:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qJD9UA0aRjNE; Thu, 22 Jul 2021 05:31:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30600400F6;
	Thu, 22 Jul 2021 05:31:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D7F241BF865
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 05:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C502C82F3D
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 05:31:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v5vRPDg6PnJ0 for <buildroot@lists.busybox.net>;
 Thu, 22 Jul 2021 05:31:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C99D382977
 for <buildroot@buildroot.org>; Thu, 22 Jul 2021 05:31:26 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id k4so4526681wrc.8
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 22:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yFMZS5uOR7RD1ZKqlR0VBTuUyS5gM27CLvmMwRXzz1o=;
 b=HXXNTv2XccUiWb3LqCbGqS7tYwc+zym3Hgjj9vo0r/u/852UFEBbhurqy7Q39xgag4
 1NQWIuutYD/dFijAorIvc2dDU6JPLVrkQv5TJKKOHqP1dojZrs1ONvMsgRvQ8yRsWhMW
 VjopcL/Cjx+9I9a9QcXG++fclr3wL5GHgTZrRFqfh3ZXysdKD5mOmceUvnItPvSnQ9kt
 BdSuIs+XOOGzSYsU3+jWf0PhHZHnSiAoLhLVPIZiQoR+FmaDfkafrbTenUvsjOnM4r2U
 m6bhShAAqXZLQ+Na99EkRfKtzVr2Hptid9WZZlGSg22LSKaYTy05NaCMdE6HxPEOrAJu
 a1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yFMZS5uOR7RD1ZKqlR0VBTuUyS5gM27CLvmMwRXzz1o=;
 b=NWx2RcNFQzyQrUQZVGCV0z1b6FPZM7ug2A68dW1V7w03DQZXoKtOTe1ypDuflYRxNH
 whwBjQrEez6XhcBFSvGdTGExwokRnT/5uV8Kr7jSOyM4bOr0/PQR7fBGJY1B7wNlowOw
 ILuLk8XF44ORaPE/xcS5Mb3+UYHVQ+SEwLl9ws5rbSnvlT5o7mMRjOMn5bYodG+nYHuY
 ACExY71wbpFvcYxLywtZq9qUnrupa5yhWyAewA+jCb5UtX2S8Fb2lG8606P7isfkz7j+
 m+24OYwpGVjhc0g4v8T++lK3tSZfy4/RJYPasTqjBk9r8lDTuOnby70aKXTOznzdddW0
 3+2w==
X-Gm-Message-State: AOAM532Z+OpMC4P9KHCUcs8tPCaCD6Z6XBvIiRtkbwLp5GwXkHX9bItX
 oQB4G2eZVipd6ztPK+/LYJzB65BZdokzbw==
X-Google-Smtp-Source: ABdhPJwDg9Od5HlKE8i4vH+x+tliifVPHsAcEVq5x2TKQVdCi0pzwwG83HCibW8ONgtfTgGQlB6E3Q==
X-Received: by 2002:a5d:4ace:: with SMTP id y14mr47297245wrs.390.1626931884857; 
 Wed, 21 Jul 2021 22:31:24 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id p7sm23860927wmq.5.2021.07.21.22.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 22:31:24 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 22 Jul 2021 07:31:17 +0200
Message-Id: <20210722053117.1199335-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mupdf: fix CVE-2021-3407
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

A flaw was found in mupdf 1.18.0. Double free of object during
linearization may lead to memory corruption and other potential
consequences.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-free-of-object-during-linearization.patch | 52 +++++++++++++++++++
 package/mupdf/mupdf.mk                        |  3 ++
 2 files changed, 55 insertions(+)
 create mode 100644 package/mupdf/0001-Bug-703366-Fix-double-free-of-object-during-linearization.patch

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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
