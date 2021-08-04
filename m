Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F737C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 13:47:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2ACCC60F58
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 13:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2ACCC60F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB19A406AC;
	Wed,  4 Aug 2021 13:47:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N1df8cMXICxb; Wed,  4 Aug 2021 13:47:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A7AB40673;
	Wed,  4 Aug 2021 13:47:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D94D1BF82C
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 13:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3AFAC83C88
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 13:47:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nlAU3p_C_wq6 for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 13:47:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9805183CC2
 for <buildroot@busybox.net>; Wed,  4 Aug 2021 13:47:02 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id l18so2333359wrv.5
 for <buildroot@busybox.net>; Wed, 04 Aug 2021 06:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i95dkSwF581Ke0BjGCGeZLbr1BO1CEI6/jN7y7GBQtk=;
 b=jW43+8pyHvSxqxQMOiJ0oTXZTaNtBHFi+RhfjOn5p1Px9BT2LDN2sv1zk9/zIgw80d
 PaUZ3xweeHIF1WzsjQFuPQwErkATVfALb1clRlIUzOOZxVRw8Hy6BqfZUwI3hRteQ8WD
 eT/Y6AkjaqgEhPB1UJ8+pbhq5U1ckfXZgU6I3lZPQvSMpAN3dlKSZknSbsHILUBh7wJq
 +E2UzLm71sbfvbRX0DEsZ9CERdlaxeldZy09v2WJBcdC87H7kA6UodJAcG7Ok17CnGuL
 b+8CXARtTlQtUGp/e/kMc/5xNEFchUMq4SHnnTz7cW3t5Ja6vhWmRimD2NeEJ83hJ7mx
 VFvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i95dkSwF581Ke0BjGCGeZLbr1BO1CEI6/jN7y7GBQtk=;
 b=Cfm1aRdssXsnBn7Wn91GKxvUzmcATwwjLe/Zu9/Xh3gv0KRpE1Ypj53OvOfbxxDwFO
 av2fqVbH1TgTop2XywBagr9JGTImGZZxnFyvghGKUEMKe8yvR59dhmj1GvZUh3dvKLR6
 N3TwT8asXYUlWBSKrXn34LC6mHHh6nQuji/QjF4N4Os4LG449JWHzxYvIeNvm/FrWDiW
 xuaAg3gVV45qcPMKdMuLktqN5sz41vuSs16tdOVJLeBuf7qq3IFd1TjlU4SVmIanLrWH
 RMgfyQkVn5ZUDmalA4lHjkokfOelQM1c1dB3ppiicdkGm2+Xp7+7+bB7eb2DCib6qbc4
 EApA==
X-Gm-Message-State: AOAM530uRXUP7+BU5GZUGPXuyL2v5zbhD+xEtPIeTsvDZWTCXaz67Yaj
 VWXW43eTc6fRas8XPNVkF/qT50gdt5I=
X-Google-Smtp-Source: ABdhPJzDfGhbPWfSgK8sAnJqAZONHPWK4ORtOtikaLh3HXGwYSXSAbmS1dllnx/ZBvTtBS7bZdQVWQ==
X-Received: by 2002:a5d:6608:: with SMTP id n8mr28249337wru.427.1628084820730; 
 Wed, 04 Aug 2021 06:47:00 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id 129sm2292777wmz.26.2021.08.04.06.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 06:47:00 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  4 Aug 2021 15:46:35 +0200
Message-Id: <20210804134635.262095-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210804134635.262095-1-francois.perrad@gadz.org>
References: <20210804134635.262095-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 2/2] package/luaossl: force no sysctl
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

same issue as with lua-lunix

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luaossl/0001-force-no-sysctl.patch | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/luaossl/0001-force-no-sysctl.patch

diff --git a/package/luaossl/0001-force-no-sysctl.patch b/package/luaossl/0001-force-no-sysctl.patch
new file mode 100644
index 000000000..558d0dce7
--- /dev/null
+++ b/package/luaossl/0001-force-no-sysctl.patch
@@ -0,0 +1,28 @@
+From d701a8f40bef389f8caf5ea67651179fa55a6e0b Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Wed, 4 Aug 2021 14:56:51 +0200
+Subject: [PATCH] force no sysctl
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+---
+ luaossl-rel-20200709/luaossl-20200709-0.rockspec | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/luaossl-rel-20200709/luaossl-20200709-0.rockspec b/luaossl-rel-20200709/luaossl-20200709-0.rockspec
+index fb66acb..c0073b0 100644
+--- a/luaossl-rel-20200709/luaossl-20200709-0.rockspec
++++ b/luaossl-rel-20200709/luaossl-20200709-0.rockspec
+@@ -114,6 +114,10 @@ build = {
+ 						nil, nil, nil, nil;
+ 						"dl";
+ 					};
++					defines = {
++						nil, nil, nil, nil;
++						"HAVE_SYS_SYSCTL_H=0";
++					};
+ 				};
+ 			};
+ 		};
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
