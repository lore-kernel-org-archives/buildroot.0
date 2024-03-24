Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D06C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 22:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E148981E2B;
	Sun, 24 Mar 2024 22:51:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JpCURA6OvNcj; Sun, 24 Mar 2024 22:51:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5971A81E28
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5971A81E28;
	Sun, 24 Mar 2024 22:51:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DA0A41BF4E4
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 22:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C313D405A1
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 22:51:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mr8GBc-8q4uX for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 22:51:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B6BDB405A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6BDB405A3
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B6BDB405A3
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 22:51:16 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6e6ee9e3cffso2493039b3a.1
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 15:51:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711320675; x=1711925475;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w/hB7NgIVgmLI8Q3z9jPi2nGVG1jo5WSvup72AaMATg=;
 b=S/YA5EfL3uW+swMq53fNHaA2BDDlcCaD3QZ0R1Gmzsycw3L+Gf69PZnEYWkbcABcex
 AbwU53U1el94dimBS57bmctBYthR9Jd5+YqAYJTnTGxarzGfUDP5X+HnbGU8Zqztp0dU
 hKccxAyer2BH9RuF7G6iZK4b3Pp2zfy9dx6MoQu4RVBuidRVckj0gKszBnw5NyIeJbe4
 vqY50X42XwJ3GO0oZwch/pG/mci3tpK/NIVpypng9yuKNZXKQELvfpvpVcsp/sUiXdKY
 foBgtNe+LNH9m9sEfpXK6FGrxe4GUIxH1A1az/LzbCRMlP8BNLQUnSHB7AyLDZHN1ENt
 OGCQ==
X-Gm-Message-State: AOJu0YybZ0usPFMx2Nz/alrvJ5yMjn4wJfdIKkVtZTNe+R48LT9z1rU3
 J3LZjIhOwiL3VZ+uXfWWq6ZMwAXEq4E2QW7+hWhxFQZSMD+tIHguJpy/ILnvSnCy0bWp6rqlyEI
 0
X-Google-Smtp-Source: AGHT+IE6whJUkQ/b2q0aM6MaepWAlsHGMsewctgYD82dWshxi3WCGQitWgXxnQQoyVFJ3cyI1C7+iw==
X-Received: by 2002:a05:6a20:5482:b0:1a3:b173:1a97 with SMTP id
 i2-20020a056a20548200b001a3b1731a97mr6810989pzk.1.1711320675401; 
 Sun, 24 Mar 2024 15:51:15 -0700 (PDT)
Received: from localhost.localdomain ([204.229.2.167])
 by smtp.gmail.com with ESMTPSA id
 a33-20020a056a0011e100b006e580678dfbsm214031pfu.193.2024.03.24.15.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Mar 2024 15:51:15 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 16:50:49 -0600
Message-ID: <20240324225052.629874-10-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240324225052.629874-1-adam.duskett@amarulasolutions.com>
References: <20240324225052.629874-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711320675; x=1711925475;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w/hB7NgIVgmLI8Q3z9jPi2nGVG1jo5WSvup72AaMATg=;
 b=MhvYOEn2U3ktTDMkzvzlYulwaXPdmXuXr25uXJthFZxhe4d3s6USfrq/YcAXVd5ZaN
 uyRf51XLQ+2oPfTmsBCod/+8X8HsmSkIpEppmLhIK31k/24nZ/4/j1hyBUC/xixGOPxF
 mjajwrWaWubNar/q6nOGIYvQEQoQIxAYk227Q=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=MhvYOEn2
Subject: [Buildroot] [PATCH 10/13] package/flutter-pi: bump version to
 783db32ec6441b878783bfa241777d3bfe6b35e2
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-pi/flutter-pi.hash | 2 +-
 package/flutter-pi/flutter-pi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flutter-pi/flutter-pi.hash b/package/flutter-pi/flutter-pi.hash
index df47d666bd..956827a5b3 100644
--- a/package/flutter-pi/flutter-pi.hash
+++ b/package/flutter-pi/flutter-pi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6b11f260567a4589915cf29ce2ffa62b6f80414242a65c616f01983ae3a177b7  flutter-pi-75e72fef8e8ce65ec72a002c00d9c6db4d1479d3-br1.tar.gz
+sha256  4ab2ae849d46261fe22ed94eae5726841d34119a5656e85b26c7c8802050d14c  flutter-pi-783db32ec6441b878783bfa241777d3bfe6b35e2-br1.tar.gz
 sha256  b34df9d3e1b4e5d1ba70b1740ec74b69f1189b44efd0c96b898b074ef8db1c70  LICENSE
diff --git a/package/flutter-pi/flutter-pi.mk b/package/flutter-pi/flutter-pi.mk
index 9edc62e7ac..ee54a2bf4e 100644
--- a/package/flutter-pi/flutter-pi.mk
+++ b/package/flutter-pi/flutter-pi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_PI_VERSION = 75e72fef8e8ce65ec72a002c00d9c6db4d1479d3
+FLUTTER_PI_VERSION = 783db32ec6441b878783bfa241777d3bfe6b35e2
 FLUTTER_PI_SITE = https://github.com/ardera/flutter-pi.git
 FLUTTER_PI_SITE_METHOD = git
 FLUTTER_PI_LICENSE = MIT
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
