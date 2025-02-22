Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4958EC021B2
	for <buildroot@archiver.kernel.org>; Sat, 22 Feb 2025 08:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A89C5408E9;
	Sat, 22 Feb 2025 08:03:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 92Hb11gdIBiF; Sat, 22 Feb 2025 08:03:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8431D40B51
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8431D40B51;
	Sat, 22 Feb 2025 08:03:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2034D6B
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 08:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F35E80F87
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 08:03:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WOiimRHfu7cz for <buildroot@buildroot.org>;
 Sat, 22 Feb 2025 08:03:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0D6F880CD1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D6F880CD1
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D6F880CD1
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 08:03:00 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-e589c258663so3216500276.1
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 00:03:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740211379; x=1740816179;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LS5EZPsYvNtvNV00V0PgC6xBjZbd6tMrWsgYI3cv87I=;
 b=c0GQz6kcvIxof7uuNbE0kwsRlTcNNl4OuiUJrlP4zUs+O1jtg8IqPvpVYwXbeBn7Vb
 fbQjkJ2AqS0V1PcFeucEW1M7bLrY8GiYAHjk4m1ll6ku1WPB2JSIqwKKclIKJsfjokkB
 IV6SoM6fwNuy7EU8Dtu82VDSc1+dPNomQRKRCpgs0a+IhvEyL08PvzFwQdrUkNUGDfcn
 mtLsk+ASgkAHo6FXC6earIaRfq1I11qwD0mSPqmcQHC9zx2sw6khCzAqxaY6bYVuSC9Q
 fwechA18M3nBaF7m27jAUrVRFVAjCGJPadC26KLM3qH+Evjdaj8lzlxDg4af7THFJtMz
 VWKw==
X-Gm-Message-State: AOJu0YzWWPcVJwnFCxmOobwgUoGOuS7Kep9Dn010gfmV0OrN6UDcyNC9
 5KN7ZsUu1MA3iYNEds1JIbh3swvkX22igsc4BuXHXw38ZnsBBWcFv+C7kQ==
X-Gm-Gg: ASbGncuhiojiGTEn9vq/2vGNb3wc/iKnIFQM9tp5lDcBNTyCySSFFyKESz8BBBOUXc5
 os5o+vrjFTWJwqyH0mYNRlqeC0C5VDJih9INC2JhrA/IW452U7kpWrk5s5yLzv0MXqN2pY2M/hK
 2GelKknaaNAIq811VNONvm4tlQzaIw8Xqr7jIStjc4KViHQop6p0zR9R5d9kPCfhcDz+nyXcxja
 /Aty00NteaGNSTHrnHXpQCaEzHKkLBcxYc4lrY+CuUhnHREsHzpXTG+YcPN9/P4EMZJhLgl8jU0
 02virWDkgJnIG0FpZYRlan4=
X-Google-Smtp-Source: AGHT+IE7jnFBtGV83ok/SSsKCZ6sZZf8VVqSPkLYvwP0JSpxarGAXy27mFMWLLAtvYbeEHzO7m0wOA==
X-Received: by 2002:a05:6902:1149:b0:e58:ac80:3492 with SMTP id
 3f1490d57ef6-e5e245b9ccemr4638189276.9.1740211378913; 
 Sat, 22 Feb 2025 00:02:58 -0800 (PST)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e5dae0da292sm5172938276.42.2025.02.22.00.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Feb 2025 00:02:57 -0800 (PST)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
	Maxim Kochetkov <fido_max@inbox.ru>
Date: Sat, 22 Feb 2025 16:02:45 +0800
Message-ID: <20250222080249.2134474-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740211379; x=1740816179; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LS5EZPsYvNtvNV00V0PgC6xBjZbd6tMrWsgYI3cv87I=;
 b=YRhhgzviYDTLN1nC51ls3wvVFpS6C9CJpQG/9H6QPG3d713uvcIkjOC22tDNhWy6Gl
 bDuiTl9Vl9WG8RC9Rx6JddTqEYJ3kjblgqwBMPNIR6a+DW7ASDsuPZxX7mhYTsfXi2SO
 qzqtrGivQlKdf8TYipjT9VyXjQHCpAJcayJNAf19qj1elnlItcA3/z/Cd1794KcQRwHo
 cBR28mXxLD1uLbfsG+tn+VIUmvp2r25QCYfc+GYgBaNvnYg/F6o5RqV+/+73P1axi9rh
 KwTDrMDII724SjJwql3DOn8oZes4Rywxp3EtVQ1iODoP4p8QjDLV9Sje+8ziv5lIgX8x
 iQmA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YRhhgzvi
Subject: [Buildroot] [PATCH] package/timescaledb: bump version to 2.18.2
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

Release notes: https://github.com/timescale/timescaledb/blob/2.18.2/CHANGELOG.md

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index 7c770618b2..95dedc0d92 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f293fc54bc76d06c5955ae68e2e8124331bee80aee8b499047afae01b10513ce  timescaledb-2.18.1.tar.gz
+sha256  30f4ddf5bd71e4e30706f6715aa52109b4672c611e5948d865a2b43471032a92  timescaledb-2.18.2.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index c1f65d5f3a..fdfe9c0539 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.18.1
+TIMESCALEDB_VERSION = 2.18.2
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
