Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE9BE6F064
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 21:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15A9081195;
	Fri,  1 Nov 2024 21:05:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZGYnJJAsaRog; Fri,  1 Nov 2024 21:05:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4578F81157
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4578F81157;
	Fri,  1 Nov 2024 21:05:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EA2A27E1
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 21:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C11F606E1
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 21:05:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SLqczLqZtMo6 for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 21:05:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12e; helo=mail-il1-x12e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1658B6060C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1658B6060C
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1658B6060C
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 21:05:01 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-3a3b0247d67so8464295ab.3
 for <buildroot@buildroot.org>; Fri, 01 Nov 2024 14:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730495101; x=1731099901;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xef1c+9hGSHxZDe+LGv3Aq1ZQllUNDgj99nnBqD1KDc=;
 b=wNTqV7qCIEjA6ATrHv1P4jm2UYevRCG3INZTJesxiwSZ5X1IcM9yOePtdsBD0XYXgD
 KK+aJmlDpfCnLJsEC4lHj1MYkPViWXNMJOYmMKYdT4XUAnb5WO3oRhMUGL1KVPTPpMiv
 DNYAW7dcHALdEHAxUbYAhwwBhRbcc9JYPfqrJUhxWASfpR3dUbTYgXCqi3hKB2deKeys
 +VIvtW68sZLlap2lBTN3W7YvcjskgCMsVhJmi+gR3fAjgGMZgC3pYjcrkzy8E+rR3rpc
 y3S4S94o1SEkj3A2dO4/KBjbSbzaT9RXWwrSU2sVUI0/VHi+Yj6IUeiUwnRsdn+hafZo
 mREg==
X-Gm-Message-State: AOJu0Yzi7fSpP0Qjxss0Fj4SLT9WkojXNR4QieTx9+foeuqKq8IuJuXp
 2Lp/69eTAUgzqhmgX3ChQLJ8xwrPQMAckK2AgJrOVE1qw9RcK5WIyLCJoA==
X-Google-Smtp-Source: AGHT+IFqbBtsFg0/9Q0xjPcFAxxMHGiad7LR1AimVR6L11tXHh+hSXdZ3GE2/31PNtyzxqeq0ij8NQ==
X-Received: by 2002:a05:6e02:b41:b0:3a0:a311:6773 with SMTP id
 e9e14a558f8ab-3a6b035dc3emr52849325ab.21.1730495100849; 
 Fri, 01 Nov 2024 14:05:00 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de049a3159sm895167173.129.2024.11.01.14.05.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 14:05:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Nov 2024 15:04:59 -0600
Message-Id: <20241101210459.1292235-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730495101; x=1731099901; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Xef1c+9hGSHxZDe+LGv3Aq1ZQllUNDgj99nnBqD1KDc=;
 b=CMJ4Q0kty+0P4dO+fWSY6OfSwKWAfOcdUL1wQ90SLdAvJ8xWeBcdqCRBYKwqh/C8Dm
 rLMf2fGHuSBps8q46xqPWEmJ5FXAQrdfyXkfDnujgSKk1c7lnWFJwGNSnLrD5e4flh3v
 2yM1nnhxLitUs3DbljNDzNFUKv/cvI8kLo2qDCtPvf3M4IprshFv6KEP00N5EbvtZzcV
 uXjcN7Pp7bZSMVrDOlnKYqM9syT7CGczp6N4EEZKjHfR6+RMEnnBSFGYrilAG4mr3Uz7
 sRt7q/lqrsUlGLTDvT4xvK2Zmh2W8IkgBC1igEAwmuAwVidmMoP62YkRtxp9KckO91hB
 8I6g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CMJ4Q0kt
Subject: [Buildroot] [PATCH 1/1] package/python-selenium: bump to version
 4.26.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-selenium/python-selenium.hash | 2 +-
 package/python-selenium/python-selenium.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-selenium/python-selenium.hash b/package/python-selenium/python-selenium.hash
index aa492248a5..c3dd0879cd 100644
--- a/package/python-selenium/python-selenium.hash
+++ b/package/python-selenium/python-selenium.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  2e801325943bae1ccf4978b76e25f539d2e24d5765891be20d77d117940a9674  python-selenium-4.25.0-cargo2.tar.gz
+sha256  0c7bbef3f83aa48e1786ecc089e8d6a23c35164e7e9b02917697eca7a23628a2  python-selenium-4.26.1-cargo2.tar.gz
 # Locally computed sha256 checksums
 sha256  de658a7d3761e92b471e2f630ea99eeb3389b27820809b1e4853baabd5fbadb7  LICENSE
diff --git a/package/python-selenium/python-selenium.mk b/package/python-selenium/python-selenium.mk
index b317a83148..8f5f2c3598 100644
--- a/package/python-selenium/python-selenium.mk
+++ b/package/python-selenium/python-selenium.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SELENIUM_VERSION = 4.25.0
+PYTHON_SELENIUM_VERSION = 4.26.1
 PYTHON_SELENIUM_SOURCE_PYPI = selenium-$(PYTHON_SELENIUM_VERSION).tar.gz
-PYTHON_SELENIUM_SITE_PYPI = https://files.pythonhosted.org/packages/0e/5a/d3735b189b91715fd0f5a9b8d55e2605061309849470e96ab830f02cba40
+PYTHON_SELENIUM_SITE_PYPI = https://files.pythonhosted.org/packages/3f/b1/e9efcb88d5682e802cf03bdee4886f854d75bdb2859d1e72cb74041b4ef6
 PYTHON_SELENIUM_SITE = $(PYTHON_SELENIUM_SITE_PYPI)/$(PYTHON_SELENIUM_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_SELENIUM_SETUP_TYPE = setuptools-rust
 PYTHON_SELENIUM_LICENSE = Apache-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
