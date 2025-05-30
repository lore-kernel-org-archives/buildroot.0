Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96953C5AD49
	for <buildroot@archiver.kernel.org>; Fri, 30 May 2025 22:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 391B083DD6;
	Fri, 30 May 2025 22:05:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2G0KWkeR3jrd; Fri, 30 May 2025 22:05:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 363E583A5E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 363E583A5E;
	Fri, 30 May 2025 22:05:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2502F234
 for <buildroot@buildroot.org>; Fri, 30 May 2025 22:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 161C68356E
 for <buildroot@buildroot.org>; Fri, 30 May 2025 22:05:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id It8Ucdw3cUW8 for <buildroot@buildroot.org>;
 Fri, 30 May 2025 22:05:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6314A82148
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6314A82148
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6314A82148
 for <buildroot@buildroot.org>; Fri, 30 May 2025 22:05:35 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-b1ff9b276c2so1518723a12.1
 for <buildroot@buildroot.org>; Fri, 30 May 2025 15:05:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748642734; x=1749247534;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k9gw4qv3ItfqsfDaGuTadOYKG4s1BIlf0ybc8L0sL0U=;
 b=OB9rTg6yh9ZmpwLR+wMKCYvoA+InBmzPf6HD3QHW41ZO+Nd9ub2s5f4FZhtJPGzj0M
 yiUezDstko5hb0dyO82/kWfulcBcag2yrNGvmvoWvp4/ReUajJ8qACP29BfmYkniJ6EJ
 Ot+Ocq1T5R2UmDppmL0dyAkFpzc5wAj5F4zx+gpb+2kAHWy/ZzpNaD+4LltSvDesf19r
 FOF+G/qz4+XfJO7qf8MML9k44LdSQW0x5fp7zDDX8+pHNaQubij8p2eEr3/WzRvN7ey3
 k8XWS3AHEKSOKEkSlcTL01jCrfFN32n9c938P/fxSHq86Kt2PH4f3QoqLTxiqS7vvCav
 rXKg==
X-Gm-Message-State: AOJu0YyOH9B8sIH+U6vPnfucLHefE/n7Q8GIfP7xOMsJyMehFdFXZZGE
 0wuJDA2htc4blRO/v9Tx/2CwTx9FE3T7qLHWiKOGDfNsDufeUuI0IJzUC2DveT1l
X-Gm-Gg: ASbGncsBz4jNLH3nMJJzhrFITf3SfqyDbIrZ4zMeQmrshNuJX61NzKhic83beDATGUH
 cDS7+jR4PO5JTTMf+maIsbnefztSHlpy/Fti8iyzLEWFoAPGoRAKyH3+Cc69kjShCUTQRfgAoLW
 MyYZXZx5zGSvlwzBQn5IbFy2+HHYjnryhhEkvQxhPuApq/upqNDrIoUQv18euPouPcd7EUB0XCF
 522vxT2O1KvOH59x1I9DPpd2pfbqSD6K0VCFwHmV+yxyN+8+37Ghft6hVYETBMxl7ePAz3i1rL3
 tfbugizmaJ4wKE9VbuHxoYJGvK1x5aaES+TZEJvGQtNsw3c1XV12p4pOzZlslgKElQgS6SDNS9m
 46bP/IDCsZNsLkvo1aN6OIYopY9yVTsmU3c37L3Z6jlyOHy0g
X-Google-Smtp-Source: AGHT+IG6v9ryfpMTaiLm9VA9BQdgZ/QnR9/i6Mx8abZ8mtHu5o9S8ILDuItQrwaWwcvypU7IzqDxHg==
X-Received: by 2002:a17:90b:164d:b0:312:29e:9ec9 with SMTP id
 98e67ed59e1d1-3127c72e8eemr61847a91.24.1748642733976; 
 Fri, 30 May 2025 15:05:33 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3124e2e938esm1669263a91.28.2025.05.30.15.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 15:05:33 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Cc: Kadambini Nema <kadambini.nema@gmail.com>
Date: Fri, 30 May 2025 15:05:30 -0700
Message-Id: <20250530220530.562916-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748642734; x=1749247534; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=k9gw4qv3ItfqsfDaGuTadOYKG4s1BIlf0ybc8L0sL0U=;
 b=KVsN/n7jXGTvLGG4fECjzmSbMn5Q4LBUmwyA0xaY719hokdaeebGlRf3KtW/sdT8fP
 4cELYBjz+kfVIaNzrblHhdIUpBy2UxN4TGSIDlhYRHVTovyazV1cZpjemT0gx22SdAJR
 pT4WWDhSNh3GFu02aSoJPYZDJWSA75oaXc9g36h7YFxlUyaRuoIz3Uy1EvmItvhX70hM
 8T2lHvwlQYSCGu8VmC5SeF81zio9llas38zCiYvm/DTccl87oFFVUzJpeUpmYERo+0If
 Dj5ipbe1qjjWa0oZUQDXQ4tfX91P++VpPxXtpD2ZaK/bHJdS2DYKUIOzb7pYQ6HHr2vc
 vEyQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KVsN/n7j
Subject: [Buildroot] [PATCH 1/1] package/hidapi: bump to version 0.15.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/libusb/hidapi/releases/tag/hidapi-0.15.0

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/hidapi/hidapi.hash | 2 +-
 package/hidapi/hidapi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hidapi/hidapi.hash b/package/hidapi/hidapi.hash
index cc2d13214d..7344d55397 100644
--- a/package/hidapi/hidapi.hash
+++ b/package/hidapi/hidapi.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  a5714234abe6e1f53647dd8cba7d69f65f71c558b7896ed218864ffcf405bcbd  hidapi-0.14.0.tar.gz
+sha256  5d84dec684c27b97b921d2f3b73218cb773cf4ea915caee317ac8fc73cef8136  hidapi-0.15.0.tar.gz
 sha256  7d3b087c34f35d4d538e3bcddd1ff8f66e92f9ef336881999482800ddf840913  LICENSE.txt
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE-gpl3.txt
 sha256  30eb1bef29b46f8ba7ab8b416035dbd93cb034a45481dd97815b944284582cd2  LICENSE-bsd.txt
diff --git a/package/hidapi/hidapi.mk b/package/hidapi/hidapi.mk
index 9f5c0a3df2..c4daf934ee 100644
--- a/package/hidapi/hidapi.mk
+++ b/package/hidapi/hidapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HIDAPI_VERSION = 0.14.0
+HIDAPI_VERSION = 0.15.0
 HIDAPI_SITE = $(call github,libusb,hidapi,hidapi-$(HIDAPI_VERSION))
 HIDAPI_INSTALL_STAGING = YES
 # No configure provided, so we need to autoreconf.
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
