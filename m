Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65784C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 21:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1A3960A6B;
	Sat, 30 Dec 2023 21:28:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1A3960A6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xvj-7Oz_5dOr; Sat, 30 Dec 2023 21:28:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63A9060810;
	Sat, 30 Dec 2023 21:28:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63A9060810
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8447A1BF867
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 21:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B7EC4038B
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 21:28:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B7EC4038B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gEg7OQ1jTP4v for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 21:28:44 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3FDA5400D1
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 21:28:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FDA5400D1
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40d5d898162so27072505e9.3
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 13:28:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703971721; x=1704576521;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3EqcJ3R66NfgDvI4kfC6v+W3S/deh2C24FvhpbSj7Uo=;
 b=wUTSRPloOmgfzo6iC1ebIqV1rmBoxRKjOhSPbx3RNQ1y4oOjRvM21MDqvGCCR8/OjR
 EEhwsOIcC+/rog1LkcAEljDDhYrvgI3Y1Wlz2SD8OLNrpv5LyPVHbtSf7359XEVcbqD9
 dl1wFPU6rztowxbktm1MGd1zWv9x6jWoUNLXJXzq7lg0GDRqJt06sHs/eXntwJf8T5Te
 CURV0wQUQMAgLjCNM+fcRq8dgL3/pkpgnkUtBEFzIBq1AGsaJ6cAQw5rFcpTTOLWm1xy
 pAQKWDbjeMHZlUzjcukKF5xYLtzNV1xzmeCFj74diyGr14QzEyf0kO8pWJraq2Gce7e5
 PQpg==
X-Gm-Message-State: AOJu0Yxa641pYfbSYlkkbSi3AEIBk4mNZT0etmjZBEABUsyJ+USHrTbs
 ol29cNSAbLIp9Ok5Spx3qe0O+TtIIkM=
X-Google-Smtp-Source: AGHT+IFpNVUXU9QuDPDHr/I/fMg7nB4wcPPGD4phZ/eiY1IpR4bLt2T3YmvOUAFRhDzzPOmpWhfzaQ==
X-Received: by 2002:a05:600c:1e0c:b0:40d:8563:8163 with SMTP id
 ay12-20020a05600c1e0c00b0040d85638163mr295796wmb.100.1703971721446; 
 Sat, 30 Dec 2023 13:28:41 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 bd6-20020a05600c1f0600b0040d5335079dsm25287795wmb.47.2023.12.30.13.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Dec 2023 13:28:41 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Dec 2023 22:28:37 +0100
Message-ID: <20231230212837.1384148-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703971721; x=1704576521; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3EqcJ3R66NfgDvI4kfC6v+W3S/deh2C24FvhpbSj7Uo=;
 b=g0fLujVBfVdJprhdDMuikHugk4YpV10IVRj1XzeYvKIPmNHSN2W0hy6Xry03kBJo9F
 sYobrX/olzFmAfmZltePlkD/HA6avXfajt+vDfGV+LWDIwtpUTL2yvBbbwavfIKmfO80
 Prkcjg7/46tqbUpssRDXbtD8nOwxoySqntC88ujYgwXpzxjGIdzL5pElcNaFXt5tDctX
 /02hgrX5i7oi0E/ss4+TamCGJsCykqcNiChzW+Y1k1WnXyYD8j2AF8Dt3/X6g7VbJjz5
 jNuwSOaFFCTJCWgMF/Somqj5emZI+jiAfuxR74UtWMoR3kp0qgdEKAW+I8OKtkEXwaFc
 se9w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=g0fLujVB
Subject: [Buildroot] [PATCH 1/1] package/logrotate: bump to version 3.21.0
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

https://github.com/logrotate/logrotate/releases/tag/3.21.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/logrotate/logrotate.hash | 2 +-
 package/logrotate/logrotate.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/logrotate/logrotate.hash b/package/logrotate/logrotate.hash
index 9c8e73f738..cc466a6f4e 100644
--- a/package/logrotate/logrotate.hash
+++ b/package/logrotate/logrotate.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256  742f6d6e18eceffa49a4bacd933686d3e42931cfccfb694d7f6369b704e5d094  logrotate-3.20.1.tar.xz
+sha256  8fa12015e3b8415c121fc9c0ca53aa872f7b0702f543afda7e32b6c4900f6516  logrotate-3.21.0.tar.xz
diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index 453dbe477a..37c48121f1 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LOGROTATE_VERSION = 3.20.1
+LOGROTATE_VERSION = 3.21.0
 LOGROTATE_SOURCE = logrotate-$(LOGROTATE_VERSION).tar.xz
 LOGROTATE_SITE = https://github.com/logrotate/logrotate/releases/download/$(LOGROTATE_VERSION)
 LOGROTATE_LICENSE = GPL-2.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
