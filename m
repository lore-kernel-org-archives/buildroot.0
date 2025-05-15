Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7D5C2D0CD
	for <buildroot@archiver.kernel.org>; Thu, 15 May 2025 12:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0D836115A;
	Thu, 15 May 2025 12:10:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E5ZsdNu9ipbW; Thu, 15 May 2025 12:10:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 309EA61183
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 309EA61183;
	Thu, 15 May 2025 12:10:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 769D3119
 for <buildroot@buildroot.org>; Thu, 15 May 2025 12:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 381BE41516
 for <buildroot@buildroot.org>; Thu, 15 May 2025 12:10:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v4k9aQPSpCqV for <buildroot@buildroot.org>;
 Thu, 15 May 2025 12:10:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 47FF14155A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47FF14155A
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 47FF14155A
 for <buildroot@buildroot.org>; Thu, 15 May 2025 12:10:40 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5fff0cf071aso97304a12.3
 for <buildroot@buildroot.org>; Thu, 15 May 2025 05:10:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747311038; x=1747915838;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ju2QNLUwvX3c4opK5dukCIH11MKN+qs1nzZutkqLv7A=;
 b=rLnPasRcd0Y/tBPFFg52DESEeE0e8DmYE24E56yO/w/uJSjGSsigeUiuby+brtmrav
 fq4a/pqiYNzuzUWuGdZEzmZBP7sYTms4ZW62W6qmwxP6lqwhT87VDMz0IL0+lRdFnfjf
 owh8aTyTv+nL5hqnjYANGK5D+wSpZOD+8/AhL7LaCKbB19ivsXRbdeFPuU4jyU0kb8JT
 FUn7EuhuwWbLh6mC16IEK1QxKIzJIKSIdvCB6bgkw7wyUyHq6vMsiqUvJ0ghKboPWVvB
 RiOGqsfy3dFTY6SuHhfJUBrqBxdQ6KJXfk2JXztY72PF0N110Pk67Hns3SkyqcHe+gb2
 1nZw==
X-Gm-Message-State: AOJu0YxagMeRBBdCuLS8PQ2X7FF4ASM3opbrPBzZvmT9tpdDvHZNdEwv
 YIt3HEuWBvr3aPvFBFua2MIqsceg/LwQSTqGyWKUbPpejs5acWvTy5LLSLM5N+kV2bLozsqofoS
 w
X-Gm-Gg: ASbGnctZt/T0DlAXGlJBEcKQCPt8aG2QYdUIE2TS1rUWMiGiLn7zGT5p7IEqa+pArCy
 Hs080FIP/ju+peNZ1Yxh4UsWrDMIaLrsxcV3rSvG94n+e8t3BKj+1c2O8cfkHEu37wrDcCJGnHx
 5ocQMqpqnHJjiXR8aVEYqAbx9Kv3sRgy/WLq9vovQrnl3xZGafpwcI4ye2qGM+DFPjwJV03EeLX
 YV6ZlhHWD3niAxuoSMEiGwDNz3eZmdJOenql0KS8AMvILCJWcL3vL+CmyZlFBo/NQ2E2QIm1eBA
 tUQC4AmKH+wroB9DbZiwLx0Gr8upPxdg3K9jGi0ygUo0qNo3trlL7vH+0tnILKldVp5qkBXjwCy
 Jkw3pn25fJFmbUEH8wCFEPsD7uhnmAxq4lCVnAkIQ6jrrkVsA47x/QDfnoOXjprkZO6vSoMuwPY
 9uR+l1CWczNROFnd1DT0zD3yWfFx+pbiA=
X-Google-Smtp-Source: AGHT+IHzZASv7S/jzLS6oy9YYlB62iGYZHxiiykLg8iNnn5MzwYD2imzjlnFkOUihnUyv2ucQeJXIw==
X-Received: by 2002:a05:6402:5210:b0:5f6:d42b:d604 with SMTP id
 4fb4d7f45d1cf-5ff98898a5emr2446730a12.1.1747311038006; 
 Thu, 15 May 2025 05:10:38 -0700 (PDT)
Received: from fedora.amarulasolutions.com
 (2001-1c00-8182-4700-cf31-04f3-d898-af42.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8182:4700:cf31:4f3:d898:af42])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fc9cbe523bsm10218214a12.12.2025.05.15.05.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 05:10:37 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 15 May 2025 14:10:23 +0200
Message-ID: <20250515121027.561571-7-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515121027.561571-1-adam.duskett@amarulasolutions.com>
References: <20250515121027.561571-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1747311038; x=1747915838;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ju2QNLUwvX3c4opK5dukCIH11MKN+qs1nzZutkqLv7A=;
 b=c1dCUj8/gcYgFU3n+nBu50tTTzKRw59ARXw8vPtUEs4eFWR8Sy79eM8EEC0Jftyi1W
 8tdkkZo9EsW08Xv1k1dm9bI5YNDduJA66mTflsRgS6a+sHvat+4Z0NVVZHI8OI+0DwhJ
 UQ3D5BpNsX826bMQ0kms8kZ6XhEjRwRKZPYzo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=c1dCUj8/
Subject: [Buildroot] [PATCH 06/10] package/checkpolicy: bump to version 3.8.1
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
 package/checkpolicy/checkpolicy.hash | 2 +-
 package/checkpolicy/checkpolicy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/checkpolicy/checkpolicy.hash b/package/checkpolicy/checkpolicy.hash
index e768a80cdf..ba33165685 100644
--- a/package/checkpolicy/checkpolicy.hash
+++ b/package/checkpolicy/checkpolicy.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  fd3e1925477d49946d1116938661af44c1f86f0d681466fd9f02eaa06002a07f  checkpolicy-3.7.tar.gz
+sha256  7b477c516e2693d8b6c511386323177f1d7db51c2e04eb6d0de8ca2b36120e5d  checkpolicy-3.8.1.tar.gz
 
 # Hash for license file
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/checkpolicy/checkpolicy.mk b/package/checkpolicy/checkpolicy.mk
index adf125ebf8..8c094f23a5 100644
--- a/package/checkpolicy/checkpolicy.mk
+++ b/package/checkpolicy/checkpolicy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHECKPOLICY_VERSION = 3.7
+CHECKPOLICY_VERSION = 3.8.1
 CHECKPOLICY_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(CHECKPOLICY_VERSION)
 CHECKPOLICY_LICENSE = GPL-2.0
 CHECKPOLICY_LICENSE_FILES = LICENSE
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
