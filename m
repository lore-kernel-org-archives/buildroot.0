Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75006C433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Jul 2022 21:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C991A4234E;
	Tue, 12 Jul 2022 21:47:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C991A4234E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fMCK8-ZkyYMI; Tue, 12 Jul 2022 21:47:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E5994234C;
	Tue, 12 Jul 2022 21:47:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E5994234C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5B5DC1BF37B
 for <buildroot@lists.busybox.net>; Tue, 12 Jul 2022 21:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43EF7841F8
 for <buildroot@lists.busybox.net>; Tue, 12 Jul 2022 21:47:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43EF7841F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cG2yA9O2Iz8g for <buildroot@lists.busybox.net>;
 Tue, 12 Jul 2022 21:46:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6863841FA
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E6863841FA
 for <buildroot@buildroot.org>; Tue, 12 Jul 2022 21:46:58 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id f2so12958833wrr.6
 for <buildroot@buildroot.org>; Tue, 12 Jul 2022 14:46:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mvgkiK46CSpXEqoCW2pgaE99d+ogCmslDiFKD779OiY=;
 b=QSqaCQ3HCDSvK9yKZK9Cn7LJYkC4HVYnNuQOb8CM4SoLIwgSqxdbLsZTFm1iJlAVFb
 Aj/p1z6SvnapzcBUNgX4kHZRwdZvlcPILs9dqSa5qzU/CztGIGhZ+eI8gzZMAn19M2Gn
 HBF3liKTRwhXSDUE1l38NVIJlp7MeLGtyvQTYw4If0GciTpYCA4GfUrBqm/3Uo3ZxJVT
 6jIddwM10s0K7eCEWeAXCjxbVjAZW6XKJQEdw4J2+vAV2iCwVWCiDYSu/3nz6lere87z
 UCnw3LPbVno30SMBxvYaf+3Q2GYhLLZkKInAL1/JGTYdVEGfHSMxM4DhjJSqGsoTVfpD
 MY3Q==
X-Gm-Message-State: AJIora8N21QgXpi6Y6YuHaw/9idPEtSTJdzP8G1v3H+L2bpFMaJXnfRU
 oogD1uVzBSXWmNTEqszlok8Q1m1VZwM=
X-Google-Smtp-Source: AGRyM1uj0ddD1ZD6u9cn7ZLF5B2KZ8t3tuqRHJsocXBx+gcZa9rO3yaw6bmT3tsq8sxPtei5F92nwg==
X-Received: by 2002:a5d:4e49:0:b0:21d:6e8a:fa3 with SMTP id
 r9-20020a5d4e49000000b0021d6e8a0fa3mr69330wrt.528.1657662416885; 
 Tue, 12 Jul 2022 14:46:56 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 j11-20020adff54b000000b0021d65675583sm9101066wrp.52.2022.07.12.14.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 14:46:56 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 12 Jul 2022 23:43:56 +0200
Message-Id: <20220712214356.1976809-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mvgkiK46CSpXEqoCW2pgaE99d+ogCmslDiFKD779OiY=;
 b=RH3Gzd2/FCLQq3d923hyaEe+XYd/FGVWAaYJjFJG4kk3jq8aCfkAimRmMek4O57zSc
 E2S1oDKk+JWdTXM2fOdlqYITwmFkJb8mbYNJUFGEthCwsQzhhL/CNvJle/Z+LnVGFuGM
 2BNh2YbGJgb/Y4dLaC3AVZi/sd01+Bog9To3Gmzw9eTQ8qJ+zsdfuVWzYrigQCOktBXM
 6ZDiSdYqhLKlB4L9+eL4FItSqZnZ3P26zLEQ1iZN0Zav/oPajs6EKYPDvFLIXk8nafJo
 MrH0r/PPMkGquhR+8Sy36bqx5uvDQmvV7hnACbIGIRmjdjTBClG7khs3pVTDRDxdPtez
 RDNQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RH3Gzd2/
Subject: [Buildroot] [PATCH 1/1] package/haproxy: bump to version 2.6.1
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

https://www.mail-archive.com/haproxy@formilux.org/msg42473.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/haproxy/haproxy.hash | 4 ++--
 package/haproxy/haproxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index 4b00438190..7a870d7c0c 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.0.tar.gz.sha256
-sha256  90f8e608aacd513b0f542e0438fa12e7fb4622cf58bd4375f3fe0350146eaa59  haproxy-2.6.0.tar.gz
+# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.1.tar.gz.sha256
+sha256  915b351e6450d183342c4cdcda7771eac4f0f72bf90582adcd15a01c700d29b1  haproxy-2.6.1.tar.gz
 # Locally computed:
 sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index ef144053d6..de7accf4ce 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HAPROXY_VERSION_MAJOR = 2.6
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).0
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).1
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
