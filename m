Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 448CACF58D7
	for <buildroot@archiver.kernel.org>; Wed, 19 Nov 2025 19:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F162683C70;
	Wed, 19 Nov 2025 19:57:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h-L7SeXFLZJv; Wed, 19 Nov 2025 19:57:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFA8283C76
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFA8283C76;
	Wed, 19 Nov 2025 19:57:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7730E2A9
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 19:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68F8240F04
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 19:57:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ATX8RPB75I4r for <buildroot@buildroot.org>;
 Wed, 19 Nov 2025 19:57:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=mr.zoltan.gyarmati@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 66A4E40F01
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66A4E40F01
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 66A4E40F01
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 19:57:20 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-477a1c28778so1665045e9.3
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 11:57:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763582238; x=1764187038;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lg/4X1OtHxmIUxQs6GuP1Dd5KGYGo+WunWXCSijtNtA=;
 b=p2Q9FM/gaItsRcZjbpjQNBFTANM5rIKbPxmlzyCawMN8hBtkBeJInJGjGVoumLeK/n
 sS8APRlWpF2pEGDBD4aZOuejfYZCejYlX+NSVIuNPSE5n1e127Qbxvm5vR7DJ0FgEEEa
 6SREN8sUG5XRL8UovCilWfdFfMLf0piB8QzBsoPDaNJ9BBm4Jq1rxkolE6ESBwTKFPjb
 DkyJySrlljlIGE9Wtzj225ICCwU1uHk4LPrzKHBnZSmeabwAIW9PKh4EQCvB51Ow5GIY
 Uk5E7QRYYuTKSNgY3iRAFa77lfg6O2GTlR0lViNBSgzUmd0PRct8Fo6YeSiqJLL/Hs5A
 oe/A==
X-Gm-Message-State: AOJu0YweFH2qPw8QViaukf9lzycwGlCjwuLMI2GZyzOwisdpPgQOWvwg
 KmhMrcix6xG3LrSIEGyqlpEyQMBG4FadCyoxMSAR6Uv5nNUuPuFbq1R6xOlhcA==
X-Gm-Gg: ASbGncuE7u836tnJQh6fGEL48itNQb7B2slgezDSre47TizU3tgXmUeVNTBNVoMJFJ1
 hEsCLF7v73yNmhdad7fju0CaRL4h9l10pjIyZyrk9nszNi/o8YDvulyCG+CSm/wpbmhP/+R+A7P
 rxsQ+xxKU+pZu0ghFGqe6fcQnd9xXdLh6I/o/YrGkKo8U0RSBXNS9RPZnwQp9y1EiLIbx6IM0xm
 eqxasvTpAu9xLQFtMDBA5ME/HL11cN2fvVEaldzB/f2YSCSMKgmDeNpNZNOEpXu+Ib/a8JMT/Ph
 nfIkfNxrJXXMLGzjIjAxW0NwZs8wRx++Hw8qryzTvGH15NjbAJ9EUAaxdkUaUNpYiKNuURMJ4En
 g2BR49A/9IOs0U1lvNujTg4vlkU1buyRTXeT/tfwytQSzCV/cPnmyfHHLjodtYVkLeTU0uenkuI
 ZwTA/Z8D7MTMz1yh6pQWJRMiSskhPuEGMhPw24K7mgh58x
X-Google-Smtp-Source: AGHT+IF1Dk8PpvG3QGJwmcHSJdf9M1GLK3WUGatysxQnzY1yT/ATFPSXtBR392bNCoVieW27jWI8dA==
X-Received: by 2002:a05:6000:4210:b0:42b:3e0a:64b7 with SMTP id
 ffacd0b85a97d-42b5939e08fmr20524168f8f.53.1763582238118; 
 Wed, 19 Nov 2025 11:57:18 -0800 (PST)
Received: from zgyarmati-t580.. (netacc-gpn-5-84-233.pool.yettel.hu.
 [84.225.84.233]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fa35b7sm939410f8f.20.2025.11.19.11.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Nov 2025 11:57:17 -0800 (PST)
From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
To: buildroot@buildroot.org
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Wed, 19 Nov 2025 20:57:14 +0100
Message-ID: <20251119195714.1304811-1-mr.zoltan.gyarmati@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763582238; x=1764187038; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Lg/4X1OtHxmIUxQs6GuP1Dd5KGYGo+WunWXCSijtNtA=;
 b=gVIIPgNwcsrhlKBlT8mydwm0+ivHZyu42LlWcIsBUzEoAMAtD9lT2LkjI5exA6Qs5E
 3c14vX35vXmXm9LOBUCTij16/6KzeHtd3Bf3LZifUiwmIMnXBUZbJ1Sk6skUaECZTktV
 QZPcbecLTLCA536Gw5nW6usPPk+CJiqO921ltbeAn41HrVyHQye+9XPTsI0rwxNCXosO
 /UoFPvCaikThfdNT2/cAHVFerj/C6EG9KqmvS+a6pk2vNz6XGzaOkAXKkZCcOq9Jc7/U
 MHt/575APK2WX/Kw85Jpv0Z7VhdyLYv1mans8PRqpg9S+k3gw6AgKhNg3MhubkL9uT1Y
 F+ZQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gVIIPgNw
Subject: [Buildroot] [PATCH 1/1] package/shapelib: bump to 1.6.2
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

For release notes, see:
http://shapelib.maptools.org/release.html

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
---
 package/shapelib/shapelib.hash | 2 +-
 package/shapelib/shapelib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/shapelib/shapelib.hash b/package/shapelib/shapelib.hash
index dfa7ef3a34..3759917148 100644
--- a/package/shapelib/shapelib.hash
+++ b/package/shapelib/shapelib.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  5da90a60e25440f108f4e8e95732bfa83ede13c8e0c2bcf80ae41006cc8ebc20  shapelib-1.6.1.tar.gz
+sha256  4b74a36ced94e9a7bea401157e664addcc5be251e7df7f88d4674361da012c21  shapelib-1.6.2.tar.gz
 sha256  681e386e44a19d7d0674b4320272c90e66b6610b741e7e6305f8219c42e85366  LICENSE-LGPL
 sha256  3f46082162242563bf4f43b091871cb19064bc5a398c6d2b024f6b64c6710516  LICENSE-MIT
 sha256  15e1205bb007d4d7821f7b1cc461ba8d051647e86dbc9baf1bb6f68b10588eeb  web/license.html
diff --git a/package/shapelib/shapelib.mk b/package/shapelib/shapelib.mk
index f7c3056844..08bf3c9f94 100644
--- a/package/shapelib/shapelib.mk
+++ b/package/shapelib/shapelib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHAPELIB_VERSION = 1.6.1
+SHAPELIB_VERSION = 1.6.2
 SHAPELIB_SITE = http://download.osgeo.org/shapelib
 SHAPELIB_LICENSE = MIT or LGPL-2.0
 SHAPELIB_LICENSE_FILES = LICENSE-LGPL LICENSE-MIT web/license.html
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
