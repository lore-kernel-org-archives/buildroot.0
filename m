Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3E3C0218D
	for <buildroot@archiver.kernel.org>; Wed, 29 Jan 2025 07:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30B76606EC;
	Wed, 29 Jan 2025 07:34:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oAKnbQK_pyop; Wed, 29 Jan 2025 07:34:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A57A606A9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A57A606A9;
	Wed, 29 Jan 2025 07:34:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1097F20
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 07:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EEF734021C
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 07:34:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FzLUDpyF8H3q for <buildroot@buildroot.org>;
 Wed, 29 Jan 2025 07:34:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B32F040168
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B32F040168
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B32F040168
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 07:34:45 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-21c2f1b610dso152286495ad.0
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 23:34:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738136085; x=1738740885;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t1dDgkXKq7C2mk3bWmGp6va6+cXa0FG08QFLEi1XSiw=;
 b=gQw09AFchSKnYUi74KVNEU8zTZzUTcyQxIhc/ewX2MhTo8z8LCZa4uiaU9ZCIr2ngv
 ZyjfEZQKrSMp81CMa1i3YdjUu8Z/qxbXW+++O54AqzDpZHn0G3GtuxX1pR6h/ow97YAn
 T6aZdBW5lnswgSTbxB0z/y5ZW2j8v0AvI9dH112APoAhuA1T7p4qZ61I9/mcbvtw+ahA
 YKNxhCBvDmP4KsMqQVbs+EbikPbgn0T6gjKO3L5ggR5829Mn8A8OBCLy1Cpb94n3WpO+
 WYF4sNij7EHa6nA6NuIppmMb9yyOBQQJxbGKs+xoNyNwYnA4jph62U5ksnFBS5eG+EAo
 +KzA==
X-Gm-Message-State: AOJu0YyjRH+oBzha7VmczfPUyP5nk0EvNn0rWIMfA6bWa+THE+1FTKg3
 xNWPZ8yG3t/9YbyW4ACsLf/RrLvanOqBQR/3wIwItiiQrVX08KQK6hK2Oj1y
X-Gm-Gg: ASbGncuKEbl8L6XPxbC8nA6Id9qZZ/nr4PeQZ9lUu+O82Rm+owQtOW/h9dVOPi6keas
 888c3dBnXIVp5/buXLA6ObF00Gp9MroBEe/eBonIysGI+zoM6o+Xob+X9DOJ9pUdyqM4C5Pl11M
 LaTuDyzIcy/mUcQoeF6PaLEJJLCYG5foiP3eaAQ/uMIhjZXx969Hhvpzz0Jck0cVV93fQqlpp3x
 kjTWUzLZCWQbYzkWXcdKzSjNNpbIzO64bkMX+ArBp5XmxRl5wgOvCeZbFPALADY41BRAKopg+d5
 4uoIIhiQW4VRzCcie7KSEyu5iLwqYauyRJLt1tKBnsX38x9QHZeFCyeJS14DIPlLe0wMeWa+Gh4
 =
X-Google-Smtp-Source: AGHT+IFGnShti6uA7soXUsaC22WZHfzUTWU7CLFPeUJOCTvpnifzmKziRnmvHgkY2g5RcRQsDc0ACw==
X-Received: by 2002:a17:903:2a8b:b0:216:3c36:69a7 with SMTP id
 d9443c01a7336-21dd7de0fc4mr31949975ad.45.1738136084483; 
 Tue, 28 Jan 2025 23:34:44 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21dda5f7a75sm5440535ad.4.2025.01.28.23.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 23:34:44 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Tue, 28 Jan 2025 23:34:37 -0800
Message-Id: <20250129073437.5540-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738136085; x=1738740885; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t1dDgkXKq7C2mk3bWmGp6va6+cXa0FG08QFLEi1XSiw=;
 b=Em0eqWC+a8iquMUxZlFMQQYBKEP30M7xxvxMS1j/Aytu7MVCMktgBAbCpOKjvNwzix
 +F0AcXTz7ZQM52D28RQtsIfF6hvRT3CI40d4oVgPzDmjJYOqeruD0LPV7c8yb5/H2dM+
 7mRgiJGg/Lt0w9g8xy5XWDGJcHDQLSPr8tQ3V5kn/V6vi/4GhrWSJiJWr3rQeNyxbLIE
 Kzi+PAuxHbg6oas4j0YSHSN+8IaeOUp31gecXo9J0gH0ZQkfDGiFfTVrwgH7G5Eql8BL
 APAOdxYE00EjlsRpWq9TyyhCqGCTFsbIw0wZyjLcR+ODa+teUYXBlcTiaghXHhVPXzbC
 OKUw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Em0eqWC+
Subject: [Buildroot] [PATCH 1/1] package/iw: bump version to 6.9
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

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/iw/iw.hash | 2 +-
 package/iw/iw.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iw/iw.hash b/package/iw/iw.hash
index 376dc3b499..e1e5ddd868 100644
--- a/package/iw/iw.hash
+++ b/package/iw/iw.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/network/iw/sha256sums.asc
-sha256  f167bbe947dd53bb9ebc0c1dcef5db6ad73ac1d6084f2c6f9376c5c360cc4d4e  iw-5.19.tar.xz
+sha256  3f2db22ad41c675242b98ae3942dbf3112548c60a42ff739210f2de4e98e4894  iw-6.9.tar.xz
 # Locally calculated
 sha256  5932fb70481e128940168a5fdf133e6454293c0865c7e757874b235cb6daa2af  COPYING
diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 60ada9d57f..f20d8f1065 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IW_VERSION = 5.19
+IW_VERSION = 6.9
 IW_SOURCE = iw-$(IW_VERSION).tar.xz
 IW_SITE = $(BR2_KERNEL_MIRROR)/software/network/iw
 IW_LICENSE = ISC
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
