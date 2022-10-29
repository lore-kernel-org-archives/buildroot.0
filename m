Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E640EC38A02
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 20:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A23040549;
	Sat, 29 Oct 2022 20:40:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A23040549
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id npEMCoGQLAms; Sat, 29 Oct 2022 20:40:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A50C4052C;
	Sat, 29 Oct 2022 20:40:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A50C4052C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 97FD11BF5A8
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 20:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 742C34052C
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 20:40:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 742C34052C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XcHrApSizOnx for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 20:40:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52471400DA
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 52471400DA
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 20:40:29 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id g12so10809890wrs.10
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 13:40:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sBuYw9dBW166+oMiVCB0FR/84TBY6LlAjMTQSxKOvXc=;
 b=m3/YM3Q9LB02PAnj1zx7BPiWsp5bk3D4eB8KoYZg0MnBNIdnw3tPz+ZwbmH82xFkcP
 athZejYmM7FBkkdqQet0s392Xo7jz2FUKotLXNLs5Q9xiHf0/lhxd83qfz8fMc651QFZ
 MjzBSKju+coqPBsQUKJir/l5V2RjVlTu3ZMspgAySyGug2IvdY12oc856XiHRHiAA5U5
 t7KXD6/tmPXPxHRZOGeFDSJvKHpN5VAJ3l1Xh/reIuIvzJ4KBlkr5ZzToGuvwBr30t8Z
 GWkWUcbfa0BBvxBjm5EODrViF8WTwnLcs0QD0AxPe5l1xndmcfRu3i3oDmF84evrz4sQ
 c7cw==
X-Gm-Message-State: ACrzQf1SEVl5dMefUkOgCtvSHuXCD3KD68xZ/VhhyExXvtqGbvIQnYfl
 cXmkC4OXzJSU3vIR5T4qiIo/Wj4vLOI=
X-Google-Smtp-Source: AMsMyM5I2uku/y9B96Jc2pAc5lA138uH+Bh/j58pcED7BD3PmMoofTLZdtA8UlbK4TlLrAC1p8VirA==
X-Received: by 2002:a05:6000:1885:b0:22e:7869:d43f with SMTP id
 a5-20020a056000188500b0022e7869d43fmr3172879wri.249.1667076027246; 
 Sat, 29 Oct 2022 13:40:27 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 u7-20020a05600c19c700b003c6c2ff7f25sm2673486wmq.15.2022.10.29.13.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 13:40:26 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Oct 2022 22:40:23 +0200
Message-Id: <20221029204023.162302-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sBuYw9dBW166+oMiVCB0FR/84TBY6LlAjMTQSxKOvXc=;
 b=m5QeDws4Fa2GSeMn2E/LOLdAN3bjxE32OuxvkdleMrnxfGx84D5mNVtI0hbkhcsQvS
 tYRC9jdoP34XgqN5mvEJkUgLlti+VLM6S81aHWlC1vIxHIJnfXpQXawj3tlF1m8eYTtO
 FicHyB4qklU70kUayMlvXuDbOqisDQplBSJD0V6IQ2A2mJn0sTk8VUp2iFilm/VmqhRU
 1G1SbgsNCkl0X2Geb8TJruVW5qixT3udX9rVNyS4IKi2HS3ixPaaO1AXuR4D1HgPLa9p
 Yf0Oe2o18azM3sr7xuwgZk41IRUa4J7oS40lhH3cCVQABPR/RC5gIG0NAcfFdYlJlwyd
 WdSQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=m5QeDws4
Subject: [Buildroot] [PATCH 1/1] package/lldpd: security bump to version
 1.0.15
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

- Fix heap overflow when reading SONMP. CVE-2021-43612.
- https://vincentbernat.github.io/lldpd/ is redirecting to
  https://lldpd.github.io/

https://github.com/lldpd/lldpd/blob/1.0.15/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lldpd/Config.in  | 2 +-
 package/lldpd/lldpd.hash | 4 ++--
 package/lldpd/lldpd.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lldpd/Config.in b/package/lldpd/Config.in
index 9a9517b5b0..3e0446986f 100644
--- a/package/lldpd/Config.in
+++ b/package/lldpd/Config.in
@@ -18,7 +18,7 @@ config BR2_PACKAGE_LLDPD
 	  lldpd is an ISC-licensed implementation of LLDP for various
 	  Unixes. It also supports some proprietary protocols.
 
-	  https://vincentbernat.github.io/lldpd/
+	  https://lldpd.github.io/
 
 if BR2_PACKAGE_LLDPD
 
diff --git a/package/lldpd/lldpd.hash b/package/lldpd/lldpd.hash
index 6e809b2796..6db5ca98f1 100644
--- a/package/lldpd/lldpd.hash
+++ b/package/lldpd/lldpd.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking gpg key
-# https://media.luffy.cx/files/lldpd/lldpd-1.0.9.tar.gz.gpg
+# https://media.luffy.cx/files/lldpd/lldpd-1.0.15.tar.gz.gpg
 # using key AEF2348766F371C689A7360095A42FE8353525F9
-sha256  6b64eb3125952b1e33472198b054e8aa0dee45f45d3d4be22789090a474949f5  lldpd-1.0.9.tar.gz
+sha256  f7fe3a130be98a19c491479ef60f36b8ee41a9e6bc4d7f2c41033f63956a3126  lldpd-1.0.15.tar.gz
 sha256  0e96a5aea65f16e2239231ce4ab90497f8bc3bb8fe6abe9299aade4726ff7c8d  LICENSE
diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
index b88dd002e4..dd6f8dcf5d 100644
--- a/package/lldpd/lldpd.mk
+++ b/package/lldpd/lldpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LLDPD_VERSION = 1.0.9
+LLDPD_VERSION = 1.0.15
 LLDPD_SITE = https://media.luffy.cx/files/lldpd
 LLDPD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_CHECK),check) \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
