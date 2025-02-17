Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB29C021A0
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 11:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BA2E40E0D;
	Mon, 17 Feb 2025 11:20:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u_pCH-1X7Mkp; Mon, 17 Feb 2025 11:20:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC70640DBB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC70640DBB;
	Mon, 17 Feb 2025 11:20:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EFDEDE
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 11:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EA9040132
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 11:20:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FehwpnqZ8YhO for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 11:20:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EDE80400A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDE80400A8
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EDE80400A8
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 11:20:14 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-8558d9ca0b5so25022939f.0
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 03:20:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739791213; x=1740396013;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GYhAc0EGWp6Uujv9uOBygy/RTPCoH5kDDhPl0TxhPzA=;
 b=N3lObsn3IcZsMybvHpmt1W4dmsTAiSo85NeiI1tRwAxxDmEoDDYuNoYds2qZobuQFP
 5QBW+DsOQXPNKuePZU9XmYd24DDm0PMOzVkwIhrvs8rkPAs+7wzcK+4Lgxm/VygwTCSy
 s2RxqGz4Nqdm4EMVBiJ9sElXxj3hvGAgbv7aFhtsMt5Uin4Mtstovf3faCbd0hmaMwaa
 pr6SnoFmLjICWir1R2reN4DL+FGSybadnHdmMIE+mRlSbsYksFjb0topr2MWTmwMqI4J
 X0XS1aOp23CIPP3NorZESgzDNKGiMtF9O1kogxL+sTqv4Pv3oNfBeiD+S8d7PgtAWGID
 KjVQ==
X-Gm-Message-State: AOJu0YzSYHiI4afORkVGt0WIPik+CAvpoTsdLHuz5jHyzysU1A0YhXw5
 UUSFj5Rdtcg3SKgQIWnTbo/ySYkhDngCXruOuqaOshUDqXP0Yvo+5wYP6A==
X-Gm-Gg: ASbGncsqvfWVYb9LZnb+Z3C4exsKbdAxrQk1xUqNeEk4RWll/3OXhYHlF2AE6P3pX3B
 rfUUmupMM0UB7g9sVYEc4cOPZKrhqoYmEN5kW7Ame4bhHck4bwJkhHtEAx3IcxyARhURdJ/3O+3
 lTACmCwtAAKUVY7tDlclvfBj/vtdTpJB3wMs+Z83y7eJ7aY7hpYcH1R74dR67CzepSq19FFcJTG
 88+husOmwPdCviqaoY8ZWsmmr3lBNd+HkQv9TRTnxwHGhnv9N6AZVwt5SS9oRJevVfPfQ+V3YEl
 tIQlnAs8ZquBxHyrituO0yAi+RPCJRB+PDW0rvqUV+745zOxBoJLL5EprhpUeXIwSQ==
X-Google-Smtp-Source: AGHT+IHlWd1SyHUHyTwh9GVeT9jbZwLRYYDT+MyfpoE46dRnVsGEKdhxv1xDz9WqSY54mw289sYblQ==
X-Received: by 2002:a05:6602:21cf:b0:855:a13c:fae7 with SMTP id
 ca18e2360f4ac-855a13cfd16mr245339f.5.1739791213539; 
 Mon, 17 Feb 2025 03:20:13 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4eea0309692sm284048173.22.2025.02.17.03.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 03:20:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 17 Feb 2025 04:20:11 -0700
Message-Id: <20250217112011.1853079-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739791213; x=1740396013; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GYhAc0EGWp6Uujv9uOBygy/RTPCoH5kDDhPl0TxhPzA=;
 b=fQiAxAWJApzo7UPK+Qr8VZN0MqjYgKw0xDSuB38mVyQIkenJbvxI2gbpHK/RUUw70V
 KVImIlQIh3euvz824v87H1/RpsbkcU04aFQ35+CbrTNT89FlBy/djCz6MR54G12MREgY
 vzIcrXsmsad0ef9E+Hwr4PxrMwjJ0M64VfhIK+wVazzQoIVihBMIlnyVLjcuYpfx19zE
 6m5+25hAoORNyzJFwWFEZbAyMgrafKjVOqIdWMf51bAUjTfPPcC7Oc9ZptLeRB0pLuFL
 adeKcEDEJXShMKa68tyNd2+vfxtwwxQKAutamCnpASgzHYnTFEk5WtVfAdfYsnEk66jb
 /1wg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fQiAxAWJ
Subject: [Buildroot] [PATCH 1/1] package/python-weasyprint: bump to version
 64.0
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
 package/python-weasyprint/python-weasyprint.hash | 4 ++--
 package/python-weasyprint/python-weasyprint.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-weasyprint/python-weasyprint.hash b/package/python-weasyprint/python-weasyprint.hash
index 0d39d55aae..9c51ad95a3 100644
--- a/package/python-weasyprint/python-weasyprint.hash
+++ b/package/python-weasyprint/python-weasyprint.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/weasyprint/json
-md5  219b0f3ea8247e97f16477d509ee0f40  weasyprint-63.1.tar.gz
-sha256  cb424e63e8dd3f14195bfe5f203527646aa40a2f00ac819f9d39b8304cec0044  weasyprint-63.1.tar.gz
+md5  9e87ec00619aad446c51f679117be676  weasyprint-64.0.tar.gz
+sha256  1ceb3ea6306db4a3d06df0eafae3a5a6e879c35c40091aa8ceb5bcb143e80b29  weasyprint-64.0.tar.gz
 # Locally computed sha256 checksums
 sha256  bfd14eccfa6100575460e685556b183399d4bd335904e3c9521b0116d21c54da  LICENSE
diff --git a/package/python-weasyprint/python-weasyprint.mk b/package/python-weasyprint/python-weasyprint.mk
index 583af799b1..7edb9f28da 100644
--- a/package/python-weasyprint/python-weasyprint.mk
+++ b/package/python-weasyprint/python-weasyprint.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEASYPRINT_VERSION = 63.1
+PYTHON_WEASYPRINT_VERSION = 64.0
 PYTHON_WEASYPRINT_SOURCE = weasyprint-$(PYTHON_WEASYPRINT_VERSION).tar.gz
-PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/2b/f0/1ac7d241b8cabaaf047278ef67b64869473a4e0a2218a1cbc0a6ffb0d8fd
+PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/e3/04/c73f99531bce81d4ced5cd18a159855de261f83843a5633acd67ae327933
 PYTHON_WEASYPRINT_SETUP_TYPE = flit
 PYTHON_WEASYPRINT_LICENSE = BSD-3-Clause
 PYTHON_WEASYPRINT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
