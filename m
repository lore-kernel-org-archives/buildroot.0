Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC4BCAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 14:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57D8E83E73;
	Wed,  1 Oct 2025 14:37:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R_HY6bBjZtEk; Wed,  1 Oct 2025 14:37:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AE0D83D70
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AE0D83D70;
	Wed,  1 Oct 2025 14:37:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B13FE26
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 14:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C5D781D46
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 14:37:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cCwyosjLKqxI for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 14:37:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9C9CE83D70
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C9CE83D70
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C9CE83D70
 for <buildroot@busybox.net>; Wed,  1 Oct 2025 14:37:47 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-afcb7a16441so1191164966b.2
 for <buildroot@busybox.net>; Wed, 01 Oct 2025 07:37:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759329465; x=1759934265;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0bGPwmwKM2U3Z4Ij4TjGZZCL58TlHdbyo1581db1Hcs=;
 b=Jes8HQFyDjZrIEvPxj4zpIEptCN7P/XrF5eKc5cTypYofb5Uncbuf4qsy95wKhlhT1
 SKjFJN4PPJSpvg/xctv9zy4AAwPglOWVvLhFb4fp+reC6JVquQ6ceN36im09intqTNXD
 CqOsDu7ggY3imgPSm5qmkDuCy4JujWGHBZVZq7eAEKYbkXSQADpOCKhMlpicenbLxTVQ
 8di9U+Y616n/nA6hVjQ8GPz8Fg2zulAEQO+aGV3YxKu1QS3wGWt+pvvnrQX//hy2HShq
 j3jfiwVHt24MJO07a64DDpObYrIUAZm+JvGwEQFLQmBhyQNY79ldYogHCo0nEmGUJnRh
 0Nag==
X-Gm-Message-State: AOJu0YzwIpGgUMebIc2wN6JhJqWkChk0JkwOACun1wGZ5t/hxEkop75t
 LxhkvpR+lvz7U5S2d+Z8fKxPTCo8dxEqMOvmdDalqGfW0KgjRgXJMMnQSbHd9v4hiiw68N3VJH7
 Ey0LNbQ==
X-Gm-Gg: ASbGncs5l1bnQ30uUoxME+AHkWohT4cGbViX+QAg+Fh+EChacXiQb0I+yVl7z9OFmMp
 QNcEE9ZLlWyp2MsfxJ0JBOFsqMcNPzqGNkcuEimjK0zWTy9qcMATgTwQ7ts7ZddHWk2SY4/kWzX
 pqsqkiJ1ibqqTZT+oBbdUzNwJ+t8wcD/zij7XuLBlPcN/ldHPzR7Wx1WXvwVITdEM57BOhBmZ04
 RDjygbZbdVotxeFDWHFITT8qXQ60xCh5UbhXAX2R1ru39IWOjbgr27YZXGTgOFUVMl2rEIK/TTD
 Pg+28fTC5KDtgvUM9P7WTmUBxkyjJJ8n1+K86xeB7TReHfHSiLKJygUx2yepLl/Xt8vOlV8SNmB
 B8vrDU7qd6Yh32JGDmHMlr0sOioRGFHrsRhOGI/SIqKzfCLU/LOUCch9EzQtuUzXxF7IokW6Vha
 yTwoek
X-Google-Smtp-Source: AGHT+IF9FK8rr77fGFPzziRlTLmd0QdTON3jiLNbkmJaR7KjOnL2OwiyXkiI6C8KpsU6ZxWS+C/R0Q==
X-Received: by 2002:a17:907:7f8a:b0:b44:cfe1:ac93 with SMTP id
 a640c23a62f3a-b46e223f388mr483395466b.26.1759329465303; 
 Wed, 01 Oct 2025 07:37:45 -0700 (PDT)
Received: from vm-2404.. (10.187.66.37.rev.sfr.net. [37.66.187.10])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b3f9eaa10e9sm601319066b.44.2025.10.01.07.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 07:37:45 -0700 (PDT)
To: buildroot@busybox.net
Date: Wed,  1 Oct 2025 16:37:14 +0200
Message-ID: <20251001143714.981725-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1759329465; x=1759934265; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0bGPwmwKM2U3Z4Ij4TjGZZCL58TlHdbyo1581db1Hcs=;
 b=dTRHJfpymf8H9yngzaY78905HsYtjSAPzfLu8FHeKouaCqIG0sqE3q1JRgMC/dSM1T
 sWJBeEYH4UdFtR2aTNVhZbYYfe7BiI63zvWDLcBIPMNGemrrn4GUTrdraLCyD09UsuoE
 BC98imbeR11ZViPe4mW68sJ+v+stVnx/ZZIZ6WBu1Ix4oNCZkj58I1UzR5XUje+2dLgy
 Y3Qr3NHBPn0weK4xR5LviN7OxaMfm7xyBCSOawOpSgj4Xy8VzVuD8SjsF3nfsf0jyKgX
 Qnrd7sVZfnggJ4I7xHGnUppcWSJshGpKo9TiSA/xismcchFkKbNYXoUFXds4evw2wduT
 OWcg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=dTRHJfpy
Subject: [Buildroot] [PATCH] package/luaossl: bump to version 20250929
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

diff LICENSE:
-    2015-2019  Daurnimator <quae@daurnimator.com>
+    2015-2025  Daurnimator <quae@daurnimator.com>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luaossl/luaossl.hash | 4 ++--
 package/luaossl/luaossl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luaossl/luaossl.hash b/package/luaossl/luaossl.hash
index bf08fbd51..734c916f5 100644
--- a/package/luaossl/luaossl.hash
+++ b/package/luaossl/luaossl.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  d711c86f433def90f63cb6747fe0bebaac604b868de6a9a35e4da2bb4e0967be  luaossl-20220711-0.src.rock
-sha256  7bd585fba3ae52943e0915e4c8ca049acde9f1e5cea101ef6b294427c8f0ee7d  luaossl-rel-20220711/LICENSE
+sha256  19cfc635dd804bde649a8db1ffae01e5fc0cdfac2630fb73c617fe6d8a0bfd30  luaossl-20250929-0.src.rock
+sha256  421c26c8788c46fd59e4dbfe5bf8eab6c21e37ce3ca8cb44dfff5dc179098756  luaossl-rel-20250929/LICENSE
diff --git a/package/luaossl/luaossl.mk b/package/luaossl/luaossl.mk
index a6283a520..079d1e0ca 100644
--- a/package/luaossl/luaossl.mk
+++ b/package/luaossl/luaossl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAOSSL_VERSION_UPSTREAM = 20220711
+LUAOSSL_VERSION_UPSTREAM = 20250929
 LUAOSSL_VERSION = $(LUAOSSL_VERSION_UPSTREAM)-0
 LUAOSSL_SUBDIR = luaossl-rel-$(LUAOSSL_VERSION_UPSTREAM)
 LUAOSSL_LICENSE = MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
