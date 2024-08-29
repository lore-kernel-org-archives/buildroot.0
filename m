Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81212C83F2D
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 14:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 128A3418D2;
	Thu, 29 Aug 2024 14:51:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e2oR-hiDS49M; Thu, 29 Aug 2024 14:51:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03A3641E40
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03A3641E40;
	Thu, 29 Aug 2024 14:51:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 49CED1BF31A
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B03140223
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fyrJET7Ckzrl for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 14:50:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=johan.oudinet@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 589B44045C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 589B44045C
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 589B44045C
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 14:50:46 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-42bb885f97eso2437015e9.0
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 07:50:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724943044; x=1725547844;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mLqtWA2uyQFNIcUNDVyiXPi5Gzq2BuMjs/839c9YbOs=;
 b=gCEqDdLjegn+WWfczKOdZGCODab86RebmcbSNzTW5e8N754K7urp5PlPNLe0WUgtdm
 klYzKmYWrRyhPNWjNT0wWU3LK2pmZNFeOYu1QZBt8Xe4/DtMu5rgqk+9cLj9iQPe++/H
 /FYcUbCyxI5V32QYUPEpzP/7roIMZuwtQfNG5ACvzWPVR5l6RBtGe20KNnmo+i6pwHPQ
 7rVDMO/SCGZqDOtXQw3wOdDq8vPHb7RW8Xe8LYMdsmq0aRYaxWBFrGBWZhru6NB+YQPw
 HYoqlDMjmAlLyrj9HLOQzXINhOQoXtW1pjO7J5rRJUJoE2PQZ1zDaNRgPWtSSLnh4eXB
 wAwQ==
X-Gm-Message-State: AOJu0YxcleRL2H0IExr44vL00+FewpGVVO3iElB+CytczooXacePOERO
 HOS49KpjBORi9vZZ3AMQaEwqjR5dlu3ECqLUm7jtb99jGwnfcSnGzqMTvg==
X-Google-Smtp-Source: AGHT+IE+HuwGjy96NCpWazK9/yIODwEwV8yyjdxf+7QTRohueuzH8t7stqcdOAf6kSQTiy3K3paPWw==
X-Received: by 2002:adf:f001:0:b0:371:6fc7:d45d with SMTP id
 ffacd0b85a97d-3749fe439acmr1695878f8f.2.1724943044021; 
 Thu, 29 Aug 2024 07:50:44 -0700 (PDT)
Received: from shrek.. ([2a01:e0a:acf:1a32:284b:b9b9:cca0:be3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee9c48csm1619241f8f.51.2024.08.29.07.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 07:50:43 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Aug 2024 16:49:32 +0200
Message-Id: <20240829144940.209964-17-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829144940.209964-1-johan.oudinet@gmail.com>
References: <20240829144940.209964-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724943044; x=1725547844; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mLqtWA2uyQFNIcUNDVyiXPi5Gzq2BuMjs/839c9YbOs=;
 b=KZP4gBgawHnWlerr713x0mdW8Z74zjtxyEHiXbsZd597xF4jSMYe5ooei+rldvHakK
 DaTovGUurFwiSJYDdHtudFckXEjV50utK61cgUP372SGvrWk3J/L5bWJoRc65D3csMrR
 sxMNWbWtdlOUQAkTjBRwjmZ8tDeAMxNQIYPeS8Rfw7aFxzhTR8GWbEW5S1EdGSqXpDqQ
 jKsoTgx5Fi+83wDC4dmgR2lHYFNPSJpATz8kyPGJbzGWAnQF08Jql2sygFbYyCFWlJWX
 1crK/tLw+BqgL1opc3jasrnRQndiTcawkORCqpXypTz/aIjqeSzryaURgsrQO9q6ggSY
 7nLg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KZP4gBga
Subject: [Buildroot] [PATCH v2 16/23] package/erlang-eimp: bump version to
 1.0.23
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-eimp/erlang-eimp.hash | 2 +-
 package/erlang-eimp/erlang-eimp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-eimp/erlang-eimp.hash b/package/erlang-eimp/erlang-eimp.hash
index 26e8addd2d..e9ef9c693e 100644
--- a/package/erlang-eimp/erlang-eimp.hash
+++ b/package/erlang-eimp/erlang-eimp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7023b86bc7cf3551fd876a1361ceb2443bdf1c1be9f98a4d9a9a90eda3353b51  erlang-eimp-1.0.22.tar.gz
+sha256  923d9fb5abd7fca36188441e6871e2d2da2f8fc95ed42d78406eb431df587b28  erlang-eimp-1.0.23.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-eimp/erlang-eimp.mk b/package/erlang-eimp/erlang-eimp.mk
index 68d0d9e9ed..1e1a5ece43 100644
--- a/package/erlang-eimp/erlang-eimp.mk
+++ b/package/erlang-eimp/erlang-eimp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_EIMP_VERSION = 1.0.22
+ERLANG_EIMP_VERSION = 1.0.23
 ERLANG_EIMP_SITE = $(call github,processone,eimp,$(ERLANG_EIMP_VERSION))
 ERLANG_EIMP_LICENSE = Apache-2.0
 ERLANG_EIMP_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
