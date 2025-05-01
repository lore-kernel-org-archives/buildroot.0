Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC09C3ABA9
	for <buildroot@archiver.kernel.org>; Thu,  1 May 2025 07:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 856EF423D7;
	Thu,  1 May 2025 07:20:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id roqm82a_uyZw; Thu,  1 May 2025 07:20:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7077423BC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7077423BC;
	Thu,  1 May 2025 07:20:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EC893E4
 for <buildroot@buildroot.org>; Thu,  1 May 2025 07:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFDA583DCF
 for <buildroot@buildroot.org>; Thu,  1 May 2025 07:20:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V7BT8vQ0EXT1 for <buildroot@buildroot.org>;
 Thu,  1 May 2025 07:20:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 022AD83DCE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 022AD83DCE
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 022AD83DCE
 for <buildroot@buildroot.org>; Thu,  1 May 2025 07:20:04 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-af52a624283so623804a12.0
 for <buildroot@buildroot.org>; Thu, 01 May 2025 00:20:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746084004; x=1746688804;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=spi53DothdynhfMPQzpEYKYZYbtaBJ33tM6tVrTJkJs=;
 b=OhleHjrKG9Urwn5E4XoVlWp0kquhJLKkNVgzkXwpjd47F/W98KuAL6nNLpup3U+blJ
 OXxxrBu3n3dUvcZ/x7Qp/TXitf4kYjgDp984xgnEUtRZJ5NagCKYr3AhIFbl+T7Ln7v0
 winP+0gEYhwpMPBv51NJ8vNqoMxQO0bHMg2+/Tkyz0nsTBz9nM6SzOR6yC22bm23Thgy
 V6X2aZiToC4Qjtqq6Ncl/ifIpt/to8kq0H6VRTYTxDwD8sw2yebHBxebonE9utYBSu9i
 YIJlGkBX0A5ka858I4CLhgpr2aOM4RT+Ztife2OVY/YiEPtkOvl7i3sYFTJdZSZ7GFfx
 oHkg==
X-Gm-Message-State: AOJu0YxBOtGY4vL26FdxObAO1JHvQYFvgsmqhX1Mqmj3wViK99TgErMw
 Zkv0p3O4V5+GNvkH84425DpmjY3Qmo2S9ot1wzavhZcqhTnPRs0aWQfRz6PT
X-Gm-Gg: ASbGncuodL6BBNg2MGDPS3K/T790vD+gBvpsYP28IlEq1B/L5fUt9+06R4RFiWMv6RR
 0uOo2rNX7rYumNfkYBk2cyXPC2L/FJ5bAkYaKL0/LPYCf3MPr3xNWcpHFiOqCr4/6zhRLUCgnFU
 dr0s2ggcUI+D3LNLDnsgB2/EVzTqz2qYo1Inf8blVARyoMiJsffRFfUu7nFn6pmVdbhmHX8gFAa
 mHnOfco8KiPSm1kB0C0NM9iy4DZ54vHkhEsVuPSDIHj6qBqxSVsYzbspTDHC2D6VItpBErV+MPR
 +HfXdN13lbOjzbVGGWp+nmma7r7d8Sm82tSa60JYjJTd161j+VNp9Bg/Vw3EFflkwbA2MNF7i1V
 mVrodYm5KVQHA0szvHY82aeEApnY=
X-Google-Smtp-Source: AGHT+IGwS3X1UO+azDxUfS3Yd2WzAVQ5CWkIumeVYM7kcFQ4x341mYEXsHUdNi1AoaWe4y8L4O3ZMg==
X-Received: by 2002:a17:90b:57d0:b0:2fa:17e4:b1cf with SMTP id
 98e67ed59e1d1-30a4312b904mr2410375a91.2.1746084003672; 
 Thu, 01 May 2025 00:20:03 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30a47625af9sm169238a91.31.2025.05.01.00.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 May 2025 00:20:02 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Cc: Kadambini Nema <kadambini.nema@gmail.com>
Date: Thu,  1 May 2025 00:19:55 -0700
Message-Id: <20250501071955.10446-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746084004; x=1746688804; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=spi53DothdynhfMPQzpEYKYZYbtaBJ33tM6tVrTJkJs=;
 b=C/LvecFLs6DiGLWkakzbw0HtdfXqq7NQyycuaI68LUeVbQOhMmEZCdWhHxsDQgYkL0
 fNYhZQ4Lqb5ViRx3LC49n+L+TlM7ITCY5EVk+CwLd6mheUB3IHm6xfW+fL7U5sN3Ubbl
 YjhfEqrB9vU6N2hWkYHOs5QYix7+b3T2eQ1VeaoagkNw4obvnWbEHDCXodugpE+9ivCD
 PhCseQiRKVtqidKEqVJ+Wzn93UGljH7fqFl2g9RTGcXI/0qCTlPoJtlce37zoryiFrAe
 GAHcrIf7TzZAStnyA0ldYaZSa1JzL8BRM/MxxjYOKLsJ4VdhXbPfwVvwBMO0va7Om4Xf
 WLEg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=C/LvecFL
Subject: [Buildroot] [PATCH 1/1] package/mtools: bump version to 4.0.48
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

Release notes:
https://lists.gnu.org/archive/html/info-mtools/2025-02/msg00019.html

Changelog:
https://svn.savannah.gnu.org/viewvc/mtools/tags/4.0.48/NEWS?view=markup

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/mtools/mtools.hash | 2 +-
 package/mtools/mtools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mtools/mtools.hash b/package/mtools/mtools.hash
index bce1951224..44f0803b0f 100644
--- a/package/mtools/mtools.hash
+++ b/package/mtools/mtools.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  2709cd2f42d65500829b056cb0630edd515d7060b4865bad31277f0da9f9e9d5  mtools-4.0.47.tar.lz
+sha256  7d57f14a2482dc4658e4b386180793ef50f0de89ee3a9a28f0a371630baac7c4  mtools-4.0.48.tar.lz
 
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/mtools/mtools.mk b/package/mtools/mtools.mk
index 45b4b8d49b..8c7a348fea 100644
--- a/package/mtools/mtools.mk
+++ b/package/mtools/mtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MTOOLS_VERSION = 4.0.47
+MTOOLS_VERSION = 4.0.48
 MTOOLS_SOURCE = mtools-$(MTOOLS_VERSION).tar.lz
 MTOOLS_SITE = $(BR2_GNU_MIRROR)/mtools
 MTOOLS_LICENSE = GPL-3.0+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
