Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E565C3DA6E
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 17:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD2CD8210F;
	Wed,  3 Jan 2024 17:42:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD2CD8210F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JqptxYHHJpew; Wed,  3 Jan 2024 17:42:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BFDC8208E;
	Wed,  3 Jan 2024 17:42:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BFDC8208E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 20D5E1BF3A4
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 17:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0529B8208E
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 17:42:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0529B8208E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D7_oDIQ8pOjg for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 17:42:47 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C4CC58204E
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 17:42:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4CC58204E
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40d5ac76667so55729245e9.1
 for <buildroot@buildroot.org>; Wed, 03 Jan 2024 09:42:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704303764; x=1704908564;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qJc7hTxEa5HDMqrg2ezLfkic1cOTHdFKaAhXg6VVrHo=;
 b=SktZwHWeaxqBrGnp7Vhr1y3znxWY6OkmBAX9Oi51FiKPXWstdYvEq/pTsIdgAQVaF4
 43gwZWPhoJM62DlL0QyoYXQZ9xapQVrunZiApmmtYAjg2zqseNU+ofD9SBtyPSaeK6f5
 jJNiiywPDV9VwvFANf9XKPScmiV0B5ppWpZY1A37d2EUN/jukK7lnDmE8XDgy1miNjjO
 JeJgK0i4CNwCOHI5MTSmkulixmVWdIm/D3W5UxZrk7xRVSdUccomJz9Ldjoe1nrxpLOH
 b5DGHE3zBxJPgPt4iT30JZmd3syy0578vLW2a/niS/t1Ylk4Ba+GzhwbjakX8eJJv3+D
 2zlQ==
X-Gm-Message-State: AOJu0Yz2LHkpNx0yaAdmrFy/nnY8zde2oYLF+pXSm/wXpTjyaYjwcORv
 6Nv1hXKNEwFM7d/7XYat6fBYXYRO8zA=
X-Google-Smtp-Source: AGHT+IGF/pbM0lNAt7g9bOc92s+UDbcFvr7klIe4KnLHujG3cZlb0J7NVeqKaPIxqWB/dxXyzPZcjQ==
X-Received: by 2002:a05:600c:4e43:b0:40d:8fd1:6111 with SMTP id
 e3-20020a05600c4e4300b0040d8fd16111mr943411wmq.116.1704303763869; 
 Wed, 03 Jan 2024 09:42:43 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m1-20020a05600c4f4100b0040d5b849f38sm3025915wmq.0.2024.01.03.09.42.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 09:42:43 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  3 Jan 2024 18:42:38 +0100
Message-ID: <20240103174238.854675-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704303764; x=1704908564; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qJc7hTxEa5HDMqrg2ezLfkic1cOTHdFKaAhXg6VVrHo=;
 b=M5Gw1Y0WNMvyYc7eMkOerqUt1eIkBf0/VQevMRsnaPjmgvUCOtIQbBzhapLM/W1cSX
 SShmXHhva9nYq3cm09d2bP46Wo63ZZy/HeQSXzQNT77DakkTMP3lThGM3F0syjZj3xh0
 CBeFPrhdadg6nA70Zg0PJleUNtOAdid1LIqQm8QExZLfyh6mSOX1GKffsS78OWb2g39f
 wMXUO5XqUfqUAlFZBBx79zKlvzH+VFaH68kN+nsWp7Pi6OO/j2t174n7KWdoMcc+bIJP
 QHWoBHzuxnYcZ2zrMiyde3YwxvYw7t4AJLYkJb2MVEdVWktxV1k1YM3Y8TGHvvZ8uStR
 J8cw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=M5Gw1Y0W
Subject: [Buildroot] [PATCH 1/1] package/vnstat: bump to version 2.11
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
Cc: Rodrigo Rebello <rprebello@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/vergoh/vnstat/releases/tag/v2.11

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vnstat/vnstat.hash | 2 +-
 package/vnstat/vnstat.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vnstat/vnstat.hash b/package/vnstat/vnstat.hash
index bad4325d90..87d2a6d687 100644
--- a/package/vnstat/vnstat.hash
+++ b/package/vnstat/vnstat.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a9c61744e5cd8c366e2db4d282badc74021ddb614bd65b41240937997e457d25  vnstat-2.10.tar.gz
+sha256  babc3f1583cc40e4e8ffb2f53296d93d308cb5a5043e85054f6eaf7b4ae57856  vnstat-2.11.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/vnstat/vnstat.mk b/package/vnstat/vnstat.mk
index 3b2951b8c9..665c0feaf3 100644
--- a/package/vnstat/vnstat.mk
+++ b/package/vnstat/vnstat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VNSTAT_VERSION = 2.10
+VNSTAT_VERSION = 2.11
 VNSTAT_SITE = http://humdi.net/vnstat
 VNSTAT_LICENSE = GPL-2.0
 VNSTAT_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
