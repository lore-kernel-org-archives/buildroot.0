Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF6E9C433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 08:31:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5951360F9D
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 08:31:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5951360F9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27D85613B1;
	Wed, 22 Sep 2021 08:31:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y9Tvq2IWuls0; Wed, 22 Sep 2021 08:31:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 809BA60B51;
	Wed, 22 Sep 2021 08:31:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 397C91BF30E
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 08:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3430D4049D
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 08:31:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Ty67kB3BwXt for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 08:31:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8070740161
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 08:31:29 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 k23-20020a17090a591700b001976d2db364so1704007pji.2
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 01:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+9rUnRMJkF3g55mTij5LFbViwB+nDQTyZsYE1bk+VYs=;
 b=n5rmYMm9Ymt9FclYFQZugVBqoWa9shZT+bIkpn5SXC3nSK6IWmqVLjFdDC8MZp10Of
 XbWmDmiRoON3Gr/fMtahhXancpOSNmygYFz9tc4CYda46NCBo2FHekZvDudgWPkoQe3x
 4vHS7HAX+JxHb/kxVprsGV1AIa+am78EQpMve/HM3HyiVmIZZmVAAzSmLmlS7u7k8ZCR
 K9GmX/p6AyAIyZlfhwalI+Qbpf3LgQuw2DhhvB8H/9mocHOMi86b1YEYRaBAqzL//cDn
 I0+W55ga2g6EDnZbjILsxnPwIlQi3EqeOZ5W8ihtbpbTZgnsfqKY/NjmlR2ymABxzEFU
 /dog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+9rUnRMJkF3g55mTij5LFbViwB+nDQTyZsYE1bk+VYs=;
 b=c/GPCLoDgjVzf4xNDoj6+2p8dD9iEjy04HVUySv1M5ZgYcM9cSimqP2p46KzIZUYRm
 +8GMepP/l2Ca1PrPCxF8KqsX9T33y+nPAjV6vJ00G55JtNCzbVojto/fTw3/DEeexfuu
 fricEIzIgv55GjzG6k1Qe5cOb8iP5Q6Oqm/sf9fpZqPUx4CLgolQzae4G95PEvsX06qV
 W9vPTHbS5mJfCpvEC+T/Dw2+r2JOAkZTfTSEyiLwDmY8UWYHuAzlXXreHE3Agjtz7fJZ
 as6SzBrq/FQWE2VwtrtQgqdBDc/dvD0y9/ZQ/JIaE4ye9PgqefOgyZeehnS3/swZM9rq
 2tFw==
X-Gm-Message-State: AOAM531NkvvKz8IFGVg1ulc0KjB9xM7LYxr4YZt8jOPDssIzsUVmx49i
 PzDTgdpf9U7PFbJO7rn+oIkDrKoRk63zmA==
X-Google-Smtp-Source: ABdhPJwgcuVBMFbN+b/dnJaxoH5C6XnrNlX5bMYJdbvClvM74LCPqu64HznRXUJitNFIzsnCkRm/fA==
X-Received: by 2002:a17:902:e793:b0:13b:9cae:5dcd with SMTP id
 cp19-20020a170902e79300b0013b9cae5dcdmr31279293plb.53.1632299488628; 
 Wed, 22 Sep 2021 01:31:28 -0700 (PDT)
Received: from chrisp-dl.atlnz.lc ([2001:df5:b000:22:45c1:823f:9f7c:20d])
 by smtp.gmail.com with ESMTPSA id g3sm1631656pfk.178.2021.09.22.01.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 01:31:28 -0700 (PDT)
From: Chris Packham <judge.packham@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Sep 2021 20:31:14 +1200
Message-Id: <20210922083114.545106-2-judge.packham@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922083114.545106-1-judge.packham@gmail.com>
References: <20210922083114.545106-1-judge.packham@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/micropython: Bump version to 1.17
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
Cc: Chris Packham <judge.packham@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Update to micropython-1.17. The LICENSE text has been updated to reflect
the licenses used for various libraries and ports, update the hash
accordingly.

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
 package/micropython/micropython.hash | 4 ++--
 package/micropython/micropython.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/micropython/micropython.hash b/package/micropython/micropython.hash
index fe47ee09c4..d5045e8f27 100644
--- a/package/micropython/micropython.hash
+++ b/package/micropython/micropython.hash
@@ -1,3 +1,3 @@
 #locally computed
-sha256  542eb120df8d9eb6f200bcd856294e143813adea9dda0d7189405c218d4b16f7  micropython-1.14.tar.gz
-sha256  9c6089e26c8638a0645bcb0db2c85051f82de8022dcd07fb22baa0c5f9362085  LICENSE
+sha256  c21dbf8144237b3dbe3847c9ad5264cd0f3104eb078c810b3986004cce8fcd70  micropython-1.17.tar.gz
+sha256  59b1f0947a87c90d0d29dbe2c8deb3d1f8263bbbd2fb5ebcc79a649cff6dfcba  LICENSE
diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index 7a752efd69..5dc044239c 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MICROPYTHON_VERSION = 1.14
+MICROPYTHON_VERSION = 1.17
 MICROPYTHON_SITE = $(call github,micropython,micropython,v$(MICROPYTHON_VERSION))
 MICROPYTHON_LICENSE = MIT, Apache-2.0, BSD-1-clause, BSD-3-clause, BSD-4-clause, \
 		      GPL-2.0 with FreeRTOS exception, GPL-2.0+, GPL-2.0, LGPL-3.0-only, \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
