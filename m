Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B994BC3DA7A
	for <buildroot@archiver.kernel.org>; Mon,  2 Jan 2023 12:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A58F4157D;
	Mon,  2 Jan 2023 12:22:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A58F4157D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VkvPI86g7PrR; Mon,  2 Jan 2023 12:22:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49A7941578;
	Mon,  2 Jan 2023 12:22:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49A7941578
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 447801BF33E
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 12:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BC4C80D7B
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 12:22:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BC4C80D7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gn0f6qo9_0Iv for <buildroot@lists.busybox.net>;
 Mon,  2 Jan 2023 12:22:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C9FE813D7
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C9FE813D7
 for <buildroot@busybox.net>; Mon,  2 Jan 2023 12:22:07 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so18100467wmb.2
 for <buildroot@busybox.net>; Mon, 02 Jan 2023 04:22:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J0BVCu2VrVk2VhjHN1ChtNRa/e1xnnGs32TvxR5LBxQ=;
 b=uTjVk+zfAWCxgYDxVfKobUw4GCMaUKurBQ1kh00Z1UrjuOPWBGpzM15JiHPWCbNx2h
 ow91go2Klgt8RR7YY0Qa8qqTVhEUY9vAgFtGmYo5Ia/EKRVnMJVQI3/U+2Alg4Vu/Z5L
 3oNRKiQV8YsqL2am/qH0aj4z31xM0tcHMqQ+LnDbOO/dqv67wyUK7QmNlqHVTOfH5piG
 txkWPFWCk0Z5TEcybBnCnXp16kkfB+0tX+Sy63p+vqG7sBfcJ8LoAhqBYVF4r1/Nzjpr
 ka7werUEb7RwJ72na8a+f9BLuvcpfUUIT1fPYjLt9nH0YO6qLG5mbV88V0nGHWUnxbrh
 9UZQ==
X-Gm-Message-State: AFqh2krYcqvHI3i4uyIMQmDDa1N3SaV8Mkv9yArG/Zlv2psHR4B6ed7Y
 RdWdMHG2Q/AcOt6RX9jkaHwAwt5jc9w=
X-Google-Smtp-Source: AMrXdXurbKMRt79Dl00BiNWE1Pb2QdvjyejiR+vC65nPHGOFoHtXYBzFJRcriw5W/Jp5X01i8BA1Ng==
X-Received: by 2002:a05:600c:4e4f:b0:3cf:9d32:db67 with SMTP id
 e15-20020a05600c4e4f00b003cf9d32db67mr28510149wmq.3.1672662125366; 
 Mon, 02 Jan 2023 04:22:05 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 o37-20020a05600c512500b003d98f92692fsm24889481wms.17.2023.01.02.04.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 04:22:04 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  2 Jan 2023 13:22:00 +0100
Message-Id: <20230102122200.1912346-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J0BVCu2VrVk2VhjHN1ChtNRa/e1xnnGs32TvxR5LBxQ=;
 b=EPH4aNPMFYu0oK/aK4LSxXysDIyUXPowwgq7mYntPGp7YMAk7bkLhyDhe00yjaJStO
 np64COs3i9lLR2xilGVncvYtCu1Gz5epoJwynhuFYQFTXOMNWusJVtTOAMhhXRD50jtg
 kN2xCs51fcv/ygj7y0Zt4QagaC79rAc7p1oypWSzlFELaifqG6px8sMLnTOZSGFuX1g4
 YTHIK5BiiN0aRW1ncqHJ9UmrEhv24DKBfEqemEZyQgv8DX0u9r6Ra3OwhN0xtRC4U1uw
 jxXe/PT+BBrg5m/ondoAdBZg7RDRecCtYmes9aBAJb3W+slql4yPBnDNR5zTWCaZeTAI
 WduQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=EPH4aNPM
Subject: [Buildroot] [PATCH] package/prosody: bump to version 0.11.14
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/prosody/prosody.hash | 8 ++++----
 package/prosody/prosody.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/prosody/prosody.hash b/package/prosody/prosody.hash
index 3a3a363a4..1fd1abafe 100644
--- a/package/prosody/prosody.hash
+++ b/package/prosody/prosody.hash
@@ -1,8 +1,8 @@
 # Locally computed:
-md5  7214ee57d4702585bd0d3428e69790b4  prosody-0.11.13.tar.gz
-sha1  1cc5a72d98738872d0c1a4c34b1fcb8878348c7d  prosody-0.11.13.tar.gz
-sha256  39c61b346a09b5125b604cb969e14206cbbcb86c81156ffc6ba2d62527cf0432  prosody-0.11.13.tar.gz
-sha512  7616785536b7b51767a26963a80c961ef2403609e1e78dda3f88cf68c00d5bb899278c70a22b006b58c36c62cbb1bbd390a9298bad5b8d6524928a1cd5457813  prosody-0.11.13.tar.gz
+md5  93665d86c47e99c9c525610ac53400fb  prosody-0.11.14.tar.gz
+sha1  abbd0ad42e2b30051f4d3f198c54a52b4e9f39d0  prosody-0.11.14.tar.gz
+sha256  ec0c7447ec07ed336b6912d06a2f533439cb16d60d8d3bffa8ce46269ee52c87  prosody-0.11.14.tar.gz
+sha512  128e12427ae0b5080fd3cc2380974c04570b16f0f79de7b39ef85cec6e8f579bee2d1150ce70ca731222c487dba646cbcd48bdb4a102a14395644eb5f19f1c88  prosody-0.11.14.tar.gz
 
 # Hash for license file:
 sha256  bbbdc1c5426e5944cf869fc0faeaf19d88a220cd2b39ea98b7b8e86b0e88a2ef  COPYING
diff --git a/package/prosody/prosody.mk b/package/prosody/prosody.mk
index 62ba073b9..b5d89ebba 100644
--- a/package/prosody/prosody.mk
+++ b/package/prosody/prosody.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROSODY_VERSION = 0.11.13
+PROSODY_VERSION = 0.11.14
 PROSODY_SITE = https://prosody.im/downloads/source
 PROSODY_LICENSE = MIT
 PROSODY_LICENSE_FILES = COPYING
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
