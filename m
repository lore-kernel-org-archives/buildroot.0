Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39208C38A2D
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 22:14:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC46A40165;
	Tue, 25 Oct 2022 22:14:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC46A40165
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y95r-JtHfBSn; Tue, 25 Oct 2022 22:14:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1BE7400D1;
	Tue, 25 Oct 2022 22:14:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1BE7400D1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 893571BF5DD
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 22:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64816607F4
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 22:14:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64816607F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rAGPeaiofyte for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 22:14:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00486605B0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 00486605B0
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 22:14:50 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id bu30so23426808wrb.8
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 15:14:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tFuCsOv/rmikwFkX7GNp5zjbDpFZmwS4+ppFXO2NiFY=;
 b=etJ4sKhyUB9ox6vZ6L2QGfAzOQH+FgH1+svem0qEr/sbQw8TbnDVF57/QIsLXwYb9n
 qfxf5EhAqa2u6dpFej3ET8c0l5xf45XIdmgfWG95QyV+Z6yY22XdfrCZkvHG0KxvUDzH
 X9Ufu6Yyvwboj7d5P8NcjqCeuC3u7OzSNmMZizyOq3RqkB/MeOrOSl+LHNzW+3QAXnyL
 l1TqgfXwJ81k52J0rKAhDwtHfrKKKUMYgxHBAANZDesD9ijd3pofpCgZuFKi+98dIzTU
 gLRfLPUegflgJsXquHz+XqqzCFT+2VG38dg1CPu+om+LU+DEMPjzI1QjvrZ/S1Gobdvb
 vVmw==
X-Gm-Message-State: ACrzQf1y9ZY+LyUYOPu4wW/pytiSojZc3Z0G0SheVAOUkSTDOtzGcyZG
 w+538JIec3IYyUJ+9hdC28EtzWZemeI=
X-Google-Smtp-Source: AMsMyM4sR9VVALaRbRUD17oueuuBQEk4YZhXALtok91ByJFWiUX6kZ2xpgp83/i4/8FNcxfYvQ1dAg==
X-Received: by 2002:a5d:6d89:0:b0:236:6e52:4fa with SMTP id
 l9-20020a5d6d89000000b002366e5204famr9880138wrs.395.1666736088755; 
 Tue, 25 Oct 2022 15:14:48 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 y5-20020adfd085000000b002364c77bcacsm3531888wrh.38.2022.10.25.15.14.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 15:14:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 26 Oct 2022 00:14:45 +0200
Message-Id: <20221025221445.352620-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tFuCsOv/rmikwFkX7GNp5zjbDpFZmwS4+ppFXO2NiFY=;
 b=aOFWanmcduQ4Q1vLzdvg8pkkoUChKxH+1wxu3xkdJKzVzc9kw8erhd1v1jBNVTEWya
 tEkxTM4KE0Gn2QSpUOZxtAIUnPbQkVTX9V9ca0fcrN5T4DUtvUijfgWsKD+JzrDsTk9L
 jifFokJ6TIisM7f29J5hmu2THfyW6EwI6ztn/U3SowuEuxI91KG5X5Qn++ss/py9tuJi
 wBM9PlDI2fRR3TX72DyypFULOUujhl01wGhM/9HcQE7fQ8NQnHQUyU0moZPO4Mjdqb1b
 iNbDO3S8LG/0VguiT6R4YESMLIORa1xAyZOaiW543w8LLfvUt1ziB1FLSqicqqbiTnLy
 ouCw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=aOFWanmc
Subject: [Buildroot] [PATCH 1/1] package/libffi: bump to version 3.4.4
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

3.4.4 Oct-23-2022
    Important aarch64 fixes, including support for linux builds
      with Link Time Optimization (-flto).
    Fix x86 stdcall stack alignment.
    Fix x86 Windows msvc assembler compatibility.
    Fix moxie and or1k small structure args.

https://github.com/libffi/libffi/releases/tag/v3.4.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libffi/libffi.hash | 2 +-
 package/libffi/libffi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libffi/libffi.hash b/package/libffi/libffi.hash
index 689b5da4f1..8d2349ec21 100644
--- a/package/libffi/libffi.hash
+++ b/package/libffi/libffi.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  4416dd92b6ae8fcb5b10421e711c4d3cb31203d77521a77d85d0102311e6c3b8  libffi-3.4.3.tar.gz
+sha256  d66c56ad259a82cf2a9dfc408b32bf5da52371500b84745f7fb8b645712df676  libffi-3.4.4.tar.gz
 # License files, locally calculated
 sha256  2c9c2acb9743e6b007b91350475308aee44691d96aa20eacef8e199988c8c388  LICENSE
diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index ecfa120c7a..8f6844113c 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFFI_VERSION = 3.4.3
+LIBFFI_VERSION = 3.4.4
 LIBFFI_SITE = \
 	https://github.com/libffi/libffi/releases/download/v$(LIBFFI_VERSION)
 LIBFFI_LICENSE = MIT
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
