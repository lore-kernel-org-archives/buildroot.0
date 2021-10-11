Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE924C433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 07:33:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48BAB60EDF
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 07:33:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 48BAB60EDF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F270981B72;
	Mon, 11 Oct 2021 07:33:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7aPmmuBrVioe; Mon, 11 Oct 2021 07:33:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6467E81B70;
	Mon, 11 Oct 2021 07:33:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 155C61BF29D
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 07:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03D5840284
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 07:33:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tgNVMSUAsyJ2 for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 07:33:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A110740270
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 07:33:22 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id z20so63910382edc.13
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 00:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z1cI2UTuskYJX7Sdq2QX+SciiYcauGKs9kXtXvkeBu0=;
 b=AgekrwcUX/prx11O76niPq8lnVir/Oyu/Xipn3q2sdtiCD6maoi5Wh7ZtUyEUgZDF2
 Y7dCWUrQbgj9nlibTwYYxMUuGayrkSKWH2PVLqWtJ2XUj288pB3/IopOZwPXIjrJw7Oi
 bmAwqptYpCGQfoO+3RUPO/+bre4JSO2KK7K8FjDYUuU3KE3WckSPNe5WwPWOrTvJAQrl
 yNOAtHzUdoa9PPBrMaNhmWvkQCWDYq2zFavBrUKBKIAsr/pRMaP8FDsedoQIlPps7g7d
 DSrrnZrtgia7uQ2YBD2i5eiOY5Ek6zdZTT758GHMuEXQWFEMGHGfayq9av2jWuloEhMG
 qcqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z1cI2UTuskYJX7Sdq2QX+SciiYcauGKs9kXtXvkeBu0=;
 b=ctcGZ633M5+13FQNsbkzj3TR2JMCdp+KM7/lEPEWoZs31jJuR0cJWmKBqUhV1wTup8
 dE6ENApUPMjO9VBIEpfqMa/NDmLgDdwR955wMwLVSy0/DfxhQAV6O+ig4e/jx3rUvah4
 dNW86YXP9lXuwJfSz15y3iKAf1ftIb6slKmv78fMwB+YAOEridZR9Cng/wP6qIo7A6T+
 vFpdbrN96wTqz4IGDEsSQnob0uveufRnx8d17OwaoKlrmJqonY4/abTYId+3kYynf+T+
 yKdkp0ROYOSra9X465dAVPKUzTQvi4fdvyOZLyRzPwvawyUwZVoD+LzRQBqVsDUxhAEi
 W2bA==
X-Gm-Message-State: AOAM531hnanp8hXQbQJpsY2HwMUJt630ncANv/9l+hKabodFp1NwIB7C
 NWLmlj8GrUKIMsc0QD/dXa9tGJDWBqzzRA==
X-Google-Smtp-Source: ABdhPJy4CTvAz/vStybMwz59D5KlVclNPKjv420GY4ac4lR5f7/eZgeZxu7gOYJl4nJ7VOOkW/3VPQ==
X-Received: by 2002:a05:6402:26d3:: with SMTP id
 x19mr8755649edd.291.1633937600181; 
 Mon, 11 Oct 2021 00:33:20 -0700 (PDT)
Received: from smartron.home ([2a02:a03f:63d3:7700:47c:f3ae:fe47:54e6])
 by smtp.gmail.com with ESMTPSA id x22sm1002211edv.14.2021.10.11.00.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 00:33:19 -0700 (PDT)
From: Titouan Christophe <titouanchristophe@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 11 Oct 2021 09:34:16 +0200
Message-Id: <20211011073416.595365-1-titouanchristophe@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for 2021.02.x 1/1] package/redis: security bump
 to v6.0.16
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>,
 Daniel Price <daniel.price@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes CVE-2021-32672

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index d736c09489..344ca4e0a1 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  4bc295264a95bc94423c162a9eee66135a24a51eefe5f53f18fc9bde5c3a9f74  redis-6.0.15.tar.gz
+sha256  3639bbf29aca1a1670de1ab2ce224d6511c63969e7e590d3cdf8f7888184fa19  redis-6.0.16.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index f66397b216..8fac940ecf 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 6.0.15
+REDIS_VERSION = 6.0.16
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
