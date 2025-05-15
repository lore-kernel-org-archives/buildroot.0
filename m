Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 411F0C2D0CD
	for <buildroot@archiver.kernel.org>; Thu, 15 May 2025 12:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1306F61197;
	Thu, 15 May 2025 12:10:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dt4DAIokY3Yr; Thu, 15 May 2025 12:10:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6DEC6119B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6DEC6119B;
	Thu, 15 May 2025 12:10:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A86513D
 for <buildroot@buildroot.org>; Thu, 15 May 2025 12:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 468C361175
 for <buildroot@buildroot.org>; Thu, 15 May 2025 12:10:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QesA-cb1Qnvj for <buildroot@buildroot.org>;
 Thu, 15 May 2025 12:10:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3B4AB61166
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B4AB61166
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3B4AB61166
 for <buildroot@buildroot.org>; Thu, 15 May 2025 12:10:41 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5ff97e725abso158050a12.1
 for <buildroot@buildroot.org>; Thu, 15 May 2025 05:10:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747311039; x=1747915839;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nrtGFbFWa4J73a26l9Y88WFMBbqhoWH24fIA2eOSibQ=;
 b=cLB5U/50MIba0cXbISD2zSTY77iJ6e6tYhq23NhVUnBDssp9LCk5gOncZaVTfl37HN
 /QPah6cpG5cXttUusFsODeGrrzctlEoOx5Hi55h1bj2zNeTWgiILrdqb3oRNSdJewj9y
 oELh3A8rYHKBc/8+IUXIGDzszXAu7rn5g7f5dCpgLFEKZVGBIbOIQ+jHZ0zETvGMCUzS
 6xrLCEdYC3gZsBLRwiGbzz+i/lxlV5ms0Y8LmGTiI/SqxsZdpOiAfa1T05UWo1mk6H0T
 1f64xd1Y0c6Mv1TUu4tQlefhAgeS2F2W/RzDHDjSrDdSr4NvfJswEGdDonwtwuC0pJAV
 rmZA==
X-Gm-Message-State: AOJu0YyMHQX5p77y3MWUy7J1AcMq2h9xiTVpD2LvrxkL9DfokmU0bQl/
 pZW5S8IzGuBa+4Vbaegf5mJmtuU8VJWuEbX1KI7b6asxGIV4jcqV3wPgXgiENS1IjYUc67ChBNI
 T
X-Gm-Gg: ASbGncsBDq3UrccV+EEBTx5mayId8VZM/90bSqrKrHIjGSteBUo/sR0SgbVQGVVJ3kg
 pNnODAMMqTFbBw/TbFGMS33xMgWtdolNWy26cspyPFotYUlozsyzTz5HLnMwgiELJF6yVJugMG2
 wu9kKNHsq9msWg4N6wjePkzi+ul8rhTkCfgZZGr9UkG4t+/y72uxv/03uMZXjuGWEJJyKN/2prR
 1fMx0vjga1uz7CWVO+EGr55SDgGKr9YsN/0C81tFmlu7r9o68uQcJV1/am3a9uHCRLjBNAv3OJE
 0tr1qHHzewDBUeWe7FQBdE8k+jHv4bYyuCjlPZYMnlPz3xF36sNyfmksEBHS04sBhUCVnLMopgO
 3ArJvzVrgU1Kj0+oicjlj0Pti87Gsu2qwNshK9lnOATJ0v35DRwCrkLLdYq5EMS571en+BE/2Rs
 FmdMjUuApjrvRDCY0c9ITZ
X-Google-Smtp-Source: AGHT+IFtPMKaCCk/CfP0QQYdg4CNJrNKcA0b4Aty5EdnfIWqZmQbryqR9WJvT6cv/ZDnoyya5ffo1g==
X-Received: by 2002:a05:6402:3588:b0:5ed:c6aa:8c6d with SMTP id
 4fb4d7f45d1cf-5ff988dcc83mr2498986a12.9.1747311038993; 
 Thu, 15 May 2025 05:10:38 -0700 (PDT)
Received: from fedora.amarulasolutions.com
 (2001-1c00-8182-4700-cf31-04f3-d898-af42.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8182:4700:cf31:4f3:d898:af42])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fc9cbe523bsm10218214a12.12.2025.05.15.05.10.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 05:10:38 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 15 May 2025 14:10:24 +0200
Message-ID: <20250515121027.561571-8-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515121027.561571-1-adam.duskett@amarulasolutions.com>
References: <20250515121027.561571-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1747311039; x=1747915839;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nrtGFbFWa4J73a26l9Y88WFMBbqhoWH24fIA2eOSibQ=;
 b=fCdCeN+xbyfQi3ntUJ/Td295Uh5ClDDxsFtjUCwxMendQERBA0Z8oic1PxqIo0k7Yk
 3+9ZnvinSQhW1+LW97T4729Xvkq6zNsEOfeJrsvDb9MQHLtUNM2bNTBWxFNxP6SnGxkL
 OjjJxtxMAC9XQmxfV7gIeMEY++JXu2xK9uEE4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=fCdCeN+x
Subject: [Buildroot] [PATCH 07/10] package/restorecond: bump to version 3.8.1
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/restorecond/restorecond.hash | 2 +-
 package/restorecond/restorecond.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/restorecond/restorecond.hash b/package/restorecond/restorecond.hash
index 34847f28f1..2a55edc313 100644
--- a/package/restorecond/restorecond.hash
+++ b/package/restorecond/restorecond.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  4192595c08c775ff540f5ab850885ce11b132a4a4e29b65f20e751dd0a69d31f  restorecond-3.7.tar.gz
+sha256  164fe4825a9c65f3dd664f68fe252e67df72d4ea817a90d8f62ae0544bfb8ba2  restorecond-3.8.1.tar.gz
 
 # Hash for license file
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/restorecond/restorecond.mk b/package/restorecond/restorecond.mk
index 4624b9204d..f2618c20b3 100644
--- a/package/restorecond/restorecond.mk
+++ b/package/restorecond/restorecond.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RESTORECOND_VERSION = 3.7
+RESTORECOND_VERSION = 3.8.1
 RESTORECOND_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(RESTORECOND_VERSION)
 RESTORECOND_LICENSE = GPL-2.0
 RESTORECOND_LICENSE_FILES = LICENSE
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
