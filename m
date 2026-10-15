Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1627CC6B38
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 21:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71AF960ACA;
	Thu, 15 Oct 2026 21:52:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hPtxBWwV_ePb; Thu, 15 Oct 2026 21:52:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8023B60B07
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792101161;
	b=s9CNzzQcxsQoxOZtcEjClCeCZIy7lwLp9l4axnWT7A3d4Fdap80pde+ElYxiTFrZCZhz
	 oLD35h+QtPMIrHqRqXdlKgngvhyZVNm+kpqHFouL/tm89ThPF6L5QlFvGyiEiuT6RbDKy
	 kry+brrqZdAI1mA7i4Gxhsl4yEfrFYFSl1+8W2eSM793ZtooHzTHoXXjXsX43dT1Jh+hQ
	 VZeFSxZyenmugyk1V6OUI4UQRFduOJyRAuznXoYIQ9M1wtqYJgTtzr8Fj1kk6yPRGhSUX
	 88ch8p/FyqCs+OcBT4gTIvVeVyl1243Vzm17Djd9pSHvgSdKrID55KzS7ixD/S4NPGQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792101161;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=xbtVYgjj4yIAXeyX0KTxeo5nlMoSrXul8jC+7Cyk2/o=;
	b=qOYH0ERIXgXaST/6H6MdEldYOdJlXuJ7w02LipXWxjQBVkcn4Ci1wBFNFG3daRjYq5tL
	 5hsRlpuipnzmx3u4RVLE1Mw0ptyIZPgjRRv3ObMWSM7W/0uLRponhe+B0bJjv2szFVaHU
	 Q7EnV7DlaUK7qNKT7Uo3qssDqmm9FxnilQkwflgLgUIfhhJ0/MknGCLnDIeEx2kF7utYX
	 BNf/1y47YqyTweCi5G7B9/MYCBAcKfx/LLLrhXqwQdy1BWSOkdkvLYhkfHdz+7eEoGrNw
	 JWl8hgW38bD3aGPf6gALeiEGeyty2hhssYeiiIU+RSKQ2YQZftByf/7Eli+8Pe3m+CQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JMiVH64u;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792101161;
	bh=xbtVYgjj4yIAXeyX0KTxeo5nlMoSrXul8jC+7Cyk2/o=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=ESRRxdy41cNPtw+qo6jw09N6jkULSBCNzzcYO18eJd7VgZPUtwdKo77ikx/lHjSoJ
	 XWtJoVXs6FZM2BIwXuD+lRKTYHdZDNe2AMpck4XF//qJQC3C1HM7x5otIEbgqErRS1
	 uUonhxZBkAkmZ6+0Jm55rWPXd8UnICAEeWPfC6F2EL2KE0czyK4lSRW/eSbrw/wS3V
	 bMboTPyQblC5SKBrdBCJrH5tg498R1PJJjciy5/gKW0r5b1iYY3OZtvh/kWTeD5o3m
	 CLdfMc149S/pxz4r8uAkzTPASa32mingCvNj0VX7Y9yWt9roQRmRrxZ+5jUfRIxT1l
	 9a13yJQYAcBug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8023B60B07;
	Thu, 15 Oct 2026 21:52:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 94BDD332
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 928C360ACF
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 47gcJ9-vWsOS for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 21:52:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 87C2360ACA
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792101157;
 b=pgqTvImdu7dS9BcTGrIiMt0ReKEjq83f5wjNbxzunizLfAha+cZS7BlV6L4CpAldIFDW
 nMWFpPujJ8RKV++VkRaC8QFGTEvAWmzefuC2T7HWfgJWub9c/keSdG5DUOHtZDiQbIcSt
 SrzkDTWnmoRBLRl7PXr86m7OHxdX31FJviuCg9SeiknHj8ceyPnr8zx+l1g8wFv0WdiC3
 RmRx/46R1Lvv1Q615+En41h6NhFXBMisoiQ46YY142MqVgTrfpRk3SZQ5mse6Hc/5mle8
 Qngz/qI+9Jp+uR+Y3wEE37NG8flSpedgjYAPByEkCtKtTXIcWG1o9/KLjgmK6nosZfA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792101157;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=bAKKvNUOzDh/N0AVRMCvuBG679caGiuW19L2Ur7fGkM=;
 b=EDGfpYeBsfYheT2YF3mLz1RlNPK1HAquuqwsDfzql0OmZPqCE1zp4l7ffQHIRKXoLVy8
 UMNfJovxf2lP49IUDi9l5nOrDnTUyHO392j7FdcuS1ENUS5u+jxqxeLHiZljtGp/bZE9F
 QwSqSt2zLBwEjtRv4rgxO4wYwbZYhUpGsvg3vji4b5rzQs272M3ztpdheTc6456W8TAZS
 pMO+BnC5yrmBoJGlU+cajANocW9Lom9dMlgSqQs0BJki2/qsm6ZM/TQ2wrSoR9ddgCkY1
 TwfbXS4p+IhYsQrG69VMUJEGjaOHs8clF9kRBmjuVq4AwZs6Cp3hs9xkIcZrxWT1SBg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=JMiVH64u; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=JMiVH64u
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 87C2360ACA
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:37 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-8198a3a54d7so477022a34.1
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 14:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792101156; x=1792705956; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=bAKKvNUOzDh/N0AVRMCvuBG679caGiuW19L2Ur7fGkM=;
 b=JMiVH64uNgSGtfBiM+9g9Y5m13ZacQblsE64KcJD0uTGw0TPCCH5O5T8r6NLxB4BbV
 C98rlmD+KbmGNxCT/qRpxqZQp6ZMYcMauFrfDUOboQP+hp0hxlXRCt/VObWc5Gh88n3C
 g5XxQ4Eg16cdqbeQTUh0E/mNrMXrAytkYb5wBvRAPvuIx+R/+XrSakyKNz4JBye9+09f
 GwPMT5T+G1yV4l6TXKZVDXjio+bDD3kCuTWdi/OmQ/TW0eZJ37KZTD+r/uCdX6nE5/q4
 BIHppHp39J67z/Spqw3aQ0GlaxnjNp2NLbI/JjvB3rs6ILHVPaxWz3VwmWVYf7qNud0a
 +ZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792101156; x=1792705956;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bAKKvNUOzDh/N0AVRMCvuBG679caGiuW19L2Ur7fGkM=;
 b=BBz32uk12Wo/x955VWEAiyiTd3V42ZJX7Z2V2GmFQfsR67IRRyszKhA+eCWeAvrSIU
 JJnalC3Jp4X1DMiSwxzQE96vSwEZn03luygGSmVci4M1n1PYdbrlnOPMgz+Uf4ZnDSRf
 faMJ+AmFlmtWzgSTYdV7r+iUrLI+ujDOdq2rgWCSBdykJbxyWyQdoIledMqeTHveNN/e
 0aakfeIFlrHyboBfApM6C1BsEzhggdQLAVWieRDFs5H7sCBl2opnr7uJ3Zi4u7tm4Pre
 36Ou4THypByujjqwW+Ti+AEt312wXpxp5pZN26zvfZZWKka9BbnUMlLCP/nWKYIgRa5U
 WgCg==
X-Gm-Message-State: AFq9FYI3O1NJjGh3VfCPHY7LvjjpN+cd3fGe/RpVWNNY8hp3wFm++ku6
 RlQ9b0MyZ3d3zp9O/3K7zv0otZrG7BUz2OQ4fDjxjqbRxz81Erdi47XFTzs0vQ==
X-Gm-Gg: AYBFou0xpVWzSosHWrNT1CqkFJEirQwsoMligDZRcQ8rHKSiXPqK0EQ/E9tHtC9wwwN
 x1CIK3UI2VLgvtTWTIFl3Fx9DpgAiCuyi7E7XKUM98t35cacbllmne6emeD2FUn0JBD/Uq86pAN
 sYIIkqpNr5HJNfO3Fsv1j0E9gkcDgN8huzL6bXloUZbuMgYdqMqnPgFMVugyZO6l5n2QrUCbsv7
 HdNGA8X7HAw9Wk5TeKFFf37b65pttaQSnI0GbcUvzE0P1FoZzcY7xAGEEMPtpcjPTZDz7s9Zzvb
 LmbV3Q1deuG+IV8RYWL25WXoTyW9HwY0jsbqryXnQzIoAOPLpWnpK7d1DqX4HBFkIwOTOBxGyd9
 ZKQgehNUDpMdcta88iZBxX9LNV/ukHDgFZaInWGqxecNvNtn84tkAGXYgndhnEocdZVo8Kc1OuR
 fP7J3puCMJXXYbVWAWttv2rSZ1W+uS+FfBfQ3jnk177lr9Ls3+rDUJD92juMPtHvIkpCWSXH43l
 2fp2YqHCkFUXwQ4zcGi1lkbMnhi74S3zfx7jda7TOnyhZK3HCBP3xt8wuA7/PWN+/cg/EBGKXF2
 SFGxAojH1Bo3hLGdczwwDtNEIobL4mlgGG5vEB2/1jAXraNcMkXKAr4OyWZPBS8fUM7gyh7lFh/
 01yYfc43/n1v41hiKtdGUvHyTdS7v0ErnJfZM1K2Nc5s=
X-Received: by 2002:a05:6808:c20b:b0:4d6:9133:cfee with SMTP id
 5614622812f47-53703a7c709mr985563b6e.51.1792101156332; 
 Thu, 15 Oct 2026 14:52:36 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-53874e0e65bsm145114b6e.0.2026.10.15.14.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 14:52:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:51:50 -0600
Message-ID: <20261015215210.3426895-14-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-tortoise-orm: bump to version
 1.1.9
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-tortoise-orm/python-tortoise-orm.hash | 4 ++--
 package/python-tortoise-orm/python-tortoise-orm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tortoise-orm/python-tortoise-orm.hash b/package/python-tortoise-orm/python-tortoise-orm.hash
index a1652f92b0..141b050658 100644
--- a/package/python-tortoise-orm/python-tortoise-orm.hash
+++ b/package/python-tortoise-orm/python-tortoise-orm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tortoise-orm/json
-md5  d31bc68389936220db65f389df34ee7b  tortoise_orm-1.1.8.tar.gz
-sha256  09e27be9db148824dacea470d01018ab571676f94aa5428a05bcaec44c413ec7  tortoise_orm-1.1.8.tar.gz
+md5  eba6c5e1097d36f4b03e00e38fec8e60  tortoise_orm-1.1.9.tar.gz
+sha256  0399e1aa9518620f8b9c455598ac06ab890332c03e335cfca4b73b48d4e6abaa  tortoise_orm-1.1.9.tar.gz
 # Locally computed sha256 checksums
 sha256  f955d347b975d5867ee364f978476b3012878a706d468571b9758cac74de6041  LICENSE.txt
diff --git a/package/python-tortoise-orm/python-tortoise-orm.mk b/package/python-tortoise-orm/python-tortoise-orm.mk
index 927d8fda97..678a2af8ee 100644
--- a/package/python-tortoise-orm/python-tortoise-orm.mk
+++ b/package/python-tortoise-orm/python-tortoise-orm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TORTOISE_ORM_VERSION = 1.1.8
+PYTHON_TORTOISE_ORM_VERSION = 1.1.9
 PYTHON_TORTOISE_ORM_SOURCE = tortoise_orm-$(PYTHON_TORTOISE_ORM_VERSION).tar.gz
-PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/10/8c/059f284ed7a08e9cf3a45973e2b9d013a8f242fbb1051a06c3d60c638920
+PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/b8/19/b26db2d0cc5599715e15409ee63af51b4d637faae21a98fe26d58354ac2b
 PYTHON_TORTOISE_ORM_SETUP_TYPE = pep517
 PYTHON_TORTOISE_ORM_LICENSE = Apache-2.0
 PYTHON_TORTOISE_ORM_LICENSE_FILES = LICENSE.txt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
