Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40083C48BF8
	for <buildroot@archiver.kernel.org>; Mon, 19 Feb 2024 19:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E32DC40B78;
	Mon, 19 Feb 2024 19:59:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ooDDlhqRClRo; Mon, 19 Feb 2024 19:59:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD90E4060C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD90E4060C;
	Mon, 19 Feb 2024 19:59:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B1421BF228
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 19:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8885081FDA
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 19:59:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q8lQesqkO1Tz for <buildroot@lists.busybox.net>;
 Mon, 19 Feb 2024 19:59:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DCD2581FB9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCD2581FB9
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DCD2581FB9
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 19:59:15 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-6e459b39e2cso938948b3a.1
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 11:59:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708372754; x=1708977554;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wBdEHjmlW7ewKtVa08nxAPhmKTufPFjYbdNfnw5kcbA=;
 b=YVmTi5SAjL/GqleMmx2WkXf12JGsr4C/71396IpTnTIWrCAbV7fj5RUbWfr2g+4Hjx
 goRVBPJ6azO4gjgW8EOJkYaE/tZdp8tQz4Gz6AveOwCx8H6qleSaEy7exXF4RfFmBynb
 As6akeBLS1WSbBbrO4lLEeJJVwJ1jFUqVX9eUYGXNXDk7gcAaEDBNFqoG6m5c9QUxM4r
 yzsHZenzx64o+gpw/p3+oT+uk7gfNapZ4ng6iM38YiPYtjvSDy0Hj8cCQP37bz8aqH5u
 9zclsnQ/FREr2Rwb/5If+HmEJKvhYO+apWDXDW+oFwI8EA6msjRUBVMJoXcx5mzBTTrz
 XcgA==
X-Gm-Message-State: AOJu0Ywb198ekrjQhxAEMfUM97ZyYl9sS9eMzpRrs+qhE+1df8J0ovWD
 XThiccEzx0+ociAkccZTO3LUy9fbPLD9BngUxoVUMxn8+eVDiE3ZJR0BVZLCdAg=
X-Google-Smtp-Source: AGHT+IHfkOHlo/DLqSyM4OkWUxRpNK4Id66OqCgCjplGKry1Nc8kPdX8sQ3/ZzBbkB10nh4l1lPbDA==
X-Received: by 2002:a05:6a20:9592:b0:19e:5e0c:3bb8 with SMTP id
 iu18-20020a056a20959200b0019e5e0c3bb8mr19198966pzb.7.1708372754295; 
 Mon, 19 Feb 2024 11:59:14 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 o19-20020a637313000000b005dbed0ffb10sm5041245pgc.83.2024.02.19.11.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 11:59:13 -0800 (PST)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 19 Feb 2024 11:59:10 -0800
Message-Id: <20240219195911.43452-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ba5719b0-9b18-4148-bdfe-8a16ef06c4ee@benettiengineering.com>
References: <ba5719b0-9b18-4148-bdfe-8a16ef06c4ee@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708372754; x=1708977554; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wBdEHjmlW7ewKtVa08nxAPhmKTufPFjYbdNfnw5kcbA=;
 b=Q9hBQpKJ5ERqZYxowgmiEGVp8/gfxPl9R4u035E1ObWb3kIgV6/z5lRgQIzr5ddT8h
 BBQ4Kq5EbpQrafkmuF/qRDVZP0U7WaveDihpgKfqIv8s6+ziutuDxx1OEKpXvHcABCLk
 NZgne1nKDzJ92S3bYsWiu0bC+21h0jgZ3XxqpV7joX7bMjktUFNBP194CLtzOrzv7igd
 ZiAI+yv/ckR6NgWGT+L0T++Q/mOwe0jmnA1JKXrI0k9awFhM0LSowTiVeCz6PRiC7T5S
 mxQsh0VE0ymSh4rRld9obUKmAOybQxpd/Orgio5vqtUJkxzOGmT/ACFQbxzqN+aIWLRH
 dXtg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Q9hBQpKJ
Subject: [Buildroot] [PATCH 1/2] package/libyang: bump version to 2.1.148
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
Cc: giulio.benetti@benettiengineering.com,
 Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Kadambini Nema <kadambini.nema@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/libyang/libyang.hash | 2 +-
 package/libyang/libyang.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libyang/libyang.hash b/package/libyang/libyang.hash
index 3658b20e4e..e03278adfd 100644
--- a/package/libyang/libyang.hash
+++ b/package/libyang/libyang.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3e52b922fcf371933ad7de1686ad83504e3358236e7817b5af795b0db52fa221  libyang-2.1.111.tar.gz
+sha256  77a0aaaeb3df720aeb70d6896e32e2c2be099d48df73e3cfb52567051af3e44b  libyang-2.1.148.tar.gz
 sha256  0b7ec43747d211a1e49c53588b0822062947bab6bdcc95238578beab34cba5bb  LICENSE
diff --git a/package/libyang/libyang.mk b/package/libyang/libyang.mk
index 5533c7c68e..fca0cd63f8 100644
--- a/package/libyang/libyang.mk
+++ b/package/libyang/libyang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBYANG_VERSION = 2.1.111
+LIBYANG_VERSION = 2.1.148
 LIBYANG_SITE = $(call github,CESNET,libyang,v$(LIBYANG_VERSION))
 LIBYANG_LICENSE = BSD-3-Clause
 LIBYANG_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
