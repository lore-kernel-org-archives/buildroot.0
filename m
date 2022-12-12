Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2A8C4167B
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 17:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B58A381911;
	Mon, 12 Dec 2022 17:27:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B58A381911
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0rVzM67nv7gF; Mon, 12 Dec 2022 17:27:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA5C08190B;
	Mon, 12 Dec 2022 17:27:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA5C08190B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 87D581BF2AB
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 17:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6307740165
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 17:27:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6307740165
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L9xxKg23ajhQ for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 17:27:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10E6940101
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 10E6940101
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 17:27:33 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id h16so3904696wrz.12
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 09:27:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3jeBjYWbowalSZVBCUZRXY7rrl1PKS2FHMUIdnu8vsk=;
 b=HJ3zSyIXNghuJGusaKSM3J/BKWADI/blaszyBSUK4dE/fsYar3CrDn8SbjdsbSpJ1I
 w9iks92YTFz3Nr7t32DBPFJO68BbQAvcnG8j2s7r1OTd56/l+fmFmL2EaFOkSPlmpxqa
 H2LTUriEbead3hNQPZubwA3iLHmr9zLz+3lnTEzDC/mG4koo6htaKNwKaE4OI+5Pnr4O
 sJIX6USBUpj2yPW4b/tQfX4HAgtD3YEyUYJe+qbb+2J6syF/gyRza0xjDejBa3n7mMCb
 DpJLN8pDwXo8pe9debHFHg2JAYSXwjbeY8DukNpuB9cMFuiCyC5ucVtqWeazCNLSWhBT
 NUMQ==
X-Gm-Message-State: ANoB5plpW4x+A0ZKwvVkywOMsu7A6ZLLCA1ILV5HsfuUriEIBZmWX7dm
 2wLdTiSFq36nc4lT2YNZH3sr1Xn8lko=
X-Google-Smtp-Source: AA0mqf5D7S/ynR7LFXAMg1KN7Pc5FGNFCPt/Dgy8AqHkKtqwJQ1uOa2ibLlVqdAxRBjhRotMpCWGcA==
X-Received: by 2002:a5d:4090:0:b0:24d:5829:4e59 with SMTP id
 o16-20020a5d4090000000b0024d58294e59mr6199931wrp.58.1670866052045; 
 Mon, 12 Dec 2022 09:27:32 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 p12-20020a056000018c00b002420a2cdc96sm9529634wrx.70.2022.12.12.09.27.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 09:27:31 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 12 Dec 2022 18:27:24 +0100
Message-Id: <20221212172724.4364-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221212172724.4364-1-fontaine.fabrice@gmail.com>
References: <20221212172724.4364-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3jeBjYWbowalSZVBCUZRXY7rrl1PKS2FHMUIdnu8vsk=;
 b=T+jeH1xBR5A8qe3KU5fjSRhCBTTdI/zdEO+rg0j9V8KBiED/XWm8OpEsrSbYQkkN8P
 PBmqX5tNkIt893B73BEOLVvp3INe70kJKGfEPxO/+08KvG48IRgKm5khyK8ENPSu9vyJ
 HgQFowhJo7y7rolgkqGB7FrWm8XhiTy9CRtB3LgDGEqEBwph81l0Treg//LQCWVGNmLM
 LjaVSA37PXfDFQ661nvHyrO+5tldVqqJAYP8ZFtrezmKmUGMtVgG7AmcwNx5c1vToS03
 nDwGgkHkOfQ+ygxm66bUzG6cQXk2wvNTLRGUKdVAayKJ2BjoHz75vQT4t01HdMDnQTcI
 xCNQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=T+jeH1xB
Subject: [Buildroot] [PATCH 2/2] packaeg/libmbim: fix license files
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Aleksander Morgado <aleksander@aleksander.es>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit i57bea338e95e49bf1f2405908462686306044825 forgot to update
license files:
https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/commit/bb3091e2c8d44caccfb868505a730a4ac5a48b44

Fixes:
 - http://autobuild.buildroot.org/results/06cb9426d097657b669b7970994584592bac9868

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmbim/libmbim.hash | 4 ++--
 package/libmbim/libmbim.mk   | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libmbim/libmbim.hash b/package/libmbim/libmbim.hash
index 2e2b46fcdb..8e7633cb94 100644
--- a/package/libmbim/libmbim.hash
+++ b/package/libmbim/libmbim.hash
@@ -1,4 +1,4 @@
 # Locally computed
 sha256  cf74682c56f4c34ca4aee86de3b8c425a89fc2c0782052815295faf6a8e0a9fb  libmbim-1.28.2.tar.gz
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-or-later.txt
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSES/LGPL-2.1-or-later.txt
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index e728cf58f9..59f55a57bc 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -7,7 +7,8 @@
 LIBMBIM_VERSION = 1.28.2
 LIBMBIM_SITE = https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/archive/$(LIBMBIM_VERSION)
 LIBMBIM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (programs)
-LIBMBIM_LICENSE_FILES = COPYING COPYING.LIB
+LIBMBIM_LICENSE_FILES = \
+	LICENSES/GPL-2.0-or-later.txt LICENSES/LGPL-2.1-or-later.txt
 LIBMBIM_CPE_ID_VENDOR = freedesktop
 LIBMBIM_INSTALL_STAGING = YES
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
