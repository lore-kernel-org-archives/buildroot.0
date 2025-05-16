Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6404FC3ABDD
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 07:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02B13408D5;
	Fri, 16 May 2025 07:45:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PM5GXb2kB6QF; Fri, 16 May 2025 07:45:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F30E4092E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F30E4092E;
	Fri, 16 May 2025 07:45:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3103713D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 07:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15B684092E
 for <buildroot@buildroot.org>; Fri, 16 May 2025 07:45:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HEK6XQA4rU0K for <buildroot@buildroot.org>;
 Fri, 16 May 2025 07:45:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 415F640928
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 415F640928
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 415F640928
 for <buildroot@buildroot.org>; Fri, 16 May 2025 07:45:00 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-600fca8930aso107867a12.3
 for <buildroot@buildroot.org>; Fri, 16 May 2025 00:44:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747381498; x=1747986298;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OvhfvDSMvEVgo7Ppx279nsF0MTMIYSSmyrIa7A1KVzk=;
 b=DcdScE0aRGlzWfzL42hHZghxNNIRNMgi7vv67Mm+7uRg1dktNotGx0L08NDQUc9QkY
 oaBIR4y85Avf4nFpmNuS3a7T+xi3+V4jqoRAel4qh6wbs23/3tvOPBGL0xM+sRfYDNIT
 EzGPYDLobl8bNUCS3rx4ucxc6CbSJynHjReGlrABvsGulRe1uCRkiYzbohA2Yg2K3uG/
 Mpw3dunkPbQME5x2m4aP+RtCSiDfbQeFlD56GRNNJR0ZwK1DmR3ccxH6KWs1BvzU88qw
 jnVp1lJRFZzd7q0y9jwU1nFeDJi4kCQzqrnqa/HR5+BazlxQ+3hRSu0aaOG5hXa65qSf
 Zbwg==
X-Gm-Message-State: AOJu0Yz1680Ap1VrY6NuGCCtgrAmwsq+V6wSb2CPwASYGRkDpCOI1VD3
 CDPEHjGBUm2LDNHpiYwf0cSz5htS4EiEdYqfiyR9653F6rXf9R9FG74Bc/9Jf9cq1V5ibmwQsdB
 XZTV21J0=
X-Gm-Gg: ASbGncsr8rdtXYavGIxM9laIKe4CUCpRgh9G5RezdHCtTBOEeYNbwZDXStZyrYQ1YKF
 /1kkeyB+CtiDcd6hE76nCVMyutxn4qf+AX1Q9AZanoyYPNlyJpjoOxRSgLu7FFUA5BAiImV1JEW
 jkfHYm/VQaUAYeymoqvT1i9rJAe8aWaxBcHgWoWn9WtIFASsakUJXnDPY8p/NnhWNokYxqV83Nu
 MZSmiFocTmZtgaYHWWcZUOMcZVxMuxX+MAI7FB4DIHP4JN0FJEWOS1mwbZIjhnP1FtBr8kxonqn
 716YiJ56mEp/ycrtUwPhWIoqQcUuf8zckmUPmHubmR4MdWDPdriqWxkzre1DpWQr7KmvvOSSObf
 yuA9lu0f1uOmf4iMnE2jdJ0BCMntgyTQQKvKjjz7M48pZz5GOjEcdWX2QFXXvQK9aNecY1H08/D
 53w5zyLGIUaiXNaeoXU5XNJemK9bdFMxo=
X-Google-Smtp-Source: AGHT+IG1Ke/TUuMPtQ4evZuxoHWUMWocob+nLlNHsrKjPgtbZPzo/5GXUjk7vUy1HYwrNQZoXxP2NQ==
X-Received: by 2002:a17:907:b13:b0:ad4:fd61:6154 with SMTP id
 a640c23a62f3a-ad52d428cb8mr68081666b.1.1747381497865; 
 Fri, 16 May 2025 00:44:57 -0700 (PDT)
Received: from fedora.amarulasolutions.com
 (2001-1c00-8182-4700-cf31-04f3-d898-af42.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8182:4700:cf31:4f3:d898:af42])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d4cc1dcsm109178166b.170.2025.05.16.00.44.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 00:44:57 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Marek Belisko <marek.belisko@open-nandra.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Fri, 16 May 2025 09:44:55 +0200
Message-ID: <20250516074455.1473051-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1747381498; x=1747986298;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OvhfvDSMvEVgo7Ppx279nsF0MTMIYSSmyrIa7A1KVzk=;
 b=nGozREBr2xD6lv1zCNVA6SCzjePb52fHEdEUn3NnuuL4yvCb8AgndwaaPjab2FAixW
 DMkWswBYQRzEL1mqnibKcXViUxv2Q/rh18rHxfyKwSZ6tocl1mR4reLtA+Y1VClbHXVv
 BejPKZCp7tSR6ZBilw3i1SW7QhU/1zCgumGUo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=nGozREBr
Subject: [Buildroot] [PATCH 1/1] package/polkit: bump version to 126
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

Drop the -Djs_engine=duktape option as mozjs support has been removed entirely
and as such, the option no longer exists.

Tested with `./support/testing/run-tests tests.package.test_polkit`
Both tests pass.

Also tested with `./utils/test-pkg -p polkit -a`
40 builds, 8 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/polkit/polkit.hash | 2 +-
 package/polkit/polkit.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/polkit/polkit.hash b/package/polkit/polkit.hash
index a3855adecd..f8499f5ed2 100644
--- a/package/polkit/polkit.hash
+++ b/package/polkit/polkit.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ea5cd6e6e2afa6bad938ee770bf0c2cd9317910f37956faeba2869adcf3747d1  polkit-125.tar.gz
+sha256  2814a7281989f6baa9e57bd33bbc5e148827e2721ccef22aaf28ab2b376068e8  polkit-126.tar.gz
 sha256  d2e2aa973e29c75e1b492e67ea7b7da9de2d501d49a934657971fd74f9a0b0a8  COPYING
diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index 234e1cf415..653a2819c4 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POLKIT_VERSION = 125
+POLKIT_VERSION = 126
 POLKIT_SITE = $(call github,polkit-org,polkit,$(POLKIT_VERSION))
 POLKIT_LICENSE = GPL-2.0
 POLKIT_LICENSE_FILES = COPYING
@@ -20,8 +20,7 @@ POLKIT_LDFLAGS = $(TARGET_NLS_LIBS)
 POLKIT_CONF_OPTS = \
 	-Dman=false \
 	-Dexamples=false \
-	-Dsession_tracking=ConsoleKit \
-	-Djs_engine=duktape
+	-Dsession_tracking=ConsoleKit
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 POLKIT_CONF_OPTS += -Dintrospection=true
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
