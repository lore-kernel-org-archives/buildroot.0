Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8407CC0032E
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 15:35:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05B6F4152D;
	Sat, 28 Oct 2023 15:35:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05B6F4152D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DjSxJY1vumrS; Sat, 28 Oct 2023 15:34:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 199374152A;
	Sat, 28 Oct 2023 15:34:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 199374152A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4FA951BF362
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 15:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FC024152A
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 15:34:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FC024152A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5ZpmZap0duU3 for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 15:34:55 +0000 (UTC)
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E541540396
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 15:34:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E541540396
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2c54c8934abso44070851fa.0
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 08:34:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698507292; x=1699112092;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cwZQKuYlbX0kpACiYkY8DoeReSt7PooGpp+EgCsh8Cc=;
 b=uN91T3n5ea9gSbFiPz7tUgSFz0ssJtIeutGl46hK3bscVm70vTHEyoo0pC53IsbhKj
 7xblWg2iJGwNqqvD/+X0xEcbxcWmzv5dJ2ycXAG65mS5XHxynsY7lh5vyWfx0nS6FUTI
 JWP9dx/qdjhwimEoiWFuvY1oJ7in4KOye0DMKiIQBr6VR2EjtBX0FvipBRT+9yqJ7a/c
 IGLLyTr8YowXmJpqbLaXCGicBsxaRRw40vAeGnIVjdpedBU0OmmnOpSeeICRC57LyWWT
 Lv+SIfFF9LaelMQC5R0i5j1aB/nGyYm5lUzGv0uHjYWW65EZPkE/nPSOAg+5W1aMmX3w
 BZbQ==
X-Gm-Message-State: AOJu0Yz3Pd2Nn+aAj9c029n3NBQvM4WGzvYHctuR9r4JiIeWXFIwWQ/9
 SFswfHWEFw8bAX+p5dMrCpLeFSOPmu4=
X-Google-Smtp-Source: AGHT+IEJPwhCSROXfiNFrJ3kp7cQC6QJ59z310TPl/MZz/6c3VbCOS/FYMgMeGdjVkQNl4kmZ6Im4Q==
X-Received: by 2002:a2e:a793:0:b0:2c5:8b1:7561 with SMTP id
 c19-20020a2ea793000000b002c508b17561mr4937141ljf.10.1698507292006; 
 Sat, 28 Oct 2023 08:34:52 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 u18-20020a05600c19d200b00401b242e2e6sm7781514wmq.47.2023.10.28.08.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Oct 2023 08:34:51 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Oct 2023 17:34:47 +0200
Message-ID: <20231028153448.142511-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698507292; x=1699112092; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cwZQKuYlbX0kpACiYkY8DoeReSt7PooGpp+EgCsh8Cc=;
 b=bDCNqrFuo3adLXq3efiXB2zn5FrxtcgBrovkV/k+L6Zw/S/Xmsw0Y39J4ac7WzB3cq
 axlT/zKIEFonVL6RMVnFCViMAetphdXqSSV1C69Bxxaue59yzXsYnpPff2dyMe7Rgi4H
 N/bvSGL5FIcVS0e3aVKtaqvNNtRObGj3h2zcyB1ozpjjuJe2jI+n62LQFn/5FEPzbxlk
 sfVLnHj/Rf6WyaWnQGMo9umzwl57FgceqXo5v4rvBsQPU5hofuawN5XyNhibVVdLdSmW
 UV12kw3WUGPpjBUlxqfAwOjMxeAMOsEv3yWovcZnpKLVHYyoHul8hqzJPAuexwHrhtcc
 NX/A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bDCNqrFu
Subject: [Buildroot] [PATCH 1/2] package/zchunk: add ZCHUNK_CPE_ID_VENDOR
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:zchunk:zchunk is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/480C0B83-3109-49EE-9E06-7866A54878CA

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zchunk/zchunk.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/zchunk/zchunk.mk b/package/zchunk/zchunk.mk
index fc91f90431..2acdaba3a1 100644
--- a/package/zchunk/zchunk.mk
+++ b/package/zchunk/zchunk.mk
@@ -8,6 +8,7 @@ ZCHUNK_VERSION = 1.2.2
 ZCHUNK_SITE = $(call github,zchunk,zchunk,$(ZCHUNK_VERSION))
 ZCHUNK_LICENSE = BSD-2-Clause
 ZCHUNK_LICENSE_FILES = LICENSE
+ZCHUNK_CPE_ID_VENDOR = zchunk
 ZCHUNK_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
