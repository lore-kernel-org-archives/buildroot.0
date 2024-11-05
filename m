Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE6CED3176B
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 17:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A08634054C;
	Tue,  5 Nov 2024 17:34:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vd9A5aUBQJT0; Tue,  5 Nov 2024 17:34:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E3A4402F4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E3A4402F4;
	Tue,  5 Nov 2024 17:34:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B5B5723
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 17:34:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C50180E01
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 17:34:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7eBeVEFoHFiw for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 17:34:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6BCF780DF2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BCF780DF2
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6BCF780DF2
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 17:34:28 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-82cd93a6617so190704239f.3
 for <buildroot@buildroot.org>; Tue, 05 Nov 2024 09:34:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730828067; x=1731432867;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uwh7BwWayOmm5awhsRzyd5EYOKtNjXNm3SUAYVGAI20=;
 b=IC86AeJQsMqP7VNNLjSCtxipAWP9ulir8FSaHCb4tJkrMHA7Tj/4eYJNv43HkCDvRo
 pBzWdBhCjGOS0lfkh57MNdZyz5ZiYaskusW/Yl24DgUNs9F4nHXDWmBX/tCD2vYyw7Kp
 U+SpwORwO4FGDPBt9u8/mUFvqwU9e0ROxFZRRQ6DZvbvqbplYcdnw9EjqBJHNejcL1Sn
 0vUPC1Gqx8z8CVuO4lP3hYMPI4N8AtYAtbXsChYGoxVV1Ed655aAbXgm1zDqFpmVe8+0
 6Pvq1/oAlmdU1ylITEOdz8O1945W8EoiORS96rpP7Y2LEBd1ZZlW8XT44cCZdcGDzZrl
 ghvQ==
X-Gm-Message-State: AOJu0Yyc8xbs6JPUBPIkfX+XXr3DGQZSuSBweUrJa33fAEGhPGStml+/
 Aqoim5GsHLmpmFvJhr7Ekn6B8hRinnl67tmaqHg6JEFN5AziPMxdwMlN/A==
X-Google-Smtp-Source: AGHT+IE4h68oAKIkIbosMvgNVlE+lxfAHxov0EqfJ7i92LXsd5oOF5sPjHt5Zf0/D9+V1vEUIkEkKg==
X-Received: by 2002:a05:6602:6420:b0:83a:c4e1:7d69 with SMTP id
 ca18e2360f4ac-83b1c3b78c2mr3644560839f.1.1730828067114; 
 Tue, 05 Nov 2024 09:34:27 -0800 (PST)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83b67c7ceaasm274944039f.35.2024.11.05.09.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 09:34:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Nov 2024 10:34:25 -0700
Message-Id: <20241105173425.1393747-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730828067; x=1731432867; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uwh7BwWayOmm5awhsRzyd5EYOKtNjXNm3SUAYVGAI20=;
 b=Um/1ufYGeXmtrd0CLrbyNchVE2vUIwR1kvZ2lVchTpeiwRbDe1h87Tvlp6bAEn5uUm
 qrjU9cQUjg7PoifAwSrqlzVkPiQlSvxjgcEJ8bMQAbLMZSvdXr8W5K0HZJl2W1NyQYhj
 sXHZYtka/45kV+V+Aj4qqqKs5wW/lVKnx7UQXO/IVw/14tELNFN/gHDOitNTud5yK0VL
 OSA6qaEYntHRo3Ocvy3jC5gZD8i6etvG0kN60CSMvgqEFbQ0ytRGyphNTWMI2VhJlWMW
 qigDGL7jvS3Pi3/TsYx0UUxBhddsw4LS0DakU+K1Bvvjxw1BRuloI1bdPo1t9o0u8uO5
 t32Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Um/1ufYG
Subject: [Buildroot] [PATCH 1/1] package/python-pkgconfig: use poetry setup
 type
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
Cc: Romain Naour <romain.naour@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the new poetry setup type which automatically pulls in the
host-python-poetry-core dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pkgconfig/python-pkgconfig.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/python-pkgconfig/python-pkgconfig.mk b/package/python-pkgconfig/python-pkgconfig.mk
index 239dd90a5d..fc7e8273fe 100644
--- a/package/python-pkgconfig/python-pkgconfig.mk
+++ b/package/python-pkgconfig/python-pkgconfig.mk
@@ -7,10 +7,8 @@
 PYTHON_PKGCONFIG_VERSION = 1.5.5
 PYTHON_PKGCONFIG_SOURCE = pkgconfig-$(PYTHON_PKGCONFIG_VERSION).tar.gz
 PYTHON_PKGCONFIG_SITE = https://files.pythonhosted.org/packages/c4/e0/e05fee8b5425db6f83237128742e7e5ef26219b687ab8f0d41ed0422125e
-PYTHON_PKGCONFIG_SETUP_TYPE = setuptools
+PYTHON_PKGCONFIG_SETUP_TYPE = poetry
 PYTHON_PKGCONFIG_LICENSE = MIT
 PYTHON_PKGCONFIG_LICENSE_FILES = LICENSE
 
-HOST_PYTHON_PKGCONFIG_DEPENDENCIES = host-python-poetry-core
-
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
