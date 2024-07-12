Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D11C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 20:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1ED614183C;
	Fri, 12 Jul 2024 20:19:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q8BdiuHgHcNi; Fri, 12 Jul 2024 20:19:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE38941A2F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE38941A2F;
	Fri, 12 Jul 2024 20:19:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9D1F01BF420
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88D2581346
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:19:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jcN1VShVyPnO for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 20:19:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 830FE81209
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 830FE81209
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 830FE81209
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 20:19:48 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-3833cd120e5so10017975ab.1
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 13:19:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720815587; x=1721420387;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6Xsxv5hNdzGUM32UnYkSPJmTNK2xVCY4GhGYs/GgGGE=;
 b=tEAYgIlKEOvZUgR7UP24EyRK5+nXLJ7s4wRiqmsyASBhIDeNgh6EBYloROP6WvxWL2
 /Q1kPpG7JLC6w+jSMC5P/fA9+PnsdiMeuo2Xh0lo9gwYgng4uy00KNyUbhpyuuTw3ggC
 yHaHOP8TjjiEfqEJkKEAx+fkrMXL4LmiUkPAqm1uULTGXyKLtlSOgEnJfNSVq7J7IpXO
 Xy6cH0G8GSKDjEmpsp+cRZ4hli7d5qDcCy2CRFAR3A7Pt1H/GwnC3XASAuxzfdKNxmO/
 LUQpEI/Se5irPrRcV1f612buB97+gkRGIxT6kWqNVo+PojLdXNP8w9h6k6nbSG2z6+nT
 w1+g==
X-Gm-Message-State: AOJu0Yz95vnwSaJ8KXfbscwW/ER/RjZsTgHDpvAEMXH5bOgBD41Xnt+5
 E7/3qawcqBEwItmvr53tJgyXZIxPBOhtJRfdetytUU+XwfmGlL8ZWzWE7KwE
X-Google-Smtp-Source: AGHT+IE3Pq21wF6d24RjTK7OMMoyQH5ymKkjn+igFr7yWvIbpnZiBNkHHVurRO4ZMrtl606tcZk4cA==
X-Received: by 2002:a05:6e02:1c8e:b0:379:393e:df70 with SMTP id
 e9e14a558f8ab-38ee32bb1aemr15943575ab.6.1720815587177; 
 Fri, 12 Jul 2024 13:19:47 -0700 (PDT)
Received: from james-x399.localdomain (97-118-154-90.hlrn.qwest.net.
 [97.118.154.90]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-38a4946152asm21402645ab.24.2024.07.12.13.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 13:19:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 14:19:43 -0600
Message-Id: <20240712201943.457747-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720815587; x=1721420387; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6Xsxv5hNdzGUM32UnYkSPJmTNK2xVCY4GhGYs/GgGGE=;
 b=MMxh9MwhBfV5v0iqZVSxaqe10fTZrbIyGwa+vtkgZec7InfwGC90kIfiiALplQus5X
 ny1+kSkuYDAfzeiTAJlJWl70x/Q4Ox6PuorTMDikbnuYbvFbAPyWrVOJodBVTS+xV7ox
 EvEv0IZRh8hexVoqGd0FjkMDsCIuMgKIdfvnbicZ6h9inT8gmi9m3mB8MfIBwNlaVOLX
 xKRGVMjm0IIfgEkXAkAVqf5Wqx4QB+Dlw0+wl7YnUbF92zdOSpJGCBEprbhI7Shtteno
 5u6K8KLviyQGpBHEN1yrSbAnijkfZzEYK7g3LegxFSJWdgQZw9yDXEa9mIvuqTW9YuI6
 Hmfw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MMxh9Mwh
Subject: [Buildroot] [PATCH 1/1] package/prelink-cross: bump to version
 ff2561c02ade96c5d4d56ddd4e27ff064840a176
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/prelink-cross/prelink-cross.hash | 2 +-
 package/prelink-cross/prelink-cross.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/prelink-cross/prelink-cross.hash b/package/prelink-cross/prelink-cross.hash
index 4aa3a86c45..286fef9fc3 100644
--- a/package/prelink-cross/prelink-cross.hash
+++ b/package/prelink-cross/prelink-cross.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ce0d58b7c60a441fd61c52329e2c767f7888056c491f55627a5304b13fda743f  prelink-cross-440c0059a21f06b5577499a80b55482cb99d6d1c-git4.tar.gz
+sha256  a8fdf6e96032d2300102c549bdb4d961fef4e546874d79cda1f88fa07912e30c  prelink-cross-ff2561c02ade96c5d4d56ddd4e27ff064840a176-git4.tar.gz
 sha256  b8a2f73f743dc1a51aff23f1aacbca4b868564db52496fa3c0caba755bfd1eaf  COPYING
diff --git a/package/prelink-cross/prelink-cross.mk b/package/prelink-cross/prelink-cross.mk
index c32ea74afd..e554a423d4 100644
--- a/package/prelink-cross/prelink-cross.mk
+++ b/package/prelink-cross/prelink-cross.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PRELINK_CROSS_VERSION = 440c0059a21f06b5577499a80b55482cb99d6d1c
+PRELINK_CROSS_VERSION = ff2561c02ade96c5d4d56ddd4e27ff064840a176
 PRELINK_CROSS_SITE = https://git.yoctoproject.org/git/prelink-cross
 PRELINK_CROSS_SITE_METHOD = git
 PRELINK_CROSS_LICENSE = GPL-2.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
