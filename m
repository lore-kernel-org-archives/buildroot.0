Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C97C433FE
	for <buildroot@archiver.kernel.org>; Sat, 22 Oct 2022 21:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91594607D0;
	Sat, 22 Oct 2022 21:19:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91594607D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SL37blABFs_G; Sat, 22 Oct 2022 21:19:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCE9B607B4;
	Sat, 22 Oct 2022 21:19:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCE9B607B4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B55A11BF3BC
 for <buildroot@lists.busybox.net>; Sat, 22 Oct 2022 21:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8CF914013B
 for <buildroot@lists.busybox.net>; Sat, 22 Oct 2022 21:19:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CF914013B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XEa4Ob073qyR for <buildroot@lists.busybox.net>;
 Sat, 22 Oct 2022 21:19:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 797484011B
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 797484011B
 for <buildroot@buildroot.org>; Sat, 22 Oct 2022 21:19:03 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id a10so9469521wrm.12
 for <buildroot@buildroot.org>; Sat, 22 Oct 2022 14:19:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w4OBqUZpo79xXdz5fECGUpd/ZUNu+60zglKs+MDHWQs=;
 b=6SMUVrizDx+4kN9cyGfn7CXXOAY+72Q3SdRhaLTCiWdNg53KZR65AtMHqVfVTy/3s1
 IIW+GiCDm46PPBS76o3O9g2Yza1RIXbJW6Q/D++oTRvsjFEBX6NSpC08wFOhXRAgCNBC
 CY+qhAd7RhsaKTgF2pBoG0kYc/ColcFfwPHxcKPzfpT9mn+u6N0j0sknWhphOaZM8FXo
 H9U2gfiRi3Y55lUl7nb8F8RAwHrbu3Ty/yv8eRum07AP9YqE6gbsmDmO832OLTkLPyzR
 20xkwxkP3IgO9R3l4UO6toK4gVdYSP4JLmo4/NLgj9TEj2/8ljZvOt+/uypHFy8qc7nm
 RoMQ==
X-Gm-Message-State: ACrzQf1DQi4kNQXU+PRVP3JoAUNsLeiVuqrRUIpXPTi4hiUIenlAIgON
 NWsUBx56uSaG1HDbd9dfPqre6+b9Bv0=
X-Google-Smtp-Source: AMsMyM5rpqwnnmeHVR4Ol99IyJei/1z7JYUsYS5NglrpPiM8wj+F8TveISixNiciyHyPh0xYvQ8KtQ==
X-Received: by 2002:adf:f0c9:0:b0:236:26a2:34e3 with SMTP id
 x9-20020adff0c9000000b0023626a234e3mr9242936wro.541.1666473541287; 
 Sat, 22 Oct 2022 14:19:01 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 hg16-20020a05600c539000b003c6b70a4d69sm6518087wmb.42.2022.10.22.14.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 14:19:00 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 22 Oct 2022 23:18:58 +0200
Message-Id: <20221022211858.166130-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=w4OBqUZpo79xXdz5fECGUpd/ZUNu+60zglKs+MDHWQs=;
 b=EPOuHgNhuIXKdbBEhP7oXuJ8e1ofJ5BnvotanmrRkGQ3QiooTdnyhFhODyhxqmb7RP
 uVAku8xijEcGxv6XehyqxqcYs2Rx1mUKCE7ds0cQC4XgltZZ6sh81WCH8tt3gubCXsGz
 l0rrjDA/uuMTPtX12eMKm5uBGCJA+u+MEnYns3E4EwYdcdritS6DKplA2zDYxGG+jPmj
 mPTwK81vpwa52nV5D8fpI+FASHrnrQjJHjsqKZ2WkpHH/4ShAsty1bwR7PNtGnaoAYz7
 giTu9eAXea6n8etw5sq+aVyYOzs6+5ogHmqLNQ4wYk8zGTtMX1/H6mgM89EFiikXttEM
 AJyA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=EPOuHgNh
Subject: [Buildroot] [PATCH 1/1] package/stress: bump to version 1.0.5
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

Switch to an active fork:

"The original stress went unmaintained; the source of the last version,
1.0.4, was imported from Debian. After, patches from Debian and other
changes were applied to create the 1.0.5 release. The details of each
release are registered in the ChangeLog file. Now, stress is maintained
by volunteers under Resurrecting Open Source Projects."

https://github.com/resurrecting-open-source-projects/stress/blob/1.0.5/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/stress/Config.in   | 2 +-
 package/stress/stress.hash | 3 +--
 package/stress/stress.mk   | 6 ++++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/stress/Config.in b/package/stress/Config.in
index b22c3f19bb..32a3e264bc 100644
--- a/package/stress/Config.in
+++ b/package/stress/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_STRESS
 	  It imposes a configurable amount of CPU, memory, I/O, and
 	  disk stress on the system.
 
-	  http://people.seas.harvard.edu/~apw/stress/
+	  https://github.com/resurrecting-open-source-projects/stress/
diff --git a/package/stress/stress.hash b/package/stress/stress.hash
index 8d14d053fb..dc1785b6c7 100644
--- a/package/stress/stress.hash
+++ b/package/stress/stress.hash
@@ -1,4 +1,3 @@
-# Locally calculated after checking pgp signature
-sha256  057e4fc2a7706411e1014bf172e4f94b63a12f18412378fca8684ca92408825b  stress-1.0.4.tar.gz
 # Locally computed
+sha256  1798e49ca365d928fb194ba1b8e8d1e09963b49e9edb0a78bcbba15750bb5027  stress-1.0.5.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/stress/stress.mk b/package/stress/stress.mk
index 4d2d4cb838..99a50f349e 100644
--- a/package/stress/stress.mk
+++ b/package/stress/stress.mk
@@ -4,10 +4,12 @@
 #
 ################################################################################
 
-STRESS_VERSION = 1.0.4
-STRESS_SITE = http://people.seas.harvard.edu/~apw/stress
+STRESS_VERSION = 1.0.5
+STRESS_SITE = $(call github,resurrecting-open-source-projects,stress,$(STRESS_VERSION))
 STRESS_LICENSE = GPL-2.0+
 STRESS_LICENSE_FILES = COPYING
+# From git
+STRESS_AUTORECONF = YES
 
 # Stress is linked statically if the --enable-static is specified.
 # However, this option is always specified in the global
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
