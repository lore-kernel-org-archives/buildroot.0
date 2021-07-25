Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 525ADC4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:39:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E3C160231
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:39:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0E3C160231
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D78D840281;
	Sun, 25 Jul 2021 21:39:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gh99PFrsqDrU; Sun, 25 Jul 2021 21:39:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C33940276;
	Sun, 25 Jul 2021 21:39:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 27ABC1BF312
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17889403E8
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:39:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uB_h80oXTlTR for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 21:39:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E95B8403E3
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 21:39:45 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id j21so9465136ioo.6
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 14:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/i1FATGBHHAXabNVOf0qKnLDocn3cCGEQ/8za2l/eMs=;
 b=jXPLRjv/zqygXFNGxwxDvTP0S5n7yvX1M06YcPPJuOLMyQHJlkKgEx91ycatUDST/0
 rKvbcdSlzAujLMVLpVPNtm0peKv5WJ332qJa4C6IPZp4fX9rmSBkXOkCvR6PWfe7xovo
 i8k2cNAl/jxt2g9Qfv5L2SR6RNVKPDUBXat9RN0FQG6oXsWvXmhLeW2bWLx2C4mYiJHV
 2XjG1wcF3VXVaIu0sPZHpI0/0Wev5FMLjXxA5A2k7bpGPVvojQvSI+cZT8laDLOQRNvo
 tpM6UJ7evorkTMMVRhO1ClgrTimhEwB3bCQOa676wKhevOI+UcRWbEW8EloyxY6XGUFu
 bs5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/i1FATGBHHAXabNVOf0qKnLDocn3cCGEQ/8za2l/eMs=;
 b=A1ZITS63lQ1ZEtBxRrZUgmZo9nuiQ7knOs90cJpSi9PeHyyEq3z2a0yFBB6AQ3ztht
 6Pk2IVt4m4qU2ZBEypuFkDigdjsEmi4N5yfllSzSzttqRJHuTDpvyI1ZliMrPDjM87Dj
 L9EfaDvWuCn3+BHyPVC397YoRVOKcOh9UpgU1B4pMEVAs9aZiH+xiZMewKp8a84mKCml
 M9eDIT7jAA0XYULFxnoTxr6XxZKh53CVVBQXa4Yu0WItkCSumkGAyxWrgNO5g65I1DON
 Cz5Ny8BamUgzrjDwTKW9P30tdg+CrWJFnOlfYwzlvGCzJyeEmLzyGvBZ3ll3PhNS10X0
 toMA==
X-Gm-Message-State: AOAM531bmsvPYoeaU+46ovDWKoB6Ld5psOHV0X/1rHy1Fi72D40xhkCl
 nPPwObKg8yd+KV0R42fT04O53TtYHF4=
X-Google-Smtp-Source: ABdhPJzsXdbF+7/YLakpTizlPTGqW1SuJfBRKaCTIkBU8uj3VgKUJ1rKcmISM73hTfGooxvY44xx5A==
X-Received: by 2002:a5d:9ccb:: with SMTP id w11mr12279593iow.174.1627249185031; 
 Sun, 25 Jul 2021 14:39:45 -0700 (PDT)
Received: from james-x399.localdomain (97-118-178-184.hlrn.qwest.net.
 [97.118.178.184])
 by smtp.gmail.com with ESMTPSA id g20sm20134454ilk.81.2021.07.25.14.39.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 14:39:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 15:39:42 -0600
Message-Id: <20210725213942.1622634-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/nfs-utils: add dynamic library
 comment for NFSv4/NFSv4.1
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/nfs-utils/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index f2997b9c91..df9c12ca44 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -26,6 +26,9 @@ config BR2_PACKAGE_NFS_UTILS_NFSV4
 	help
 	  Enable NFSv4/NFSv4.1 support
 
+comment "NFSv4/NFSv4.1 support needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_NFS_UTILS_GSS
 	bool "gss"
 	depends on BR2_PACKAGE_NFS_UTILS_NFSV4
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
