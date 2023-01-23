Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40021C05027
	for <buildroot@archiver.kernel.org>; Mon, 23 Jan 2023 18:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C856A40B3A;
	Mon, 23 Jan 2023 18:59:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C856A40B3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mziE03-iUv5k; Mon, 23 Jan 2023 18:59:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F80D40B4C;
	Mon, 23 Jan 2023 18:59:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F80D40B4C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 088E81BF319
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 18:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D85F881B35
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 18:59:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D85F881B35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w1JrLwoF9Fr2 for <buildroot@lists.busybox.net>;
 Mon, 23 Jan 2023 18:59:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE5A681AF6
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DE5A681AF6
 for <buildroot@busybox.net>; Mon, 23 Jan 2023 18:59:01 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id y1so7267399wru.2
 for <buildroot@busybox.net>; Mon, 23 Jan 2023 10:59:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e76W6VU8kCCQhu5PmGCCBihsq6itu4MGsybNE1j1EXA=;
 b=c/2whR1FSX2adgDgyrrtoLjOSixIkCK+q6JTJlJ8xbBUYZw5hSBP7HW5EkTwhm0/uU
 sNcDp7MSBVmw6x8syZSWmgnillDm+59wDJVy8aeTqapGvwSK4mATUgneS2kYMlQhLhdr
 fogaqGY4t0vuRIx2BrrruqaamdjfgVO8K5l5DMOqe3CShG3J98ViHprgrNKjQqqd1FBT
 LjNU5aboiqIY0uDGu4nxvr59Wiey1uFnaqwumyxicB26D0O/LLGs/qt0KN0YbBBsVYF2
 lw4hl5MBquChU5xgHQuDCC/7WMFbBuAvJb8AvD6IxJHf0oTXWRdNNFC++fJJ6oM//Yb9
 D3xg==
X-Gm-Message-State: AFqh2kplvKMkExLOFlLPbHK7R8b9gsBlQZEUNSnIlOl+qQneQ0gD4Da4
 4p0FcCwpTdYyC/vnYdAVbs1ltodLNYY=
X-Google-Smtp-Source: AMrXdXu1OKN2PMg2vkxa1wOLxvUqVyR5u1PmHCrkp6kJ58qF9m7FRj2h3QgUYfvbcGPviRyfJEQXPA==
X-Received: by 2002:a5d:4907:0:b0:2bc:8149:9b31 with SMTP id
 x7-20020a5d4907000000b002bc81499b31mr24506340wrq.27.1674500340091; 
 Mon, 23 Jan 2023 10:59:00 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 x4-20020adff644000000b002bdeb0cf706sm90422wrp.65.2023.01.23.10.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 10:58:59 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 23 Jan 2023 19:58:55 +0100
Message-Id: <20230123185855.159370-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=e76W6VU8kCCQhu5PmGCCBihsq6itu4MGsybNE1j1EXA=;
 b=TClZSQaZkyk+isitVtj5maxHds0qIyXD0/PrHceegoh2Bfyqv+ZiJIKrjk80e/wi5K
 7teciJwYJXueBpRG1A6Nlxi2hfJ5ROGf59NLwXr9Z0pQA1s509OOuj3DvsozqF4XOYQY
 Cg2Wq/TrlMmq9AxYPdaKIuRsYsigqE+Ec7pfF3YnvRkEB7+g+d7LVfkdJZJTRE7oRbE6
 3VglQWjbEZvkkVznXZXtPDRbGc6zy1uUS+Ge5Ja9JQz4hX5xyu1BHr44MyOcd7mJcKSE
 8WL0vqxTiuUKRZUfJ5O5+qku2fxBFyg8LJK/iRrVsk+w2b64xMjAhwRcL2CSpwgRj9An
 XEbQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=TClZSQaZ
Subject: [Buildroot] [PATCH] package/tcpdump: bump to version 4.99.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/tcpdump/tcpdump.hash | 4 ++--
 package/tcpdump/tcpdump.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tcpdump/tcpdump.hash b/package/tcpdump/tcpdump.hash
index a950d3fa6..e548e3262 100644
--- a/package/tcpdump/tcpdump.hash
+++ b/package/tcpdump/tcpdump.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature at
-# https://www.tcpdump.org/release/tcpdump-4.99.2.tar.gz.sig
+# https://www.tcpdump.org/release/tcpdump-4.99.3.tar.gz.sig
 # using key 1F166A5742ABB9E0249A8D30E089DEF1D9C15D0D
-sha256  f4304357d34b79d46f4e17e654f1f91f9ce4e3d5608a1badbd53295a26fb44d5  tcpdump-4.99.2.tar.gz
+sha256  ad75a6ed3dc0d9732945b2e5483cb41dc8b4b528a169315e499c6861952e73b3  tcpdump-4.99.3.tar.gz
 sha256  8a54594d257e14a5260ac770f1633516cb51e3fc28c40136ce2697014eda7afd  LICENSE
diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index c38d46e2c..7a679ce4b 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCPDUMP_VERSION = 4.99.2
+TCPDUMP_VERSION = 4.99.3
 TCPDUMP_SITE = https://www.tcpdump.org/release
 TCPDUMP_LICENSE = BSD-3-Clause
 TCPDUMP_LICENSE_FILES = LICENSE
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
