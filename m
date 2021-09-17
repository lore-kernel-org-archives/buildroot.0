Return-Path: <SRS0=uTOM=OH=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85A04C433F5
	for <buildroot@archiver.kernel.org>; Fri, 17 Sep 2021 20:20:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D3576121F
	for <buildroot@archiver.kernel.org>; Fri, 17 Sep 2021 20:20:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D3576121F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03804406CD;
	Fri, 17 Sep 2021 20:20:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CJDmEdZoYPXN; Fri, 17 Sep 2021 20:19:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47EF340678;
	Fri, 17 Sep 2021 20:19:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 34D7F1BF48D
 for <buildroot@lists.busybox.net>; Fri, 17 Sep 2021 20:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23F2540678
 for <buildroot@lists.busybox.net>; Fri, 17 Sep 2021 20:19:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7TiBD_GTaMaU for <buildroot@lists.busybox.net>;
 Fri, 17 Sep 2021 20:19:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6D5D340675
 for <buildroot@buildroot.org>; Fri, 17 Sep 2021 20:19:56 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id d6so16957834wrc.11
 for <buildroot@buildroot.org>; Fri, 17 Sep 2021 13:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=91ZxZwqADUTutk2/ZP/GcEJsark2h+/0MpdjjimCEaY=;
 b=Sk/vDUZn/WOJK35Bwv6Caqhl4fpC4/Hz4KnH+UQs3DFXg5qvNSVNIQRHqOlyP9cjuA
 wSmjAzcS63ibPxsieO86p+mmfoRIwHBtd2ucLQn2opdmVPpG/l5JpZBnt7vw1FuK9Ge9
 7ItUyKS9YT7/tW7UvNgpBiornpuOpyu3C+kxPX+A/hZVZuyMuOehxSDeOLJStd/B9L6x
 q1JRJMHX9Wz8X0+crNRk42BN8Y3HzpOPRZf9l2Wj1dlhu8gneJPDgykbs83iSqI/CVrZ
 ifAZm3ha2PqnKwg/5jrfSMB3Qw8xZV9fiWurkQLuUlTAtaULhUAVikkmgJZ3F8Db5+V3
 3Skg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=91ZxZwqADUTutk2/ZP/GcEJsark2h+/0MpdjjimCEaY=;
 b=TnAjjf4y+ML1wCfhL4DZwYLy3mNyWPMEUwBrga8UqSZjTYj4aaWBHdZUKYqU96O1IE
 Gq6LlljxI6XMFb2W9TnZUHSRTUr3wyVlL8TcRwrs6xpe0GsOtPsOm/KBLfZfROOfu0DL
 c+V/grRgTOPi5mfHamuh8iMW9uNTedAnXKGkLaJWvNaIUtHj/O5F1RptaMIdxLEriHU0
 PlyTlyMWmX5qTfLcu5/yISSCUDm2lmcK48GT3R27W3ntn/2yFdaGNtbZ6quPIvQuarv8
 XfwAQSgQLB6c5gVK7I7fGNJxniVA2ntt2Gy65ii1WoX+ToIIarxhFybOm23FUNwokeU0
 Myhg==
X-Gm-Message-State: AOAM532RfoAKHCSgwhQv20zIc6+/OH24rcezo8cHiZAVMq5DawK/Q1tj
 yWVpWReiZa1GYO2z1BVGjdHV9xCv9sA=
X-Google-Smtp-Source: ABdhPJw1jtJRtd7r1hLODh7I5JsQ8AGJDerykNiXqjUhvV4qgnW+bYm8vQonV1bc7bnO3CRtwUUXFQ==
X-Received: by 2002:a05:6000:236:: with SMTP id
 l22mr14600294wrz.386.1631909994610; 
 Fri, 17 Sep 2021 13:19:54 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:4db3:5a06:f3b2:1f85])
 by smtp.gmail.com with ESMTPSA id d2sm7551805wrc.32.2021.09.17.13.19.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 13:19:50 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 17 Sep 2021 22:19:44 +0200
Message-Id: <20210917201944.3760710-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] fs/ext2: fix namespace for variables
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Kory Maincent <kory.maincent@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

In filesystems, variables must be prefixed with ROOTFS_, to avoid
ckashing with packages of the same name.

We do not have a package named 'ext2', so we currently have no clash,
but it is still ebtter that the variables be properly namespaced.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Kory Maincent <kory.maincent@bootlin.com>
---
 fs/ext2/ext2.mk | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index 74c99bd7b1..0b797f315f 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -4,32 +4,32 @@
 #
 ################################################################################
 
-EXT2_SIZE = $(call qstrip,$(BR2_TARGET_ROOTFS_EXT2_SIZE))
-ifeq ($(BR2_TARGET_ROOTFS_EXT2)-$(EXT2_SIZE),y-)
+ROOTFS_EXT2_SIZE = $(call qstrip,$(BR2_TARGET_ROOTFS_EXT2_SIZE))
+ifeq ($(BR2_TARGET_ROOTFS_EXT2)-$(ROOTFS_EXT2_SIZE),y-)
 $(error BR2_TARGET_ROOTFS_EXT2_SIZE cannot be empty)
 endif
 
-EXT2_MKFS_OPTS = $(call qstrip,$(BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS))
+ROOTFS_EXT2_MKFS_OPTS = $(call qstrip,$(BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS))
 
 # qstrip results in stripping consecutive spaces into a single one. So the
 # variable is not qstrip-ed to preserve the integrity of the string value.
-EXT2_LABEL = $(subst ",,$(BR2_TARGET_ROOTFS_EXT2_LABEL))
+ROOTFS_EXT2_LABEL = $(subst ",,$(BR2_TARGET_ROOTFS_EXT2_LABEL))
 #" Syntax highlighting... :-/ )
 
-EXT2_OPTS = \
+ROOTFS_EXT2_OPTS = \
 	-d $(TARGET_DIR) \
 	-r $(BR2_TARGET_ROOTFS_EXT2_REV) \
 	-N $(BR2_TARGET_ROOTFS_EXT2_INODES) \
 	-m $(BR2_TARGET_ROOTFS_EXT2_RESBLKS) \
 	-L "$(EXT2_LABEL)" \
-	$(EXT2_MKFS_OPTS)
+	$(ROOTFS_EXT2_MKFS_OPTS)
 
 ROOTFS_EXT2_DEPENDENCIES = host-e2fsprogs
 
 define ROOTFS_EXT2_CMD
 	rm -f $@
-	$(HOST_DIR)/sbin/mkfs.ext$(BR2_TARGET_ROOTFS_EXT2_GEN) $(EXT2_OPTS) $@ \
-		"$(EXT2_SIZE)" \
+	$(HOST_DIR)/sbin/mkfs.ext$(BR2_TARGET_ROOTFS_EXT2_GEN) $(ROOTFS_EXT2_OPTS) $@ \
+		"$(ROOTFS_EXT2_SIZE)" \
 	|| { ret=$$?; \
 	     echo "*** Maybe you need to increase the filesystem size (BR2_TARGET_ROOTFS_EXT2_SIZE)" 1>&2; \
 	     exit $$ret; \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
