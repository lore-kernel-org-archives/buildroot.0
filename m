Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934ADEE0213
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 15:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56AFE80D5D;
	Wed, 11 Sep 2024 15:50:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vs4m4qxetPFV; Wed, 11 Sep 2024 15:50:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65F4F80D64
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65F4F80D64;
	Wed, 11 Sep 2024 15:50:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 00C1B1BF33C
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 15:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E453780D88
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 15:50:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qoO2FWqpf3hs for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 15:50:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A0DF980D5D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0DF980D5D
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A0DF980D5D
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 15:50:35 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-42cae102702so42887215e9.0
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 08:50:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726069833; x=1726674633;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=buT4a7Xf5HihzFuMgAeMdkytGgzHrA0n++KV+wSr9RM=;
 b=rPAyS/0SyhPImv9PHf21KYN5iBMTFjX6CsKIBjy/JlF5noVAoepRH+Hu1hTtOs9KdA
 Rc/X/RZTHajesQn9JAeBkGG4utRMibdXKxu42QvtWseSZOSdt1907imAyy5BYIcw1d6t
 ofF7rZPsmQRBNf/2lk3x/b0DUhz3kFYFur6yWeWYMBSVR8cZ2+vc/Nva/YO6POCM9Gt8
 qlfh4Dko//nfZm4HKCqkSRjNMdiSeWqvuFAeGJRMQh4/T3rb6hqPX/CdulkqFh7GWZ1e
 pDCWxYPGKjX6HGKGKIEkc3EzXBrj6Ru/4igOGAL/K0KtpgDwyYSZFnkEP4bAJqc5hxBv
 aLLw==
X-Gm-Message-State: AOJu0Yxpsz+8T/9AbCEK/WAKltfVT2ptyrYQHrY4KRg1EN+6KdbjuIl4
 0hwleGMfNRcs7A2FlNjsWkUdTvPOUrQ5671ibE3DxDGL+N73vy7kfnaRmwOVnGyWCW0sAQLRE7K
 BVdM=
X-Google-Smtp-Source: AGHT+IEhNNxw7gyO4PYo+jn76AwSCPwVJiDx0aemwlICQSmg3vJFpFqp4/Dblp8E9pxCln6fJoz6LA==
X-Received: by 2002:a05:600c:1c85:b0:429:a05:32fb with SMTP id
 5b1f17b1804b1-42cdb5318femr336975e9.10.1726069833013; 
 Wed, 11 Sep 2024 08:50:33 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.3])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42caeb8ada3sm143712915e9.43.2024.09.11.08.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 08:50:32 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 11 Sep 2024 17:50:23 +0200
Message-ID: <20240911155023.2921034-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1726069833; x=1726674633;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=buT4a7Xf5HihzFuMgAeMdkytGgzHrA0n++KV+wSr9RM=;
 b=eiBddIB7ocnzzAtzWcNeU66HAfAKkpjm4OLotuTrhStp1mh+MqyMxPHfm2yEoGUK5X
 gD3qEQa9xCkdxFhq75DFirRoXWuG6gdPIlsEkc2nf7Bu0yUNMvmc4FIlDgpvJiFy9ZG8
 VA7rDuZEEioZju4B0g7EgbIoWC7a7Azxol4FA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=eiBddIB7
Subject: [Buildroot] [PATCH v2 1/1] package/rp-pppoe: fixup download URL
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
Cc: Jaco Kroon <jaco@uls.co.za>, Dianne Skoll <dianne@skoll.ca>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As reported in [1], the download of rp-pppoe-3.15.tar.gz is no longer
guaranteed from the download section of the project.

Fortunately, Jacon Kroon is hosting the RP-PPPoE source code for versions
3.15 and 4.0 in a location that permits automated downloads.

Fixes:
- http://autobuild.buildroot.org/results/8676456feec9dd401152887101ad1a9ce96cb769

[1] https://dianne.skoll.ca/pipermail/rp-pppoe/2024q3/000652.html

Cc: Jaco Kroon <jaco@uls.co.za>
Cc: Dianne Skoll <dianne@skoll.ca>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
Changes v1 -> v2:
  - Change download URL.

 package/rp-pppoe/rp-pppoe.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rp-pppoe/rp-pppoe.mk b/package/rp-pppoe/rp-pppoe.mk
index f50f1e5a1fd1..75f2290442bc 100644
--- a/package/rp-pppoe/rp-pppoe.mk
+++ b/package/rp-pppoe/rp-pppoe.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RP_PPPOE_VERSION = 3.15
-RP_PPPOE_SITE = https://dianne.skoll.ca/projects/rp-pppoe/download
+RP_PPPOE_SITE = https://downloads.uls.co.za/rp-pppoe
 RP_PPPOE_LICENSE = GPL-2.0
 RP_PPPOE_LICENSE_FILES = doc/LICENSE
 RP_PPPOE_CPE_ID_VALID = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
