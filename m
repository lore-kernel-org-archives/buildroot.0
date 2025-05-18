Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A35D1C3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 20:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 668C040B3F;
	Sun, 18 May 2025 20:18:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KvQIVeULBiz5; Sun, 18 May 2025 20:18:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 895D440B74
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 895D440B74;
	Sun, 18 May 2025 20:18:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EE5AE4
 for <buildroot@buildroot.org>; Sun, 18 May 2025 20:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00196813CA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 20:17:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U5JBsV1Ss1m8 for <buildroot@buildroot.org>;
 Sun, 18 May 2025 20:17:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 32F0480F29
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32F0480F29
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 32F0480F29
 for <buildroot@buildroot.org>; Sun, 18 May 2025 20:17:59 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-74264d1832eso4904439b3a.0
 for <buildroot@buildroot.org>; Sun, 18 May 2025 13:17:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747599478; x=1748204278;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y158P3vu5tzDQAn2sn8YPHCJoufE0xwcJaIDquUDOcc=;
 b=avo4TZvNcR00hB+VC6VpunYGyGUp5vs3/leCqtiPvt4KnMCMlMlezvGLkRxmwgE3YL
 lZOfgPa5sPOYSzHdYpCyLZRnqbrObN8aaUPK/R4Gspnw+mKyt8Y6rnDn4kpFeulbC1bA
 ZVNAb3fiiPA85Odn5Ksm8Y7Hwzub88YlRvtUBotd9KAbiQbbylzMZ4sEVshdNPCFtiW5
 SgtnamdEZLZAoH2/bTQF3/Ns/hF8LC3z67LTfI+t4bytEpBBxHJEHF845juKgEnepAyy
 HMgEMIUKSUWZl6SLa+Fy2PVr0RQgXo272HQTnfFcxFAqjfnepjon6M+HH8NKWtbQsGZo
 m2cg==
X-Gm-Message-State: AOJu0Yyt6+JFiHRFY7qkXq5ow5IbvXZeO0Z9cOOAERbGZsuDE9rFPiSS
 I+/PYK/5jahkE2ZjUxLbc9s1JHNoLyRoj6zVL4cyBEJpR4pHVZdFHO4YrFeaChtn
X-Gm-Gg: ASbGnctqscjTN7VDYxGHfjOjZcRNPPQjjJIqSEQTe0FgoA0l8iuCJIj948WjDTnBbKO
 3RFrlLTvrPpMRsCdAfFQz/vmv6nIo7Bg0RZyu+zXk1P4roLnFCXVyXShNUqYZhkJjIWOu8Byl/U
 JAFcOJT5tfjIK7YJrNI8tUttCtRoKBEpzs4qkIkcpyjuDyeopg5BN9wYD1FR/0gHACaQcBowQU2
 /vku/UuVu3XZ8zmI2B9hc+rf17wOue6ilrvYXSx4z6UygBJWDaxaMQg4UhpENZps9zaxz1gzqfF
 Y/S4kpUYTXgqQ1ftErLNBzpcR+3902KnCUGSA22IgHOAHIY9dkSlbf5lMXCjN75jx5cGmoDnvu8
 dEE8KSbsSYVMFGqzX8zECo7iU56jeEvvGsm/IFg==
X-Google-Smtp-Source: AGHT+IEK96b3kbTNhGGbUlh3V8f6ejQvz/rPpZO5AFKnuHrEFDhdASrLUMU5vYgBfjN8OcEORY64lA==
X-Received: by 2002:a05:6a00:cd3:b0:740:9d7c:8f5c with SMTP id
 d2e1a72fcca58-742a98b2e93mr12924258b3a.18.1747599477914; 
 Sun, 18 May 2025 13:17:57 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a970c86asm5027809b3a.57.2025.05.18.13.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 13:17:57 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Cc: Kadambini Nema <kadambini.nema@gmail.com>
Date: Sun, 18 May 2025 13:17:54 -0700
Message-Id: <20250518201754.149656-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747599478; x=1748204278; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y158P3vu5tzDQAn2sn8YPHCJoufE0xwcJaIDquUDOcc=;
 b=ABg9p8IhiGex9wBvy0Uyl90k5IR3H/g+hxWRQEyhLi7kD4nSflVfaOm6+tDZ6JMeBQ
 eeCXwDAj1jM+mQoPzF2WlvbwnrhS4oJ9f1h0QKOzAMUs6eJIDuMvecwbCPwXFhHkaPxO
 /4GGpA2850unKgA1mq49Qb13WVkkzCvojwtlMHI6gkI/thl6pC4sD9Vy8WOXkINskKtQ
 6ovd3Zoe19eaqabufUERWTR5IhkujI9usswyQoAY/GTuck5KL7H1YYFXs4z2pJx8SPbv
 EkvxllZ5woucAgEFAJfKrLys6VOCfGbxVjVIsyiwfQ03SCgYZ5bR7l+UyEdnRXQerF6u
 cZ9Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ABg9p8Ih
Subject: [Buildroot] [PATCH 1/1] package/lshw: bump version to B.02.20
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

Changelog:
https://github.com/lyonel/lshw/compare/d76afbaaf40e953243da921844cddff8185324f3...B.02.20

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/lshw/lshw.hash | 2 +-
 package/lshw/lshw.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lshw/lshw.hash b/package/lshw/lshw.hash
index 5626d7131e..40f150778c 100644
--- a/package/lshw/lshw.hash
+++ b/package/lshw/lshw.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c62c89d4b3305d897bd644524bbc816c1793c41c9fea10381b75f9d5b074e056  lshw-d76afbaaf40e953243da921844cddff8185324f3.tar.gz
+sha256  6b8346a89fb0f0f1798e66f6a707a881d38b9b3a67256b30fc4628dac09f291a  lshw-02.20.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/lshw/lshw.mk b/package/lshw/lshw.mk
index 86c8f356cc..70fa2aef27 100644
--- a/package/lshw/lshw.mk
+++ b/package/lshw/lshw.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LSHW_VERSION = d76afbaaf40e953243da921844cddff8185324f3
-LSHW_SITE = $(call github,lyonel,lshw,$(LSHW_VERSION))
+LSHW_VERSION = 02.20
+LSHW_SITE = $(call github,lyonel,lshw,B.$(LSHW_VERSION))
 LSHW_LICENSE = GPL-2.0
 LSHW_LICENSE_FILES = COPYING
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
