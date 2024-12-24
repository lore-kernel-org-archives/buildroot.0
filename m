Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A700AE7718D
	for <buildroot@archiver.kernel.org>; Tue, 24 Dec 2024 16:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55B8060857;
	Tue, 24 Dec 2024 16:15:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qi6MZNXiJb53; Tue, 24 Dec 2024 16:15:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FBCF6085A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FBCF6085A;
	Tue, 24 Dec 2024 16:15:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D20B0757
 for <buildroot@buildroot.org>; Tue, 24 Dec 2024 16:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0AD060857
 for <buildroot@buildroot.org>; Tue, 24 Dec 2024 16:15:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EavLBzTHXBtZ for <buildroot@buildroot.org>;
 Tue, 24 Dec 2024 16:15:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D77B76085A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D77B76085A
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D77B76085A
 for <buildroot@buildroot.org>; Tue, 24 Dec 2024 16:15:23 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4361aa6e517so7543615e9.2
 for <buildroot@buildroot.org>; Tue, 24 Dec 2024 08:15:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735056921; x=1735661721;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CozeesZs45iDJ2MDS4hDO6oCp9y9kPnEAQ9/HNRlQcQ=;
 b=lZ52qAHHySvVjFjf9UWmR/dAzQwdaPv3vHT/yFM8uKMe3bT4BBf4S8bbcADLqzB7QK
 8ktkYRbxEZ3bdkv1RkYZ3Gb8ipR6RiIvqci1doEFc09zZvIFUY44AUblHh6dpnSKHpwO
 rOsoMHFHYhxKPYFFfB+pVOwCfKZk0RDnvueRWh9dGvCezrQ6TMzi2qjHMEizc6l0bElY
 ABE5EbmBeMT/tYFks87NBNBPobGH7bgm18TxiTQdk4fDE7ILoRL9htzKdk+Q4bZ8kf1V
 v6cUMFJASv8klqG1bzpaZAcHfN9qoLFqVcZMxGpTa0NDA/Glibt9SQtA1XXkjFBj5Nt2
 281A==
X-Gm-Message-State: AOJu0YyNkxB+XgTip3k90A7kruHkSFkwJw/T+N85HP1JLEItt9l1jg9S
 /zdTF4xXMPCL2x2g7z1WmNdfTPfg7vLaqhYCSAAgN8j3PSQf6udXVeLr/iykDOzyr0G1t1GMoC3
 V2nQ=
X-Gm-Gg: ASbGncujikwkDYUvIRb2Ltk5Rly7cAdfTAjIULBQIW0r0ScqG/yBUBHKuGWKoz0kz06
 Yi2S9zP/aZieldHAF8mPLL5rPN8u2c3MXu38ojQPriJxxXdqyuVMiihvyJsNlvxXNOggReA7mta
 APRWJ5gIhEf0/ZzKO7O9FfZ5/CZ95Qb8Te/alm4DdnvIYW9vq+Bt/MalkXMZt5kJAar9EiggshI
 F8zlDcNdl+vRUi6iieJN3dsgKoXiVKdd/IVfT8sgNsWvWIN1UnuGVABatquYzcISq0aLmw1Bo4h
 19j24Q+yZ3CU
X-Google-Smtp-Source: AGHT+IEuDT5z2BwRkDn9vauAu5Wy4DHQo+PJx+nO6Y8CzQo4tCRTTrVb7d3zamcAb13DGOB1yBshCw==
X-Received: by 2002:a5d:64a6:0:b0:386:352c:9119 with SMTP id
 ffacd0b85a97d-38a221f7401mr6368859f8f.8.1735056921355; 
 Tue, 24 Dec 2024 08:15:21 -0800 (PST)
Received: from localhost.localdomain ([212.22.143.210])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c828d39sm15004580f8f.9.2024.12.24.08.15.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Dec 2024 08:15:21 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Tue, 24 Dec 2024 17:15:09 +0100
Message-ID: <20241224161510.410850-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241224161510.410850-1-adam.duskett@amarulasolutions.com>
References: <20241224161510.410850-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1735056921; x=1735661721;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CozeesZs45iDJ2MDS4hDO6oCp9y9kPnEAQ9/HNRlQcQ=;
 b=RYMC3QA7fCRsJEgKVXoUdt3p+IAMhDfF7Q6akCX1O019DKVrkCXt8EyoEXoCv+FIrQ
 zDM0mmJo6zmgEEC5mN/86OVsjsv6kO8wF/ltwtOJbaQ6cYOqy7J0DwIuVPckypdSIFkD
 aQWukGDoGlujUavr5A9GxbpjwLo141NudXRwg=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=RYMC3QA7
Subject: [Buildroot] [PATCH 2/2] package/mender-connect: bump version to
 2.3.0
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

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/mender-connect/mender-connect.hash | 2 +-
 package/mender-connect/mender-connect.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mender-connect/mender-connect.hash b/package/mender-connect/mender-connect.hash
index 5f7e082e1b..4b18a540cf 100644
--- a/package/mender-connect/mender-connect.hash
+++ b/package/mender-connect/mender-connect.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  7e83c4cabc090ed26088036c6c68fc8e73546fa4a75db817f676dc8b1e8a3c8f  mender-connect-2.2.1-go2.tar.gz
+sha256  c90a5f5e2d7ab4396e04d1914e2cbb2a16cb11c1d6e038b889ba7ff941f1e02a  mender-connect-2.3.0-go2.tar.gz
 sha256  c57e1178f932015d7f08b4d76c4b18e4a55083a6fbc97629cd25ef426bf1db30  LIC_FILES_CHKSUM.sha256
 
 # Vendor licenses
diff --git a/package/mender-connect/mender-connect.mk b/package/mender-connect/mender-connect.mk
index f4f7e0f195..9e6fb87ed5 100644
--- a/package/mender-connect/mender-connect.mk
+++ b/package/mender-connect/mender-connect.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MENDER_CONNECT_VERSION = 2.2.1
+MENDER_CONNECT_VERSION = 2.3.0
 MENDER_CONNECT_SITE = $(call github,mendersoftware,mender-connect,$(MENDER_CONNECT_VERSION))
 MENDER_CONNECT_LICENSE = Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT
 
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
