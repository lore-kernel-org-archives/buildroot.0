Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED815FA3741
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 22:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EF4381290;
	Mon, 31 Oct 2022 22:11:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EF4381290
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9w5RDLDPaEVe; Mon, 31 Oct 2022 22:11:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8BA081276;
	Mon, 31 Oct 2022 22:11:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8BA081276
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 124ED1BF2B6
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 22:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDC9C408C3
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 22:11:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDC9C408C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xPKrJguaKQyN for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 22:11:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AC4D408C1
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8AC4D408C1
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 22:11:37 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id k8so17928997wrh.1
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 15:11:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vTQhDLErlAsSuQtebIR56DRG/IRYPMNwEOsais6Ya/M=;
 b=zqb9vZIU9p91xgVOc0Ns3ytn5Y8n8BpQyQOcNW1KYOpcZpPE2xherU6yk05tKPkMbx
 +dLmBN1UU9rPht0E7o4AkEA/qhVVHCXTaVxDYiDs2vYVKG+oz/b+kUOP4WbwrUZ/CPPH
 DRTYF4Zf0IcGmPbCTmMZh0rqyZxxCxgEuNcG74HVzgERk4gX4SN+Gdc6Ynb70CdrP6Cv
 +SdwNiead3Zn4mh5fAJsLgJyyxweJ4yHDlOkdM46CxRytKhlMc/m2ijc1AP9kH89eB+m
 K0s9mqRAdqKoKJenZT9JIRt7bOBA9T1F8f15Kzz+5p4jy4gWxFRVvuQ4v3IutRQvIYge
 4mWg==
X-Gm-Message-State: ACrzQf0TtNzJiJ06STkDEVoFHMN+0dNKyT66pDEqx8uAJiyg5s6bbpGT
 Ulhi3gE/CV9g5BqLTT/AqLUWEqYafEA=
X-Google-Smtp-Source: AMsMyM7fnnL3vccfs3DiRaUcFnU+OTbEvgDlArdHGfZig+c89Av3XqsAiAIGdy9Th9Ht/Kzz7yoy/Q==
X-Received: by 2002:a5d:6b02:0:b0:236:d484:2d01 with SMTP id
 v2-20020a5d6b02000000b00236d4842d01mr3359542wrw.623.1667254295239; 
 Mon, 31 Oct 2022 15:11:35 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 i39-20020a05600c4b2700b003a6a3595edasm9346597wmp.27.2022.10.31.15.11.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 15:11:34 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 23:11:31 +0100
Message-Id: <20221031221131.257422-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vTQhDLErlAsSuQtebIR56DRG/IRYPMNwEOsais6Ya/M=;
 b=cUoGWZRJ9ZKKWpKNY0MtowdwO/B2qjDU7E29GPjpkLpppdMk3jKJCtPRz8Zqb4bnn1
 y6mNJ97PWHNAYRclhv3piY5gDIDQyzz83mBWul7zyrmSCQbKcN4gkR/JLOjdM0IgXG50
 n0Aa1zZasJ5GnYpDhvUveU87AV46IKPlhyg4iS1bT/I7wnKT7oVf1/Pw0sR76TJ3x6Vy
 32M3OGXibYiWF/x45z+MilPCgucejgwPKaUfyLrw9TXdrA8lSDQN7HlJ30k6vlrArXvu
 2eeW0AkScVy/XnTnDVQAg6ZKiLSgPN1VKbRJH4zldNMSa8nGyl93PubfYT8WysrtA/Bd
 sSCw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cUoGWZRJ
Subject: [Buildroot] [PATCH 1/1] package/rpm: bump to version 4.18.0
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
 James Knight <james.knight@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://rpm.org/wiki/Releases/4.18.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rpm/rpm.hash | 4 ++--
 package/rpm/rpm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rpm/rpm.hash b/package/rpm/rpm.hash
index 19b6dd9176..dfe50303f7 100644
--- a/package/rpm/rpm.hash
+++ b/package/rpm/rpm.hash
@@ -1,5 +1,5 @@
-# From https://rpm.org/wiki/Releases/4.17.0.html
-sha256  2e0d220b24749b17810ed181ac1ed005a56bbb6bc8ac429c21f314068dc65e6a  rpm-4.17.0.tar.bz2
+# From https://rpm.org/wiki/Releases/4.18.0.html
+sha256  2a17152d7187ab30edf2c2fb586463bdf6388de7b5837480955659e5e9054554  rpm-4.18.0.tar.bz2
 
 # Hash for license file
 sha256  171d94d9f1641316bff7f157a903237dc69cdb5fca405fed8c832c76ed8370f9  COPYING
diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 5c04d47f10..fc57a14fd6 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPM_VERSION_MAJOR = 4.17
+RPM_VERSION_MAJOR = 4.18
 RPM_VERSION = $(RPM_VERSION_MAJOR).0
 RPM_SOURCE = rpm-$(RPM_VERSION).tar.bz2
 RPM_SITE = http://ftp.rpm.org/releases/rpm-$(RPM_VERSION_MAJOR).x
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
