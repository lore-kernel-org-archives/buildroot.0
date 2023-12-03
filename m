Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A58C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 08:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4033D60E08;
	Sun,  3 Dec 2023 08:45:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4033D60E08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4iR4Kdmsn8KC; Sun,  3 Dec 2023 08:45:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A380E607F0;
	Sun,  3 Dec 2023 08:45:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A380E607F0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5452F1BF391
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 08:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A6EB403B3
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 08:44:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A6EB403B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rnhiSZ_RCaeX for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 08:44:57 +0000 (UTC)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B718A400CB
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 08:44:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B718A400CB
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3332f1512e8so2045591f8f.2
 for <buildroot@buildroot.org>; Sun, 03 Dec 2023 00:44:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701593094; x=1702197894;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wSGLz4+S2rQiBoeGWBIUIljCnzPvpOj460lJmhQnyR8=;
 b=hB/LpLvrxc/gv89Eg8ZJlD67OOJQZr2SIFGaXO//IN3Ru+KRQFWx1zSEkkJgQtmfl4
 /ZDEGUysB2qt9n2lGD0FKNxfi9bg6f/E/qavu/OP3OEOfhPZTc35ZNbYcm4ZA5CLrFOE
 ocDPbe5AYxmoUATSMkQ7ZGst3TCctPm6MZ4evuEL7sjwgRx2D5Pk82A43iFcpBAMQzti
 FlVosNHHgoNuaz/tXrha+K/I/oPHjQAgzIkEf25vLz/Cua0JL9V1ahbi58v18gx7Ni+X
 awfLwhzxZjc7/XC2gaGNOprDUiNz1wqtvkAu6ZcA40JUHIztHhjssju1C8VIbgsePpjZ
 Ynyg==
X-Gm-Message-State: AOJu0YxAYKoxmnyo3bKZ1ZTpIepfla5o/I56PmTn2b1SDpsrKUoQftwc
 hniPpd4/iTNl2ANZSVDdQ3YWNlyx5Uo=
X-Google-Smtp-Source: AGHT+IHG9ikHEpDD+nmhFoQsaNqnrwSxQFjfyPUrpVdK1NLHw12F0dWXdT3NkX7RN7mGonTmDqZQ9g==
X-Received: by 2002:adf:f383:0:b0:333:194f:2c4f with SMTP id
 m3-20020adff383000000b00333194f2c4fmr2092789wro.6.1701593094208; 
 Sun, 03 Dec 2023 00:44:54 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 x18-20020adfffd2000000b00332fd9b2b52sm3118223wrs.104.2023.12.03.00.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 00:44:53 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Dec 2023 09:44:45 +0100
Message-ID: <20231203084445.471234-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701593094; x=1702197894; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wSGLz4+S2rQiBoeGWBIUIljCnzPvpOj460lJmhQnyR8=;
 b=E9M5kQqAN4/1uX1d2uDD6pAzdEuw8emKkl2PHvOheLS24u7SYOdlwL7pIymaO/kshP
 th9t9gWvKgiHXVd2MPSQrawLqPzuH+bt2pBbkue7bZ9FedTU9mcmCRjtXbPngriPSdqm
 Klfyo9mURopgDRAxibkTUv+UqaUnCLuxKdgxn6+nslMujU03OkTdqjq47WMEu3+WuCyT
 le/5n3a3/UaXcXM5xYlWpRFF3H+TtzIXs5n+XrRhS5hP4H2KILsWAYRsaMB/u4IseFYm
 OfniDhOCF6mLmWcTxYkYsSe+UWmi5QeoHPjKLFViYQWO0fKfmBszHspwrgANAqIInmP/
 gwHA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=E9M5kQqA
Subject: [Buildroot] [PATCH 1/1] package/libmemcached: fix build with gcc 4.8
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

Fix the following build failure with gcc 4.8 raised since bump to
version 1.1.4 in commit 7205df8a4f3c729b11a5f0c34885e6cf592f24b9:

/home/buildroot/autobuild/run/instance-0/output-1/build/libmemcached-1.1.4/src/libmemcachedprotocol/ascii_handler.c: In function 'ascii_get_response_handler':
/home/buildroot/autobuild/run/instance-0/output-1/build/libmemcached-1.1.4/src/libmemcachedprotocol/ascii_handler.c:249:3: error: 'for' loop initial declarations are only allowed in C99 mode
   for (int x = 0; x < keylen; ++x) {
   ^

Fixes:
 - http://autobuild.buildroot.org/results/202aeec4dda822ac341d8882f84f968a303697c3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmemcached/libmemcached.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libmemcached/libmemcached.mk b/package/libmemcached/libmemcached.mk
index f86cdd3bbf..63df8f5c20 100644
--- a/package/libmemcached/libmemcached.mk
+++ b/package/libmemcached/libmemcached.mk
@@ -16,7 +16,9 @@ LIBMEMCACHED_CPE_ID_VENDOR = awesome
 
 # Force Release otherwise libraries will be suffixed by -dbg which will raise
 # unexpected build failures with packages that use libmemcached (e.g. c-icap)
-LIBMEMCACHED_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
+LIBMEMCACHED_CONF_OPTS += \
+	-DCMAKE_BUILD_TYPE=Release \
+	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -std=c99"
 
 ifeq ($(BR2_PACKAGE_LIBEVENT),y)
 LIBMEMCACHED_DEPENDENCIES += libevent
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
