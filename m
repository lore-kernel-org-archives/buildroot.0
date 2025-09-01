Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00172CA0FFD
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 09:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBFF341494;
	Mon,  1 Sep 2025 09:01:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 42Zbe2_mH75Y; Mon,  1 Sep 2025 09:01:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E74EE41596
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E74EE41596;
	Mon,  1 Sep 2025 09:01:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 43A14D2
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 143DA83C4E;
 Mon,  1 Sep 2025 09:01:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 53zqC6Aaqx8x; Mon,  1 Sep 2025 09:01:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6640183C53
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6640183C53
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6640183C53
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:01:38 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3ce4ed7a73fso2004461f8f.1
 for <buildroot@buildroot.org>; Mon, 01 Sep 2025 02:01:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756717296; x=1757322096;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=R3kFA/2mc/DJpNgvCVcjeiahRxlK15DaoEUMi2duuKU=;
 b=TvyFrZ7rmf7FrmtLTdFthEe8YP/ITYgIr8+vCOQX/KEdbAJ/kOQnNOWpjZYfx939OU
 lDFQW5ZxCdrSJlv9aWPG4GmPXprbuM0g/kxSfm4HJKeucYFuvebkXssian4ecETQ8DQD
 x+gng+qBuILwSWHDfvmy1hWBDEu+3xHi+epKNEc48QxHxFOJhgUAknkpvrlLio9TiMDa
 KigPf+jELMS8YHAIJxAGkRzspa0Bt7LwpOQtSyfRf/kHaxpH8+tGrNf7LzQ5iPd2u4cS
 w4kPHBIYHRYmYi6JdvSEjXwMv+1QJSh6jv3SyZWPkchtyrd3LGeu1eAuwD3YN+jBL7Lo
 CdqQ==
X-Gm-Message-State: AOJu0YygXFSaBR931yxfREbUNh/gDv+qIr6v6umCGi/LCZ/c3hQPuGKh
 6RcbD7k8P/rxz+nfw4sYwfhT+qVDy95nHATlebpvogjn/22+jQjA087xEBzUDw==
X-Gm-Gg: ASbGncuZB4+4+L+8BTJ3yjsedqUxOYDcIk5R7pTi9iHhBQYDkUKtbdcS87pnFMylDTV
 oWq2JhorhEe+hGEJDYASZiIawLiO94T0DC/GH/75yiZvLQiO4zDcgjenm9gocyEhc/SmeDf+Yz9
 wXy8RfEWTYy7R18mToMSPWO/gmIZFbxpTpMNqFoXgeJRGyaX2J037yXQYNv+Ijmy8qp83My3wiL
 hhCeScZqewjS1pLeQXqjfosx3PFCKAVvMGcTlbLWSttSR4rdXullmpe47cVJeq22pHNSDJmfnz7
 +mlXagE/f/uu2Yk8KHRP19PzSDvS7b/aNMCu6vpPbSnNbosRKrvky4BkIwjtDczjhNBZFGpBK4v
 ANIMD272JdQ7XuTJmA8Gc7Nn7PyYvps6K
X-Google-Smtp-Source: AGHT+IGyd43Oo9/RRMWGwiJGFS38OUiWvz/ybBtyiNvqPgSXkchLCEkeFpycvFKTHYyHdC9tEDOCWg==
X-Received: by 2002:a05:6000:2288:b0:3cd:cf31:d77a with SMTP id
 ffacd0b85a97d-3d1dddf0b51mr4351097f8f.18.1756717296363; 
 Mon, 01 Sep 2025 02:01:36 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b8525a94bsm98171055e9.15.2025.09.01.02.01.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 02:01:36 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Mon,  1 Sep 2025 11:01:24 +0200
Message-ID: <fffd7a239510254f91ec430da4c8b355595e1aea.1756717276.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1756717276.git.yann.morin.1998@free.fr>
References: <cover.1756717276.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756717296; x=1757322096; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R3kFA/2mc/DJpNgvCVcjeiahRxlK15DaoEUMi2duuKU=;
 b=MHe/dJ2wcRroVoMePpN2FtWWv7WA1eCsx0VlqOcPI14qLCqO+ASrO+Jd1YhO54kXJW
 eUQ7MJ6oOkJKCZHK9mMvKSPqn7n5xce36HNccdsmu9j3rcNkc0qzrRWdt0HEGjASRxN3
 F1EwNU9T6B8T0R3mV1T66O4rEWOD+md65X2tD7jAEhtbjjHP7YnEjQcvOGR3IvMK4663
 pwGy8+WYb6NinCgTspCYWOnMQtnjvYL2sk/6E+GGHXEm0UdBM0ytAT1qtGWkZbTU8s35
 DNJxmFKhxR2+6z+6BMrJjjhpynU0cUwLcRoaTumt1rWhQag8SVpgfr/Kkrg1kRzAQ3S1
 VKBA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MHe/dJ2w
Subject: [Buildroot] [PATCH 15/18 v3] package/util-linux: adjust paths for
 merged-bin
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/util-linux/util-linux.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 3098a81a72..d1abdbdc9e 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -75,7 +75,13 @@ endif
 # ${usrlib_execdir} (/usr/lib) to ${libdir} (/lib), since both paths are
 # the same when merged usr is in use.
 ifeq ($(BR2_ROOTFS_MERGED_USR),y)
-UTIL_LINUX_CONF_OPTS += --bindir=/usr/bin --sbindir=/usr/sbin --libdir=/usr/lib
+UTIL_LINUX_CONF_OPTS += --bindir=/usr/bin --libdir=/usr/lib
+# Ditto for /usr/sbin and /usr/bin when merge sbin is in use
+ifeq ($(BR2_ROOTFS_MERGED_BIN),y)
+UTIL_LINUX_CONF_OPTS += --sbindir=/usr/bin
+else
+UTIL_LINUX_CONF_OPTS += --sbindir=/usr/sbin
+endif
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
