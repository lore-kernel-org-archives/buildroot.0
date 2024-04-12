Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B68C4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 21:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0059741493;
	Fri, 12 Apr 2024 21:43:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9-dNQcVPI5ws; Fri, 12 Apr 2024 21:43:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14E8741C4D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14E8741C4D;
	Fri, 12 Apr 2024 21:43:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A16011BF37B
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 21:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D5034196E
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 21:43:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BoYfhogggzI3 for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 21:43:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=ben.hutchings@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3A23341493
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A23341493
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A23341493
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 21:43:34 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-41804f10e36so5969875e9.3
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 14:43:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712958212; x=1713563012;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+zSTfsVkah+g3bdSbn2kuw3OyYBzTfv9HcO4Zr6szBo=;
 b=EMHx3y0QTXGbk3pd4K/FNhidit0s8jeWgsvS2eQYWPDUQGrGjAuDUDWiIbm9Bxcnq7
 fS6E5K/yFSJX268xeUXPUpXUhqAXZESzidAUAsBOiqCHidEUNdVtvGoP150LA26Py234
 eFGKm7lVQ57kCv8uw38vsnkG7h/asuTrF0VGS03Ydp5L7vKABwfY/cBjHIx9BhfURHNU
 y5l6YsbhlCdxrBz67CvCiH015fGvP0k1yIyx9AilUwjuMhTSwyOQcoE/s5nXMM2AN6Vx
 iO/nTplUAHt54divhL3zgaiC9yD3NKLNU2XEPJAPaNozFh13Dlwpg2zoF46ftRdJLa5b
 OrpA==
X-Gm-Message-State: AOJu0YxVN8L6KpCC8HbY0uaoLBbhXtZjQZGnEh+OVpyYoBkAaKjjeWku
 kx6OzQKTedYKFHKOgNd2McjN9UJX3KZd5zTAeEAWocHO8j1dIrigypT1krt3VGTic70+hdDMXxq
 Q4hQ=
X-Google-Smtp-Source: AGHT+IEiIhFDB6vXsd6QocuSvtwqZPprusVCk8ZCI3CKBa3I93uCpI2td0NCOCJSeOCNpG188rkfmQ==
X-Received: by 2002:a05:600c:4e8b:b0:416:3f85:d49 with SMTP id
 f11-20020a05600c4e8b00b004163f850d49mr3130938wmq.18.1712958212213; 
 Fri, 12 Apr 2024 14:43:32 -0700 (PDT)
Received: from cephalopod.i.decadent.org.uk
 (213.219.156.63.adsl.dyn.edpnet.net. [213.219.156.63])
 by smtp.gmail.com with ESMTPSA id
 l23-20020a05600c1d1700b004163ee3922csm10034597wms.38.2024.04.12.14.43.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Apr 2024 14:43:31 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 12 Apr 2024 23:43:05 +0200
Message-Id: <baf799dacd2d518a6e274aa59c7659fe12b68834.1712957992.git.ben.hutchings@mind.be>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1712957992.git.ben.hutchings@mind.be>
References: <cover.1712957992.git.ben.hutchings@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712958212; x=1713563012; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+zSTfsVkah+g3bdSbn2kuw3OyYBzTfv9HcO4Zr6szBo=;
 b=IJXBMOuGA8s4WBvxMptcxC9yasWxSKgcC3N18gQ7ccskwwfkyuKKntSSiWKbx1dGEf
 aKNUXQolOH6RRqj1a0Jlzehqf1nzMXGZVeHP4CJXgMJSO9zt0whtD8BD3lu/ykjHdC3R
 8bwmNcNVQs9lmNK0Wt/6PmO9ls84VuMNtRNzYzeTc8LUX8lX3lCh2x4ElxgY3B3nVE+B
 RixOYU/hoRQvS2Nv7mxK3SAcBzG9vovJj/94CDHAiU3+HGqC/6EczTnThgaxNzXfa3pj
 yVRisstNhAFVG5m/B1FuarOpctW5cGkpR2pne4VRxwq0IGxgRPGnFiNdblEaIbHjmeOd
 ZD4Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=IJXBMOuG
Subject: [Buildroot] [PATCH 1/6] package/libgpg-error: Add host package
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
From: Ben Hutchings via buildroot <buildroot@buildroot.org>
Reply-To: Ben Hutchings <ben.hutchings@mind.be>
Cc: Ben Hutchings <ben.hutchings@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is needed to support a host build of gnupg2.  It is not directly
selectable.

Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
---
 package/libgpg-error/libgpg-error.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 60e3da9de1..9c8233b492 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -19,6 +19,9 @@ LIBGPG_ERROR_CONF_OPTS = \
 	--enable-install-gpg-error-config \
 	--disable-tests \
 	--disable-languages
+HOST_LIBGPG_ERROR_CONF_OPTS = \
+	--enable-install-gpg-error-config \
+	--disable-languages
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 LIBGPG_ERROR_CONF_OPTS += --enable-threads
@@ -27,3 +30,4 @@ LIBGPG_ERROR_CONF_OPTS += --disable-threads
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
