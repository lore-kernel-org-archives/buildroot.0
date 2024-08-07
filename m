Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86FFEC52D71
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 14:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51A4B60A6E;
	Wed,  7 Aug 2024 14:35:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m_jr8PgUoNYT; Wed,  7 Aug 2024 14:35:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D18560A64
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D18560A64;
	Wed,  7 Aug 2024 14:35:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D94A61BF982
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C1DE760A3C
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:34:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ztYTh9gZZGv4 for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 14:34:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com;
 envelope-from=johan.oudinet@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A41D0606F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A41D0606F7
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A41D0606F7
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 14:34:46 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2f15e48f35bso18681491fa.0
 for <buildroot@buildroot.org>; Wed, 07 Aug 2024 07:34:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723041284; x=1723646084;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X3iWoCHujnvPgXUtIFoYBQEQATcOoUYQRqSgLJP0zBc=;
 b=mvl7CcxvXrexqUkwy/hniDU2FpQ9EwFJT1Xzd6twDq9i/sUVubMA5r1FbuE4+G3sH3
 aDGZkS7TKyL8k1ssU6671s8CUlMffkp8e5KgB0VEQ/CixWSTr2LeeJfGnS4ld5AVx65C
 1+d5xRMgcvd/LBWfD670XCTh4E7yB58pV65hlymL3hsZAaze4QlkJwQmOMbFy4oVFlzY
 AFWGMbuimjnZt9b/Hjnn6NDkN+lshPlKBO/zMLGYkq9/fMq3V89LrbMll2VltpzSnkhZ
 8Fnwp/0kBJmfw6NiP9DH1KmPkBbGEd5KQ+tz6j08lk4YIF11RlpH5Opel3A5uSajG0vs
 l0rw==
X-Gm-Message-State: AOJu0Yxxkg/H1O4x3IBjex2z50IdiYHZYk9N1CwclNoMCmTuT20+r9JI
 ZFvu0wXTs3u64v96KoPzE//pXzw7JATBO3MW1hZBoN3fqSiD1ZIsA7rchg==
X-Google-Smtp-Source: AGHT+IF1cIXfExg9zjW+2iyfYqOdw7DN1U5WJG4ruPycYRoyhShlbHYypeq7TWkSAnU2ioENKgZcjQ==
X-Received: by 2002:a2e:3019:0:b0:2ec:4acf:97dc with SMTP id
 38308e7fff4ca-2f15aa9112dmr131089001fa.11.1723041283829; 
 Wed, 07 Aug 2024 07:34:43 -0700 (PDT)
Received: from shrek.. ([2a01:e0a:acf:1a32:b409:e7b0:306e:2d45])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42905796a29sm33289995e9.10.2024.08.07.07.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 07:34:43 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  7 Aug 2024 16:33:14 +0200
Message-Id: <20240807143318.439619-15-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240807143318.439619-1-johan.oudinet@gmail.com>
References: <20240807143318.439619-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723041284; x=1723646084; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X3iWoCHujnvPgXUtIFoYBQEQATcOoUYQRqSgLJP0zBc=;
 b=KuOnMgvszsXgNcqnZ8wZgcBiyfwfuYHgKwGsm6Qd8iT3ez4u4A2d5pG50ggmMVJDcC
 x6uuD6ogAdMDPv7ABn7VZvvP6CDQbvDKb7NhZkoc450ogAvTZossS0shz9gv8S2zrYJq
 T3WP2U2f8Dgb3KzUlOQCa3WKBOJKGhq+7RZyDzSy0y5CEtNpgEVgLGgShY1KOEXv+POf
 nvxPeMfkAIeS4AbuxsvXguvlYENUoAyPk5Sz3ek4GKR5xCVHRfkCmmuovxqh0bZTzBtY
 20cMgQwM/x/e1YvT4RoHlp9J7p0hnhHNxFlXryrGJt9sJM7cMRw6+jscOXSlUUMn6peG
 x3YA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KuOnMgvs
Subject: [Buildroot] [PATCH 14/18] package/erlang-jose: bump version to
 1.11.10
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
 package/erlang-jose/erlang-jose.hash | 2 +-
 package/erlang-jose/erlang-jose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-jose/erlang-jose.hash b/package/erlang-jose/erlang-jose.hash
index 1e763fd5ba..abcf11b1d1 100644
--- a/package/erlang-jose/erlang-jose.hash
+++ b/package/erlang-jose/erlang-jose.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2186b93ad20d386e6db9f673c135c48568a55de42b5a1d839518c65509af4ea5  erlang-jose-1.11.5.tar.gz
+sha256  57c0ebfb0fd41d52bb22ff0398af75acf378475751c0a127af726b7385659ba7  erlang-jose-1.11.10.tar.gz
 sha256  6397e2bd9a35a64c1bb798b937071fbe49d90667f717e65c74a0d0fe93d5c1be  LICENSE.md
diff --git a/package/erlang-jose/erlang-jose.mk b/package/erlang-jose/erlang-jose.mk
index 4df5173b2c..f147afd5a7 100644
--- a/package/erlang-jose/erlang-jose.mk
+++ b/package/erlang-jose/erlang-jose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_JOSE_VERSION = 1.11.5
+ERLANG_JOSE_VERSION = 1.11.10
 ERLANG_JOSE_SITE = $(call github,potatosalad,erlang-jose,$(ERLANG_JOSE_VERSION))
 ERLANG_JOSE_LICENSE = MIT
 ERLANG_JOSE_LICENSE_FILES = LICENSE.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
