Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093B5C54E58
	for <buildroot@archiver.kernel.org>; Thu, 21 Mar 2024 21:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8BD7815CE;
	Thu, 21 Mar 2024 21:12:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uAg0GovVAKPB; Thu, 21 Mar 2024 21:12:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E362C822EC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E362C822EC;
	Thu, 21 Mar 2024 21:12:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B46EC1BF39F
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 21:12:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC8F740329
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 21:12:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KLoyTdNNMbJn for <buildroot@lists.busybox.net>;
 Thu, 21 Mar 2024 21:12:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3DCD84030E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DCD84030E
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3DCD84030E
 for <buildroot@buildroot.org>; Thu, 21 Mar 2024 21:12:51 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-33e285a33bdso705890f8f.2
 for <buildroot@buildroot.org>; Thu, 21 Mar 2024 14:12:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711055568; x=1711660368;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RmM5ZKyHtxUipwBgaPRtVx5pbvS9p0ws9c3NCu3Yj9I=;
 b=n4dmdAo4B81LF3kYxwMhVqh1hDJzSRmfdxx2AsyrNORS3DWhJL7NwWdjni/8XkDXIS
 AOSczdq5HkiYmVaRjP5JLwMJYaxDljKMqbJ2TLQVYHpkwza3X+DE3MjB2WAf9Vdbuqf8
 BebdnFnDgS0kJCDoMW2sJDhZlx4V2SoX7iwQTOGdZfhsfeOtihn9EJbrQka1l+TjIjq1
 4/VAcYo/DaXbp6MvfU05ODOMpjOvrUsRSb+kcFk8iwm9La+K4g3CoAL+eATWl3+fCMjV
 NlIR7yTYN90iIHfo7m/TvR+3i1Y4ZHLma3J3IMxrt0GeLSBGyUgSUXr7kbTfzjqJeoLV
 VimA==
X-Gm-Message-State: AOJu0YyAJ4QNCMSCWxgEmfjOHMZaxxX8BnMEb7XfVqUSXXMyE7lKjYif
 HW6CcHVfTMeZSlkHIoUG0Ml16z87u9wq0KTKcbhIPy6DNZcb8Nw3vLqPWfRA
X-Google-Smtp-Source: AGHT+IEFc2tkPferbKa8xeMKLYiE50Cv4q1lIY3wsSww0UB71pvts+FtLxmEpqgdyh00cvnBGpc/4A==
X-Received: by 2002:a5d:6d8f:0:b0:33e:7a71:1a31 with SMTP id
 l15-20020a5d6d8f000000b0033e7a711a31mr221885wrs.6.1711055568376; 
 Thu, 21 Mar 2024 14:12:48 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 ba21-20020a0560001c1500b00341b3f13cb8sm284794wrb.87.2024.03.21.14.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Mar 2024 14:12:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 21 Mar 2024 22:12:45 +0100
Message-ID: <20240321211245.508853-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711055568; x=1711660368; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RmM5ZKyHtxUipwBgaPRtVx5pbvS9p0ws9c3NCu3Yj9I=;
 b=eYjBF4/wrpY2egA/XpGXSgLgCg8OwoTmpdZlwhxGvKewqU/GIaZ+zwOfQjeYM3tibI
 bq4Qn69JuclbYD2rmsqWVQ8hfG08h0gv27WZDw7C0dnDpS5la1yOYnlERji8gDx0sdin
 4bkdBETJo8AWpuCq0tU3znelrxvF/bAflNUWppYMqoZOil+bIwfetvw2xR+QMHxP7K0/
 b/hOQfBcqEq9m6CiW8wWO1xPTUxy08KdpPuuCiKFposta8RaRUI8U1Sz/nqQmCKnBcHL
 /Bumu35Ncosby9VAntwiV+1ctqV+Le2iRniQ7+ZRlk8gXScFeYqVc0gMYDisjZzS1aoa
 h9aQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eYjBF4/w
Subject: [Buildroot] [PATCH 1/1] package/containerd: fix btrfs handling
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
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

btrfs handling doesn't depend on btrfs-progs but on kernel >= 4.12 since
bump to version 1.7.7 in commit 79e01ef9506a6cdc4836912607dc594ae7b1999d
and
https://github.com/containerd/containerd/commit/024a748c092cbddde0918f2e93a646ce50116e11
resulting in the following build failure:

In file included from vendor/github.com/containerd/btrfs/v2/btrfs.go:21:0:
./btrfs.h:19:2: error: #error "Headers from kernel >= 4.12 are required on compilation time (not on run time)"
 #error "Headers from kernel >= 4.12 are required on compilation time (not on run time)"
  ^~~~~
In file included from vendor/github.com/containerd/btrfs/v2/btrfs.go:21:0:
./btrfs.h:22:10: fatal error: linux/btrfs_tree.h: No such file or directory
 #include <linux/btrfs_tree.h>
          ^~~~~~~~~~~~~~~~~~~~

Fixes: 79e01ef9506a6cdc4836912607dc594ae7b1999d
 - http://autobuild.buildroot.org/results/d6afeef47daae1783dcce3e2b6a0a16e3e5d5fbd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/containerd/Config.in     | 7 ++++---
 package/containerd/containerd.mk | 4 +---
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/containerd/Config.in b/package/containerd/Config.in
index 12a53bc111..2dd04b109c 100644
--- a/package/containerd/Config.in
+++ b/package/containerd/Config.in
@@ -20,12 +20,13 @@ if BR2_PACKAGE_CONTAINERD
 
 config BR2_PACKAGE_CONTAINERD_DRIVER_BTRFS
 	bool "btrfs snapshot driver"
-	depends on BR2_USE_MMU # btrfs-progs
-	depends on BR2_TOOLCHAIN_HAS_THREADS # btrfs-progs
-	select BR2_PACKAGE_BTRFS_PROGS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
 	help
 	  Build the btrfs snapshot driver for containerd.
 
+comment "brtfs snapshot driver needs headers >= 4.12"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
+
 config BR2_PACKAGE_CONTAINERD_DRIVER_DEVMAPPER
 	bool "devmapper snapshot driver"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index 50c2965b87..9bf51c93ae 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -35,9 +35,7 @@ CONTAINERD_DEPENDENCIES += libseccomp host-pkgconf
 CONTAINERD_TAGS += seccomp
 endif
 
-ifeq ($(BR2_PACKAGE_CONTAINERD_DRIVER_BTRFS),y)
-CONTAINERD_DEPENDENCIES += btrfs-progs
-else
+ifneq ($(BR2_PACKAGE_CONTAINERD_DRIVER_BTRFS),y)
 CONTAINERD_TAGS += no_btrfs
 endif
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
