Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C87C0032E
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 16:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFFD7416B5;
	Sat, 28 Oct 2023 16:51:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFFD7416B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z_jG2n8Q5Tk0; Sat, 28 Oct 2023 16:51:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EDC50416AC;
	Sat, 28 Oct 2023 16:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDC50416AC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 17AE51BF32C
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 16:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E509842077
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 16:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E509842077
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o7U3cc5ygCyO for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 16:51:30 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D964442076
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 16:51:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D964442076
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-32daeed7771so1926807f8f.3
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 09:51:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698511887; x=1699116687;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dLaKqQJqjkWIp0Vsv0fJO36PowawHC1MUTYn/rgcXgk=;
 b=TVKHyU3ZpH5eia2+q7K/QFZG0K6Nm859dO1dztBPz+A3Lx8CFA2MgVtnTknoE4ON5W
 w+b70p1B5PImSu6LoCe8zIm0T+usLGzSK4jVWG0yKQicvfAtDQMuiVDDMLQj+Lb8U9w8
 sk3exFF1s0decBY9QkvD8jctCnQipGllJKI8x/GGZzjDfrLOxDeZ9AIQz5/D6XSvv404
 jWejZcjs7z/tCpamzNgnsw5lbWHm/rukY35jD4z/X+ERuDeI/pxEs1pPUAlhnLWY42WV
 LTE6CoEcFKlx1LlWGpmmA2bAiqHQAhMtj0af7MdVxNnQRPSpreQ4K0agJQcg+gGMGEyz
 rbNQ==
X-Gm-Message-State: AOJu0Yxn2116/J8VSN90A846kQM0SDo4aTDGTgEYTBXZPl7E85h3vFd2
 GVUVgMoOmLgVjpsUXziS5jci6jeznRw=
X-Google-Smtp-Source: AGHT+IEfeq/sZpVcNcynXf6UYTypkfNcdNsLggkMXrFhAPQ9Pp19LoREXouk78MIv/MLVt5JT8pyUw==
X-Received: by 2002:a5d:64eb:0:b0:32f:79e5:5ea9 with SMTP id
 g11-20020a5d64eb000000b0032f79e55ea9mr1611078wri.10.1698511887527; 
 Sat, 28 Oct 2023 09:51:27 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 z8-20020adfe548000000b0031c52e81490sm4199878wrm.72.2023.10.28.09.51.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Oct 2023 09:51:27 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Oct 2023 18:51:24 +0200
Message-ID: <20231028165124.594087-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698511887; x=1699116687; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dLaKqQJqjkWIp0Vsv0fJO36PowawHC1MUTYn/rgcXgk=;
 b=Yxp2krDQO0VIj16dxNsHGzstEhdVoJbVUxda/bH8DWtFjj0R9DkrT+EysO6qboBeLO
 JeDF6S+gs+zP4ClwyuwonSqjWpw+WVg+NCi7yFyEzvDirjqKfMpeJJZGuBT74jZ53vfX
 qQtJD6/S1rvzIRZjeHSgeS1/5XargyjpOOjGSZfWlPtIkpdsCvT93KFtrYS77h//wRop
 cPzmrLaOMTc+y6ACcwgoqvwI9yGeq+qWCbNPBReuPhMgwpaK/D//Js/zQATmpkyitmgs
 RLnubR528rg6lWO6tR3/IoJHbLoMR8okCVpqVsvEYQ5Vd2W7UudL7G/1HuZHtB39Ris9
 jXJw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Yxp2krDQ
Subject: [Buildroot] [PATCH 1/1] package/avrdude: bump to version 7.2
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
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/avrdudes/avrdude/blob/v7.2/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/avrdude/avrdude.hash | 2 +-
 package/avrdude/avrdude.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/avrdude/avrdude.hash b/package/avrdude/avrdude.hash
index 5910a568db..cb34e6b6f9 100644
--- a/package/avrdude/avrdude.hash
+++ b/package/avrdude/avrdude.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  016a5c95746fadc169cfb3009f6aa306ccdea2ff279fdb6fddcbe7526d84e5eb  avrdude-7.1.tar.gz
+sha256  beb4e0b0a07f8d47e550329ab93c345d5252350de6f833afde51b4d8bd934674  avrdude-7.2.tar.gz
 sha256  201babc7da198873304a77a30dbfc7ca449c9bba52df2dffa4cca0009dbdfcb2  COPYING
diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index 8ebe33b372..89637d4ca6 100644
--- a/package/avrdude/avrdude.mk
+++ b/package/avrdude/avrdude.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AVRDUDE_VERSION = 7.1
+AVRDUDE_VERSION = 7.2
 AVRDUDE_SITE = $(call github,avrdudes,avrdude,v$(AVRDUDE_VERSION))
 AVRDUDE_LICENSE = GPL-2.0+
 AVRDUDE_LICENSE_FILES = COPYING
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
