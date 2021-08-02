Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BA1FC4338F
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 18:06:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C90960F36
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 18:06:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C90960F36
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7B7240233;
	Mon,  2 Aug 2021 18:06:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 78zhyQPIsKtD; Mon,  2 Aug 2021 18:06:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DBEB4020D;
	Mon,  2 Aug 2021 18:06:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2E9161BF30A
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 18:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F1FD829FE
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 18:06:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yqTixChpSANo for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 18:06:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD188829A9
 for <buildroot@busybox.net>; Mon,  2 Aug 2021 18:06:30 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id n11so10924880wmd.2
 for <buildroot@busybox.net>; Mon, 02 Aug 2021 11:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3yrs1tTP8tJBAtipFUcevFr8euUkyFMKXi46oMEKiRY=;
 b=UQiK3AnMCS95tAGdfg305yw9CcmxeoxGZ+EMxbGrFDZSygHhxLgi3LfXL5i0ftLQtg
 7pH8kDTSc7+eZZXYRYTnk0lCj7bIKeRpM9GPbkzlSqDSfROFhm35f7EdepI60VIkclbv
 eQ6vrBowLsIpDMpUwUTIjMeCJFfnh1FAqy7Vm9JfopDw6YfAopwgD3fXMy+qxLK6HeYS
 /e+cs8fwx1FqPCr+RtC0Rg+Bit5IRfAiimo6j3L1rgwpc0JItYl4bL0lIiNuUNIE3RaT
 VTKCHbajP6+v8ZyfHXkpKVmLYTsEHWRv/9vl5qy32GoQpSoyXBrqlZa4Sg8MYticPlX3
 LnZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3yrs1tTP8tJBAtipFUcevFr8euUkyFMKXi46oMEKiRY=;
 b=ObXVzT9GVOvtKTymDt/HLf7sNFyaPlfia0Z1yNQqN/rGd+c6ZD6Y39pMLIffLcfamx
 mKvAvr14n7t5vH0vhpN/bPyNfEtPnIOSOMjZadkyfNzTI1AlcdxaGOfZtN28kTViISul
 tvmVVkvQrK3QkQoIqsFbYxlvW8KdnvZ4jTPeAhrQYa9d4Rlzfomg9vwgH+C8b4wolOJM
 OiLRFIqtAEP0X5qok10/+n/D6YzEKoQs1bQKAUKBbgxo/igH5TBdcWKbrFW9cKVZiZOn
 lLr6SpXJuJ7OTW5PRxxnKg0pZe2UufOXqw7jOPTeYOrc57BrLxI90iBCqM4vtEn4nhAb
 kjFQ==
X-Gm-Message-State: AOAM5314b9qCyFH53jsKPokfMP5NN/InOdNTg3ekIFUBRCQ4a/JZzGMj
 0dQabtl3JDgSAUcGrY1S/VHYVqyaPPA=
X-Google-Smtp-Source: ABdhPJxi21FZMXYfmkPiysyfCvIc0grEMJjaVPcEoHXwUa7TbjG1ZjGDpffDIn4lisdxRfYlThfb9g==
X-Received: by 2002:a7b:cb19:: with SMTP id u25mr166772wmj.25.1627927588900;
 Mon, 02 Aug 2021 11:06:28 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id 140sm11169410wmb.43.2021.08.02.11.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 11:06:28 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  2 Aug 2021 20:06:16 +0200
Message-Id: <20210802180616.3304814-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libcap: bump to version 2.52
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libcap/libcap.hash | 2 +-
 package/libcap/libcap.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcap/libcap.hash b/package/libcap/libcap.hash
index ec87a38df..eb8fe43f6 100644
--- a/package/libcap/libcap.hash
+++ b/package/libcap/libcap.hash
@@ -1,5 +1,5 @@
 # https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/sha256sums.asc
-sha256  6609f3ab7aebcc8f9277f53a577c657d9f3056d1352ea623da7fd7c0f00890f9  libcap-2.51.tar.xz
+sha256  a2faacd55ae5959db1b0c695f91f256ac4c5e6b10acaeaeaf508ea1ee887fa97  libcap-2.52.tar.xz
 
 # Hash for license file:
 sha256  f58c80bcce8c929db39a23c32e924876e3311f3ffa54f66076c38056d38fa59b  License
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 3dc09bd55..45700e56e 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAP_VERSION = 2.51
+LIBCAP_VERSION = 2.52
 LIBCAP_SITE = https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2
 LIBCAP_SOURCE = libcap-$(LIBCAP_VERSION).tar.xz
 LIBCAP_LICENSE = GPL-2.0 or BSD-3-Clause
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
