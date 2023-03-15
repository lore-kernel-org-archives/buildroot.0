Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F713C74A5B
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 09:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 521D2401D2;
	Wed, 15 Mar 2023 09:08:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 521D2401D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JJSnJyjeiWR2; Wed, 15 Mar 2023 09:08:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26EA741750;
	Wed, 15 Mar 2023 09:08:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26EA741750
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 829B31BF2C1
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 09:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C1F481308
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 09:07:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C1F481308
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4oXN_wTZa92s for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 09:07:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C3F6812F7
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C3F6812F7
 for <buildroot@busybox.net>; Wed, 15 Mar 2023 09:07:51 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id o12so72612721edb.9
 for <buildroot@busybox.net>; Wed, 15 Mar 2023 02:07:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678871269;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E1qah3BWtXjDk4FTgiDGDO2I/VRZLQTrTl5Pr4QNdG0=;
 b=H9bPK6gAfER5rJHEDT/cvAd5uLPfTeuvKA9xouZWHx9PkWum/o2Afjt8HYqnGsHQei
 es3iInqN8Q0eMHGrFfv2Y9AJfRLLBAtnuRyRmY/Ak9gJfFAE0c0cuC9ZAh6h1m9Tqj5A
 /PamVvJANAAdP+7uoxAxlFT2ZjBe6U7CkH/SsUfoSUZOOJWktQwZhtuJap+ZBn23/pXf
 MjylAYFwApvV4Oy6IxGPrBmmK6EWSlT7jIH28XkhJL3FSHaOJa8/U4sKEqGGysHXNPRg
 qqysyUlqg+04Plz66dkj7Py/8Dp5xjrzei1SnFXZY08i6oXYdGe8RiiuHJbcRqQIzmAu
 Mnjw==
X-Gm-Message-State: AO0yUKXi3TMO9eCQSE4mzqA3/5+fwtG4ZDbGwAYFLmlHYARfIu5A1mJV
 MvB0SCdpFgT64UBy+WMY6gbdViUhQXE=
X-Google-Smtp-Source: AK7set+xwkvaLMShznMuqihMr4SZP7RjmfmGoeTbwLw4FgKZek+/lCDSH6dl6st+HqU0EJ+XRzMEyQ==
X-Received: by 2002:a17:906:f45:b0:92b:eca6:43fc with SMTP id
 h5-20020a1709060f4500b0092beca643fcmr5319238ejj.64.1678871269375; 
 Wed, 15 Mar 2023 02:07:49 -0700 (PDT)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a17090679d200b008e204a57e70sm2190120ejo.214.2023.03.15.02.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 02:07:49 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 15 Mar 2023 10:07:42 +0100
Message-Id: <20230315090742.399240-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678871269;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=E1qah3BWtXjDk4FTgiDGDO2I/VRZLQTrTl5Pr4QNdG0=;
 b=ISjpqs/VkpvMWkXF2dDgnZxUqAS9fYW/L3l/FcIdIHxukOXd7AKufs94dxG7xYRerg
 Ur4nCReZCo9kTq3z/7Usy78HzOdgePcO5+JJzo8jmATnoWdDJA/M+qxeEUfeYXaX8oWX
 yTcrXDtPd1iV4EDa1Ezecv3m6Hdka4obi1eu7mPwVrorBxYW65A3gU/kMJsdFf8ahyU8
 ajxjpML5hXF6pk1CcbJSrnFWrxh6Hed4TDZQ1F8qD9MmsIjjfpvIyqfRJFm0pPWm0brm
 kmfrBiQ/CSVpGrclb2r/q84J4nwFaYmYqOJHxGUw8vgzHkkTmSbkTPHwvD1G441v6Yeu
 9kfQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ISjpqs/V
Subject: [Buildroot] [PATCH] package/lualdap: bump to version 1.3.1
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
 package/lualdap/lualdap.hash | 2 +-
 package/lualdap/lualdap.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lualdap/lualdap.hash b/package/lualdap/lualdap.hash
index 15ca840f1..97aa3b570 100644
--- a/package/lualdap/lualdap.hash
+++ b/package/lualdap/lualdap.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  49c253f540187c61850c856b8e70e45dca904b81720a760f6a94e4eb474958ad  lualdap-1.3.0-1.src.rock
+sha256  c1772077ebfd02e082e89583701ef27dd348dc76ae015247f21a2756f5fac0ae  lualdap-1.3.1-1.src.rock
 sha256  b9b75da18d1e1147ec47bff508ffdce831da07dc371891b9057cf1c422660af4  lualdap/docs/license.md
diff --git a/package/lualdap/lualdap.mk b/package/lualdap/lualdap.mk
index 5dfba8b7a..375754180 100644
--- a/package/lualdap/lualdap.mk
+++ b/package/lualdap/lualdap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUALDAP_VERSION = 1.3.0-1
+LUALDAP_VERSION = 1.3.1-1
 LUALDAP_SUBDIR = lualdap
 LUALDAP_LICENSE = MIT
 LUALDAP_LICENSE_FILES = $(LUALDAP_SUBDIR)/docs/license.md
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
