Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F44E748ED
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 15:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 885C181B7B;
	Sun,  1 Oct 2023 15:45:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 885C181B7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZYhRY4ukDfbg; Sun,  1 Oct 2023 15:45:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D423381BF4;
	Sun,  1 Oct 2023 15:45:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D423381BF4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CB7C81BF5A2
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 15:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A528181B7B
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 15:45:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A528181B7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U6aemxw2yMyP for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 15:45:45 +0000 (UTC)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 836E081B23
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 15:45:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 836E081B23
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-323168869daso12881719f8f.2
 for <buildroot@buildroot.org>; Sun, 01 Oct 2023 08:45:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696175143; x=1696779943;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Sr4fJ9CnYjzeSYkO3vBGjz4jP2wQ2slbPzstIQBdQhg=;
 b=B0SUtAeAvda3ldqrwoFTvjstGyBZzorBPtBT5V7VSTDSAZR1ThOxDHLyekOL4WSx/v
 aja9RCOkwipPj2PWlWuQ5LwxNgdeBjGyNj/K0j6GCQekOgoyR1N6uvTSUGbwdAieJoAu
 bR0/tL9QtT3KkeJIPC8PM/T527KHpHd0F72wfPoE0wDgWJtXLkbdUIJj4VVLqTb3L5Zn
 5nPWhRfto287YwL0XybT3PmxN62gRxO9ZthLI35d4GTLRLzHqiYlcpk9oNfj15BpRNKb
 chs95cSGvJfsJB0rf1V4FamSIUFJ2icAE2tSKwLhcB8dQOqPMcVag7m8ywgWozC7Bmzc
 DJtA==
X-Gm-Message-State: AOJu0YwWKh3qtCH5YzDp3u8ZAvzETlv8D7O4/YrMfxvmibkZi9sAO2P8
 2Zg75CkJ3xIO3Ff0YRO17p7FO4f3ENE=
X-Google-Smtp-Source: AGHT+IG0VgLI4K04b6WxdJWa4n31OLcgEaRMi9jcpxM1SqSm9uICrgjSTOUSQ+KTMLBs8Tpl0Bz4rA==
X-Received: by 2002:adf:f648:0:b0:31f:eb8d:481f with SMTP id
 x8-20020adff648000000b0031feb8d481fmr7873798wrp.29.1696175142993; 
 Sun, 01 Oct 2023 08:45:42 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 c5-20020adfef45000000b00326dd5486dcsm3816268wrp.107.2023.10.01.08.45.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Oct 2023 08:45:42 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Oct 2023 17:45:40 +0200
Message-Id: <20231001154540.1131198-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696175143; x=1696779943; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Sr4fJ9CnYjzeSYkO3vBGjz4jP2wQ2slbPzstIQBdQhg=;
 b=mop+AJp5BSJAhdqE0bu2fIC9cnhLcdr4F3sZsMADPS0VKssmEWJhCer0xlJCp3K8FU
 TIkC1Di23OCmT2vxTJmCWEnOSZCI9KcW+5pBlKpoEiXsQuu+D9y4tHD1AwDg7L2Cbqx3
 q84DlCZWxKKNQOdDC9KfKoKzqHYygpohuA9JnHTbDsRGyme5ySXHiG5zmH0sWn1tmZon
 q9wG2HldiYu0KK1QHFQttc8Ce6Ah5yV31SB2Bf7tn0YTSiAEUJHZIVQ9eFwthGkXeCLE
 PQ6ztsMfs6Ge/UQppOPNUpUzhIL9sASU0UsjibFrcNAek8zIiyxR7oJErwb/tksd0UQ9
 iGZA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mop+AJp5
Subject: [Buildroot] [PATCH 1/1] package/liburing: bump to version 2.4
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update hash of README (changes not related to licensing)

https://github.com/axboe/liburing/blob/liburing-2.4/CHANGELOG

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/liburing/liburing.hash | 4 ++--
 package/liburing/liburing.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/liburing/liburing.hash b/package/liburing/liburing.hash
index 7d3306850f..eaee8fcfa1 100644
--- a/package/liburing/liburing.hash
+++ b/package/liburing/liburing.hash
@@ -1,8 +1,8 @@
 # Locally calculated
-sha256  0fcd25dc1eb32cbeb534219f8e7fcfeadbd8dc2304aa447148e5ca8408076f22  liburing-2.2.tar.bz2
+sha256  ca260e7a5820c2d0e737ec1e9b999f10776dbe84a169a02a0eff10c8eeaf3394  liburing-2.4.tar.bz2
 
 # Hash for license files
 sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL
 sha256  2ec12f7934cdfce25ff72b0557738989d79fc7a496d1cf9b2d3f9464fd61edbe  LICENSE
-sha256  1c3351726408c22787dafbb5cc4bfeaa38ca8e92eabf59a36a046a5a2e66108f  README
+sha256  51e124279343177cb3c214ffddc011f1355b6eba0bbefca4f4c41fbc56574c92  README
diff --git a/package/liburing/liburing.mk b/package/liburing/liburing.mk
index e98c710997..c35fb39390 100644
--- a/package/liburing/liburing.mk
+++ b/package/liburing/liburing.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBURING_VERSION = 2.2
+LIBURING_VERSION = 2.4
 LIBURING_SOURCE = liburing-$(LIBURING_VERSION).tar.bz2
 LIBURING_SITE = https://git.kernel.dk/cgit/liburing/snapshot
 LIBURING_LICENSE = (GPL-2.0 with exceptions and LGPL-2.1+) or MIT
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
