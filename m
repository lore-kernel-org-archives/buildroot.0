Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BED6C433F5
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 11:00:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3881460EE9
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 11:00:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3881460EE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13A3B8246D;
	Fri, 12 Nov 2021 11:00:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a5505JN6ojVZ; Fri, 12 Nov 2021 11:00:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D04982479;
	Fri, 12 Nov 2021 11:00:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 693C51C1148
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 11:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E1DB607B4
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 11:00:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2qZZcSe54Glw for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 11:00:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 97D7860701
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 11:00:15 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id i5so14829248wrb.2
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 03:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n1qkLASKawt6S4ZKWtJ9/WyMVsFzLu/jVIrl4oRjIMg=;
 b=f04io5d5EnH30zHoWAgtmNPNN5pcUw7mWc9LJEfV+0HUjOJPTxYTwKhTUoLYOxCN0q
 Njf36woPyntZvKz/lvu6id0gmxYvYyvVsSJA8VMN5ToPQvv/3zYqhk6WS3E871kK2Fby
 c1sWAkefIqY48jD7PRaynHZhS5xcsn99zrK55hxycuoCn1anYP19rm6u/LG44Zw09lqG
 3D247jvn2AcFUhI4fUM3AX2nTCGlrtUAh+kCLEiunGFbwjHpN8AWGUEPlj1pB+ke9pqw
 gk0Z1W00feCXEtvrpoflj7afjYOB0V/68PAIq31ZsdulrI/Sf4p11Hz9BSBleYBOpK81
 WTcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n1qkLASKawt6S4ZKWtJ9/WyMVsFzLu/jVIrl4oRjIMg=;
 b=rTx46gly0hSo5SkG5MBxT6Brk66ZUd25nYTQ472uK3jb4FyTtOxzJ5pLNdxuLAMQ/C
 P/gI+TJzQJi9b6j6phKTX+yHF+pmZTNc9jBG+UsfjG9nZPyRRjWx9obaHbbcgO8Onntg
 9fSOtv7mEZ6es/Qus8T9v0Zbjq0FYRv9hr2j9HluhzFR1+LF16b5hZizLCzuukRRfS67
 UhpLheeH0XFnDckZtKPNJ0gBfGjONsTVfkjedDGNBxCAiGbMCMotsqg9ESsl1EzICsvJ
 dHVMrLscTS04BFcWmGax8fPXaQstwUHTXeTVbcPXZvZcPOn3Vo6fpYKBSU/FaCmdfqsn
 Eyiw==
X-Gm-Message-State: AOAM532roDJdMoNLoaz7XMqwT94o2bvQarW9YouiTVpV0TStG8hR2cl4
 IP80/3T0qNjH1od3rtRvjK0VzJDDFiM=
X-Google-Smtp-Source: ABdhPJweXW7bh7kFPedKX9hDVSPJ6ZbfLLjeL1oNp64eYQ2aUykzAISgJv3stMrZzwOm73Qi8JSr8w==
X-Received: by 2002:a5d:630b:: with SMTP id i11mr17168400wru.316.1636714813851; 
 Fri, 12 Nov 2021 03:00:13 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id 8sm3748796wmg.24.2021.11.12.03.00.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 03:00:13 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 12 Nov 2021 12:00:04 +0100
Message-Id: <20211112110007.787836-4-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211112110007.787836-1-romain.naour@gmail.com>
References: <20211112110007.787836-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/6] package/luajit: rework
 BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
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
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit reworks how BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS is
defined to follow the recommended syntax.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Francois Perrad <francois.perrad@gadz.org>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/luajit/Config.in | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index e4e1249240..f6d01ed09a 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	bool
-	default y if BR2_i386 || \
-		(BR2_x86_64 && BR2_HOSTARCH='x86_64') || \
-		BR2_powerpc || BR2_arm || BR2_armeb || BR2_aarch64 || \
-		((BR2_mips || BR2_mipsel) && !BR2_MIPS_SOFT_FLOAT && \
-		!BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6)
+	default y if BR2_arm || BR2_armeb || BR2_aarch64
+	default y if BR2_i386 || (BR2_x86_64 && BR2_HOSTARCH='x86_64')
+	default y if BR2_powerpc
+	default y if (BR2_mips || BR2_mipsel) && !BR2_MIPS_SOFT_FLOAT \
+		&& !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
 	# -m32 flag is used for 32bit builds and host-luajit has
 	# limited architecture support
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
