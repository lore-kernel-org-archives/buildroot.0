Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C0D7C52D73
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 14:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0769960A56;
	Wed,  7 Aug 2024 14:35:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kb51w4UYhdIg; Wed,  7 Aug 2024 14:35:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC6C560A5E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC6C560A5E;
	Wed,  7 Aug 2024 14:35:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EAB5F1BF2BC
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6E9180B7D
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:34:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l7NzPlGEGCq3 for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 14:34:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=johan.oudinet@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0CA8780B80
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CA8780B80
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0CA8780B80
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 14:34:43 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4280ee5f1e3so12985445e9.0
 for <buildroot@buildroot.org>; Wed, 07 Aug 2024 07:34:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723041282; x=1723646082;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mLqtWA2uyQFNIcUNDVyiXPi5Gzq2BuMjs/839c9YbOs=;
 b=eGsbFnaCta+L6IV3ZKF/4PLYN95KZDgcLyz0kuYExjFJ90UJZUEEFi4fUtfOTHHELQ
 oa+CFBRvanU5RyjMA6KDpNxUp8+5hNMOQxuG+v/6Q/CdWFU6NawKoSZg9sf4tYV0i/s8
 2tH8fJ8CFcwTvXr710qTtV7c5TzEZsJZLSLvBYv8rdZku9WAd4gMOcloQI6BVgzaa1Zy
 qH9tmGmOlgTeevQarg3Sn1RG5nu4pv4bMud2oIAcwXLr+l8jAFjjmkVbGZm1Cp1AZRAE
 YjW1HZJVKudJ2FQFUHCRVpXMI7S3GTR+Fbmb7L4z2Vv3N1QJ6K2qI9xxeh0S66MXoFLg
 0+UQ==
X-Gm-Message-State: AOJu0Yzhmn0CC0yLati1huTlY8bLA65Bm5Mg1euhAZ1bNeu5B/rnCv6s
 BLaI/BAj2bR79Qg7YY6ylh22omJJ5RvTAVHfanIWGi0qeteqAko2RP9r/w==
X-Google-Smtp-Source: AGHT+IEdSLRdnPGTxKfFaDPPiAiN25Gc/qpL9WBZet7JkZbDbFWCi4zTGeIYqZu8IvlSvy/A2HEeiw==
X-Received: by 2002:a7b:c846:0:b0:426:6f17:531 with SMTP id
 5b1f17b1804b1-428e6afe872mr130932925e9.13.1723041281662; 
 Wed, 07 Aug 2024 07:34:41 -0700 (PDT)
Received: from shrek.. ([2a01:e0a:acf:1a32:b409:e7b0:306e:2d45])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42905796a29sm33289995e9.10.2024.08.07.07.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 07:34:40 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  7 Aug 2024 16:33:12 +0200
Message-Id: <20240807143318.439619-13-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240807143318.439619-1-johan.oudinet@gmail.com>
References: <20240807143318.439619-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723041282; x=1723646082; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mLqtWA2uyQFNIcUNDVyiXPi5Gzq2BuMjs/839c9YbOs=;
 b=WmlC9kBWuGUxICvdlDpeFMg2eB/qjJlr/055iZbrp7B8rJfu1mzHJewfvhUJ3sbOFD
 wYUsLfTC4fFpgLixEGpsDkRqgQ4xWFboCa8dZf9JEfE2Xc9EZFOARlnr7b+MWagPe16+
 gWOzjy20nKFbou/oE4cOa+p57fzrfsJsb/gMV65h9YuFZgTOiyfEPzI69s4tF7IcL3+u
 cg6vUlKu85qwiij7iJEpqQvy8lumQgaatS27PZr1oY5IdWvsK4fbKMyGCznFlRWj5zMq
 gSPGTRwQaMKHp1cOR3xZrcruZ9p4GQu/xInWGdMNsuPwmchDkIpFUIo7ZZqdd8LqtwFX
 0v2w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WmlC9kBW
Subject: [Buildroot] [PATCH 12/18] package/erlang-eimp: bump version to
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
