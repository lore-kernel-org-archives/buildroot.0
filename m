Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5336FC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 12:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA8FF60759;
	Sun, 14 Aug 2022 12:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA8FF60759
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IDFZL_HZm85v; Sun, 14 Aug 2022 12:56:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03C2260BB5;
	Sun, 14 Aug 2022 12:56:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03C2260BB5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D0F151BF96B
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 12:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B79EE82F87
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 12:56:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B79EE82F87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rzcEu9jHHtCa for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 12:56:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C558E81A4E
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C558E81A4E
 for <buildroot@busybox.net>; Sun, 14 Aug 2022 12:56:18 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id gb36so9395661ejc.10
 for <buildroot@busybox.net>; Sun, 14 Aug 2022 05:56:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=BfSpRY7KkLvQ9vxX8pp9Sla7cMGRs2tlFkNcVT6WMR0=;
 b=5PutCQixROIT7AGjbkCXWz8iRUTCeRBRTjTMIZ71Yc9enDITeIWoGnC2o0VQdGkbcM
 EfBwkkqud922CGvkbphEn/gZewi+BPyu/BV2HrhPy+ow7+D6JODwrdC36ZmTGA6gcdDU
 Qsq9FwqQcMqki/6R28QONahmwskH+w/e/XjKoEdkxDVH6nA657ftBIU4vB7ljsQ+7xr/
 EkeBikZXT9hVa0HfjVsZbQZQEf5t3BfOOEYQY5qz8xcPDhMIM1W3ECBgGusy9oI5U6sM
 LUO3Q9k3OQVf14gjceNq+GZSS9PGiy3e70IW0H3ztJ6UmnvTGJ9Q4yMTtsacYVDg8M3H
 6VcA==
X-Gm-Message-State: ACgBeo1XbAQw8n4VRh6GrytXcmh2CS+iRzZ2HYfpTnRMS8mfVnAOrkWF
 30kXhTUuX92GPg8USEdrot6KjfavIzk=
X-Google-Smtp-Source: AA6agR474gEvCuv5dE3yuD2+QjYKGCMdzsJ9dXaQ3vCAzhtQ9PL+SlChhY3YxJsT2/cw7vf4RQ3lGg==
X-Received: by 2002:a17:906:6a0a:b0:731:4a2b:a1b1 with SMTP id
 qw10-20020a1709066a0a00b007314a2ba1b1mr7898977ejc.544.1660481777107; 
 Sun, 14 Aug 2022 05:56:17 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a1709067f8100b007310a9a65cbsm3038290ejr.16.2022.08.14.05.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 05:56:16 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun, 14 Aug 2022 14:56:12 +0200
Message-Id: <20220814125612.1227910-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=BfSpRY7KkLvQ9vxX8pp9Sla7cMGRs2tlFkNcVT6WMR0=;
 b=cjB1uiAfSjV7TfEb9g5nYuujnz+XsFt3M3ct7u62PTEyvoV8pHm3/NNRwH1uqLtnjJ
 hJbrtfTRaE2z/Sfnm4dl5dDMQNnPhwTl6fN+F8Vo/as/qgNLtCyjR/SEjrAS+XOhJkpw
 6YxqIzu5X73AboaduKfO7FHuLg8Pro0eKyvKtQjeClcw834KIz89AYutdHhup7Iigbtc
 tpam4Y49S8H//n25semfFibYXulQD3B5Usg4d5fsw0z7JHzCsq5whG+3Nr+RMzK4/8gM
 Jjxsl/ifHK8oGommCHuLjbDhRag7kPDZnA0ry85AeG6uZ16fR8hPZk4gmoEorNgnWuLl
 hQ4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cjB1uiAf
Subject: [Buildroot] [PATCH] package/nettle: bump to version 3.8.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/nettle/nettle.hash | 4 ++--
 package/nettle/nettle.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nettle/nettle.hash b/package/nettle/nettle.hash
index 14467977b..d726cb94c 100644
--- a/package/nettle/nettle.hash
+++ b/package/nettle/nettle.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/nettle/nettle-3.8.tar.gz.sig
-sha256  7576c68481c198f644b08c160d1a4850ba9449e308069455b5213319f234e8e6  nettle-3.8.tar.gz
+# https://ftp.gnu.org/gnu/nettle/nettle-3.8.1.tar.gz.sig
+sha256  364f3e2b77cd7dcde83fd7c45219c834e54b0c75e428b6f894a23d12dd41cbfe  nettle-3.8.1.tar.gz
 # Locally calculated
 sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LESSERv3
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYINGv2
diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index 05b8b0bea..dd4dfbbe3 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETTLE_VERSION = 3.8
+NETTLE_VERSION = 3.8.1
 NETTLE_SITE = https://ftp.gnu.org/gnu/nettle
 NETTLE_DEPENDENCIES = gmp
 NETTLE_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
