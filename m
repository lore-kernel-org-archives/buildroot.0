Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2AC2C54798
	for <buildroot@archiver.kernel.org>; Tue,  5 Mar 2024 15:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A80760E9D;
	Tue,  5 Mar 2024 15:59:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FkzYhqPIL3qa; Tue,  5 Mar 2024 15:59:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF7EB60EA6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF7EB60EA6;
	Tue,  5 Mar 2024 15:59:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 165661BF2A9
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 15:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 034BF820DA
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 15:59:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wICR-c4uu_Mi for <buildroot@lists.busybox.net>;
 Tue,  5 Mar 2024 15:59:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1682881D34
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1682881D34
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1682881D34
 for <buildroot@buildroot.org>; Tue,  5 Mar 2024 15:59:34 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-33d9c3f36c2so496220f8f.2
 for <buildroot@buildroot.org>; Tue, 05 Mar 2024 07:59:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709654372; x=1710259172;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w9h6QD3/PASLi+QfZXGnnHpM7dPwUgI521ZxUTGA9iY=;
 b=o9Y5R197E2M27jnC9yFJUhfpMvJWwgJMhpMHA5Q1CDcJAmGWcc/rvP+0IcdWLZacLX
 T1aseHSA/akfJ+WW8zlZ40EznO1kyxb0BI4hg3Luf8ixZ3WF614VMMKVjsHeb/P4R2wP
 qC5NU6Urc2U+Bscf3ggSHvs2AhI1wh+evSpdaO0NKrF32xZA70I4yyHveWWmKd6fNniK
 zmey2e+wrteRctI9cpgtHKAJucCzCwMev1b8X/zhl/cOu0UFFmQb6TkkgZLVYEbU9fd0
 d9eJBFQJTimwFse/Kme298rYv/SnbbDO/TT/Q+G5/el3swEgUb5ePGltp3pNu6mIyH4j
 hQyA==
X-Gm-Message-State: AOJu0Yx+jXVhNEY2SEL8MIXBNQzt1a2P8SUUwSZexUdDsWRVlfkmzQ1V
 q7PKKFG8Z2l6ydr+dpkWM7hWNATff+dmI6rGvW00iaEBvggEnfbfaIN5EJ7g
X-Google-Smtp-Source: AGHT+IEcnOYn0z1d7YxXkhE2lPob7u4kvPWFv/I7Fo7jsUNYk+CtspyPBGdWJ+e0iJzfBi1F5fxyPA==
X-Received: by 2002:a5d:4f8b:0:b0:33d:d799:ef6c with SMTP id
 d11-20020a5d4f8b000000b0033dd799ef6cmr7986154wru.66.1709654371666; 
 Tue, 05 Mar 2024 07:59:31 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 jn3-20020a05600c6b0300b004128e903b2csm20886949wmb.39.2024.03.05.07.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 07:59:30 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Mar 2024 16:59:21 +0100
Message-ID: <20240305155921.1818567-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240305155921.1818567-1-fontaine.fabrice@gmail.com>
References: <20240305155921.1818567-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709654372; x=1710259172; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w9h6QD3/PASLi+QfZXGnnHpM7dPwUgI521ZxUTGA9iY=;
 b=hjYyx3ICQPduqgcF4qdCgYZ8IVUawJakLCaNGcuwPelSVK96kLlgYS1WgMtCxtnmGq
 8ic59en4mt6E6Rdj+zV6DYCpfr4Xw0uX6woI9qjBeH3b+2mdtiiKwSaqKgzs3VmsHlZo
 H8DiZVNNMGUIMqpfVFvtg0yTbu4OV9b6zX5JTAYcPymzfn15DOsgCNI7ZHwQ+Lwh7WJH
 AAty0hj5LlV/JmOKT9AYjk3O2AXMfvcaZs4HpwvMs1xXsPY38UvCjZzYCwUCdhhnvIFr
 odK9nys3HKtnl1zvzxtqZsuxOs+HgYldaQOBLVAno6ZN241G5i5P5DWziKxMP1R4Xx5+
 wpTg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hjYyx3IC
Subject: [Buildroot] [PATCH 2/2] package/iwd: security bump to version 2.16
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2023-52161: The Access Point functionality in
eapol_auth_key_handle in eapol.c in iNet wireless daemon (IWD) before
2.14 allows attackers to gain unauthorized access to a protected Wi-Fi
network. An attacker can complete the EAPOL handshake by skipping Msg2/4
and instead sending Msg4/4 with an all-zero key.

https://git.kernel.org/pub/scm/network/wireless/iwd.git/tree/ChangeLog?h=2.16

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/iwd/iwd.hash | 2 +-
 package/iwd/iwd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
index 4eea644842..3f18146e13 100644
--- a/package/iwd/iwd.hash
+++ b/package/iwd/iwd.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/network/wireless/sha256sums.asc
-sha256  f7ac93aeef672604f5b5194ca038035ae222925be392c4345873c9742f477797  iwd-2.6.tar.xz
+sha256  c1a82032e994861e794cf3b5a16d07ae1aa03a6674f716c73408ffeae2a233ba  iwd-2.16.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index f20427114b..af6b2f849a 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IWD_VERSION = 2.6
+IWD_VERSION = 2.16
 IWD_SOURCE = iwd-$(IWD_VERSION).tar.xz
 IWD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/wireless
 IWD_LICENSE = LGPL-2.1+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
