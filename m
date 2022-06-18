Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABACC433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Jun 2022 06:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 751C360ED8;
	Sat, 18 Jun 2022 06:06:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 751C360ED8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xFr-4C98fV3O; Sat, 18 Jun 2022 06:06:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8073760EC2;
	Sat, 18 Jun 2022 06:06:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8073760EC2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4AE4F1BF831
 for <buildroot@lists.busybox.net>; Sat, 18 Jun 2022 06:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CD7E40961
 for <buildroot@lists.busybox.net>; Sat, 18 Jun 2022 06:06:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CD7E40961
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kvQAdVH9eNFe for <buildroot@lists.busybox.net>;
 Sat, 18 Jun 2022 06:06:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C09D04089A
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C09D04089A
 for <buildroot@buildroot.org>; Sat, 18 Jun 2022 06:06:49 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id o7so12223246eja.1
 for <buildroot@buildroot.org>; Fri, 17 Jun 2022 23:06:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RNWpYSB7eYxpVHaKP7qKHl3iJDBcvZkPlMVOzOHypLo=;
 b=lYlr1b4vhRppn7T76gvAWy4kfWobJ29hI8IGhhTSI07THqCVHCTUiZ9GGj22LD4oT5
 a1P+Pwutda3ul+wXjoSTYZSaQgMPvUVNEv9ref76qdxUJYN8qrETWpq52bJzI+Z5uNqC
 lJkUDeR3uohvKTJVrpiqVn0DM4cLhWYt+jQythqhiZkAuKCVvQVsV52H6y098kFDaWOo
 DswdFopmi0CBub9PxjfZS5miebmBECBGVZlO2Grp/2rm4phevrgaqI3cxZq0K3Rmt5yA
 aQ1gkhMwhCEyrJZj1z81bTj1BP/3fvm8isJLO45Fi/q6esiHh9m1Su/RQmuDDY2tdSxO
 FyAg==
X-Gm-Message-State: AJIora9Esa+9u3mDZvPAVpL+5DAvPQSfrMcbTJJMZMKWOUAbEp7w94gE
 2lgdOeOOJxjemb74ROMXjrBfON/8dba4Sg==
X-Google-Smtp-Source: AGRyM1uIV/EZmjI2LCccL7Z2fm105lkFR1WZniANUUPiYIWJyHG5zExG1WycabDK98Wa8gbjhUIHfQ==
X-Received: by 2002:a17:906:7b82:b0:6f3:ee8d:b959 with SMTP id
 s2-20020a1709067b8200b006f3ee8db959mr12523954ejo.458.1655532407880; 
 Fri, 17 Jun 2022 23:06:47 -0700 (PDT)
Received: from localhost.localdomain (ip-109-42-114-75.web.vodafone.de.
 [109.42.114.75]) by smtp.gmail.com with ESMTPSA id
 d4-20020a170906370400b006fec56c57f3sm3044973ejc.178.2022.06.17.23.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 23:06:47 -0700 (PDT)
From: Thomas Huth <huth@tuxfamily.org>
To: buildroot@buildroot.org
Date: Sat, 18 Jun 2022 08:06:41 +0200
Message-Id: <20220618060641.24736-1-huth@tuxfamily.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/kvm-unit-tests: Completely disable the
 tests on big endian ARM
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
Cc: Cornelia Huck <cohuck@redhat.com>, Cyril Bur <cyrilbur@gmail.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Though the code compiles with a big endian toolchain, the kvm-unit-tests
do not work at all in big endian mode on ARM. Until someone steps up to
fix this, disable the package completely on big endian ARM targets.

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
---
 package/kvm-unit-tests/Config.in | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/kvm-unit-tests/Config.in b/package/kvm-unit-tests/Config.in
index 2b797e13b4..7658877ce9 100644
--- a/package/kvm-unit-tests/Config.in
+++ b/package/kvm-unit-tests/Config.in
@@ -1,12 +1,13 @@
 config BR2_PACKAGE_KVM_UNIT_TESTS_ARCH_SUPPORTS
 	bool
-	# On ARM, it uses virtualization extensions
-	default y if BR2_cortex_a7 || BR2_cortex_a12 || \
+	# On ARM, it needs virtualization extensions and little endian CPUs
+	default y if (BR2_arm || BR2_aarch64) && \
+		(BR2_cortex_a7 || BR2_cortex_a12 || \
 		BR2_cortex_a15 || BR2_cortex_a15_a7 || \
 		BR2_cortex_a17 || BR2_cortex_a17_a7 || \
 		BR2_cortex_a55 || BR2_cortex_a75 || \
 		BR2_cortex_a75_a55 || BR2_cortex_a76 || \
-		BR2_cortex_a76_a55
+		BR2_cortex_a76_a55)
 	default y if BR2_i386 || BR2_x86_64
 	default y if BR2_powerpc64 || BR2_powerpc64le
 	default y if BR2_s390x
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
