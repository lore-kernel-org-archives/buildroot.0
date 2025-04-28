Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85D5C36005
	for <buildroot@archiver.kernel.org>; Mon, 28 Apr 2025 06:29:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4352407D5;
	Mon, 28 Apr 2025 06:29:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id begsPEhbeyzR; Mon, 28 Apr 2025 06:29:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B68C740751
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B68C740751;
	Mon, 28 Apr 2025 06:29:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AD2AC5
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 06:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CB45406E8
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 06:29:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 30G0G2E1or-i for <buildroot@buildroot.org>;
 Mon, 28 Apr 2025 06:29:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A7A73406C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7A73406C2
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A7A73406C2
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 06:29:07 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-afc857702d1so4207014a12.3
 for <buildroot@buildroot.org>; Sun, 27 Apr 2025 23:29:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745821746; x=1746426546;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TZ8V3iyPEgv3hmE/sopQOr62e1O3yFfRBz+E5uMJRTk=;
 b=i3Sg9Bb179kp6qcT0rGlXLW1AFiAulPLADWfk2oj3EUuc+tfGeEKXf9qaAnfanY6wq
 i65oGflzMMuh/ConI3haOiidoVZCunJZmU8bHk4if0X7vNF2syo0Ui554IRISr7TOd/T
 9jSk1IWY6yTBzVQ6R2orWGhJAxnCOKErK7bDacUO7oNhSsScI7MrcD2csBqAoRnVMRqj
 rRHXO+UCNg+8dxRXEJ0axm01Dr+5pFE3B9PObXMkic/E5WME4dxNr8h4kruVE+5egA76
 BLeIxQjwdS9FcQ0KoLeYHNQDDjJXPiLtoSiYzj87VtGfv4huVSWsRq8nPsXvQGC5vNq9
 HxcQ==
X-Gm-Message-State: AOJu0YxZIYGtXaMHR4aVAsX8USqLEAcdAD8HYH5OmdPI38ptCumSPfuC
 OKrJJWzUlEwygh9TVl3wtq6UYDRwBwhmR1Z9pp2UtSt0by1jPuL8ZKlGkRa+
X-Gm-Gg: ASbGnctpgRUxN7QAHbbiZyX2OTl93vEjK9YPPLB4sl4VJmA1qNXFg54XPyVVKHvGOcv
 6Ps//5tJDbYlXZ5fTFadBIyqVNNEZZn+1zkiTs3DVp486BNVkJ0TXvFm4liSEpBe7mL3xcOHvu8
 OgkU+24CdUdkBlNopoNV1HyxqMYPq8FHYexljJ4qolbCO87PZmiGqAy8v6SnoQw1ux6AihbjNjY
 B61NmaFEJTnLI9gAW0lUm88KHgiuVdvMr2xmaOAJ0uJbJsc3omkuzMKhwzccMGDqUsHdUpVEMJF
 Z+oowHVH3IuHS/DMIGtDEL5tUR0GGKpJJQDE4ZvbchQnbI8EeN+Fp10lwkifi39Hmhe66pKxmFx
 Zi4XESA8yMeaxCnxVPfS/El7anxo7IJqQTZ125w==
X-Google-Smtp-Source: AGHT+IEEx6831D1pEKFCBZpJZ3VTXKrBOicDR+/VqaYPpdGJBXj0Q9Tou46a4w5wjW7EsH8CxUVktQ==
X-Received: by 2002:a05:6a20:7fa3:b0:1f5:59e5:8ada with SMTP id
 adf61e73a8af0-2045b6a40dfmr14074822637.4.1745821746351; 
 Sun, 27 Apr 2025 23:29:06 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b1cf3921092sm1516573a12.25.2025.04.27.23.29.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Apr 2025 23:29:05 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Apr 2025 23:28:51 -0700
Message-Id: <20250428062852.100535-2-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250428062852.100535-1-kadambini.nema@gmail.com>
References: <20250428062852.100535-1-kadambini.nema@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745821746; x=1746426546; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TZ8V3iyPEgv3hmE/sopQOr62e1O3yFfRBz+E5uMJRTk=;
 b=P/KDIb8dB7tR/ew7yjT5U3lVzA+7ukIRTK2tq5vyiz9/4oSphI2kfg4Qzq4r2mYzp5
 7hOCJvCaulR15RSdS59BNOflA405DRU2ZpG/TTeR12BNlwDTM2dF07mkmP24PFEeApWH
 RiizMv9MiIWFJW3h1/ZJaZISdO9g4uB+YQqNTJP/6S59G43UfQV6Pk0ChMajRVaUtQRN
 /SJ1Th5fm9hayQuwiZwRllqkDraapKi/0w1FIspyuF5+MSU89iVnAVQ3C+UvnuG0URPd
 X/uIZ7j1EqxF5rl/dUNg4qUOr4GSCVssP+nj9hKrgjuLdphyCGpc+1h71JXNxVccKROG
 qJkg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=P/KDIb8d
Subject: [Buildroot] [PATCH 2/3] package/libmbim: bump to 1.32.0
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
Cc: Kadambini Nema <kadambini.nema@gmail.com>,
 Aleksander Morgado <aleksander@aleksander.es>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/blob/mbim-1-32/NEWS

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/libmbim/libmbim.hash | 2 +-
 package/libmbim/libmbim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmbim/libmbim.hash b/package/libmbim/libmbim.hash
index ebc37504c5..d487b5156d 100644
--- a/package/libmbim/libmbim.hash
+++ b/package/libmbim/libmbim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  cfc729d23b9bf699b23a7ef2f5d732d6eff96234e31fed36b778771a6e3d3ee5  libmbim-1.30.0.tar.gz
+sha256  7eca9f5af2eecfdb5e3a2a865a7f29d0ac9532ab187a9c6adce4d85f897eb385  libmbim-1.32.0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-or-later.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSES/LGPL-2.1-or-later.txt
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index 717c2396f7..190f3547ec 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMBIM_VERSION = 1.30.0
+LIBMBIM_VERSION = 1.32.0
 LIBMBIM_SITE = https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/archive/$(LIBMBIM_VERSION)
 LIBMBIM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (programs)
 LIBMBIM_LICENSE_FILES = \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
