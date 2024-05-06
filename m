Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384B1C25B4F
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 18:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9113F40B9D;
	Mon,  6 May 2024 18:52:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JSCC_nbIZHvy; Mon,  6 May 2024 18:52:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4A904117B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4A904117B;
	Mon,  6 May 2024 18:52:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C26111BF308
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 18:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF14540B88
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 18:52:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iDuGBLcp16-v for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 18:52:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9FCFD40600
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FCFD40600
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9FCFD40600
 for <buildroot@buildroot.org>; Mon,  6 May 2024 18:52:36 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-7daa6bfe4c8so126012739f.1
 for <buildroot@buildroot.org>; Mon, 06 May 2024 11:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715021555; x=1715626355;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AKVAUgJw3MogwdttAPaaPEDjtgooGGrLYGU+Q44zJjo=;
 b=pd6/C281nyUwNyyMmmkM4tisBu/aIK72KG2tV9rBA5r7j+Vr9GD/vQScgA2Kq5x2dR
 2RUJenM90yCvb2TiTkEGFaw/7pZ3R01N53WYTY/egAA7rBKnpoLWYT7yHdGRiAyeJm1R
 0by7Da+qiakpSs355/06zZEABU+xZZ55KEF82kGM7C91z8LZyYJ0Wuofu+mb/wl+hUJJ
 TydLCYsBYQ6f/unD9dwLohXX8bGXtV1Xkjd3D+QqBbADtr2tmzIalutk9v6P6nUNHi3o
 8x9XaV8hREin1Kx8u9oeNiH/0YwAUHI+cxgdln9Jw/Cx5Lq9IntTW9wN9K8w8fvGZfJz
 Ncvg==
X-Gm-Message-State: AOJu0Yy3oSe6GIMLsQCBpj1uueftizgRrQ+yPuxCZzcTzpQk9+wuYEH5
 k29wbKwocAOx5XuKfqMRlFeuu5sGS77+HQj/pumIjyf69fT57JqFNbLnDQ==
X-Google-Smtp-Source: AGHT+IFN/a9uFhKZiqGrVb7uU68BtESeSTp7V5CHCJPfFgnBu3FVDftStNoDz8tsxFTZrh2WUyV01Q==
X-Received: by 2002:a5e:dd44:0:b0:7de:cd30:a1a7 with SMTP id
 u4-20020a5edd44000000b007decd30a1a7mr12806351iop.20.1715021555334; 
 Mon, 06 May 2024 11:52:35 -0700 (PDT)
Received: from james-x399.localdomain (71-33-133-151.hlrn.qwest.net.
 [71.33.133.151]) by smtp.gmail.com with ESMTPSA id
 21-20020a05660220d500b007d6c7f42890sm2149535ioz.53.2024.05.06.11.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 11:52:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 May 2024 12:52:31 -0600
Message-Id: <20240506185231.3470040-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240506185231.3470040-1-james.hilliard1@gmail.com>
References: <20240506185231.3470040-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715021555; x=1715626355; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AKVAUgJw3MogwdttAPaaPEDjtgooGGrLYGU+Q44zJjo=;
 b=Tg5//kXmkGMYYlWMXL6mb5MqkxXvwYIH371uS0OUcni+zGkJrXcHQu4q1eOt5QiFAP
 k1SkZTbdTJw9/b28AbDN6O3/aZimbnU99m1rLJaHwIjfbO2tmuAel+skZ2O6l9f0fHNo
 RlRDdzxJnvqI+sIcJan9uNqqtq0FLOHP5tx8atHkoqLAsLEJV11pGgY7dcacek9b/Y+k
 rl/NBK6V18J0lkt032+qBu/DAU1G5/rJehgsFCtTDtQpfM+MfZlXTV/6rG4nSUsyJfAZ
 IpPv4QjJ9zm4OSTqmGd1SHGRJC+q+is9L8Ha3ps82NPe4/lBxbMIGdb6zmfZRI9YadoV
 5JbA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Tg5//kXm
Subject: [Buildroot] [PATCH 2/2] package/iwd: bump to version 2.17
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/iwd/iwd.hash | 2 +-
 package/iwd/iwd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
index 3f18146e13..9f88b2d6f1 100644
--- a/package/iwd/iwd.hash
+++ b/package/iwd/iwd.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/network/wireless/sha256sums.asc
-sha256  c1a82032e994861e794cf3b5a16d07ae1aa03a6674f716c73408ffeae2a233ba  iwd-2.16.tar.xz
+sha256  5901ab3fbb74bb75ec9adda35daeff595e4d238882fee7fc8c805b30ca79d943  iwd-2.17.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index af6b2f849a..c516bab471 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IWD_VERSION = 2.16
+IWD_VERSION = 2.17
 IWD_SOURCE = iwd-$(IWD_VERSION).tar.xz
 IWD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/wireless
 IWD_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
