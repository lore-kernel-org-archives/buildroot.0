Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C8BBC3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 08:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12C854096F;
	Sun, 18 May 2025 08:55:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k92EsXwpagdO; Sun, 18 May 2025 08:55:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39E794097B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39E794097B;
	Sun, 18 May 2025 08:55:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B7A9FE4
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DCF940FF3
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:55:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yz6XYCJnaiMQ for <buildroot@buildroot.org>;
 Sun, 18 May 2025 08:55:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 34C0E40FDE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34C0E40FDE
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 34C0E40FDE
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:55:14 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2322f8afe02so995595ad.2
 for <buildroot@buildroot.org>; Sun, 18 May 2025 01:55:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747558513; x=1748163313;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zF5CddGDke22lldWPXe7VKFZGL+TYtt2wuwuWYDjxTk=;
 b=WRVUS8AM+3PE2IZlPLUuNNRDPxds5SalU2or8cWodmS4uD2eM+jajScUckRs65Er3r
 u/vyHA2ATGNfbVuMaRnAS3uRjSbm5A5gY5fwEdVFWAcLXjP9loNMkEMvLzQYqY2o4hoP
 XqE500PqOQIQW6AikSRM3xt6c/apOV2xCpx8/as0Zvz8FhYUpLk4SfE4BrIZbWE1cyjr
 rl0G1rDRVzIdy9DP4uwh/ULFhlYKpj/BypPwqAUgVJF3LI0wrlr8AY9QVN2S9bUMYY4P
 XEMnNRSWNQG1feBVPZShzb7jhLEFnTZyqbowjbpm0fg25dkjRYMr1J46jEuVL0UJojzj
 RODQ==
X-Gm-Message-State: AOJu0YwA90L+YN2wM38OvpG/wvBMb9IDu6q8MyIvIF5mwiebtHa7jrWi
 c5/XdmQduJEkochYOLqJd/SsM99Pn5vJsGNMegOEyJtz0XCuNxA9DrPVsb67RZ6w
X-Gm-Gg: ASbGncuHorwod1tLPeD34Ec1FDycfx2mrYypRIG0lG7PqdLxzGw7tmAVP425/YgrQC4
 7Yi1VTvHCFutq+lCpTq/Ua6WO7a6mEuMshsDfYjr4Az8hbLMmSixDUaGXr5nUz/GYKqEczpUqb+
 xmNzynmG9NnqgdkYHa+gY2nfZ3FPtpH7sMavOzOUMBPs6eo2v+wGzm5fObQAdbqAbkr42xSvZY8
 eWpnnpESMXoseUSNGO/G0dA91vT6ofNfOAeKlHiOT2KVnOhNCSRT3m8jztAlR9RBXlLUrzpHZ9U
 zkhcg4G0YOIs1Fst63FBr8dFRs74NQvtrxVdC00YAK9Z/Wsq22V7qnNjR8sQkKjBRrecmXSzFYz
 hudg4o8gZavk3r0G6W1rbShh9wUR4zbFmi7oxZw==
X-Google-Smtp-Source: AGHT+IGUyOVAFlF579+u2fovAwMd+Dn1SWqlcwuMTG0lQmyayLi6NR0dNgGN5y3ty1bMwM64UZXhXw==
X-Received: by 2002:a17:903:22ce:b0:231:b456:b97 with SMTP id
 d9443c01a7336-231d459a539mr135792715ad.36.1747558512850; 
 Sun, 18 May 2025 01:55:12 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-231d4e97497sm40635845ad.128.2025.05.18.01.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 01:55:12 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Cc: Kadambini Nema <kadambini.nema@gmail.com>
Date: Sun, 18 May 2025 01:55:08 -0700
Message-Id: <20250518085508.51880-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747558513; x=1748163313; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zF5CddGDke22lldWPXe7VKFZGL+TYtt2wuwuWYDjxTk=;
 b=XerEn/b8Yj4Awt+iKLSz6Hwp/EZsm3kcu3z9of81u57XpSmsltTsXDzKHHIhnE2vA3
 FpPHGzTsqzmOAKqQOEFyA2miY8eU6ZsHv9tug0dyUIIDgMY0aNAdtgVbn2wQ+dVEqOHJ
 K/YxnRDE6GURSnCOhnERhuCTblH9ndaoxv2DX3Y2pF1/jUdqnj88UFGjbnZYsvw4Ssfv
 muA6Q4l7QjHPkVfjmC5BptCbil+Ij3v+/u0W67mO+wjmj/Gw1bQ0L1dpRfbRcJLzQIsX
 rE2qBceiUgzRV9cmPkBLKn3zcJH3qliOaMnVlPOut8t/ckm421NydZbWYyS4TziyhvjP
 9bYw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XerEn/b8
Subject: [Buildroot] [PATCH 1/1] package/smartmontools: bump version to 7.5
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
https://www.smartmontools.org/browser/tags/RELEASE_7_5/smartmontools/NEWS

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/smartmontools/smartmontools.hash | 8 ++++----
 package/smartmontools/smartmontools.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/smartmontools/smartmontools.hash b/package/smartmontools/smartmontools.hash
index b4e18f9002..ecc2c9d089 100644
--- a/package/smartmontools/smartmontools.hash
+++ b/package/smartmontools/smartmontools.hash
@@ -1,7 +1,7 @@
-# From http://sourceforge.net/projects/smartmontools/files/smartmontools/7.4/
-md5  178d31a6ff5256c093227ab45a3f52aa  smartmontools-7.4.tar.gz
-sha1  b0d7c9ca80768059607b92bf4e373e2822300d3f  smartmontools-7.4.tar.gz
+# From http://sourceforge.net/projects/smartmontools/files/smartmontools/7.5/
+md5  38c38b0b82db7fc4906cdd50d15a7931  smartmontools-7.5.tar.gz
+sha1  9b0ca96931d6184da34d68bbe9a785713f5a8474  smartmontools-7.5.tar.gz
 
 # Locally computed
-sha256  e9a61f641ff96ca95319edfb17948cd297d0cd3342736b2c49c99d4716fb993d  smartmontools-7.4.tar.gz
+sha256  690b83ca331378da9ea0d9d61008c4b22dde391387b9bbad7f29387f2595f76e  smartmontools-7.5.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/smartmontools/smartmontools.mk b/package/smartmontools/smartmontools.mk
index 18a1417681..557aec1efd 100644
--- a/package/smartmontools/smartmontools.mk
+++ b/package/smartmontools/smartmontools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SMARTMONTOOLS_VERSION = 7.4
+SMARTMONTOOLS_VERSION = 7.5
 SMARTMONTOOLS_SITE = http://downloads.sourceforge.net/project/smartmontools/smartmontools/$(SMARTMONTOOLS_VERSION)
 SMARTMONTOOLS_LICENSE = GPL-2.0+
 SMARTMONTOOLS_LICENSE_FILES = COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
