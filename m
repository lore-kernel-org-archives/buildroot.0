Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25AF1CF258E
	for <buildroot@archiver.kernel.org>; Mon, 14 Oct 2024 01:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8993D80FA0;
	Mon, 14 Oct 2024 01:17:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k7Ctw-POiwEx; Mon, 14 Oct 2024 01:17:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 943A980FB9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 943A980FB9;
	Mon, 14 Oct 2024 01:17:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BC8DF1BF39F
 for <buildroot@lists.busybox.net>; Mon, 14 Oct 2024 01:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB213401A1
 for <buildroot@lists.busybox.net>; Mon, 14 Oct 2024 01:17:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k1X8QxyPcS8a for <buildroot@lists.busybox.net>;
 Mon, 14 Oct 2024 01:17:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8D31940114
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D31940114
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8D31940114
 for <buildroot@buildroot.org>; Mon, 14 Oct 2024 01:17:39 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-71e681bc315so159568b3a.0
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 18:17:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728868659; x=1729473459;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qVf43sZ2OiPnu1xb8pjjmG2wDLFhG0Jik8FVHNiddwA=;
 b=c/oiJohehsTXdpmVMZpQHicOYv+9uSIlJeRxOr+s/uUMskQRd9HYdB/enhvG5gXjMn
 h2NpdMRkyCUzGnTwmsu20imLNbDnx8+P8tT3vxqeboW7ZfPlH2LP7svNq/t0c8XfDJS6
 b0YcJCqUI6G+8sf8MQNYCxrVH6RzyHz4plb8/PXxm3sj+d6N6/0LrGlA8Qs0WbSI6u5j
 U1LCGqzl5fAO+7UPHsFjiZuIbhOM50ZXflBjZhhPA+kdqjnKTgle4nkz3T0LiDikH7jR
 GsC2vMAwxhbsM5+MqDRhwht+HNn+608+wonqDfKZbyLhApqcytPN9zeZPdI6FgUG5Jmp
 cnXw==
X-Gm-Message-State: AOJu0YzOAmxbhBZTaxM4WmBaJYoPJszWPWD8tQy1/p73p8u7+ZnUmarB
 +bhYVSZhPAB0pjThgz/bUPOIDPEE/42BkhRxUm1CxuGDiTVlVKqqYsk8vWZS
X-Google-Smtp-Source: AGHT+IGPo6BmoZip4N0/3bwYW7XzDG0MqMDFhFuLNSmDgZ/XPvrGFHLkViOoob5FYRPPR+KK82onfQ==
X-Received: by 2002:a05:6a00:9a9:b0:71e:667c:8384 with SMTP id
 d2e1a72fcca58-71e667c8546mr2804984b3a.9.1728868658751; 
 Sun, 13 Oct 2024 18:17:38 -0700 (PDT)
Received: from localhost ([142.171.12.18]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71e6283e9f4sm1292558b3a.187.2024.10.13.18.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Oct 2024 18:17:38 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 14 Oct 2024 09:17:21 +0800
Message-ID: <20241014011729.48018-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728868659; x=1729473459; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qVf43sZ2OiPnu1xb8pjjmG2wDLFhG0Jik8FVHNiddwA=;
 b=OARPGQtyPCO1V0EyX25YzleZ1b2voFo/vOISLACNwo4qHS0pxtqiexpmNiyzLOCnZ/
 ylBgLgVFTieezoFuW2SI1ohviVLZ5hl/y48mWdOcBSZCEXhD6wNjnSz5sj/Ki23e8gJG
 UJBoKXXWq5KntXVd36pix5Xy1dAiMkQ1YiLpmUcgvb5L/eo6uRcA54WiuGZfI5VLnwJk
 ecnlWvYwyKY+7J/giQzzGx4tMyLiXRoQD5E7bNfUrFDBhikRT6s8SMht7j+7jvxsWGNC
 srE12uVZEL260kGDwwXxL8GZbf3hSl62Nlx3i5ALlhTRQ0KwFhxXMaKck0OXl5GZxjiv
 KSgw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=OARPGQty
Subject: [Buildroot] [PATCH] package/timescaledb: bump version to 2.17.0
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>, Scott Fan <fancp2007@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://github.com/timescale/timescaledb/blob/2.17.0/CHANGELOG.md

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index c7116028e7..c6a03e6aa0 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c1d27da11d0db3b947ed0cbf63d230427a532fd808600dea9ec3afc4ab5d730b  timescaledb-2.16.1.tar.gz
+sha256  155bf64391d3558c42f31ca0e523cfc6252921974f75298c9039ccad1c89811a  timescaledb-2.17.0.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index 37c7258a56..9b785e763b 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.16.1
+TIMESCALEDB_VERSION = 2.17.0
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
