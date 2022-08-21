Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8466CC00140
	for <buildroot@archiver.kernel.org>; Sun, 21 Aug 2022 15:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 123EF81A5C;
	Sun, 21 Aug 2022 15:49:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 123EF81A5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SrElj-TeRcsf; Sun, 21 Aug 2022 15:49:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FAD181A46;
	Sun, 21 Aug 2022 15:49:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FAD181A46
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 21E8F1BF5AD
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 15:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F137E60B97
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 15:49:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F137E60B97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kQWJV1SJxbA3 for <buildroot@lists.busybox.net>;
 Sun, 21 Aug 2022 15:49:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8D3A60B8A
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A8D3A60B8A
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 15:49:06 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id u14so10469986wrq.9
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 08:49:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=OyxUjEOxdMoqnXdDw3vN7FvMoLgM1lMWbPnqT7ARmUo=;
 b=4CwTxkeMXXNJkSK05J+ZKMf0n9IAu5j8QBLVlLlBbJEtYeCZeJYc7LgAq3XO4m2uVB
 eaolK5r3FcukgAKiRtQ0n9pAaJ1TO2EvJu91MddeeU2xILbbanoaGB5upfjLiOhRFGR7
 nuBQRv9WnU4KGsUhDUQNRD0eBW5IYORVkzLDQheohnrt7VzFS1GuQWz0VPKYBrIR50pf
 kEqb2JNTZrJk/PtN+ZiOvEryO3L+l34PnsV7gvx2oJL5Lxjk7KzPrt15dgSHlSYFa+iD
 xqUouxvRRaEFSEVxdHOsmypFv9r7g602RrvIl2tC4iez9UoVR0UDYAuhD2L5VDyuroU/
 WfuA==
X-Gm-Message-State: ACgBeo3RseQPJc7KFzS+tZeAGCXTXX7ZBu56BCQGDcPbWF//CRT/wFMh
 fX25nFhAWrGH3iuw5UakPsfYYVhk66U=
X-Google-Smtp-Source: AA6agR6ZKtQ6YajL6dxJ519kGPuN9VwVsp1hFNg29OLNZise8pQinXZgXZ6cWMw+czKt8ZGA9p5mUQ==
X-Received: by 2002:a05:6000:782:b0:225:3e46:3dd5 with SMTP id
 bu2-20020a056000078200b002253e463dd5mr5421806wrb.103.1661096944758; 
 Sun, 21 Aug 2022 08:49:04 -0700 (PDT)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 j11-20020a5d452b000000b002255aa7fef9sm350878wra.106.2022.08.21.08.49.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Aug 2022 08:49:04 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Aug 2022 17:49:01 +0200
Message-Id: <20220821154901.327525-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=OyxUjEOxdMoqnXdDw3vN7FvMoLgM1lMWbPnqT7ARmUo=;
 b=TukZl3A4YVhvVLuVPK0LzJMPpqWVF4b/8MKhBrYfX5h+Qy9xtM8AWYoH5bSaum+Vsy
 lb+Q3KCWhgIOvCNQegod2XdwcyTpqAtL6vCayOjSPvxXRVSIULRL+Fe+wg6XVAMwv2IM
 K3OfP5bKe0R+VmY0+SfjwAiIUQ9yCSKr5lk6xGsyJC+C6hP/6JIBRZhhKxVOjpWzTmju
 dpd//Q7xdMTccsAVbQzwzPNkBrYLKStLGDkkx04JoldtOX2APdp7rBldWc8Xs3kErlG4
 md7WrU8uqSyEMp9fx/ld4jyAwsvrDnvlioITdLBFrnkaR/37DsFysRjY6NpRnCrSDjtb
 WWqw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=TukZl3A4
Subject: [Buildroot] [for-next] package/poke: bump to version 1.4
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See:
http://www.jemarch.net/poke-2.4-relnotes.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/poke/poke.hash | 2 +-
 package/poke/poke.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/poke/poke.hash b/package/poke/poke.hash
index c30713b91c..09dc4e8972 100644
--- a/package/poke/poke.hash
+++ b/package/poke/poke.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  cd528e6c1bbc540c3b629c2b4f36b784b30a026b005a38b99283422599442670  poke-2.1.tar.gz
+sha256  841e285917c6738ce982a6930e30ebeadecfb0655a79d9184f16f876a9fe6e47  poke-2.4.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  jitter/COPYING
diff --git a/package/poke/poke.mk b/package/poke/poke.mk
index 2852673548..d49e628dbf 100644
--- a/package/poke/poke.mk
+++ b/package/poke/poke.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POKE_VERSION = 2.1
+POKE_VERSION = 2.4
 POKE_SITE = $(BR2_GNU_MIRROR)/poke
 # gnulib license is a mix/mess of public-domain and various GPL and LGPL versions.
 POKE_LICENSE = GPL-3.0+, GPL-3.0+ (jitter), gnulib license (gnulib)
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
