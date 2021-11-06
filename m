Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90379C433F5
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 15:28:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43B7B60F9D
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 15:28:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 43B7B60F9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD32D8266D;
	Sat,  6 Nov 2021 15:28:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1YbPGt7bjmJW; Sat,  6 Nov 2021 15:28:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49E718263D;
	Sat,  6 Nov 2021 15:28:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 76FB81BF2A1
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 15:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 651DB6067F
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 15:28:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S96Zidg6TzSU for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 15:28:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3C1DF60625
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 15:28:11 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id w29so6963799wra.12
 for <buildroot@buildroot.org>; Sat, 06 Nov 2021 08:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CvcJ7aHF23QNmKoDvtmnXtFjWbjYRyUCFHoQ9rXVDL4=;
 b=a8/qVv4Go2ysVJf4TtYI6Jqk/RfGeNvcj6gnWFuR+vfiw38D9BFgBFOKqj4ilHpW/3
 nM9PaKVRDtfyqFzAuqZXIT+8saVBng3LDLO4Zf3goSil3SB5tBGi3DobQOszqRs3R29u
 7cDAg1tkuvQ4UcCEIXAuNshDXHg1CZ9SNP1njsd7gj9u01Vv1GFq8d5u1/nPs0ubvKFs
 5Gnx21muwpBjpGkwPqLy4/yARCBcoG19sEmkEMavUl9wcMjmuXuWqhn10CHNz0vCcgBS
 fqrr8RKAkhL8BvTfkeocTWr8mGJ/jj7Xf6WZYpl81YjsgboGQv71xF13XFqgBGpsGcgk
 FAZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CvcJ7aHF23QNmKoDvtmnXtFjWbjYRyUCFHoQ9rXVDL4=;
 b=2OhYKVSFKMAcRWxHMYDLMUV7nqxFardCbMTjdN1lS/DEpksoDjCbQJP99tfa67M+cq
 jjCVny74G5muVwX+GU1dhTKfjsuir+Nx0X86GRXU/9L0lgRUAm6C0Aff0TqAE7Ql3BKh
 +jB60Q3i+72hC7K9GCybTwn38LuYjr5DrxvDRKXaTz1EaLSQ6vz3uk7hU6LpIZBChtiv
 tanrB4zLqiyGfANm2fsz0tMToYTab3FwrFRsob8N3c13ksuRsilU9WzGyh8TiluM3xOd
 9Mf7wPB+hTFZxScgJ6UNWIt+cXHzsalBVjcMwS/5qvkT6ZbBrfenq6Nllnc7R6wDg2ca
 vE6Q==
X-Gm-Message-State: AOAM531AD8GMBzxp8qbJe4Px0xGVPMhNuN2V7yvq5z2AivqKPSpSx6nO
 nSMFgD/+vP7bibCkjK6goBsqruGnk6c=
X-Google-Smtp-Source: ABdhPJw/grYO1KQ1GLg1nhX87Xpbe4ztU7KdTLK8Gy6P1cJLYRZweBjxzynWr0TfqkH69DCg4QQYpg==
X-Received: by 2002:adf:e686:: with SMTP id r6mr58395807wrm.379.1636212489323; 
 Sat, 06 Nov 2021 08:28:09 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id t8sm9208759wmq.32.2021.11.06.08.28.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Nov 2021 08:28:08 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  6 Nov 2021 16:26:15 +0100
Message-Id: <20211106152615.3186989-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/socketcand: don't override
 dependencies
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

Don't override SOCKETCAND_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/socketcand/socketcand.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/socketcand/socketcand.mk b/package/socketcand/socketcand.mk
index b11aa3c91e..dbf859d3f9 100644
--- a/package/socketcand/socketcand.mk
+++ b/package/socketcand/socketcand.mk
@@ -11,7 +11,7 @@ SOCKETCAND_LICENSE = BSD-3-Clause or GPL-2.0
 SOCKETCAND_LICENSE_FILES = socketcand.c
 
 ifeq ($(BR2_PACKAGE_LIBCONFIG),y)
-SOCKETCAND_DEPENDENCIES = libconfig
+SOCKETCAND_DEPENDENCIES += libconfig
 else
 SOCKETCAND_CONF_OPTS = --without-config
 endif
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
