Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CBBCAC59A
	for <buildroot@archiver.kernel.org>; Thu, 18 Sep 2025 16:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5983460643;
	Thu, 18 Sep 2025 16:08:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xMmL92urjjpN; Thu, 18 Sep 2025 16:08:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8559F60644
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8559F60644;
	Thu, 18 Sep 2025 16:08:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 292021E3
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 16:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1AC6F4064D
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 16:08:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BWOrquGJQf7g for <buildroot@buildroot.org>;
 Thu, 18 Sep 2025 16:08:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0555E40652
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0555E40652
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0555E40652
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 16:08:44 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b07c2908f3eso178103066b.1
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 09:08:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758211723; x=1758816523;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SupZfcLc/+2J7RjRFpr5k5r89vbMeB+ZYwxIQOqibJE=;
 b=PRZBLBe2xHzctjvT9OpoCptbkvsUMi5x3447dgEpLPdRsYZr/FonHXgKlrEha5Ulcl
 pYQzB3rNaiHJem3601+GSAoWRdk1gp+kPIYghudj4RoWxgbkJJ5j927osDxSPC552Pmb
 GWv9gwMK37mdcYxbe4pQDEsaql7PrRsm7Q/1qs6IPN+noHxnJfBvS5M0bJCuRTamnwgP
 7t5sK+tkJi6w4oXce9C1EykatfWnKct6ipmzZi+51P0L9OBrzU+jQiZkwJfSrbsF+dHF
 T+h2FDETWe3oGCJiPPf+L1JwvBZJH6d0F+l7kTuj2SjcDHS9GvIdUp1861d7Nsx/mNGJ
 SVng==
X-Gm-Message-State: AOJu0Yz9JK60rxFSzWqGnJDwtKt5E+c/PfZTaLLr78H1XWbemp8QTpMp
 3eeX6o4jZqKFHPRHQFFgqykcHDIkDgoSI11DH78GWY1AxCKRmuUdf0YdmI9+4T2Dq3AYO4v7D5M
 rwxyl
X-Gm-Gg: ASbGncsnrrxF3NoiTPgbt3qIWKnkdITVmQcLJQBcwdeUkDKDzC1dLaiTIjHi0awM4vZ
 yrozV5Ur7lMkffyUelxVIKpeAYfZWtuq50p86EdK0OiaLLS55TDgiw4maYFEB75PyuEuoGlmi1A
 n97n0JEbiFN7eMW5IVvjZHR+cZL9cUltIRkToXGSTUR1nCsiHRymEXExcKpSGqyNTzDR49bR4jR
 Q8vJXXYoeVVYTmtXFr2OX+GpqzypAJxBvIjssj/bbAWXJLNziKLz/QQ6GhB5nCfRgyKG5uhqaXS
 /1iKRzQwVwLMgM226FmcK+s0pBlX3J6UiXIuPlNJAJ4AohGUWzYeF+Q/sJHCavFxLswyO5TU92e
 oXyPbWCjq2NkTsIwKRCsaeEwsGVhrPH/uGHe/+TTl7o0vSXdNGf6oQoGv365BYarTqtv3hZLKJ4
 UVIoALlmPC1ISfAYG+jyA5CnjI90G1FFkKHDT2V9fWG0e6BqUiTNqrep8UKZa9RVgv7Zs3Gynpg
 Pv267k6QZs=
X-Google-Smtp-Source: AGHT+IGTWOASECVcg0mKddF4+zqeSUe2TX7wOeram6MAhhUioLpFz7My1IKQxMlC5LkBGOpZhyHYRw==
X-Received: by 2002:a17:906:c102:b0:b04:26f2:b83 with SMTP id
 a640c23a62f3a-b1bbbe68580mr692100266b.35.1758211722679; 
 Thu, 18 Sep 2025 09:08:42 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b1fc5e43bd4sm220342866b.17.2025.09.18.09.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 09:08:42 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Juha Rantanen <juha@codercoded.com>, linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 18 Sep 2025 18:08:38 +0200
Message-ID: <20250918160838.2538332-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1758211723; x=1758816523;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SupZfcLc/+2J7RjRFpr5k5r89vbMeB+ZYwxIQOqibJE=;
 b=JKACozjKf4ze1A7dWpKcwnOFn3xEZg1sfY3bAsrhYI8OsvY7fkywYyWqmxHf5Ngg1H
 Xh6w2Yg+PBDOjKRefJvXaqcCIoR2rEAnnwjWKwt2ADIO9u3sXyRcI0ICXLsx7LLXFYMB
 oPWCCFfdKH1NBLEg7BiOvkX4uvYU96NzBUIhs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=JKACozjK
Subject: [Buildroot] [PATCH 1/1] package/acsccid: bump to version 1.1.12
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://sourceforge.net/p/acsccid/news/2025/07/acsccid-1112-released/

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/acsccid/acsccid.hash | 8 ++++----
 package/acsccid/acsccid.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/acsccid/acsccid.hash b/package/acsccid/acsccid.hash
index e5fe669ceb3f..25f894c577f3 100644
--- a/package/acsccid/acsccid.hash
+++ b/package/acsccid/acsccid.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/acsccid/files/acsccid/1.1.11/
-sha1  75d3d17fb9d9ee7d0b291b460e2c6eb3c71654c5  acsccid-1.1.11.tar.bz2
-md5  0bbbce89a934861b7c5b003da962f1d9  acsccid-1.1.11.tar.bz2
+# From https://sourceforge.net/projects/acsccid/files/acsccid/1.1.12/
+sha1  6d9aa64b195e1b4d72a9b032f8ee70ad0798802d  acsccid-1.1.12.tar.bz2
+md5  34bf40daedd3428c07f9937d4ec43129  acsccid-1.1.12.tar.bz2
 # Locally computed
-sha256  2fcda6ed1f5d2f07e202b51f9a600a61c83e1a73a96f51ed0f9e4f781c9c1282  acsccid-1.1.11.tar.bz2
+sha256  28f6075a5494a568ce2fd8666c489f6f4a51599b44fbc9390e1ddb48d3ccc5bd  acsccid-1.1.12.tar.bz2
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
diff --git a/package/acsccid/acsccid.mk b/package/acsccid/acsccid.mk
index 93cca8e09d0a..3be13795525c 100644
--- a/package/acsccid/acsccid.mk
+++ b/package/acsccid/acsccid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ACSCCID_VERSION = 1.1.11
+ACSCCID_VERSION = 1.1.12
 ACSCCID_SOURCE = acsccid-$(ACSCCID_VERSION).tar.bz2
 ACSCCID_SITE = http://downloads.sourceforge.net/acsccid
 ACSCCID_LICENSE = LGPL-2.1+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
