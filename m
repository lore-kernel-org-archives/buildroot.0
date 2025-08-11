Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58CA1CA0ED1
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 15:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A65641564;
	Mon, 11 Aug 2025 15:33:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id goMXMuliiQjJ; Mon, 11 Aug 2025 15:33:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70740414EC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70740414EC;
	Mon, 11 Aug 2025 15:33:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B3E3154
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 15:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7200483DDC
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 15:33:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OzJUZiLIxfGd for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 15:33:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2F7D683E7E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F7D683E7E
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F7D683E7E
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 15:33:01 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-61557997574so6373633a12.3
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 08:33:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754926379; x=1755531179;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KvtXReHfzJckcY2RpHLrNnkJU7V6N2qHqWofI3zOybo=;
 b=S8kOTApQgWvdfMLpKxomtf8RVxI3zUefJc3Ch9mC/yXJmALvC6Omn1R2J/3sN9tVdx
 MHi39D5FvSxgO3zKTuDNPvoNuMPoOk3xN5wUEKYb6gCjaDOHexO5az6IGoHc0bszTzo8
 /KbEoKkXfg6ayBiSZCoI1FOtRaFImlVkGHgX+4QoFubRn9R3WN0D1RbB1fQS2jlAiBC5
 RB2CXDp5JIvqVsXFDfc5kFOWKoqONtNDnHwFdfAG2+eW/FdOTS/Lx3J6J+devi2itqX8
 S+XdTybAxt73owst8x7ewYckZr2ww4QOtv0BitwN4y16PTK9Ne6hJAAhdbStDUqMhzfY
 /RWA==
X-Gm-Message-State: AOJu0YwG0G+MuCJLm/y1xhF/WnNxlJ9llMD7XWgL3+QUtvQjKvgiQAEC
 IFV/cdh7Ca0tiLs7iOi8TNUKLOtu6dwsTz9XLJpcrM4SzJkjPHolcRdtmtB9ApClwBLZaMeXY3B
 MT/gbNEs=
X-Gm-Gg: ASbGncvXqdc04YoayX18qP+krYd4+wwr73gK3dP1ZBNaAH9NWevVGMs7OmhTCEDKvAm
 TiNXKVJMFO0IliaMijk0kLaZlNyoagsiqv/YbtjSpPlb5I3P2zROWdZHvHJ6j45Xg4ag1Z4un9K
 VfXpR0tJHyWTYrSFhELvtlaA7B5zbpzq1eVHe7IxPGb+oUEKIPwxb1GcuneIepw/+jjE+axvuZV
 VIXpFRskz5sluE4BIFp3K4GuZstwIpWukhEEgeUmfeU1riiGgpDvZ/OoOMqFvKCo2X8n/6D8DqS
 CSL9+CrGUyTU9E0SoU55We9t3r54Lha3wBQnBQUD5q0EksCOTR0Dd2FJkuXkCgnLx2ToFujT28H
 wRuQXK/fjXr5L9YfDYA29rGbJftz19uUtblvcVBZekF2w9i4aPs1Ya0NuXEy6jUGyxtSTWRZLBB
 KDFeZuQjzz079a
X-Google-Smtp-Source: AGHT+IHI5bxfvxa5wmRccHqpNTf4wTsnwXh0pseO0Wr25VSvhjxmqXdGKmr7N4VWwMnH+ggo2SZi9g==
X-Received: by 2002:a17:907:7293:b0:ae0:da2f:dcf3 with SMTP id
 a640c23a62f3a-af9c6518ca2mr1130195466b.59.1754926379000; 
 Mon, 11 Aug 2025 08:32:59 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.fritz.box
 ([2001:871:248:2b31:46fd:61f4:e6d1:817a])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a3cecsm2039429566b.53.2025.08.11.08.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 08:32:58 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Mon, 11 Aug 2025 17:32:56 +0200
Message-ID: <20250811153256.34170-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1754926379; x=1755531179;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KvtXReHfzJckcY2RpHLrNnkJU7V6N2qHqWofI3zOybo=;
 b=R12OTA0ew2p/hvM3oLZIO60BT8nUfrquL6gyPUfM8hIXcNr7TACOnpd6pwO5PJs/To
 +B1GutwWf3VjUkC7eo9+4+tQpNGEZjwwjxaT2casEaIjzpAmpMgcEylv/osYHSCqIC2B
 bxKxGPlhc1im2rSoW5+r3pqKMca4K4qE+JXAI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=R12OTA0e
Subject: [Buildroot] [PATCH 1/1] package/uuu: bump to version 1.5.220
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
https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.220

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/uuu/uuu.hash | 2 +-
 package/uuu/uuu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
index a56baaaef49b..4ad1783b89ab 100644
--- a/package/uuu/uuu.hash
+++ b/package/uuu/uuu.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  5940b1882628531b5786668552207576a5e27b7b890d67def2e22a760ebd5d91  uuu_source-uuu_1.5.219.tar.gz
+sha256  f604de5aeb687b4523768d998f6cc4a5dd295d227107365d32b5032a82be81e6  uuu_source-uuu_1.5.220.tar.gz
 sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index 18438963adf5..e88f2715e67f 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UUU_VERSION = 1.5.219
+UUU_VERSION = 1.5.220
 UUU_SOURCE = uuu_source-uuu_$(UUU_VERSION).tar.gz
 UUU_SITE = https://github.com/nxp-imx/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
