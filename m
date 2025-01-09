Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA8A9E77197
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 08:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63E718049B;
	Thu,  9 Jan 2025 08:01:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OQ-zdMN4KikU; Thu,  9 Jan 2025 08:01:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C8608129B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C8608129B;
	Thu,  9 Jan 2025 08:01:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 15D56942
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 08:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA7AB8129D
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 08:01:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t1I_nX_dBN4Q for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 08:01:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0CE2181290
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CE2181290
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0CE2181290
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 08:01:34 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2f13acbe29bso2643231a91.1
 for <buildroot@buildroot.org>; Thu, 09 Jan 2025 00:01:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736409694; x=1737014494;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8UHyxnMT9nPaHWJ6HrOwvl3ovaJP8z1H9dNyHaGFhsA=;
 b=ljUBmqE6Gdf+JWVQRp6rZf3MIkORPEvxi93JIXii9XMMLjE+KhQFFNBEMTLoz7osD5
 uKTPn7bvN/MwJCmlZ6rOVUt/KAJvZAOHbx1Al+JQ7Z+vvV2c+gJMwWbgBmwnf8mjtvki
 V4hMWhzUuA+5BDw7EIBMcks1NQpKca7YhMu4w4eLk83FcpeF4qXWWezkb3RzFvL16U7V
 idsUMTEb3gjrfPt9a7Fqu9eBgbeAVKkkRrJFb4+NYe9C4TIlZzi0vdnbeRp1VeytFe4h
 IjGTkXjpGv9QPQZcY6BC8jw5w7p5TUG8zDyqpFlEraoMkav+oT6ZbU2YB39IGxnNNRcD
 FgRQ==
X-Gm-Message-State: AOJu0YwIx4CR05Lg0OfyCcT0LtZYkxyDwYoHMLPub0Xh8nU9uGhPeU2a
 mJqbn1BYItnVTxpoENe8OxhmqzVHSyAa6ikhoTtA9i7bn7LJisPh49peCDZj
X-Gm-Gg: ASbGncvGywezbIL5nwD3iubXgPqYK4nAZjbr11ISXnM7wIzhAhYJRoW1+J7GqhSKjte
 ZyU8XdOol+95XcbnPxZvN9G9Y4eyfl/8esob1sZYXVSviF3tTscpCV5+1RYpIoKFzEKZK1N5jFx
 2WUzqx535bKvraLMifP7RtcIFHMMBVagN5OnGbpL4elx0PuXFtRey6N45ZmKblviWh57dMJMuO3
 HiC9HtoVjmoaQB45VzqGmzAj+D0CLzHZRCmsMfSTUyTXDJQTKNTPcffkhOmqLcXk7DnHqbJhML3
 1nHYOE83M2VYgxXyaxBYTNRR/oASxP6+YSSUVAKb
X-Google-Smtp-Source: AGHT+IEW0Bbrbn8plMM9qGGreID3UcvQxBrK84RHQxjAXZIfz0/q/GN61ssoF11DXRVXZQy+/8yq+Q==
X-Received: by 2002:a17:90a:e706:b0:2ee:cbd0:4910 with SMTP id
 98e67ed59e1d1-2f5583139d7mr2175480a91.1.1736409694104; 
 Thu, 09 Jan 2025 00:01:34 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21a917442adsm6652795ad.69.2025.01.09.00.01.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 00:01:33 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Thu,  9 Jan 2025 00:01:30 -0800
Message-Id: <20250109080130.759117-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736409694; x=1737014494; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8UHyxnMT9nPaHWJ6HrOwvl3ovaJP8z1H9dNyHaGFhsA=;
 b=RqryQ23fXKXbCSJ+XTadbB6h6qFEPqR+2+jyJU18vHVViFk8ME6CwJTehZPOmDrSqG
 h4uMXQhxA6yMPCKA2wxd+K2xuPcBWL+Gp+r97mb27Tc37lgNYpTH4rgAQnyndLvZrgFx
 WoK6xrtnzBZucdg00C7h1Oa5pUWRbNunOX4Zm+tqlbWT8GAJ9UhU3UojsZBy0U25o/yM
 J3TCdBqWuQUnCfS+OaK0qXTzht897MX0BlTijZEDvgcs0uLB905NIMXzP8BWhGm2cM+4
 OYb06rjvwxI/moPWJZL+Ax7uGT+dJcll7INtjexSaZGSvRzD50L20iRTAwD8NhRKR7rp
 EgIA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RqryQ23f
Subject: [Buildroot] [PATCH 1/1] package/radvd: bump version to 2.20
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Updated radvd dependencies.

Changelog:
https://github.com/radvd-project/radvd/blob/v2.20/CHANGES

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/radvd/Config.in  | 3 +++
 package/radvd/radvd.hash | 4 ++--
 package/radvd/radvd.mk   | 4 ++--
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/radvd/Config.in b/package/radvd/Config.in
index f1df0c3cb8..4149683fc9 100644
--- a/package/radvd/Config.in
+++ b/package/radvd/Config.in
@@ -1,6 +1,9 @@
 config BR2_PACKAGE_RADVD
 	bool "radvd"
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS  # libbsd
+	depends on BR2_TOOLCHAIN_HAS_THREADS  # libbsd
+	select BR2_PACKAGE_LIBBSD
 	help
 	  IPv6 Router Advertisement Daemon.
 
diff --git a/package/radvd/radvd.hash b/package/radvd/radvd.hash
index a624db24ba..8415b8d854 100644
--- a/package/radvd/radvd.hash
+++ b/package/radvd/radvd.hash
@@ -1,3 +1,3 @@
-# From http://www.litech.org/radvd/dist/radvd-2.19.tar.gz.sha512
-sha512  caa621fd77e34ff6858d60a41b0ee02aff967ac14f2b84c402359744f4bece5c1563419860431c328adc0385e9893ed1f2421d652247a3aa0dfc0aaad1e01233  radvd-2.19.tar.gz
+# From http://www.litech.org/radvd/dist/radvd-2.20.tar.gz.sha512
+sha512  798d8476ab5ff43083b181d6d6ec43c47d06e4067d30c71e038cfd890bcf1ca23e809f9e184c4363458bfa25a916625dd2d7553290fb3e5459034d477b80ebaa  radvd-2.20.tar.gz
 sha256  40a6db00cf0b97f031eaa6c6e87157788f40ced1b88e3ea6d78779bd2a39dc80  COPYRIGHT
diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index 7a3b0a36ac..89d8f55d51 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-RADVD_VERSION = 2.19
+RADVD_VERSION = 2.20
 RADVD_SITE = http://www.litech.org/radvd/dist
-RADVD_DEPENDENCIES = host-bison host-flex host-pkgconf
+RADVD_DEPENDENCIES = host-bison host-flex host-pkgconf libbsd
 # We need to ignore <linux/if_arp.h>, because radvd already includes
 # <net/if_arp.h>, which conflicts with <linux/if_arp.h>.
 RADVD_CONF_ENV = \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
