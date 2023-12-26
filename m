Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7FDC46CD4
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 15:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B000F408C3;
	Tue, 26 Dec 2023 15:18:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B000F408C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mn63YpEWfdK1; Tue, 26 Dec 2023 15:18:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A859640386;
	Tue, 26 Dec 2023 15:18:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A859640386
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 410B31BF3B0
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 15:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2751C40291
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 15:18:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2751C40291
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oMVaxc0Sw3bZ for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 15:18:01 +0000 (UTC)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D66340248
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 15:18:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D66340248
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-336c5b5c163so632158f8f.1
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 07:18:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703603878; x=1704208678;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CidusLjSrYBqVnv9jhoznaAEkqKu7VACbE2NSWgnO/U=;
 b=ImUiiK08DbATkBRKJaIP12td/MzcmdNizuxNVfYVehh+tFj0JIH1UnPGNmOIWznXqc
 5DcdZgN/6WEv6fxhRN7w9kAF8mSnCqOpKLca4PkFBLb1yUnvhHuWDwZ76CIS9bJwHzl/
 serpfWU/LDyWEt6mSfGEevgEfZW7VwHp4zgSqL6Y7c1l+FW3/e8b4OxRQHDb1QFBlxlQ
 ykunWdACWWLoZkX5iJ2LzIId0PTvgT9umKvUKszG4BuN/OzGmwFK/vVtXPLqXyvvl0g0
 URZqa5yYGH7mi+LDU8rG4xaT580zihDZHq8mxqe/0E/nedfnnyFho4PKxxoKG5pL5IWp
 WMfQ==
X-Gm-Message-State: AOJu0YxpQD0+vJJnoj7UPA5ymqWwV1QnibxmewOAPE4Ec9LdjSm9TbkK
 srZDFxgKVOl0YGxYlKDFrahN33eOBKo=
X-Google-Smtp-Source: AGHT+IE2s6sXVlhlaTvvev+pV+2kPnsnKg1Q5x6DdYQvJem0SMa1C/rVZqzjJrjIPARzXlKIi2kX3Q==
X-Received: by 2002:a5d:4809:0:b0:336:6951:7f7e with SMTP id
 l9-20020a5d4809000000b0033669517f7emr4395762wrq.33.1703603877864; 
 Tue, 26 Dec 2023 07:17:57 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p14-20020adfce0e000000b0033686e8f02dsm12338605wrn.45.2023.12.26.07.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Dec 2023 07:17:57 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 16:17:54 +0100
Message-ID: <20231226151754.449170-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703603878; x=1704208678; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CidusLjSrYBqVnv9jhoznaAEkqKu7VACbE2NSWgnO/U=;
 b=St9yt/HARwxCZFKCnFyUfUiqpTe+etMd4KX3nsjNKKsGPtB0hSKqcLVFUCzlDPYidm
 duLvmpgeISY+EiW3xxENaTq8CvEJ5/RtP97IT9Z9CBZWneiDkf8d5+gWn02CdMi2D1bO
 Rf+B7Gu93Vrk2CJg8ltWnMZmuvS6dXCJ2uop0Fy6/6xeuI/PT+57/sW9dGOHY1RggFtb
 L1pZvp6z0YRKSzlT/Tb1nRMbYoDuXvj4zBNlAXMb90o8PWvMv4NkzTk3aBtgcFoNSqp5
 eU0kXo7gEPLZ2dY6dZJKlB4ieNyccBKOUVO/pg27iRqFnYLSrZZU78QIH7et5/1nCguk
 CDjw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=St9yt/HA
Subject: [Buildroot] [PATCH 1/1] package/libde265: security bump to version
 1.0.15
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A couple of bug fixes, including the following CVEs:
 - CVE-2023-49465
 - CVE-2023-49467
 - CVE-2023-49468

https://github.com/strukturag/libde265/releases/tag/v1.0.15

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libde265/libde265.hash | 2 +-
 package/libde265/libde265.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libde265/libde265.hash b/package/libde265/libde265.hash
index 9bb3f20a71..a21a8a1265 100644
--- a/package/libde265/libde265.hash
+++ b/package/libde265/libde265.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  99f46ef77a438be639aa3c5d9632c0670541c5ed5d386524d4199da2d30df28f  libde265-1.0.14.tar.gz
+sha256  00251986c29d34d3af7117ed05874950c875dd9292d016be29d3b3762666511d  libde265-1.0.15.tar.gz
 sha256  02cc1585a20677992e0ba578fa692635dc193735f2691dc81de924b51c4e8020  COPYING
diff --git a/package/libde265/libde265.mk b/package/libde265/libde265.mk
index 8624d2f949..62c22246aa 100644
--- a/package/libde265/libde265.mk
+++ b/package/libde265/libde265.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDE265_VERSION = 1.0.14
+LIBDE265_VERSION = 1.0.15
 LIBDE265_SITE = https://github.com/strukturag/libde265/releases/download/v$(LIBDE265_VERSION)
 LIBDE265_LICENSE = LGPL-3.0+
 LIBDE265_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
