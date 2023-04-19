Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28CAAC77B78
	for <buildroot@archiver.kernel.org>; Wed, 19 Apr 2023 08:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 921E683FF9;
	Wed, 19 Apr 2023 08:31:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 921E683FF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nnARHmZxOlHx; Wed, 19 Apr 2023 08:31:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8B2583FFD;
	Wed, 19 Apr 2023 08:31:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8B2583FFD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C8CB01C4323
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 08:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE80E41E7C
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 08:31:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE80E41E7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 60vfA4ThaDUi for <buildroot@lists.busybox.net>;
 Wed, 19 Apr 2023 08:31:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2F8D40527
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D2F8D40527
 for <buildroot@buildroot.org>; Wed, 19 Apr 2023 08:31:50 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-32933a4af12so36284905ab.3
 for <buildroot@buildroot.org>; Wed, 19 Apr 2023 01:31:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681893109; x=1684485109;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T0l2DVbTwb+qi4gfeWZGqTHMMvR6vUmTqlMlInAoxGk=;
 b=A1U0+5YczkKOFxwaf56z2HeKlRpaHiZ/hbLL9JMfx9luNkATjPCsBASPJjUXTv7Xv+
 POXf5knFNOXkQH/O4eiq0uoFiT43uNcsKJCtOZb/RFri5nX324aP3mlCnjJLxnwQKxvF
 5mXGu6Wy0T2gUIvlQtlFjYmLjW4C8KHNIkpUYAZhP7eq0hk4nWzg4GdywLrs72wlKZog
 zI51bo2Wwt+ug0M44yVOitvM/WHluqB5N1wuCJttygsxYK8lrh5/cx2XXHVdgCZA9LT8
 a2D2IuP2KXhFDRn0IqRh2QiyoXVmdA2sL1rx9uH5Kodl3sVTjecKRsBUJjWNO87Pbf4V
 Nk3g==
X-Gm-Message-State: AAQBX9fZr5vbhRYoXgnjBkvv/lzde4ga8O15ar06XvhqttRY5/atw631
 8ud6lTekZufV+58Vv8iXLcwEAd9qajU=
X-Google-Smtp-Source: AKy350axe2AuGhArtZCsu0aVt5OlENPL6z2N/9sgt9umLwzYkRE5748ZkuBT5MhbaA3QLtIKkrY47g==
X-Received: by 2002:a92:6c04:0:b0:329:4a80:5a87 with SMTP id
 h4-20020a926c04000000b003294a805a87mr14665873ilc.11.1681893109684; 
 Wed, 19 Apr 2023 01:31:49 -0700 (PDT)
Received: from james-x399.localdomain (71-218-108-164.hlrn.qwest.net.
 [71.218.108.164]) by smtp.gmail.com with ESMTPSA id
 z20-20020a056638241400b0040f8a65164csm4026442jat.105.2023.04.19.01.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 01:31:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 19 Apr 2023 02:31:33 -0600
Message-Id: <20230419083144.212921-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681893109; x=1684485109;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=T0l2DVbTwb+qi4gfeWZGqTHMMvR6vUmTqlMlInAoxGk=;
 b=eASLM6Bd8xRKKt71d08On81N/1BLZCYGAOcJWQvVugJEThka+d+GGOD7guGEZfsd42
 VpKWLT8QK5HVI+gIv+VdEJIXUC1CZTMT+uSR2gGl0xHsFxCy+bvBCs/U1wxrptJTtp64
 J8y31cBsVSiXReNivYikDw/UP49nB1DV+/Ox4IFmqyMj60tjGJlsNCHGIkQUZPLT2AUG
 XY1pBcan8Rc7J9lN0EHqrtwzNlKfntIs+k0g4DTJ17Bvn5TP6OmcR9PCeUQS/80blXx3
 2PpIaSISCYU/kLbLsTqZUPvq1F5ldZ44cgOvZSlkv69Q4yW706sIiyGON0jtwl48t4qA
 dsRw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=eASLM6Bd
Subject: [Buildroot] [PATCH 01/12] package/gstreamer1: bump to version 1.22.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/gstreamer1/gstreamer1/gstreamer1.hash | 4 ++--
 package/gstreamer1/gstreamer1/gstreamer1.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
index db0ed5bede..f74832ce6a 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.hash
+++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.22.0.tar.xz.sha256sum
-sha256  78d21b5469ac93edafc6d8ceb63bc82f6cbbee94d2f866cca6b9252157ee0a09  gstreamer-1.22.0.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.22.2.tar.xz.sha256sum
+sha256  b2afe73603921c608ba48969dbb7d743776744bfe5d8059ece241137b7f88e21  gstreamer-1.22.2.tar.xz
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 09d1a10ce7..8584735129 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_VERSION = 1.22.0
+GSTREAMER1_VERSION = 1.22.2
 GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
 GSTREAMER1_SITE = https://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
