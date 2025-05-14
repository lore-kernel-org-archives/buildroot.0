Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 254FEC3ABDD
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 16:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE0B883984;
	Wed, 14 May 2025 16:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JR5tmLeKpEpO; Wed, 14 May 2025 16:58:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B2DB839E0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B2DB839E0;
	Wed, 14 May 2025 16:58:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E1BF612A
 for <buildroot@buildroot.org>; Wed, 14 May 2025 16:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C57B583837
 for <buildroot@buildroot.org>; Wed, 14 May 2025 16:58:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mPxta595qLwS for <buildroot@buildroot.org>;
 Wed, 14 May 2025 16:58:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 09D278372B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09D278372B
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 09D278372B
 for <buildroot@buildroot.org>; Wed, 14 May 2025 16:58:34 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-440685d6afcso636105e9.0
 for <buildroot@buildroot.org>; Wed, 14 May 2025 09:58:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747241913; x=1747846713;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QZSW3cnEETpnq/x2Fe8XbrSI0tNIl8eVr8hK6khsd74=;
 b=RHACcop7Ky4JhgnF+hkFdWouCOaofsCzTKD1GUXcusQvQPRacJDeJbnYiu4A5XDDfg
 b3L7+WcJ5yCltY78RM8W4iTGVq018FdIGToCH9SVAGz8/MA4Jcbqncs4A4PGhzHlUKwd
 2+2Z/q/Zzltywh+Aey0dvdOBxdnalIv93Ss7cXf7RLyEk9KWTpFhliuNLaPQFzQ9ZrC5
 EHEBgUaotvJVENbEyGOCKcXh9hTwT9gGmDDb/NNAlyq+iIo5RzHP36awfxK8PS+T3/U/
 2us9uiOX/XTavneYj7fVv2sOhmB2GrWq+5YHEqPlE23Cb89+hCC6g8i8YmpiAwDUHL36
 eYoA==
X-Gm-Message-State: AOJu0YzgvldqKtO5aVA4NeziWOUlARg/BM5JIvNm4Bxhn1qW4G3YsJdU
 sIqCd/o+kqWbI87RXF+8n3t+8U7XAncnGbxbR1zoY+38Dgk6SdvEU84P4w==
X-Gm-Gg: ASbGncvdj/wtIpn8Ta1nXJVqUYhPnCU+GNXfCcCyJCJuvFq/dBI7/tymHCPrZuZf/QV
 5HflDH0gOaljZJHHyEOQVgZnGkEnyqcoIR/IhYfALtEcgSK6vc1GQQqyRJ+LTE3KTUpgdE98a3l
 Jwl36HHIRQc6UWeXXPK6+frQd9pyunOcViC3BQBBUamFwT+XSRfrTkZ79kAM16j3zyCrQhAAZ8X
 A7yGTcb4+J6kEBwQvQjgbHzhGdFlN3j01e/pT1NCH3Gm1KkSiB/1VYgIzuudVyr41xGrdqU0EIf
 Q2JK0TfC9ZlpAGEVauXMYhP//qnOFCjaVjruDrHtIdcaoWvmLFbvSTilunTmtg==
X-Google-Smtp-Source: AGHT+IGRPDGRe/wJUmrZEcEXQ4HrjrETOzTmLsRHIjV+R8FAFYQtVAw8JaNv1R0s0+b2OkHuh5j4ZQ==
X-Received: by 2002:a05:600c:3b9c:b0:439:9424:1b70 with SMTP id
 5b1f17b1804b1-442f2177b67mr44138345e9.30.1747241912893; 
 Wed, 14 May 2025 09:58:32 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f3951494sm39815585e9.22.2025.05.14.09.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 09:58:32 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 14 May 2025 18:58:23 +0200
Message-ID: <23a66233e0eec082925701a4d9329720be03337c.1747241900.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1747241900.git.yann.morin.1998@free.fr>
References: <cover.1747241900.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747241913; x=1747846713; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QZSW3cnEETpnq/x2Fe8XbrSI0tNIl8eVr8hK6khsd74=;
 b=XsgQxDXNwmNt9MQ2MG1NNFvfQpsYYb22umocC7O/CBc8haANQYGTdAbp4nz6Bqo4ER
 Ifo9mxFZbeyiOShrdfpZkgP7nVJsZF9YsPrc6iuBrhcRgEKXotqlP/RwHB991mD3MFBt
 OGjxhAvfPZboFiHGj0fnqK3FoGYHaoRupnVDtYnPINahJ7nZ6lCpiZy8+S6zxO77AjIC
 TdTFHMSo0NAxpk33sm8wG6TChsgLkPZvW4zNwgYUbd9A1b9yjm57r1S7z0htR7Sjv31Z
 BKD96L0mhHMX9MW40tvLMLnWzVL4Q5GVSEc8VNlKjqqc8riPqWdekix7iec+Jhyj1gAw
 ZBzA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XsgQxDXN
Subject: [Buildroot] [PATCH 11/13] package/kmod: adjust paths for merged-bin
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/kmod/kmod.mk | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index dfdd17b955..4635b8702d 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -68,16 +68,24 @@ ifeq ($(BR2_PACKAGE_KMOD_TOOLS),y)
 KMOD_LICENSE += , GPL-2.0+ (tools)
 KMOD_LICENSE_FILES += COPYING
 
-# /sbin is really /usr/sbin with merged /usr, so adjust relative symlink
+# /sbin is really /usr/sbin with merged /usr, and /usr/sbin is
+# really /usr/bin with merged sbin, so adjust relative symlink
 ifeq ($(BR2_ROOTFS_MERGED_USR),y)
+ifeq ($(BR2_ROOTFS_MERGED_SBIN),y)
+KMOD_BIN_PATH = kmod
+KMOD_SBIN_DIR = bin
+else
 KMOD_BIN_PATH = ../bin/kmod
+KMOD_SBIN_DIR = sbin
+endif
 else
 KMOD_BIN_PATH = ../usr/bin/kmod
+KMOD_SBIN_DIR = sbin
 endif
 
 define KMOD_INSTALL_TOOLS
 	for i in depmod insmod lsmod modinfo modprobe rmmod; do \
-		ln -sf $(KMOD_BIN_PATH) $(TARGET_DIR)/sbin/$$i; \
+		ln -sf $(KMOD_BIN_PATH) $(TARGET_DIR)/$(KMOD_SBIN_DIR)/$$i; \
 	done
 endef
 
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
