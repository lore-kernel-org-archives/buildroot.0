Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDDBC77B60
	for <buildroot@archiver.kernel.org>; Sun, 30 Apr 2023 07:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64283841DE;
	Sun, 30 Apr 2023 07:58:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64283841DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kafyPyUms5BS; Sun, 30 Apr 2023 07:58:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEAF3841C1;
	Sun, 30 Apr 2023 07:58:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEAF3841C1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1BF0D1BF487
 for <buildroot@lists.busybox.net>; Sun, 30 Apr 2023 07:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9181841C1
 for <buildroot@lists.busybox.net>; Sun, 30 Apr 2023 07:57:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9181841C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JQ2LDP4rEQvg for <buildroot@lists.busybox.net>;
 Sun, 30 Apr 2023 07:57:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FC8E840EC
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2FC8E840EC
 for <buildroot@busybox.net>; Sun, 30 Apr 2023 07:57:57 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f178da219bso13132205e9.1
 for <buildroot@busybox.net>; Sun, 30 Apr 2023 00:57:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682841475; x=1685433475;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BGu/oXTVciNzyzTwNjZcG8gq1IxynAPAdH+Df2ifWZ8=;
 b=frpuT1CYDXjSlnSa33AhoVN21ziHu4XqmPWannNcykSYggvHDV3UO3dB2ihT8jmbhk
 2zpxFH6gX/i7nFpyr8Kv5pXUycZzGgomEmd5lcVojtzgZhG8bPKbz2EQ8veTIEvokKhq
 JQnulL8e629RLiS/kfyJu7KQ4tsAtJ3Cy7XKqhXdAprZT62I+5Q34jw2ieUwnvKhJny/
 xWSQpUNHZyLSIndpq3tIPVUIPstynutozPocX0Y9RJsEMlp5NIYFToJF7OzPVlVPMfos
 pP1Y30y3ir8MuYFdtQK+R8rjnAWFRJ1T/ZW9Ktals5xZH0MOtZSDoAMubMkaoMbfOn/1
 OyTw==
X-Gm-Message-State: AC+VfDzAMU9A8h5ycBC4RUbWyF0QRQccwwFGHG26Bntn2rwqKyluPbbh
 hERx3j4wUgU+AtxrSLCSpmwLNLCxlf8=
X-Google-Smtp-Source: ACHHUZ7nin3pQMiTAZV2ccNbX3zvxrTMck06a1aMA5Qn5GVeUwv+R7SWxFX/hVUNDPP6VYm1Ia6VEw==
X-Received: by 2002:a1c:750f:0:b0:3f1:661e:4686 with SMTP id
 o15-20020a1c750f000000b003f1661e4686mr7522188wmc.7.1682841474916; 
 Sun, 30 Apr 2023 00:57:54 -0700 (PDT)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a7bc5cc000000b003f17329f7f2sm29067135wmk.38.2023.04.30.00.57.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Apr 2023 00:57:54 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun, 30 Apr 2023 09:57:35 +0200
Message-Id: <20230430075735.188470-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682841475; x=1685433475;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BGu/oXTVciNzyzTwNjZcG8gq1IxynAPAdH+Df2ifWZ8=;
 b=lqlndoxnXpvAwlvHCwnjCmo2iXc5bUu487yDc4PiiSXAuN2t2bFXcXdzaiOb5hFdCP
 ZmufLDva60Nt6w4B2p/JGLu4gFwC34tEPB/8KHrdZwijpwzLecMRqZUhhlLGeVtwM/uU
 Tmpu8gLqPRo/9PKyVBCsuBS2Vw4714iH1kiipQo6+f4hjqxOxELkzT4q8zjOceG6YvLJ
 +XCHhLzIXSfcExosNw8kL3YlqmA5ia92uqhffDnl0HTCmFq51ADNf1S+1lrJeycV8Mld
 WIgrbsi3bbP+jIcuNv7+tElNpXlDTmpNP1B+02knnHm9peOGODIYMQxm9dbPNyZ4+cuG
 EbSQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=lqlndoxn
Subject: [Buildroot] [PATCH] package/moarvm: bump to version 2023.02
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/moarvm/moarvm.hash | 2 +-
 package/moarvm/moarvm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/moarvm/moarvm.hash b/package/moarvm/moarvm.hash
index 624988215..e56ecfe65 100644
--- a/package/moarvm/moarvm.hash
+++ b/package/moarvm/moarvm.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  51c3e9c9a7a191c148f213b65ae1f4fcfe5d4b7c16c86300e9ee8e18eaa8becb  MoarVM-2022.12.tar.gz
+sha256  67e214d44d5f626787ca7f04424043a639308a43a7777b6fa41926b7240e0dc5  MoarVM-2023.02.tar.gz
 sha256  c53c6b96081b0a5b9b2fb4d0133d55c20e5e00e4c127ade62f03434ee7b3d2de  Artistic2.txt
diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
index ef9d29d5a..6ac2468f5 100644
--- a/package/moarvm/moarvm.mk
+++ b/package/moarvm/moarvm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOARVM_VERSION = 2022.12
+MOARVM_VERSION = 2023.02
 MOARVM_SITE = http://moarvm.com/releases
 MOARVM_SOURCE = MoarVM-$(MOARVM_VERSION).tar.gz
 MOARVM_LICENSE = Artistic-2.0
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
