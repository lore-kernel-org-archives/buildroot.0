Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E288C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 15:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D324240283;
	Mon, 27 Dec 2021 15:21:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DwUMPCLkND3i; Mon, 27 Dec 2021 15:21:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDB3440933;
	Mon, 27 Dec 2021 15:21:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 797A21BF487
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 15:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75C4660DFC
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 15:21:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ggS70bMrzvs5 for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 15:21:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9354060D77
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 15:21:08 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 a203-20020a1c7fd4000000b003457874263aso11150076wmd.2
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 07:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7VzAFUT//EYUG9r/0JrQ2r5H670oXvmSksGSNfmL1qY=;
 b=UQJ83ANsWqUXytqFz0OBuCJqimFZwZqK8+OTwbOfu98dWclJYFG9UZTVAaxytgcXph
 Y98KaV2xCXvSn82vCnMfbm8QP2i5D8UT4w82XAdY5WwzVmCCUV/ziEw8WUrKo40zn0Je
 oEq9Sdw6jMeRNhfU2mKwj6jVKf0Gf5gQNB5h+mbLLwVwZJY9xxXS2BtFpSCpI7qxGSaw
 hQz4StiiVwPMcZBuT/4XnyzZmxvfpOyRGfbVIaWS0ukc0Cmvnwv5LtnCZ09Ti8IaUvkf
 S+7fl/H0j+nM63p/IuOySnIrq7VbVdLXM7dnbj1wbGnm8+kTMIoFGnIbFarhywe4LycI
 ebYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7VzAFUT//EYUG9r/0JrQ2r5H670oXvmSksGSNfmL1qY=;
 b=1BQfQDUdzMjDBNQVx6wW9vtTZUFnUKEXr+7bRTd5TU0pWcuMqPOkOdqPX9W0KgenB0
 hCqAI61llRBmWElZ/bkZFNccITa8ecwB0O4xElSZLZtNJCd/jZmhPJB0IEVrlNcamPU1
 V4sz571tuR9lSoX17rHzF8UH+jUDaDUGEAfq4nXjZ1u2vopnIsLKoOX8C+SF/SDuZm06
 WFu8StFWWjNRzTOsSQPgLGis0j1x2SdLIOpTktz/GrB+Dc/vClUqR+CDKa9oPBXSMMDn
 Y+oPZ434sPnDZrURtBtEj/p2xAaeC4YG93n504szXOt32E91HGmzUyUGButh9xazoDtp
 e02Q==
X-Gm-Message-State: AOAM530OVhLflJ8yVRAdr3sW/zIpjqVDafozdWRmsh0O/9fJYNv82pqT
 gzHXRMo2q05W0DNdGdH9mCh/FgJsirVo5Q==
X-Google-Smtp-Source: ABdhPJzYqE13SwdaS7YfMa93wgAFyxh4ZKpJdcidJwL9dsUyBjKvQrxkk6pm/HykFvIjKtyL/PaAlQ==
X-Received: by 2002:a05:600c:5010:: with SMTP id
 n16mr13407309wmr.139.1640618466757; 
 Mon, 27 Dec 2021 07:21:06 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id d22sm16067570wmq.17.2021.12.27.07.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 07:21:06 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 16:20:18 +0100
Message-Id: <20211227152018.2066371-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/dahdi-tools: bump to version 3.1.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dahdi-tools/dahdi-tools.hash | 4 ++--
 package/dahdi-tools/dahdi-tools.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dahdi-tools/dahdi-tools.hash b/package/dahdi-tools/dahdi-tools.hash
index 5538ed6b8a..72fa995c84 100644
--- a/package/dahdi-tools/dahdi-tools.hash
+++ b/package/dahdi-tools/dahdi-tools.hash
@@ -1,7 +1,7 @@
 # sha1 from http://downloads.asterisk.org/pub/telephony/dahdi-tools/releases
 # sha256 locally computed
-sha1    3e988256aae4b6a6ed8efb3ecc07753779f54823                          dahdi-tools-3.0.0.tar.gz
-sha256  5bebb20d5ae13fa13f0e2075603013954b962be477db02271eef44b3e41557c5  dahdi-tools-3.0.0.tar.gz
+sha1  fff6c8fdc72a66f81768e4f50bf55156f7cebbc4  dahdi-tools-3.1.0.tar.gz
+sha256  ea852ebd274ee1cc90ff5e4ac84261b0b787b1a74e8b76ad659bc9ec4f77e67e  dahdi-tools-3.1.0.tar.gz
 
 # License files, locally computed
 sha256  fa5fc1d1eec39532ea517518eeefd7b6e3c14341a55e5880a0e2a49eee47a5b7  LICENSE
diff --git a/package/dahdi-tools/dahdi-tools.mk b/package/dahdi-tools/dahdi-tools.mk
index 392dc09140..fc0c591ca8 100644
--- a/package/dahdi-tools/dahdi-tools.mk
+++ b/package/dahdi-tools/dahdi-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAHDI_TOOLS_VERSION = 3.0.0
+DAHDI_TOOLS_VERSION = 3.1.0
 DAHDI_TOOLS_SITE = http://downloads.asterisk.org/pub/telephony/dahdi-tools/releases
 
 DAHDI_TOOLS_LICENSE = GPLv2, LGPLv2.1
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
