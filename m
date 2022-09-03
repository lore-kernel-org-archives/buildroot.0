Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A974ECAAD4
	for <buildroot@archiver.kernel.org>; Sat,  3 Sep 2022 09:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 601854154A;
	Sat,  3 Sep 2022 09:27:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 601854154A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q6kbanBkiuTi; Sat,  3 Sep 2022 09:27:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2015F410DF;
	Sat,  3 Sep 2022 09:27:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2015F410DF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 000551BF350
 for <buildroot@lists.busybox.net>; Sat,  3 Sep 2022 09:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF70280C64
 for <buildroot@lists.busybox.net>; Sat,  3 Sep 2022 09:27:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF70280C64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f8eMJX3nt_uz for <buildroot@lists.busybox.net>;
 Sat,  3 Sep 2022 09:27:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8102480C5E
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8102480C5E
 for <buildroot@busybox.net>; Sat,  3 Sep 2022 09:27:51 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id v16so5033906wrm.8
 for <buildroot@busybox.net>; Sat, 03 Sep 2022 02:27:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=ahZq7WQzYa+cOLYBdUwE/Y0YbeA3UcfSq9N2wkZHEOs=;
 b=yHFFqGsUGFzl0xT+nQPo0qaCjKtB1FuTkgfgTNY0lEXx+EMbEyfa6O01pHrqyYBSWM
 y/rPKAxp0wvFYZRg17OGHy0ZGeFuTsySdzTpWOBilb56EG2GyaeytDHEQGkAlYwvyBjh
 51fwNCl5X8V5BjAFmbep7cDuSLo8FjgEgeuHxG4K+nfG/9NMUCCFTfvMefQhGPOuhzj/
 q1s/ENOzgX4f/GrcIiP5hl37TsLjk/NmpatIjS6zgAZ47M1s1IlqVuQbCUUOAi1Qpu9H
 cM+HHhIu0Q0L2XPvDapnWDbgokQeQ1I6LfYAzGvBz+2FvaKsP0WNZ6Ocn+FnVrH9B9Y+
 gGXw==
X-Gm-Message-State: ACgBeo1xB4dGBU1PcR0+A2+uTHnMNWBHT4ajonnbD8YwcUs7d7p6xP0t
 gaJaeq87fiBp69PdhoFgwFkOLPP6Mno=
X-Google-Smtp-Source: AA6agR6Lx3oWPUfZaN5rRjHzEsYwoLhwMwIXwEx5YI0img5yu5eo/ACZFutIPqRrcNuxbMsKZxwBvw==
X-Received: by 2002:adf:e490:0:b0:226:de4e:9897 with SMTP id
 i16-20020adfe490000000b00226de4e9897mr15121479wrm.457.1662197269471; 
 Sat, 03 Sep 2022 02:27:49 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 m14-20020a5d56ce000000b00226d238be98sm3252944wrw.82.2022.09.03.02.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Sep 2022 02:27:49 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat,  3 Sep 2022 11:27:01 +0200
Message-Id: <20220903092701.1848400-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=ahZq7WQzYa+cOLYBdUwE/Y0YbeA3UcfSq9N2wkZHEOs=;
 b=E6cuNcv2eF42i4QL3+mrbf2xZJi0XVYPGxdOay+bG+xtCnhamI8mNBkZyU75B5ZoIP
 O4826VPGypzjaOpqGFZUNnfWCBlbq4UW2SBhSq6eKRrSNi2IUN4J5692FHSmjrYT3TsI
 aZfvUHDr5HkFSZixARAmLEvk7rNnQwUrUzyPoQp1u10+ot6FVouPeWCsNUHEI0dtzvFq
 wfHutBVCFzhu+plND7ptsm2gi/0toFMvsc25/NxY2TeNniYYDSflLcGCJjIB/Y4DRdkB
 yMHdkqqzAK+IyARiRXGZbNnW4KPFSnEbHzISCDXbwBs1VKJvyU0f+MOg7XNIDV6Pgfja
 Ie2Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=E6cuNcv2
Subject: [Buildroot] [PATCH] package/mosquitto: security bump to version
 2.0.15
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

see https://mosquitto.org/blog/2022/08/version-2-0-15-released/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/mosquitto/Config.in      | 2 +-
 package/mosquitto/mosquitto.hash | 4 ++--
 package/mosquitto/mosquitto.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index b4effa36b..6fa5f79c6 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -17,7 +17,7 @@ config BR2_PACKAGE_MOSQUITTO
 	  implementing MQTT clients, and the very popular mosquitto_pub
 	  and mosquitto_sub command line MQTT clients.
 
-	  http://mosquitto.org/
+	  https://mosquitto.org/
 
 config BR2_PACKAGE_MOSQUITTO_BROKER
 	bool "install the mosquitto broker"
diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index 24b8869d1..2cfd0d942 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking gpg signature
-# from https://mosquitto.org/files/source/mosquitto-2.0.13.tar.gz.asc
-sha256  d0dde8fdb12caf6e2426b4f28081919a2fce3448773bdb8af0d3cd5fe5776925  mosquitto-2.0.14.tar.gz
+# from https://mosquitto.org/files/source/mosquitto-2.0.15.tar.gz.asc
+sha256  4735b1d32e3f91c7a8896741d88a3022e89730a1ee897946decfa0df27039ac6  mosquitto-2.0.15.tar.gz
 
 # License files
 sha256  d3c4ccace4e5d3cc89d34cf2a0bc85b8596bfc0a32b815d0d77f9b7c41b5350c  LICENSE.txt
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 3e7a728ac..c47e61850 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 2.0.14
+MOSQUITTO_VERSION = 2.0.15
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-2.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v20 edl-v10
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
