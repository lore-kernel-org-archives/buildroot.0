Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 544A6C4167B
	for <buildroot@archiver.kernel.org>; Sun, 25 Dec 2022 22:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AED06607FE;
	Sun, 25 Dec 2022 22:48:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AED06607FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qZaYq6eYnkQ6; Sun, 25 Dec 2022 22:48:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E95ED60A6B;
	Sun, 25 Dec 2022 22:48:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E95ED60A6B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 745EB1BF381
 for <buildroot@lists.busybox.net>; Sun, 25 Dec 2022 22:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 490F240017
 for <buildroot@lists.busybox.net>; Sun, 25 Dec 2022 22:48:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 490F240017
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c6PVGcOLh7UI for <buildroot@lists.busybox.net>;
 Sun, 25 Dec 2022 22:48:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BB2F40190
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4BB2F40190
 for <buildroot@buildroot.org>; Sun, 25 Dec 2022 22:48:30 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 m8-20020a05600c3b0800b003d96f801c48so4159516wms.0
 for <buildroot@buildroot.org>; Sun, 25 Dec 2022 14:48:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gLLhAnyBoJczVmj1ZHmthsHOoWE1sELfjuesOt+u3OI=;
 b=0uzMmZD+p+hg8/7Hn60imL2hrUhzRpw6sm80G8VBMZVKBbtn/A50kv5TnOHe9KrxdX
 mNjboindOM90DJEkPFsMlWwU0p13qdWQPZYQC4on3PR5lfUu1GZQHj8QNy3MJ0Ql6mAQ
 9k8LKqUNf0s7o3ShrtNGr4T4GoRU8wE0z69jkHXjBApWgkhps5Vc8T1Rj9MYQLAFhTnr
 YTJ3KqM+x6/ptGBXhGn8QB3U7uoKCzJuo54BwK7LZ4DVOY+5n4ifyBrhB429eTpV8kSm
 ueg8AFwQN7mW4oAjgmWE2C3S7gzQwm7zq7fBscMHNGzJ5Px1lBX6zY07joPwMrDSG5rv
 vQaA==
X-Gm-Message-State: AFqh2krwYWlglv8Vu42GaHHOqRPi9STGXNty9suQmPX3FLOXaglWh6GG
 4h4wKDFXa+m0SU7AywIA98AXR2jj5yo=
X-Google-Smtp-Source: AMrXdXt8uc8Vc97Mtg9ZZKGapJ3KlwzFojYDDIl3EFeaSOyjDPh6NEjuB/tuNZYXqhVxrb1KDPNn2w==
X-Received: by 2002:a05:600c:224b:b0:3cf:ae53:b1e0 with SMTP id
 a11-20020a05600c224b00b003cfae53b1e0mr11909996wmm.9.1672008507848; 
 Sun, 25 Dec 2022 14:48:27 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 o15-20020a05600c4fcf00b003c6f3f6675bsm18197996wmq.26.2022.12.25.14.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Dec 2022 14:48:26 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 25 Dec 2022 23:48:24 +0100
Message-Id: <20221225224824.814957-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gLLhAnyBoJczVmj1ZHmthsHOoWE1sELfjuesOt+u3OI=;
 b=PRfo0l71oeZKq6KGl/lGsotWytlrQgC5xTA9zBOQjPRc053A+YLX3kXWyDWJMSbyyA
 LlbcOZdQINqsMHl2TNGwIy3G35FrVxrDFl7erqe1Y2/SZ2rDOlEeB+vtnIFoe8MHy0gC
 kSAAfWtNwxwll+pKdgPC9Km+LipHY5tpv/29BiMrNF2rFWj/B0QhlwQkUIKJqJvx74Ow
 xfeiIRm9AgVkf+APFEUBh5l5doJ/ayjVHUIRc9uhmfVU1zNeysIlG4HjPOFZ7fgvGExD
 TOKalK0zvbbVVi7x0EQHESBLbW3GPUFXFVBrRmXwWDIP4OSqTrvaqyevqiPD9yPLTYo/
 D6Rg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PRfo0l71
Subject: [Buildroot] [PATCH 1/1] package/ncurses: fix legal info
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit a38a30eb3a46570705642dc37235ddcc1471b434 forgot to update hash of
COPYING (update in year)

Fixes:
 - http://autobuild.buildroot.org/results/18ed032d1b7e0492ed90f09873cd260997c1deae

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ncurses/ncurses.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ncurses/ncurses.hash b/package/ncurses/ncurses.hash
index 1029c1ddcb..c72a2abf46 100644
--- a/package/ncurses/ncurses.hash
+++ b/package/ncurses/ncurses.hash
@@ -62,4 +62,4 @@ sha256  32dc21b671ead8b199d66111ebd3404e8cd5f8c4ca5587cfeb5c6a4913b2d103  ncurse
 sha256  8fe3bcacaea784ac7971e102a8eb8ca58c4c2c4c13c1ec33f32334600b9e4f56  ncurses-6.3-20221203.patch.gz
 
 # Locally computed
-sha256  4d1fde61868c73776a539366dccf5d5a4857e7fd7299efb1f02e07c2afe9ea87  COPYING
+sha256  63de87399e9fc8860236082b6b0520e068e9eb1fad0ebd30202aa30bb6f690ac  COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
