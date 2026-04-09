Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB1DE9DE6C
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 08:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74168410D0;
	Thu,  9 Apr 2026 08:45:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fiMna_KszTFo; Thu,  9 Apr 2026 08:45:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6034040596
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775724328;
	bh=SDOBqfTjP93D3Y6OweEFowQn+AHhio7dbZwb/0TfzFw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S8aiC83RwcWw8rkXPk/T2lObhASRfEPRhYSQtzyJ4+9c56tq9pr4Wup7j7bwq3xWg
	 RIPJHXPVOp9ewT1ELH3JZN/iZ9J2zwqJ/lL+8I68/uIRpBbwa7M4qyh2LZjhgSOc2P
	 qbm4R6XZVhp/5mGsdDQqwjhpGo7eNGIwVyaDh6WarJwQtxJTZ5p3mjhWLhw4t7vTO3
	 OzHuibmdcjoGr1RTN9qiI7AKKK7HGeQ75YAEhs6Jf0MymWPra6g49goURNnHJsvuOj
	 YLrN6ihZmnSK+5CclSJgh63SmroGVAFnFzdsSKit/F4FdzHh7/zLpfMSlUDhr1qROh
	 pFXtIM3aBFw/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6034040596;
	Thu,  9 Apr 2026 08:45:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 31F3A1F6
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FB2182280
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:45:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xm8qzuOR9na4 for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 08:45:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 25F4782273
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25F4782273
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 25F4782273
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:45:25 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ca66.dip0.t-ipconnect.de [79.214.202.102])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A05FDA4C0921;
 Thu,  9 Apr 2026 10:43:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35588)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wAkyh-000000004SH-0xku;
 Thu, 09 Apr 2026 08:43:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: David GOUARIN <dgouarin@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Laurent Cans <laurent.cans@gmail.com>, Mario Lang <mlang@blind.guru>,
 Maxim Kochetkov <fido_max@inbox.ru>,
 Phil Eichinger <phil.eichinger@gmail.com>
Date: Thu,  9 Apr 2026 10:42:53 +0200
Message-ID: <20260409084305.3960494-9-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409084305.3960494-1-bernd@kuhls.net>
References: <20260409084305.3960494-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775724198;
 bh=ukFnVUbgnUDL+YxrCc48MexxqrAhEr8Mw7a8NIA4FTs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=lOWImH6qA3IiLxXx5gNjP/AbX44OBIlN/C8nPynWhSL9nvChp7aJFY8cKFq2giULx
 G0apyATQm7xS3FTQDFGb7+MIq9XvqCP+klR6WNMCGRjH27hS8gY9w0cXVwHAEr/5yw
 NMbsx+HPe9NmuaXI81xMBEXl2SKlLCxty2n6Xc595IBZ0StKXn049H0PMhz8oVHPYs
 j18O29H6p5fxHv85zO3vy/EFtWeRjNc4j0JUZUjzSzXox1A9G+EKXSikqJvWDlBLUC
 +pLad8ZD1CmPIh8Sr3LLCohA37maoE/uxaP8mjq8uX8Spc3gkucw70OOjq90knVoRe
 wE0z5o55C7MaQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=lOWImH6q
Subject: [Buildroot] [PATCH 09/20] package/pound: remove optional support
 for pcre, keep pcre2
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
 package/pound/pound.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/pound/pound.mk b/package/pound/pound.mk
index 6ed2fc656d..6d00776752 100644
--- a/package/pound/pound.mk
+++ b/package/pound/pound.mk
@@ -19,9 +19,6 @@ POUND_CONF_OPTS += --enable-pcre=2
 POUND_CONF_ENV += \
 	ac_cv_path_PCRE2_CONFIG=$(STAGING_DIR)/usr/bin/pcre2-config
 POUND_DEPENDENCIES += pcre2
-else ifeq ($(BR2_PACKAGE_PCRE),y)
-POUND_CONF_OPTS += --enable-pcre=1
-POUND_DEPENDENCIES += pcre
 else
 POUND_CONF_OPTS += --disable-pcre
 endif
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
