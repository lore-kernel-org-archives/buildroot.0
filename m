Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2DECAC5AE
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 00:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 742E683DD8;
	Thu, 25 Sep 2025 00:53:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p-116KOHtPEv; Thu, 25 Sep 2025 00:53:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61C1F83DD5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61C1F83DD5;
	Thu, 25 Sep 2025 00:53:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5649D199
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 00:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CC9183DD5
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 00:53:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZxelmlrpU0qH for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 00:53:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6F9FE83DD2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F9FE83DD2
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F9FE83DD2
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 00:53:17 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-27d3540a43fso4388055ad.3
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 17:53:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758761596; x=1759366396;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6MkAOyl+ZOZWGrriMQiSUkTyZ21yYEZBjo6zB4WJztI=;
 b=R1Vvqd9fcmvl/Hb2zJdUpcfMnOxE6+tBPe8YIYe/3UcFJrJWVFv4XenlSb8/L2BeJr
 PvYgO7iVfypQIiUmQkSe9ZcYLchkxNH4lWR+gzx0qLe2QtSx+aOL1pyRoHXnU9h84Lfk
 6Cgv7Jd9NEnSpoekqlYex3gBnOXC7WFg2LDpWnyy4cTHHI5Tkq7H8yAFsSP88a2IO/dK
 D/t3WLWZKU63r56GM4/raPfxOiCDwkhUKvoQUb3cdx2+S47DbS83IiZCJRBwzXzNr773
 4S1y8QwGB+rlbGKP/Y4mnjAD5dchROiXXvPl0+sTNh8dB2t0dsZgd+yLYJPMVeCqS1aH
 CEkQ==
X-Gm-Message-State: AOJu0YzCQETumGmlM8OfTfIM0mNeLqkb8oRq7FAq6jv2jRo9gKPJKvfd
 Rb9PqfPbVcWHXe/CeEX9WPQBpyDmtQ4P42K/1SL/5A3Weq1gFN9FAwSP4jeFMA==
X-Gm-Gg: ASbGncvfbPZLtQls6iRsDwMhuDOOmNBixCimOqyr6g3sRlI4hAXWwn106Z1aMH+sU2g
 YDvjHllmJgc9GFHLidcGEW5U9Et70TVagwF3DRtXoQMegm/DCd62jocP519v0bE7rj0lnb3tvud
 Tmf/vewlpyc/L2CdT5byMly2gI+hgKFv8YZv0/yLdL5SWg3QM2cg1BzTzdc74RAh7PZnWY0TroR
 hEEhkX68MUcUMwniHa9PChz15/UC4azjvQW3yZDJxgrAyA569QuhEbK3jFTH/6VlsnzgUQXY9+g
 nQb5wkTiH7MzCuA9c5lg6z4B5lPm3erKv+wsLKHLSlrLtRdBA3b3yNNWKRJEUErnBPkkvUf+Py0
 qDoY7QnBe13vjJwN+BOY=
X-Google-Smtp-Source: AGHT+IEJbwpqnTHGwkxAk7WQEgjZMYs6UPG+mlTGH/3Ko6fLsvUWJQO76KLteRj04NsX4FqRoF2zWQ==
X-Received: by 2002:a17:902:cecb:b0:269:8d85:2249 with SMTP id
 d9443c01a7336-27ed4a0b73fmr16569625ad.22.1758761595546; 
 Wed, 24 Sep 2025 17:53:15 -0700 (PDT)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed6882140sm5295785ad.70.2025.09.24.17.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 17:53:14 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
	Romain Naour <romain.naour@gmail.com>
Date: Thu, 25 Sep 2025 08:53:03 +0800
Message-ID: <20250925005304.827639-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758761596; x=1759366396; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6MkAOyl+ZOZWGrriMQiSUkTyZ21yYEZBjo6zB4WJztI=;
 b=OtSxV/7iwNut+Oah9WAVQQWx15HyJook2sESE5SNjwcWspJ/zUTRcmB+EHtHIG9DvL
 FNKkM5MpuBceXTRuQ4wcDxQRTFMbYSvp/9C6e66Ze+PgVq16rAeAMbgXob4oCPWIlzfB
 rViwZvpq+M3jOU95Xrv3tbDUlMdC68Zr8AM0SQ7JgvMBp+CO0b5CAIaOG7C683GzToo+
 kHXMH7noLCybZqQvVb0YvLlqjaR/jpux0XuUhjmrPx7gaOjZKY8fTph46GZlzpn7hKVW
 bjTLZbBp2fiOokcbQYsXpjhI6pGg4FOw37UKq0mtMrxiBQbNfK0050FglLe4+2L4skSo
 GaDQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=OtSxV/7i
Subject: [Buildroot] [PATCH] package/libiec61850: bump to version 1.6.1
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

Release notes: https://github.com/mz-automation/libiec61850/blob/v1.6.1/CHANGELOG

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/libiec61850/libiec61850.hash | 2 +-
 package/libiec61850/libiec61850.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libiec61850/libiec61850.hash b/package/libiec61850/libiec61850.hash
index 3c23682c49..2c1870b984 100644
--- a/package/libiec61850/libiec61850.hash
+++ b/package/libiec61850/libiec61850.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0dd0adc7f13215e961d22511bcb1dadfdbdaab969f11a0d975775a6ebdff8099  libiec61850-1.6.0.tar.gz
+sha256  64113483eea8aec4f18cef9f8bb3c872585b2c67566824c4373db257bcc7bf8e  libiec61850-1.6.1.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/libiec61850/libiec61850.mk b/package/libiec61850/libiec61850.mk
index 2bf98f1f3d..b29285cbe2 100644
--- a/package/libiec61850/libiec61850.mk
+++ b/package/libiec61850/libiec61850.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIEC61850_VERSION = 1.6.0
+LIBIEC61850_VERSION = 1.6.1
 LIBIEC61850_SITE = $(call github,mz-automation,libiec61850,v$(LIBIEC61850_VERSION))
 LIBIEC61850_INSTALL_STAGING = YES
 LIBIEC61850_LICENSE = GPL-3.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
