Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0E5C433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Mar 2022 18:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF12E81826;
	Mon, 14 Mar 2022 18:30:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UHrtZce5hi-J; Mon, 14 Mar 2022 18:30:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05336817A7;
	Mon, 14 Mar 2022 18:30:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D91191BF31B
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 18:30:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2B7640157
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 18:30:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3gkLqTVTFOX8 for <buildroot@lists.busybox.net>;
 Mon, 14 Mar 2022 18:30:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD3CB400F2
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 18:30:17 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id e22so19361808ioe.11
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 11:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6Ki+wA67SZCJbioGr7l8JSmNR3iNyiX9EK6rJWY50+E=;
 b=HJlb8CAfa3JzWHrVqD1Xk+UlMu7GklJs1JxhcoWthSsDQBLd8rOPyd0o9tJy42IYIS
 2cXBAyd7xChwtUCVh66kjiAEkn3A8YJz0LedaYUOJQPq8vT7HPBmh3gJRAuAIrAVJFNd
 2wbEQxEAnxLPGKRhK1q1tGpc890htrOAbE6oohUfj1lNzBbeiyrLZv8Ei7EWSFVHKR6H
 cEuH36COjTT06S5KTZoGALtNfVi7phlwVkKFH1p1qhb85NmbCiYUKeSEjmiFItRTZv6z
 NoQ6LSHrkzKMXFDD9U+H2rJYR8ZpWw3NDCefSAKqa2+ivc3fng9aZdcIhQFfzbDE2ilH
 v2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6Ki+wA67SZCJbioGr7l8JSmNR3iNyiX9EK6rJWY50+E=;
 b=H8RBXtKJyErbNwqJLbQbq8KQ5F1TSdUjX/FKBoQTvmWcRcPnY16iIwBhloi5kQuyi0
 a+xf0/kJYkukJ8RLO0iwRElEwiN23Wg5fFp6PCfR+ddxcPyvNHZe4WVf+F5YqnJaGUmu
 ctJh6kpGj2M2ig7EJ3FBQFqI13yjc4WKNpVOEzgA9/J/DfMhRh9fkD8HY0tNe8yLflMG
 mCTffDT8UT7g16aV6cMbeRJF4Vv2TB65SAr1gyy6SMiqxkkFyBStR/oZ8BZ/jbli/CXz
 aF19/Nr4bPgYCKQGLKPmwKqYMS8SEr6gUSo5lRtAsQJrSuiXhBd6zcBp5Vv89LcybgkI
 fpXQ==
X-Gm-Message-State: AOAM530tHAPdhtMcBTIpwAiulczzY6qx2n7LsTKZg4ie0q2TZ3bZAttn
 l4M53y4m2xjJ/lYBm+gfZyOVSXo5qBs=
X-Google-Smtp-Source: ABdhPJzsHQRn84N1sVPaFChzlJALbAYH/JTOgAxmhtuLdf5oRarwllcASuJQi25ZPitUhWHSjq5alg==
X-Received: by 2002:a02:cadb:0:b0:317:b785:8ab2 with SMTP id
 f27-20020a02cadb000000b00317b7858ab2mr21994146jap.108.1647282616629; 
 Mon, 14 Mar 2022 11:30:16 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 q9-20020a5edb09000000b00645c7a00cbbsm8782534iop.20.2022.03.14.11.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 11:30:15 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 14 Mar 2022 12:30:14 -0600
Message-Id: <20220314183014.2173419-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/meson: bump to version 0.61.3
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index c2d53519d4..d909709b24 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.61.1/meson-0.61.1.tar.gz.asc
-sha256  feb2cefb325b437dbf36146df7c6b87688ddff0b0205caa31dc64055c6da410c  meson-0.61.1.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.61.3/meson-0.61.3.tar.gz.asc
+sha256  9c884434469471f3fe0cbbceb9b9ea0c8047f19e792940e1df6595741aae251b  meson-0.61.3.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 125488dd46..4615e839fe 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.61.1
+MESON_VERSION = 0.61.3
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
