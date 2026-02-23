Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE9EE98E08
	for <buildroot@archiver.kernel.org>; Mon, 23 Feb 2026 08:30:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B93683D9A;
	Mon, 23 Feb 2026 08:30:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vw1jpBUHxuTa; Mon, 23 Feb 2026 08:30:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 834AB83D88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771835455;
	bh=cDlh3chqiDdhAWk9Upffs5w1rBsqo6xTiqrOz8Nhrb4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BMMCBceQuI1jVBezT70VUHd8BBjtk0qPqdcfvYmEEtWbvv0/O9TwRSqvYg82JjKb8
	 L4ZvuoEFi/JMRfLJbPG7hb2oDp0h8PZLLUY3amYRy+0vL7KmjZG/jOYqvbAZHPjn4Y
	 Xomb+uClobWILlqFG8tgiEni25OwGXWgKdjOfgC2r7JY2LS1sSRDXy9UBNhqNRyyhe
	 NQg/J1Kexlz6edEtb2U5vpOOYlRW/1YKXzNTQmeaaWCdD34wNGNXYSE6qBK1V58GZP
	 2Nczr1WP1DQDCF8ls4hh0EdDp56LEJaJRhEZ6OPjrW1YfAlSqVFlo4YKhUvB5gGYrw
	 ej+mG4olGDWsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 834AB83D88;
	Mon, 23 Feb 2026 08:30:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 509B51CE
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 08:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 363A183D7D
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 08:30:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zkjifg2tpP7W for <buildroot@buildroot.org>;
 Mon, 23 Feb 2026 08:30:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 066DA83D88
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 066DA83D88
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 066DA83D88
 for <buildroot@busybox.net>; Mon, 23 Feb 2026 08:30:52 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-43770c94dfaso4035686f8f.2
 for <buildroot@busybox.net>; Mon, 23 Feb 2026 00:30:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771835451; x=1772440251;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o5XKB66Il7CIe2ZYio+klg6Cwih+koflQWvv5xDabck=;
 b=RCYza49JCcSwGgt8dPJPewyFxlY7voJi2K0cFWsw2GElULhK6EozO7/aNyLLkJv7Zu
 Z63f7AamYxCWwEJCdZwSlmBG81yBR0Trkwai2USUnbZqgYU2kiMnyrtU7neQcCVGJekz
 a9pl4cIoWC8WBxbJd9gET+Ia9pvzX6d/OnYBiiiMo7AG94P8Sxe3pAPrpWG7mnFKI00C
 AP62gZ7KrPg5YgMCy1l4tfARnE+RUPS2gmJfEq4T0boNhzlS3COmgJo5s9NoFRpT7f0r
 e6iBQ2Ec6gc3AnzY5vCGVpMEqbQxxNvi0ipKY/9BRXvC41CAhQaSM6qRkSGyKhR4yT0U
 QrQA==
X-Gm-Message-State: AOJu0Yzs5DLhAPSjzeDB7zLrFTPp0b9KuEHJsrCasBYvlbJPpVCqP07E
 kAwhknd7oa/uHr5MP+RArIAw4C/jlGVY8lUbg3LBTgXmPsnWkTNoqB74bazbk/m/wl86XeveLs5
 ZTwS5IA==
X-Gm-Gg: ATEYQzyIzo5/Pj5uyqd6lhxWtXkfEI68eKL21ZPJCPzX0tCuyAK3Qo7hhiQk60uITLn
 3yFCXhG78jSHbKHxNIE5NI5nMm5Ljs69tdFeuG1SP5sjxy2re2KsnMyHbnyIkUvegjht1/oBnb2
 /9j0DNZZ2ZBEg3ybHzHNUrkKGteXps2pEzEy7pil4wmV5+nAb8G2m1gcZWSsizZqjHd6rhA21oR
 /2MFN7u9e0G8rOXlnGCPpM5uzBgdDl/BGvOFfK0gisfkrIgVseQE7cVph/qKJMObny3Itp/33Df
 7tZpYQmW0M6dKRF4EfopvUttB8ghA8dyG9hTmcry2dbOHupgbm9tMEUOnv0iQrVemvm+zXGNhGR
 HBCRlYDpzKZZ8dyPP4CbV338xuTfkudwScAjl4HyoHG+eF+uxb+Os82xQ5hyqefod1WshgRyi9v
 vjahIaJhvsop2IJEeEGC4/2IYd9PRG4fNo9YmhVJauLQsFd26ZeHkA0slzjwqe
X-Received: by 2002:a05:6000:611:b0:432:5b81:483 with SMTP id
 ffacd0b85a97d-4396f15c44bmr13845546f8f.24.1771835449086; 
 Mon, 23 Feb 2026 00:30:49 -0800 (PST)
Received: from vm-2404.. (249.184.66.37.rev.sfr.net. [37.66.184.249])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970c00db8sm17310221f8f.12.2026.02.23.00.30.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 00:30:48 -0800 (PST)
To: buildroot@busybox.net
Date: Mon, 23 Feb 2026 09:30:39 +0100
Message-ID: <20260223083040.327878-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1771835451; x=1772440251; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o5XKB66Il7CIe2ZYio+klg6Cwih+koflQWvv5xDabck=;
 b=cEJUv7ePHIDjj/16Ko2ZGkRG+TYFFfI5vemgiZJ/yqX25CPRt8hFszCGUohO6hXkHe
 NNDtEq2Y6UPUwDxl0kJNUavAke314tDk8oLCPOdB4dyDssJe0+dwLrdiubFtL7PW24QU
 n8rmzOXjNe/3kzJ/dawcCmyZBT1h0fO5hdjEQ5raPeYdft8D7s0hnbubU88ZZmExSXDm
 bmb4/37VOJ2hpFtQ4/hSC0jvbEzvFClgSScideAzhlqPJbpBqTdPOW136pVRYhq09WYR
 R4hmJyRKP+kW3dEmh3RJ1p0kTShM85WxC8q3OETHVkFnyNi6bA3IaJmT+0qaHgITi45Z
 S+7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=cEJUv7eP
Subject: [Buildroot] [PATCH] package/gawk: bump to version 5.4.0
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

release notes:
https://cgit.git.savannah.gnu.org/cgit/gawk.git/tree/NEWS?h=gawk-5.4.0

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/gawk/gawk.hash | 4 ++--
 package/gawk/gawk.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gawk/gawk.hash b/package/gawk/gawk.hash
index b65835925..35524c774 100644
--- a/package/gawk/gawk.hash
+++ b/package/gawk/gawk.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/gawk/gawk-5.3.2.tar.xz.sig
+# https://ftp.gnu.org/gnu/gawk/gawk-5.4.0.tar.xz.sig
 # Primary key fingerprint: D196 7C63 7887 1317 7D86  1ED7 DF59 7815 937E C0D2
-sha256  f8c3486509de705192138b00ef2c00bbbdd0e84c30d5c07d23fc73a9dc4cc9cc  gawk-5.3.2.tar.xz
+sha256  3dd430f0cd3b4428c6c3f6afc021b9cd3c1f8c93f7a688dc268ca428a90b4ac1  gawk-5.4.0.tar.xz
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 40b0672da..10ca33684 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GAWK_VERSION = 5.3.2
+GAWK_VERSION = 5.4.0
 GAWK_SOURCE = gawk-$(GAWK_VERSION).tar.xz
 GAWK_SITE = $(BR2_GNU_MIRROR)/gawk
 GAWK_DEPENDENCIES = host-gawk
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
