Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BED7C83F2D
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 14:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22EBF4239A;
	Thu, 29 Aug 2024 14:51:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0g7RtFgwmdul; Thu, 29 Aug 2024 14:51:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2486341A1C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2486341A1C;
	Thu, 29 Aug 2024 14:51:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1760D1BF31A
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 381BD4016D
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XhbCrs5IL3WP for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 14:50:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=johan.oudinet@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 09BA540132
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09BA540132
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 09BA540132
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 14:50:49 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-371c5187198so495413f8f.3
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 07:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724943048; x=1725547848;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X3iWoCHujnvPgXUtIFoYBQEQATcOoUYQRqSgLJP0zBc=;
 b=fuUABDmtY7xn1IVRa3wn4Shnsz/eZ6OjDR10/7zLABIHY8CEpshR9Tw6KAmk+amLb8
 y8dAccg2J7/gU94kQiqLu9PduloTTcDRogy9a4hZ6zzKqy+Gw02RUuw0vFaRHSnWFfBe
 Q1aXVcoDzizoOYbvmJTPAhzGRGW4oeG14B6ZW2kmSHDYwgDEcEj1WybUEYfAbOeD45Sn
 qUH8GELoPP7TdDMcJ/zPp6T1hT/pq7KxPN2fHrqtlc0cy84mREx+spR17eyWFT0BRQ89
 EEEWlolx8o82oFd4fDbR8HRWpvK1VAbdNX9En8KzWybt6DSvxoYFKah+u+/qFO0rOd1F
 USTQ==
X-Gm-Message-State: AOJu0YwGDZpuGntS+kg97Gi1ItvhUPxPGyt14FQ0sp08rjW5SpOf7MAm
 kiGsvpLAOg5wYVM1S5Fih9tdeurYCnafGdiWHaJf5Yq6owFJ1Dqdw4BKPQ==
X-Google-Smtp-Source: AGHT+IEY18Wg2tnyqSrLGbqkQ3Uewq906U4nSsT+4n0R8R489hD1S+oATIS9aupxqBIj13S2AxSspw==
X-Received: by 2002:adf:a35e:0:b0:371:72a8:155 with SMTP id
 ffacd0b85a97d-3749b57e808mr2001482f8f.49.1724943047443; 
 Thu, 29 Aug 2024 07:50:47 -0700 (PDT)
Received: from shrek.. ([2a01:e0a:acf:1a32:284b:b9b9:cca0:be3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee9c48csm1619241f8f.51.2024.08.29.07.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 07:50:47 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Aug 2024 16:49:34 +0200
Message-Id: <20240829144940.209964-19-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829144940.209964-1-johan.oudinet@gmail.com>
References: <20240829144940.209964-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724943048; x=1725547848; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X3iWoCHujnvPgXUtIFoYBQEQATcOoUYQRqSgLJP0zBc=;
 b=lZhW6wj2JEPHIlljbl1JfsnJHUbxGzBOkqAe8KZs3oHfwFUqhCb7ZNXRCFBTelgnKl
 UWC0SxUQJCHgjCibbQlBNXlq1XMpRJUrfgfZ/gvOYognCuA6LMrHmxzlhr1VaDTTms8n
 SXoYQw0HISWQje8P+u9KJ2hMXO4ofRDS2yaDQEIM4DuRrE3cVC5//n7E7P5Vx6lIl88l
 CzYhLwFbl5clkORqRHlqOQ80voe+cvpvcs4Qq4gZKfAPaNiXWBhq7hlVaxZ5z3eLV1Px
 8nWifUBuNUonkQ2R9GybSCr/48oKJA2RIdBlMemVAqLml0V/zlIW2xMoOsbQ1VLKZR6H
 Oxvw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=lZhW6wj2
Subject: [Buildroot] [PATCH v2 18/23] package/erlang-jose: bump version to
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
