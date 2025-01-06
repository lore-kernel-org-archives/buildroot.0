Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCDC6E77188
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 17:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69E2C40169;
	Mon,  6 Jan 2025 17:58:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N1ZHU9iVDsms; Mon,  6 Jan 2025 17:58:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CB9340235
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CB9340235;
	Mon,  6 Jan 2025 17:58:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 283E0DB4
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 17:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 065A54027D
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 17:58:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iFn-Zi7PRBTP for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 17:58:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F08FA405B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F08FA405B3
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F08FA405B3
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 17:58:37 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-2efd81c7ca4so17255038a91.2
 for <buildroot@buildroot.org>; Mon, 06 Jan 2025 09:58:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736186317; x=1736791117;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rndJoA/NAUopxIL2hwxCqLz10TYARhkNQw8wZISr+7g=;
 b=EfWeUethpEj5LJKL2AhYGZq48qd13wC90th5czSDgOvbscRwDfn9//SbBPPQvIrGyE
 SsxEW6Leqi2jI9sNUQjqz2eVMef3X58vgbFsXYfHcEONostudzNX2UhxAScoEWRadTQG
 +CRKScc7IyqZNEoBO0yuxKCnDV1++/Oy2L0yRsTsrJZCJcn+zZRpyqlzJrW/Ulr33zpL
 Lb+rxakQIhYou8x1o8/M8UBeTBzp2qwbzz8kKuDgf6gpU47qzeQFWFWAGyulRt+pnUia
 MR8j+wVl1qVIirBdu7T+kvDauf9JHomaQ3lMzSwb4DyMNUa7mk4uabzT9e5pIHylk8Ec
 hb3A==
X-Gm-Message-State: AOJu0YwJmpubuF2IqL1NVBhmfYBYbl6Gu+CZw+1f8USBwwujLkwc+OH9
 S4t6cBHAUuMv4HLcpnKtrRUi9Xh/kgMPATCwNvgSuc8dvQ5oakS+KkPvYw==
X-Gm-Gg: ASbGncsvSfhn2Q/fYvAFjYfzXH8n7Nb4hDVYSEadGr1eeuI2i2J8jq+4jELURePHP7X
 by4vr+xta6OuBQ17E6CSvXw9oAyxgPOuHsiskZjoachtDgu+xA9RGryrhTXBfe7sCFrGe80W0GX
 1qHstiim6fkBJePDGc613pmecyx8gxHClmf+djZ0Mio4SxT7h7viFZM+wUMTYsq8mrG6jewm90g
 eCHKvCD8PjkGm89ZDQPLk1167J3ILfIk3jxvP8wb0g7vj1Z2lb85W0tBCz/tqcYL3J01EAqO6NJ
 sJWKYYPN/Ut443fkpKpc9beat+1jGyvDRBsfalGj
X-Google-Smtp-Source: AGHT+IH8JtncPxYtGIaJtpriv7xcORE8KdA+iM2r8Cv+zSly8MVCLG/USxiyQ8R9E08SRUCHYjX00g==
X-Received: by 2002:a17:90b:3cc6:b0:2ee:aa95:6de9 with SMTP id
 98e67ed59e1d1-2f452eed7e1mr89991233a91.33.1736186316927; 
 Mon, 06 Jan 2025 09:58:36 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f2ed62e390sm36088304a91.21.2025.01.06.09.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 09:58:36 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Mon,  6 Jan 2025 09:58:32 -0800
Message-Id: <20250106175832.176841-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736186317; x=1736791117; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rndJoA/NAUopxIL2hwxCqLz10TYARhkNQw8wZISr+7g=;
 b=m5dv97Z+LQ86F6i8O5fnIDrCEuMMa0Y77xFuXaM7fYrw24tgDUIqfbinYSl1Cd2zy2
 +W94yZ8u3HSLe8AKvFAx3etweb/JiTHJ/7ZdrzcNiFrLSrvMEAzuomMBJ+gRenFVpmKk
 Uiiw1nspKayRxiWSDEcWz1IhEsHHvd1WOcEfq1vgsOQRAFNFlKksxtIG9QejUfLb8bOh
 uF8PGczQPgt3duhJrq2VGLD19ZrtFn0moaOvx6iObje14zrjGaSccX5otr008HlHq5L2
 nAubzo3xVnU/lbNUxGqlOP/Y1JPYA1ECubMjZSCIMVvnDT6g4JEUtA8kGCeixvORiwgZ
 Ofpg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=m5dv97Z+
Subject: [Buildroot] [PATCH 1/1] package/logrotate: bump version to 3.22.0
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

Changelog - https://github.com/logrotate/logrotate/releases/tag/3.22.0

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/logrotate/logrotate.hash | 2 +-
 package/logrotate/logrotate.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/logrotate/logrotate.hash b/package/logrotate/logrotate.hash
index cc466a6f4e..37cf85ff6d 100644
--- a/package/logrotate/logrotate.hash
+++ b/package/logrotate/logrotate.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256  8fa12015e3b8415c121fc9c0ca53aa872f7b0702f543afda7e32b6c4900f6516  logrotate-3.21.0.tar.xz
+sha256  42b4080ee99c9fb6a7d12d8e787637d057a635194e25971997eebbe8d5e57618  logrotate-3.22.0.tar.xz
diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index 3fed1b957f..9867835aeb 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LOGROTATE_VERSION = 3.21.0
+LOGROTATE_VERSION = 3.22.0
 LOGROTATE_SOURCE = logrotate-$(LOGROTATE_VERSION).tar.xz
 LOGROTATE_SITE = https://github.com/logrotate/logrotate/releases/download/$(LOGROTATE_VERSION)
 LOGROTATE_LICENSE = GPL-2.0+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
