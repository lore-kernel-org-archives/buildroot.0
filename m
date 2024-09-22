Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E7A9CF9C6C
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 05:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C438F4068F;
	Sun, 22 Sep 2024 05:05:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0BE3ARm80HYo; Sun, 22 Sep 2024 05:05:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50B214068B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50B214068B;
	Sun, 22 Sep 2024 05:05:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 882151BF3C5
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 05:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 720044068B
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 05:05:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WQowhGYHBtdW for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 05:05:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12e; helo=mail-il1-x12e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1B73940680
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B73940680
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B73940680
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 05:05:55 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-3a0cad8a0a5so10621445ab.1
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 22:05:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726981555; x=1727586355;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PYlWFZcRnUEfGtjkFYdrgEOZkas3yPvt3p/7Vz3KW0Q=;
 b=uSAUuRY2SxU0wFxuf1mhMNB8LTE3QZoekjynEnaMDG5dCV2rcDouAAMoH3MLxTD7j3
 07iQ/bGJHjJ44QjwLCMvt3MBoHyKnuXUaLKGogaYK7yhOho2gcC532ChASMwufvLCCyA
 c0cAG38DEyZfrOn264jJki2hpSH3SBVbOYwI9sInDNaT205xY5etIOOynnifWVmfZ699
 PIaPtvnVdC7GKF0uYj563596K/ej5IdfsPVjhhYNtGnwqMYvTsO26kXxr4TPvg3nYtqy
 x3Z/XzM+/M54rA5GP3SEJ1QaVe/cdzK2Jpx5h/afvpQNA9SWGizKyhRhk8U2DIc+kLnr
 mu4w==
X-Gm-Message-State: AOJu0YxxEBey4EdG+xxZ7PrxfLVy4pRtHb0rgOvLdXl2CAyUQdVTUvun
 gOxUKvEsYc6yV+MGxLkzGjH5FGBXyCLqkvGdWtog7OV3KFKjILsUM584NQ==
X-Google-Smtp-Source: AGHT+IF77XArnonRKAKsM10M2fNqVhMgZqxZ3Hqh2/1lRa7vsdaVkQvY1Diazc6jw9+NQoZqROEnBw==
X-Received: by 2002:a92:c56a:0:b0:3a0:9b0c:6b2c with SMTP id
 e9e14a558f8ab-3a0c8d26317mr56636735ab.18.1726981554583; 
 Sat, 21 Sep 2024 22:05:54 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed61d75sm4416265173.176.2024.09.21.22.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 22:05:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 23:05:52 -0600
Message-Id: <20240922050552.927526-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726981555; x=1727586355; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PYlWFZcRnUEfGtjkFYdrgEOZkas3yPvt3p/7Vz3KW0Q=;
 b=fhdIjhZyspBgmXGyCJkEVrms7YrfcXxdIXVAtKrwmjmxy2pcW8+CImVWSWft6nBUlX
 u+s9w+hP8oKpA+39BqFyMz9zYyKfdOQ/ECXX4Gi6bwvqpYOTlyYV7Ylf5ZrbIlfzjVdT
 8TGBFrh5oxnnGxL8qXhoXTQ8mwN/wDaaD66fAVYedMNMlj2n9MmDks/Cl89qo/kXoevY
 +GMJ8UX8LiAQrdAfJeVs/jAXMPiVmypMw85Dp742ApJOAn2dowNVYGYdt9x+NBdn1xtZ
 wyxFzNwi96avG5t5JghgB0T3uzjZerWoGbrBbO5HqW9bCMOAwAmV4Sqsws9lIpgrv1g1
 UjoQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fhdIjhZy
Subject: [Buildroot] [PATCH 1/1] package/python-trio-websocket: bump to
 version 0.11.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop no longer required python-async-generator runtime dependency.

Add license file which was previously missing.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-trio-websocket/Config.in                  | 1 -
 package/python-trio-websocket/python-trio-websocket.hash | 6 ++++--
 package/python-trio-websocket/python-trio-websocket.mk   | 5 +++--
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-trio-websocket/Config.in b/package/python-trio-websocket/Config.in
index 7d35fd0296..1b9093e5d2 100644
--- a/package/python-trio-websocket/Config.in
+++ b/package/python-trio-websocket/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_TRIO_WEBSOCKET
 	bool "python-trio-websocket"
-	select BR2_PACKAGE_PYTHON_ASYNC_GENERATOR # runtime
 	select BR2_PACKAGE_PYTHON_TRIO # runtime
 	select BR2_PACKAGE_PYTHON_WSPROTO # runtime
 	help
diff --git a/package/python-trio-websocket/python-trio-websocket.hash b/package/python-trio-websocket/python-trio-websocket.hash
index 3e6e832d90..b7e8302b58 100644
--- a/package/python-trio-websocket/python-trio-websocket.hash
+++ b/package/python-trio-websocket/python-trio-websocket.hash
@@ -1,3 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/trio-websocket/json
-md5  37b141910bdafa3c9b6731aa16646acc  trio-websocket-0.9.2.tar.gz
-sha256  a3d34de8fac26023eee701ed1e7bf4da9a8326b61a62934ec9e53b64970fd8fe  trio-websocket-0.9.2.tar.gz
+md5  3d9bb51b62f562dbdbc2ec067132c4a6  trio-websocket-0.11.1.tar.gz
+sha256  18c11793647703c158b1f6e62de638acada927344d534e3c7628eedcb746839f  trio-websocket-0.11.1.tar.gz
+# Locally computed sha256 checksums
+sha256  2d5e3fc506b6c87ad93b77b9aa76009a58fea72be5fb56e6803bc08cb2887999  LICENSE
diff --git a/package/python-trio-websocket/python-trio-websocket.mk b/package/python-trio-websocket/python-trio-websocket.mk
index 4522b87c9c..3e79bb7108 100644
--- a/package/python-trio-websocket/python-trio-websocket.mk
+++ b/package/python-trio-websocket/python-trio-websocket.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-PYTHON_TRIO_WEBSOCKET_VERSION = 0.9.2
+PYTHON_TRIO_WEBSOCKET_VERSION = 0.11.1
 PYTHON_TRIO_WEBSOCKET_SOURCE = trio-websocket-$(PYTHON_TRIO_WEBSOCKET_VERSION).tar.gz
-PYTHON_TRIO_WEBSOCKET_SITE = https://files.pythonhosted.org/packages/75/91/44a0a016025794ba9fef530a6fbe59987153e2cbea7e11fe2f3d8c618740
+PYTHON_TRIO_WEBSOCKET_SITE = https://files.pythonhosted.org/packages/dd/36/abad2385853077424a11b818d9fd8350d249d9e31d583cb9c11cd4c85eda
 PYTHON_TRIO_WEBSOCKET_SETUP_TYPE = setuptools
 PYTHON_TRIO_WEBSOCKET_LICENSE = MIT
+PYTHON_TRIO_WEBSOCKET_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
