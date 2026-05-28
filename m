Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A99CD5BD5
	for <buildroot@archiver.kernel.org>; Thu, 28 May 2026 17:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40F3D42B00;
	Thu, 28 May 2026 17:28:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NOvRI0l6Bdbr; Thu, 28 May 2026 17:28:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A1FB42AF7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779989311;
	bh=oaxtu9Wknzg8+tyqzRk2FKQWO1gPZmX5B6tumMtmNZ4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ju2kGlcU2Ru2369qWce79W3CUmv7+hIW+DOOLRtyB2vTEvBqBz7iYnRRcQizUvA7A
	 fSRQABsmSZMDHDiYjTTVsKQSuftRWnPVRcxizvWFy7pwwfxDy5npiHfNK5tMbFkGim
	 ZVSppWOcfIm1WMgQ+T3LJKezmQ5xfsqpvLZ0OQMP01IHgW2ZN6JOkrEd5dFUWCKKR3
	 E+aJopVvezCE0uiTM1ysWuBGR4x3HJyOw23S4bXxT3QYkMcWqqIKjE/ElfrPzpqT1i
	 rgbG38NL2UIickjVoMzSVgmpM9yMhDMaWNohsaYK4v8YvrOCGPBw/4CBqWR/9xubKh
	 ygeKxQ5I5fXZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A1FB42AF7;
	Thu, 28 May 2026 17:28:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 39F27D3
 for <buildroot@buildroot.org>; Thu, 28 May 2026 17:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36F02608EA
 for <buildroot@buildroot.org>; Thu, 28 May 2026 17:28:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kGBHd8NjhP-j for <buildroot@buildroot.org>;
 Thu, 28 May 2026 17:28:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2444C608AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2444C608AA
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2444C608AA
 for <buildroot@buildroot.org>; Thu, 28 May 2026 17:28:28 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4891c0620bcso84255545e9.1
 for <buildroot@buildroot.org>; Thu, 28 May 2026 10:28:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779989307; x=1780594107;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zsudfxnVHJJivVtPxKLg5L4D8RJ211PgOrTPb1w9Bgo=;
 b=mcvAMlXY1O48hrFf2BT1McjtAyd0wdGIPItQ/KoGC289YZiioZyRF6yVixa4Ycpubb
 97wBVtfJR5cRt10kDSuOZeVNtpcPZL5zFNxjprgbhpufU7iih3N3pbyO9r9yY2999lu/
 8pGL4J6VEP1Js68RZ8SKfMfd+tyTZoMMQ2fn1NZxlcFSLIUalFtGpbw+pBeyWLTElVTv
 ko+djIgiMC4ljVcyLC0KOsn+HauqfI7maL2aNezYotFBye/YEryecUAVMJ4fvKXnhcY4
 aUilIML9lloH7i2wBrNge4Z6al8s9Amf2zPHKXICIx11wMi88L/MbyXptavJQjBFuSds
 QkQg==
X-Gm-Message-State: AOJu0YwIt0ErUFH8mky6jIKjFLWTawO546IlOvNO1nngP3YvOqCf0Ygd
 yhbuE3b0bbyHMGMCQT8HQ6nB6FuPuYbh0gc3XVE4xC9u+Jt3rW8nm187QfW1Tg==
X-Gm-Gg: Acq92OHQfLJ9j8Ow/KVwdU+enLUQ30LGV2HHDtdTonHYWsJ/k+o3lDAURPhrbz/E9Bs
 UB+Sb00K2aovdzcuq1ztvFvGSCyQZdEPBLFCy/FscL/EgxE5seKsDVr3pLo72h05dbr9xpxuHkZ
 P7Ek8l48W+0UJN1SgXgjih6GusR4+XXB6pFYLdN5g+LdBBoDUF5l2NC0ge2ZYtGk6qqpDMVnoQQ
 U7QQE5qQnaZ1JSh5WpEsjGMd18PuBf7h/nz7r0BDkab+sBrLMI9Njq41nq6yVJGN9MB2P5J2gic
 tIFp7j/sYZMqIdzsa8jGUSXmNNYHQMKB+1f3ONu0Drs12gRuAog3TUFUaklQLuUdEvHdZggWYXx
 zAzm5dYyzZEk0pd8/tb3co4Bby6kkEvMY6LPs6x4qxRrz/YWr8+Pkbb7zVQBD+lUET22Id2v3qZ
 IkjQLusGvE30iZvfpDnEbHVTxncEKgBX8flUq5tbSFdg==
X-Received: by 2002:a05:600c:45ce:b0:490:5cd8:d20a with SMTP id
 5b1f17b1804b1-4905cd8d2b2mr300544735e9.11.1779989306674; 
 Thu, 28 May 2026 10:28:26 -0700 (PDT)
Received: from LinkMed ([2a02:8070:2483:7e00:c64b:8476:a88e:af45])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909235f8c3sm50424395e9.2.2026.05.28.10.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2026 10:28:26 -0700 (PDT)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Thu, 28 May 2026 19:28:18 +0200
Message-ID: <20260528172818.26277-1-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779989307; x=1780594107; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zsudfxnVHJJivVtPxKLg5L4D8RJ211PgOrTPb1w9Bgo=;
 b=FT5rHjzdz97H6zoniffWUWILsIergxnWm5Migtr2RQP0Toz2/y4EqJsoMWbd8SuTGP
 AGxWCOngem3Bqc/aGKHdgQywrC5zp27+XN1l3YuRfhdHwKhjlzobrogo4pe6X3QwO4sM
 o4X1ddRCHFgktPuqmDq3D9HOVn6QWDjpYIJXJwmLDPTDWKb6MRjREkbWCqAMk9VIcuAB
 i29mXzNlumsofg8EVPJNFKK7npcpZEYplNCd3hr5hbQF91rqXWpEW/u6cn+7z1js0UcF
 6qCm/5dYFhAWuQBfzbI700MsbRNcC3hkFR4YngOflExRIN0WrvBHQS9Nwm8O23jOVI7v
 joXA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=FT5rHjzd
Subject: [Buildroot] [PATCH v1 1/1] package/sway: bump to version 1.12
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

Also fix the current build error with 1.11, because sway 1.11 cannot be
build with wlroots 0.20.0.

Changelog:
https://github.com/swaywm/sway/releases/tag/1.12
Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 package/sway/sway.hash | 5 +++--
 package/sway/sway.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/sway/sway.hash b/package/sway/sway.hash
index 46f2bee753..2b8a8ee990 100644
--- a/package/sway/sway.hash
+++ b/package/sway/sway.hash
@@ -1,5 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://github.com/swaywm/sway/releases/download/1.11/sway-1.11.tar.gz.sig
+# https://github.com/swaywm/sway/releases/download/1.12/sway-1.12.tar.gz.sig
 # with key 34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48 "emersion <contact@emersion.fr>"
-sha256  0e37a55b7c3379230e97e1ad982542b75016a0c7d6676198604e557f9b373dae  sway-1.11.tar.gz
+# Unfortunately, the keys expired on 2025-04-03.
+sha256  a7b1becc217433c11c6284d36bcea0687b87b77b0ed26a384565292ec321f2b1  sway-1.12.tar.gz
 sha256  bd35722bff46327f5eded1d211207277bbe043d2a22048b282c42ef801593b8b  LICENSE
diff --git a/package/sway/sway.mk b/package/sway/sway.mk
index a497a2cbe7..56d18ef6f9 100644
--- a/package/sway/sway.mk
+++ b/package/sway/sway.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWAY_VERSION = 1.11
+SWAY_VERSION = 1.12
 SWAY_SITE = https://github.com/swaywm/sway/releases/download/$(SWAY_VERSION)
 SWAY_LICENSE = MIT
 SWAY_LICENSE_FILES = LICENSE
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
