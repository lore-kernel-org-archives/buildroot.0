Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E3D4E92FE2
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 21:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AC0A406A1;
	Mon, 29 Dec 2025 21:22:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SgCfutLyCleX; Mon, 29 Dec 2025 21:22:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8980E405BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767043324;
	bh=4FG8Nta/jQmZEtwYpkdwk/Xs0wh3aVDIlki0EAYRxg4=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=hfNQwCX1MCldeJ6cjJb7gi/39AiSYBquB6XPxvQ5PYe19mxtf14QYwVKHnMhc3x3/
	 v1a7vJrd5cPWEyKIAx032w5RYITFSXMgGQk6Nz5BcODEf2v8HN6s/cn5MeXvDhu18T
	 vnBYejYGRaCymdTn/SNYfhzxz6419t5wPeFnrqcDksqABnmliaDJgs4UiVAFAINAzP
	 31MNFK2CfMX/yZAeCUZBLCO22IzkX0l8nPvqvM+P0i8lPObDvhV6/JMHf+dKSXsy+4
	 9krT2eLHPXiA3i6K9VTWh6x78VcKugX/sreD+VFXTz/rjS0eXT2Fkz7KO1qmKpRFmR
	 CjWr/wjLjj2pg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8980E405BB;
	Mon, 29 Dec 2025 21:22:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B8D2F35B
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A89CE60AE5
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:22:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fQ8T0HxFZbgA for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 21:22:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B1BBF60AEA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1BBF60AEA
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B1BBF60AEA
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:21:59 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4775e891b5eso38257995e9.2
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 13:21:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767043317; x=1767648117;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fGmuBZDQy4j3oOztHCB4Bb1Z4P4Gby62YuozCickQ08=;
 b=SHrOyaZGsCyqHjMaXWGzPqnR3Eynvn8jvMondJTslP/t/yvesxQcj1QhEAzH0p2hh5
 J+qw18meTVabWRVzxL2rq8PWGMwaC5oEaohQSmAtr6jZ7tiH5iWYO0VvywSlm4dJZWNv
 bbun/Bc6w44d1+A9JG+M+Kkvw9gMz2kcbwom5yI4seU0dRhtthsSkPVN6DjJOJDCy0z0
 X9BniXnV8Ena2MusOZZrMaiMmfN9YdQ+YTxx0ANivml57G3vpK3iRUDkJ7UYWnOgdWJF
 vtzRXze+1RRKin9CfyF9kIjVPcmB5lwE0hXuuR+dXsE7VqiwiRHC30pyrdozpvqwx+Q8
 9B+w==
X-Gm-Message-State: AOJu0Yy16mkos2nNqE/Q+N+qezhj7dr5OmxqofdNkHHq367SWD1Gmtkn
 nv3hfhVAuFE0SpXXfQN/16LPkSNTdMjDO39wSmPMm1zkJgZRCvKVqQGR19gAEJmhu3Z3Fl7xqhw
 FWP2dfLM=
X-Gm-Gg: AY/fxX5rWd31QW2ZLNP+Ei045IbNWIphBhngeZf62qARo+P8ApiEKoj04GpOWl3JT4r
 MPsKTzJp/GmnohdWKCyvMOv9FlWIzRrXOfvHdRElkqXy/uLv2gsFo4BjEczdPnGnmPfs1u20B4C
 oO92sgNw/ckJ64wQ4KmRIxfxPgklZK6phB1z3OQqEcbg15a3wCW0d53yEVs2L3AMib8aM7jPQs5
 dhnny1/3Ni66XP8BTjH9Z/oofPOm0bqLVYLkz4da2JMpLSbkPR13TlgCUuEuW4cUMF4zoJzHPPu
 U/9owAjWOgFjEwz4vmCDQOcR6LmbkQxcPI8hmmAYXOqOzRYhJ5TDU2LBzctYWdnbH2Jhi+yhS3t
 nBddfOx4sByI8NdJENVyMjxqwsc84JajkwzaL/mIGsBFyE8Szp2RFSyHxET6EUF6d4bA6Be0KqS
 toqUI=
X-Google-Smtp-Source: AGHT+IFNvm+kL7CmAoGI0ucGLHrfwId8XE/1JMK8Dvd8NGstmxKC8/ZDVecqSZRudZMNJB2vcWWPYQ==
X-Received: by 2002:a05:600c:3489:b0:479:2a09:9262 with SMTP id
 5b1f17b1804b1-47d1953dabamr368817515e9.9.1767043317430; 
 Mon, 29 Dec 2025 13:21:57 -0800 (PST)
Received: from arch ([79.132.229.12]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193cbe58sm556813195e9.9.2025.12.29.13.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 13:21:56 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 22:21:37 +0100
Message-ID: <20251229212149.167902-5-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229212149.167902-1-thomas.perale@mind.be>
References: <20251229212149.167902-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1767043317; x=1767648117; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fGmuBZDQy4j3oOztHCB4Bb1Z4P4Gby62YuozCickQ08=;
 b=KK61+cO5n+k7nNVq2NwA9UamwXQ2mNH5GHBAY67ltT3+cTjUcCOY6ZP0fOIcDi8HQC
 4aczQuvezWs4uZEHEq7au6bU2edRWdCgyEpqp+pxfdVJ+ysMmF4LTUf/ZNhzHrEECmlQ
 EHhcBmVwwKMKv7kfEeMz2lpslgSRY5RO2wE9D+KkH6MdMcXjaVwr/6KvwZwFIcUCWSgc
 txAX1MNGEt5c0qL9AtwPCshe5WKaKvJE6/ZnlZb1n5EVlk0sTdBj8opF3P1bAcmwKb3B
 FnfcOY/wpb6ahj8uxIdPBx6h8B4BmPC6SFZe3qM/CF2aq5qBaSnV1fBmAAuiKozGSAcQ
 fgAg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KK61+cO5
Subject: [Buildroot] [PATCH 04/15] package/tiff: remove stale IGNORE_CVES
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Bernd Kuhls <bernd@kuhls.net>, Olivier Singla <olivier.singla@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Danomi Manchego <danomimanchego123@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Buildroot commit [1] introduced this IGNORE_CVES entry that was due
to a bad NVD entry.

The NVD database has now fixed the annotation [2] and it can be removed.

[1] 740412aefc package/tiff: ignore CVE-2025-8851
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-8851

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/tiff/tiff.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 32bebcf95f..e64a6baf83 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -13,9 +13,6 @@ TIFF_CPE_ID_VENDOR = libtiff
 TIFF_CPE_ID_PRODUCT = libtiff
 TIFF_INSTALL_STAGING = YES
 
-# Fixed in 4.7.0
-TIFF_IGNORE_CVES += CVE-2025-8851
-
 # webp has a (optional) dependency on tiff, so we can't have webp
 # support in tiff, or that would create a circular dependency.
 TIFF_CONF_OPTS = \
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
