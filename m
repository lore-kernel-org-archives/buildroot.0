Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E212C83F07
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 06:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA079408EE;
	Mon,  7 Jul 2025 06:05:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sb87uDHkgNcQ; Mon,  7 Jul 2025 06:05:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3BEE40899
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3BEE40899;
	Mon,  7 Jul 2025 06:05:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FEA815F
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 06:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 260B7608CD
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 06:05:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5he3ZkZy-MI0 for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 06:05:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=michael@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1FF44608AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FF44608AE
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1FF44608AE
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 06:05:19 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-60c4521ae2cso4698422a12.0
 for <buildroot@buildroot.org>; Sun, 06 Jul 2025 23:05:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751868317; x=1752473117;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5CvjIc8wwNS7NftZ+LuBNecOArltM9EriCF/hmOvanA=;
 b=Ur3W028jD6wOD5L0fp6kfT+meSfxWkvyKMNpACK6JGcGgQk+3XLUk0FZVKIJsZGLse
 4lzVARVyan7yWe3S46gM8PeH2ZHDYHywH0D7/945FSOxUhQKX/dKkqcPSnUtpUgl5Vps
 gtpC10EEvzr3OZ/vWVhwzrtaltHMW8Hg2vvJY7GoOjecLJfqU5JOcOZp5rntXSQ7JJF3
 BU+dVCFvpxPF9PEJl3+bL7snjuqWRrZqffEZHj+PQ7b80DiPmwMEYI0RZuB7fH0UdCpE
 KuhSWFyQ6HK3p33i5ZzTKPmFZFK7eiQQvUakleo2Ijct7+NrzVtzj8PO/SUBSPDVFfnC
 BRmg==
X-Gm-Message-State: AOJu0YzzisDb1QpkqlXlITys4stgk+YKuHzw5sbbrkgKO2OBcth3BHAe
 mVLmXz9AnXwonPf1ofdullfHClYpmM4EseBDuAd0qAHvnk2VwjFe/Ra3ZkIsuQ01MXq/gZ4mnjb
 7TAw7yZs=
X-Gm-Gg: ASbGncsw/dFq3qskKP2VJjweCSD761eTRYHy96PFcNKAXXPaGe8aE4HZicMCflvObln
 HdeF07DxdRDepSJDOtzDaZSdZEydf5cF5PHXQUUHOxesxWrk1tter6MLAeB5r/jgecD1kDTnFyI
 tJFn0AuerYOygnTNnDieCLix89YnyjcSb8ecoJhtaPR5i5HEOGcr+Q6CHHuCv+eA2r41kDODwJj
 I55EweGSqLg7i0HVU9lpD/9m/LGF/eOJljwk9/CtHjGOFnWleKuf0ue2GQNOgvYUIMNPRWXAR8p
 uOoIf/NWNt0RIKQG0lix7C4IY14GYROSzR7HN0qLF18EMzvph5VyMqm7Wm8BD7WorYMgmrQJsQ9
 RKehdogpDsaykQkOXDgEq
X-Google-Smtp-Source: AGHT+IFOJJAP4g8pEUzqy7JaHWCY3B8rgfAxt9dQwAGgYJWDqaAfgTMOV9SONOPs/5fa3eyWJ4FxmQ==
X-Received: by 2002:a17:907:6e8b:b0:ae3:6a82:e6a2 with SMTP id
 a640c23a62f3a-ae4109d3093mr681171666b.29.1751868317519; 
 Sun, 06 Jul 2025 23:05:17 -0700 (PDT)
Received: from panicking.amarulasolutions.com ([2.197.36.176])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3f66e6f46sm632882266b.5.2025.07.06.23.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jul 2025 23:05:16 -0700 (PDT)
From: Michael Trimarchi <michael@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  7 Jul 2025 08:05:07 +0200
Message-ID: <20250707060509.617632-2-michael@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250707060509.617632-1-michael@amarulasolutions.com>
References: <20250707060509.617632-1-michael@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1751868317; x=1752473117;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5CvjIc8wwNS7NftZ+LuBNecOArltM9EriCF/hmOvanA=;
 b=SyCTrsyWSSmbP5PzgXwnBd7UYqP0C2jAZs8Nab+MoguYgBTraBxlLaJ8BiSfM1LDqX
 JkWrzVZjcG8UtVQuUftzjX6n1h+OmkS5PkOeQq2BDffVdl/ZWR1uCQOvWBOZOB7ig/XP
 WG1oe9t6R2MWOdKsGGDyfmKFMWd1vu4tl86fA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=SyCTrsyW
Subject: [Buildroot] [PATCH] package/python-spidev: bump to version 3.7
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is just a minor upgrade for fixed deprecation warning

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
 package/python-spidev/python-spidev.hash | 4 ++--
 package/python-spidev/python-spidev.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-spidev/python-spidev.hash b/package/python-spidev/python-spidev.hash
index cd8a24eb72..9dabbacc40 100644
--- a/package/python-spidev/python-spidev.hash
+++ b/package/python-spidev/python-spidev.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/spidev/json
-md5  83a73279d6e823a9030c4315577bfae3  spidev-3.6.tar.gz
-sha256  14dbc37594a4aaef85403ab617985d3c3ef464d62bc9b769ef552db53701115b  spidev-3.6.tar.gz
+md5  3074b983c687b1ec3a80833a7508642d  spidev-3.7.tar.gz
+sha256  ce628a5ff489f45132679879bff5f455a66abf9751af01843850155b06ae92f0 spidev-3.7.tar.gz
 # Locally computed sha256 checksums
 sha256  510129bc8174c0fa81fa6d653691d1bd5d3555f7f38979ec45b5fc5bbff5377b  LICENSE
diff --git a/package/python-spidev/python-spidev.mk b/package/python-spidev/python-spidev.mk
index f48b5b0832..e93871c745 100644
--- a/package/python-spidev/python-spidev.mk
+++ b/package/python-spidev/python-spidev.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SPIDEV_VERSION = 3.6
+PYTHON_SPIDEV_VERSION = 3.7
 PYTHON_SPIDEV_SOURCE = spidev-$(PYTHON_SPIDEV_VERSION).tar.gz
-PYTHON_SPIDEV_SITE = https://files.pythonhosted.org/packages/c7/d9/401c0a7be089e02826cf2c201f489876b601f15be100fe391ef9c2faed83
+PYTHON_SPIDEV_SITE = https://files.pythonhosted.org/packages/b5/99/dd50af8200e224ce9412ad01cdbeeb5b39b2d61acd72138f2b92c4a6d619
 PYTHON_SPIDEV_SETUP_TYPE = setuptools
 PYTHON_SPIDEV_LICENSE = MIT
 PYTHON_SPIDEV_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
