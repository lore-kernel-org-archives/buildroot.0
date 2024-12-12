Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9FE4E7717F
	for <buildroot@archiver.kernel.org>; Thu, 12 Dec 2024 07:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C08261370;
	Thu, 12 Dec 2024 07:09:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U1wXe8APjxZJ; Thu, 12 Dec 2024 07:09:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADC8861382
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADC8861382;
	Thu, 12 Dec 2024 07:09:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DDEF21146
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 07:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBD0661385
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 07:08:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oi21h-amNhWb for <buildroot@buildroot.org>;
 Thu, 12 Dec 2024 07:08:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9F54861370
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F54861370
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F54861370
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 07:08:58 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5d3e8f64d5dso421237a12.3
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 23:08:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733987335; x=1734592135;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=huBCZbGSE/QvuxFt2Bb2YaCORDMnmAuP9iB1PNeyeIw=;
 b=EK4D0/zgn2xW2zgR8YRNall5qoAMyLxYSPTmwYhNYCbEicJ6nY4d/5UcvJz3LUz3zP
 rPXjMt5b2qNiuXx169lPUoh8IoX6HFI9fzdow7Oghh7gliT0YhkHTZFEsPQRgEaPSieP
 74tEN1ivPPN1hdOjSkfuP754eh6TM8rDdEFMUSd+T1ywUGCDZ2miI8VEv56vig/z+2zd
 j4M4ss2xAZab0NYMurJilxpxLoHJNb5/WBwcnoMHCLpDKbJ97+SIFqOSSrLDKiJfJ3sm
 I/YpHgDwNv7+Eix173txintFzTk41dXukhotQDahn7Bt8CBSQMsaNTQOxp1wJRdOayYD
 uhbQ==
X-Gm-Message-State: AOJu0YzcSTn2KTaiVm/JOzckyWZnNF3SnRl7V7n4Yr+3/xyV7EjGmPUY
 rrSyAY+SQG6xK2qPhO2LuQwx9zGJom5vST6D1vlCE8TK5a8jk2Xmoue/WQ==
X-Gm-Gg: ASbGncteBnaiP/jTMmnYHqILRPxYdtuNWZjjRe+ipPiM+/O0UpxjwqJhw7czxOTDdt0
 Q205rglINn6iTtKo8EsVhoHP9QQ9+eMZKeDK9BLYPUCB8TyyyUTIKQdpxfIS2f922CbWpejHDGQ
 L+Ei5JX875626ki9tpo2wln2xhkiifwDvx87OCcXRf2ARff2t04Ubv/T3DoSP1f6A/di25lfwTX
 N/C7JKoG6wjx8hBesjn3NLHRfKi/JyD8Bk8YhpHQ2hArjCK2zj/BDFFQHX8JYNk+oJ+V86wjybE
 Wkva36sGzAEuEVdi9dwLpf8ZAjGcuDso53jAHw==
X-Google-Smtp-Source: AGHT+IEofoueYxH6cr0Z0zGlmbFKqT71+tRf7cZRGGG3gZvvr7xK++9QirVpGqBfXwKBZJ7UpaNBDg==
X-Received: by 2002:a05:6402:3217:b0:5d3:d8bb:3c5c with SMTP id
 4fb4d7f45d1cf-5d445b3d90amr2526730a12.12.1733987335213; 
 Wed, 11 Dec 2024 23:08:55 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3ee6ddf5dsm6558916a12.86.2024.12.11.23.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 23:08:54 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu, 12 Dec 2024 08:08:45 +0100
Message-Id: <20241212070845.1623350-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1733987335; x=1734592135; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=huBCZbGSE/QvuxFt2Bb2YaCORDMnmAuP9iB1PNeyeIw=;
 b=TAdSa+7CtEaGKzS7liPnceOytn6+v6CTmGY1D2Mih19Ev0A3LCWzujXYqHenhfTZVp
 17WEnnG+0CLk7dpivnpLNm7rSvU2nbFftIgqoE8L2ClkqZkZ/VndqEMSfyFOPDtZKxJh
 sETAP1RSlxlZK2fw5c6BieXtMukdK4A4mVlGSYnop5j+WClcxjiup5r++JWt6IMd3yoC
 TGoxs2lgPAiNZb7QSKvHL7xpbSv+8oeLDSOcb6bhfdnPWZHazb96+ZPa2Hw2FFl/JGZm
 6x1bT6rtSE8jAXX6j+W3e7yirTCRTDvdXrukPtN+WZ0VYrcNwNNrssOqWSIIdt6wcKUY
 o4+w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TAdSa+7C
Subject: [Buildroot] [PATCH] package/python-autocommand: remove licence
 declaration
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Remove license declaration and rely instead on Trove classifiers
and LICENSE being included.

Fixes:
https://autobuild.buildroot.org/results/6af310ba0f114020781fdcf71d3169ea3083478c/

Upstream URL:
https://github.com/Lucretiel/autocommand/pull/33

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...eclaration-and-rely-instead-on-Trove.patch | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/python-autocommand/0001-Remove-license-declaration-and-rely-instead-on-Trove.patch

diff --git a/package/python-autocommand/0001-Remove-license-declaration-and-rely-instead-on-Trove.patch b/package/python-autocommand/0001-Remove-license-declaration-and-rely-instead-on-Trove.patch
new file mode 100644
index 0000000000..05807d1d8f
--- /dev/null
+++ b/package/python-autocommand/0001-Remove-license-declaration-and-rely-instead-on-Trove.patch
@@ -0,0 +1,27 @@
+From ec6f6641c10be1e9285be5d31c96462f251889d6 Mon Sep 17 00:00:00 2001
+From: "Jason R. Coombs" <jaraco@jaraco.com>
+Date: Thu, 4 Apr 2024 17:23:20 -0400
+Subject: [PATCH] Remove license declaration and rely instead on Trove
+ classifiers and LICENSE being included.
+
+Closes #32.
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ setup.py | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 41f86a1..d154562 100644
+--- a/setup.py
++++ b/setup.py
+@@ -13,7 +13,6 @@ setup(
+     ],
+     package_dir={'': 'src'},
+     platforms='any',
+-    license='LGPLv3',
+     author='Nathan West',
+     url='https://github.com/Lucretiel/autocommand',
+     description='A library to create a command-line program from a function',
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
