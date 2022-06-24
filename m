Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D57AC43334
	for <buildroot@archiver.kernel.org>; Fri, 24 Jun 2022 14:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE04684894;
	Fri, 24 Jun 2022 14:08:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE04684894
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id elBRrP8mk1aB; Fri, 24 Jun 2022 14:08:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD1DC8488D;
	Fri, 24 Jun 2022 14:08:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD1DC8488D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 785781BF40F
 for <buildroot@lists.busybox.net>; Fri, 24 Jun 2022 14:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 510C784793
 for <buildroot@lists.busybox.net>; Fri, 24 Jun 2022 14:08:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 510C784793
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qVYsxpVQGHYk for <buildroot@lists.busybox.net>;
 Fri, 24 Jun 2022 14:08:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2735384574
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2735384574
 for <buildroot@buildroot.org>; Fri, 24 Jun 2022 14:08:09 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id v14so3295719wra.5
 for <buildroot@buildroot.org>; Fri, 24 Jun 2022 07:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BnDTcZ2lyLBNytb4SG6o/fgBh/lQLhE4ASGdXgt6bqQ=;
 b=MEITEa7iHOX0+30m9oh2IqVVvO07OLJnzf/HxdTyMbhLtxSR5k/qJ92W0xi2VMlFSq
 RM4m7eyJlzIejSVNlCaJS00rtoOPgkHdivLytBU5v/eecuQ0lGo2mGx9x6gXHKPaG0o7
 nmGY7O2dg0u0ksCdTQWkV7ZOIJHrkISKIOfoHz07i3+i/me10cPKTOhcgLklot2ywzl/
 Mz2l/zoa0WVjJURc4IrWN7GkSK6qrJ4Lpsw9ptBESgxprDQGAFy4/1P6qOX7tjc2laWg
 6mvtRfQe0xRVdFtTnf2HaINg/dF/JnOHXpoFACUb7HHwt73EkZtOZYJFMfCaz+s4uBlY
 2HjQ==
X-Gm-Message-State: AJIora/44a6Lvhb62SMxeq+i3YnvO1sho6Ogx5HT+PDOdYGhBt0+JKJB
 upjeby5Z9WiOARLQ+R65ubPNcc6UEE4jC2uN
X-Google-Smtp-Source: AGRyM1uFQR/9nN7YIR74JaYPa321PYDi1RVV4GNXqt+YBmxRwxv7Jm3GFNNFlRZC82mBJJ+WTvO0zg==
X-Received: by 2002:a5d:6d8b:0:b0:21b:9804:1959 with SMTP id
 l11-20020a5d6d8b000000b0021b98041959mr13423066wrs.605.1656079687134; 
 Fri, 24 Jun 2022 07:08:07 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:61bc:9e00:725c:af7c:8d:b8e5])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a5d5105000000b0021b88ec99cesm2354008wrt.94.2022.06.24.07.08.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 07:08:04 -0700 (PDT)
From: vsvoboda@forkoder.eu
To: buildroot@buildroot.org
Date: Fri, 24 Jun 2022 16:07:41 +0200
Message-Id: <20220624140742.78223-2-vsvoboda@forkoder.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220624140742.78223-1-vsvoboda@forkoder.eu>
References: <20220624140742.78223-1-vsvoboda@forkoder.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=forkoder-eu.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BnDTcZ2lyLBNytb4SG6o/fgBh/lQLhE4ASGdXgt6bqQ=;
 b=ML9RR37j4vKHI6KQ6eUrQ6SI7dJD92fKKinkQngV0MFgVNlSehtuLIOFb6099FPGjM
 KtyweUM5XzyryhWIrPaUlHpRui8DG2dvE4DsTU1oAh0yQcx5ckb0HQVQ6pfFL6QnrC6q
 G8PcHSc3RKvSH7t2SO5OsYN5QL6wuseINab1ufJ1nqExxSMRT+/dC586S3EaIHAy/cCo
 3FOHYuOrRBz6pCnzigk+UnqUrkDy43r1ZEutZvB5FGEcGB+YaJDdBASkc6Mbvc+BS53M
 6nwz62cir3pY/1wrWRWz0ZwAw4kJNFAfQMs7lTrZlfx7X8QEl2kg+2aGxwVen6smtSrM
 PJGg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=forkoder-eu.20210112.gappssmtp.com
 header.i=@forkoder-eu.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=ML9RR37j
Subject: [Buildroot] [PATCH 2/2] fs/tar: add option for zstd compression
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
Cc: Vladimir Svoboda <vsvoboda@forkoder.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Vladimir Svoboda <vsvoboda@forkoder.eu>

Signed-off-by: Vladimir Svoboda <vsvoboda@forkoder.eu>
---
 fs/tar/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/tar/Config.in b/fs/tar/Config.in
index a4e375c68b..e88a5bb91e 100644
--- a/fs/tar/Config.in
+++ b/fs/tar/Config.in
@@ -46,6 +46,11 @@ config BR2_TARGET_ROOTFS_TAR_XZ
 	help
 	  Do compress the tarball with xz.
 
+config BR2_TARGET_ROOTFS_TAR_ZSTD
+	bool "zstd"
+	help
+	  Do compress the tarball with zstd.
+
 endchoice
 
 config BR2_TARGET_ROOTFS_TAR_OPTIONS
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
