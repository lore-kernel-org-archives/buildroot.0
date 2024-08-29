Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A270C83F2F
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 14:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2884E418D2;
	Thu, 29 Aug 2024 14:50:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z2cRVBlIIYVm; Thu, 29 Aug 2024 14:50:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87ED641982
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87ED641982;
	Thu, 29 Aug 2024 14:50:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E9AEA1BF31A
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D75D0606A8
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e6GEgPEYEX7u for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 14:50:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=johan.oudinet@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2052D6069B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2052D6069B
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2052D6069B
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 14:50:08 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-371bb8322b2so497272f8f.0
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 07:50:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724943006; x=1725547806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jmOLfHjV/byovrj72E+9iv1ofPvzZMwdDNdnbNFCt7A=;
 b=ZqpG1eHySqoC3rHj9dmw8KHNqWPqifc7dxRIxGvLS3o9N3uDG+OUIpAJW7OGpByJ09
 mKatGDlEsWkC7P/phmyLAbPIMYHDWI+DRn2RxlCNKk12fY7hhuVKXIRtVWmM/gjDpC7U
 sh4posU6Am/tgWlPOjXTlrl+f9nNhrV2rEYjnEvq7qXCJX/6ztY+AFxKpunXwvtucsSr
 devJblZpDPQqyysccUEbRpMLfcO72oGuAxcrLXhDCoyXXK2R32Ky4pzN8fkcSFH3874F
 eS6j/NBAOZGj96U0aq+WeXZKnOFKxWPcDueSh1KtnvEr9htyrGS8hqClIC//LzUfchbW
 Fjow==
X-Gm-Message-State: AOJu0YyNFQ4YUVyqgpPz6tk7yMaDMNGPFI3ovE0fvARBZvELAmKA2XVS
 e/AANAvd2yI1egSzRzK3hxhGkzOzQxdDMWxK3mTUhVSVN9pTsv4NZAUBlA==
X-Google-Smtp-Source: AGHT+IGGFEb0tIrLXnC1JH6wxQjbHROwl8s4op4xHg9xK//tluywEO491vgE2TB752lJ6I84osYe7g==
X-Received: by 2002:a5d:61c4:0:b0:360:70e3:ef2b with SMTP id
 ffacd0b85a97d-374a02318f1mr1542592f8f.26.1724943005274; 
 Thu, 29 Aug 2024 07:50:05 -0700 (PDT)
Received: from shrek.. ([2a01:e0a:acf:1a32:284b:b9b9:cca0:be3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee9c48csm1619241f8f.51.2024.08.29.07.50.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 07:50:04 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Aug 2024 16:49:18 +0200
Message-Id: <20240829144940.209964-3-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829144940.209964-1-johan.oudinet@gmail.com>
References: <20240829144940.209964-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724943006; x=1725547806; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jmOLfHjV/byovrj72E+9iv1ofPvzZMwdDNdnbNFCt7A=;
 b=WACq9cD6VzHqSTj9V1ojrJt1YS8/ZPFmnuey2+gs8fpQTj6p/1l7eGF93CjDgiJFNc
 0OIZJsWnQ2uN9kTxy4utHA2HgtBKoHGY34bz3jt8xc4LVoVqTMQZ4nsJNw2CLhPL8yJ/
 TQc7FYgwzY4sCJSHjHxHlW9f7C9yoCKOZyfnDathyHrz7K8ogg4p6cL0tBrmSZkX3t6N
 u4gUSy36XU5+4RQL6EU9yjNHOkN7ClmfmB2jsJxOffYqiMQgUbvg+N0k+aXed2dadqSf
 85pTUXIiBj7lURGay2+cXWyYsLJLW84Nyf0DqFBWFbYK9AVG+71/DVptOx5d+tQ4XTuE
 9BqQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WACq9cD6
Subject: [Buildroot] [PATCH v2 02/23] package/erlang-stun: bump version to
 1.2.14
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
 package/erlang-stun/erlang-stun.hash | 2 +-
 package/erlang-stun/erlang-stun.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-stun/erlang-stun.hash b/package/erlang-stun/erlang-stun.hash
index 85dc6a42fa..c248e89ea8 100644
--- a/package/erlang-stun/erlang-stun.hash
+++ b/package/erlang-stun/erlang-stun.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d7e9d3d591a88a91abf053c068f7152495e37d17f4c9ac58992c544d6f8f5e86  erlang-stun-1.2.7.tar.gz
+sha256  110b06572c6208fdeaa60c32cd549e6798f0a719d51bef97608c2aaa61151c11  erlang-stun-1.2.14.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-stun/erlang-stun.mk b/package/erlang-stun/erlang-stun.mk
index 9def30a857..abfb1c3853 100644
--- a/package/erlang-stun/erlang-stun.mk
+++ b/package/erlang-stun/erlang-stun.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_STUN_VERSION = 1.2.7
+ERLANG_STUN_VERSION = 1.2.14
 ERLANG_STUN_SITE = $(call github,processone,stun,$(ERLANG_STUN_VERSION))
 ERLANG_STUN_LICENSE = Apache-2.0
 ERLANG_STUN_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
