Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D78C433F5
	for <buildroot@archiver.kernel.org>; Mon, 20 Dec 2021 22:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B5AC409A5;
	Mon, 20 Dec 2021 22:05:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wq_PfGSJeWgs; Mon, 20 Dec 2021 22:05:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51E8740938;
	Mon, 20 Dec 2021 22:05:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0637C1BF34B
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03BDE40935
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:05:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OytqMe2fsYP9 for <buildroot@lists.busybox.net>;
 Mon, 20 Dec 2021 22:05:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6B62840934
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 22:05:30 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 f18-20020a17090aa79200b001ad9cb23022so1239233pjq.4
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 14:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TjSU8hLqudHXfeihaOPEXhAi289JsAA08gU0l3Ao0Ao=;
 b=fJDggl8ed+/ty8GJqU8ffdpgN4JEFrv7w1j3ZIUTZ5tBWnUbfAMU2mCHkDeevHgQ0u
 YDMMo6LOBwvqkhkz1A6RgYzzlx6ILdZ1UFIy2UFJMPmvEn1sH+NE7n8LhKIuO1J+FdWz
 vRq9nq/4Rucw2y7C365JSXB/DABC4YTGWSxMr6omuMxGJgX7egpKfLblH7cerRpHxjRl
 ys7YCOfDCh2VTzaz/Je6ATHJtFGSIEWYtRLVycr4V+3/3y0lisos2Yq9C+0V9RVpz6XN
 z6SXzx0Uqk+/+54pQKDqLrE/UyP2iz/Y6dbXxC6PVXXDb0tINxD9ASJaOuVEOR5ZJ6dU
 gCZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=TjSU8hLqudHXfeihaOPEXhAi289JsAA08gU0l3Ao0Ao=;
 b=Z8OlCuP9Z5TSZBez1U8vpkmMRrTEgI+OG5Xnwuu08vDtlGbMbTCD+0GaimmK4124IW
 qqjfGTEB81gXwaIDJrgfS83oMJ/M6gdJDuDCre4xosG9mvO98XxiHbRU3B9el/uj6IBH
 3yJvsKs369ZnjsXTvKn3qbeEYBRSGRN5NdqT464r04qyt/CN5M/RFIZfmuTcYetkNUGi
 k6EG/RC1BLAu/h18dMEYzTiFVgKCtFeY6ynKK34n10yYsFzND+fqZgBKLRoi36uB9xDM
 /qN3d9r6vYv9XuSUcWDiNkIP7Bu4sYwjYtzt368WHV0QmvJnowUVAtD46JEQ5se0Ds0/
 2qwg==
X-Gm-Message-State: AOAM5335ePZbeH4/nLo9EA16MIBlkZxX2JzDWZA88W46GdgB8e6bYAsp
 gKw3oXIpGQVypCOO6/31OerYpqgwiNE=
X-Google-Smtp-Source: ABdhPJz5T6bWUkLXji0GjQl+6TOej1TVGO3ufU+xn4jIESSxGaaXOy4fv0oww8QhgeVnT8mnlnnNhg==
X-Received: by 2002:a17:902:7406:b0:148:a2af:4abd with SMTP id
 g6-20020a170902740600b00148a2af4abdmr19203803pll.4.1640037928982; 
 Mon, 20 Dec 2021 14:05:28 -0800 (PST)
Received: from voyager.lan ([45.124.203.19])
 by smtp.gmail.com with ESMTPSA id y8sm339604pjt.25.2021.12.20.14.05.27
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 14:05:28 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: buildroot@buildroot.org
Date: Tue, 21 Dec 2021 08:35:17 +1030
Message-Id: <20211220220517.1619994-1-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/pdbg: Bump version to v3.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Remove patch that is now upstream.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .../pdbg/0001-template-Fix-alignment.patch    | 39 -------------------
 package/pdbg/pdbg.hash                        |  2 +-
 package/pdbg/pdbg.mk                          |  2 +-
 3 files changed, 2 insertions(+), 41 deletions(-)
 delete mode 100644 package/pdbg/0001-template-Fix-alignment.patch

diff --git a/package/pdbg/0001-template-Fix-alignment.patch b/package/pdbg/0001-template-Fix-alignment.patch
deleted file mode 100644
index e95d8344e2d6..000000000000
--- a/package/pdbg/0001-template-Fix-alignment.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 0080d0a64da274207bc341491f87863952bb6e3b Mon Sep 17 00:00:00 2001
-From: Joel Stanley <joel@jms.id.au>
-Date: Tue, 3 Aug 2021 17:28:17 +0930
-Subject: [PATCH] template: Fix alignment
-
-The assembler complains about unaliged data:
-
- ./template.S: Assembler messages:
- ./template.S:21: Error: misaligned data
-
-If the included data is not an aligned size, the the symbols following
-will be unaligned.
-
-We lost the alignment directive in commit 5f3deee1289e ("template: new
-libfdt requires 8-byte aligned fdt"), so add it back as it was before
-that commit.
-
-Reported by the buildroot autobuilder.
-
-Signed-off-by: Joel Stanley <joel@jms.id.au>
----
- template.S | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/template.S b/template.S
-index ecf9bba0656d..df8c064d6bc0 100644
---- a/template.S
-+++ b/template.S
-@@ -17,6 +17,7 @@
- SYM_START(SYMBOL_PREFIX):
- .incbin FILENAME
- SYM_END(SYMBOL_PREFIX):
-+.align 4
- SYM_SIZE(SYMBOL_PREFIX):
- 	.long	SYM_END(SYMBOL_PREFIX) - SYM_START(SYMBOL_PREFIX)
- .globl SYM_START(SYMBOL_PREFIX)
--- 
-2.32.0
-
diff --git a/package/pdbg/pdbg.hash b/package/pdbg/pdbg.hash
index 9a58fa842c6a..df7ba314bfbc 100644
--- a/package/pdbg/pdbg.hash
+++ b/package/pdbg/pdbg.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 87fe68977f72885e46d321da806d30f33a901de817461eb44fa727cd81d1d109 pdbg-3.3.tar.gz
+sha256 5b721fd5551591cd5626ccf72c8d9096d902de4da10324097a37b4763815f0d7 pdbg-3.4.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 COPYING
diff --git a/package/pdbg/pdbg.mk b/package/pdbg/pdbg.mk
index 7f6b48e6eb57..5a5cfbc62d8a 100644
--- a/package/pdbg/pdbg.mk
+++ b/package/pdbg/pdbg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PDBG_VERSION = 3.3
+PDBG_VERSION = 3.4
 PDBG_SITE = $(call github,open-power,pdbg,v$(PDBG_VERSION))
 PDBG_LICENSE = Apache-2.0
 PDBG_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
