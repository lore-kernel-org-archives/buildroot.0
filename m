Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D41E1C43334
	for <buildroot@archiver.kernel.org>; Tue, 12 Jul 2022 18:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3973A8254D;
	Tue, 12 Jul 2022 18:17:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3973A8254D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jSP-wz73mFL3; Tue, 12 Jul 2022 18:17:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5870981AAC;
	Tue, 12 Jul 2022 18:17:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5870981AAC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A1EBD1BF573
 for <buildroot@lists.busybox.net>; Tue, 12 Jul 2022 18:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CE9B819BE
 for <buildroot@lists.busybox.net>; Tue, 12 Jul 2022 18:17:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CE9B819BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u4NIPZHtIdpw for <buildroot@lists.busybox.net>;
 Tue, 12 Jul 2022 18:17:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7213C81970
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7213C81970
 for <buildroot@buildroot.org>; Tue, 12 Jul 2022 18:17:49 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id b26so12326731wrc.2
 for <buildroot@buildroot.org>; Tue, 12 Jul 2022 11:17:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CCYF4Yi341sWK2D/L10QAGNWLCqxusF2FLaj6nAE/IQ=;
 b=7k9B3wPVF/RW4MltKnmZDIl4ayaHNGIExqQXgnFuTl3i53NBiev53Ok43uYkrH6I/P
 ZUTgJwkLLvkYMDNEEE6nFN4m4Oo6l01TJrgX9AfdDrAVZkwagNO90DKi0scqEjCPKOQi
 QwVP7mj2lg9nRAO9lQ3ZLn0aNrQuEMtkmemb8Ay11Kc3xqHEpVaXFyaT8If4gNOqDtTT
 IXa6WMhn22vGHJgWr2lPNZelJxAQWukYAySReC30b8O/fqlNXiihTdQSba2fGIt67S+f
 15Aonv5x3QHE510P1dHvjI8gTG2oO0zfnckfHxHX7p3JvGRgQocnFsX044AWckHeQIE5
 ix9w==
X-Gm-Message-State: AJIora/g4vZV12e2J8CgVVh472XWUvfyARU8g53r0lrBq6EX8maQbxj3
 VoMfXrGSYB+VmVCUPwMFss8NQHQlhI4=
X-Google-Smtp-Source: AGRyM1uy1UengcU5/rw6Lho6j50S5R+xKAqtOzq9o25LBIWKK00RIPuzOUyEOWG7coYBlx7IriubrQ==
X-Received: by 2002:a05:6000:1541:b0:21d:b298:96be with SMTP id
 1-20020a056000154100b0021db29896bemr4543038wry.206.1657649867273; 
 Tue, 12 Jul 2022 11:17:47 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 i25-20020a1c5419000000b003a2cfb9f5basm13973684wmb.16.2022.07.12.11.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 11:17:46 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 12 Jul 2022 20:14:43 +0200
Message-Id: <20220712181443.1650438-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CCYF4Yi341sWK2D/L10QAGNWLCqxusF2FLaj6nAE/IQ=;
 b=dFDwrurYFoj847TrczfT0Py8XpXfJ993qkRXLc20lV5T3tJWtiGOymBe1m225wCJ7w
 RJCCEBmipcpmnQo6srPaA61JFDl3NpTWeIzOkJAKNiPUN70TIgUN1DfBQu6wA5V+S9Gs
 3V16Tll3wrixg1udu/enpYpv1p4fmnjpz8kSKOB2zNUKY70CbMm5nrr1NxIY7BMY0bPX
 gmMtKAwXwwum0s4NRO04oMnnuZ/oTjdnBENogRYA74TPbX2quIDS4M33H5NjD+MTwjUj
 0Qog6nY3CBHWu5jXHmhN1DKNZ0NiY8HFSSm11KR+4j17OZkIBbkFXYeFPaLJiGHerLob
 6mJQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dFDwrurY
Subject: [Buildroot] [PATCH 1/1] package/suricata: security bump to version
 6.0.6
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

Various security, performance, accuracy, and stability issues have been
fixed.

https://forum.suricata.io/t/suricata-6-0-6-and-5-0-10-released

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/suricata/suricata.hash | 2 +-
 package/suricata/suricata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/suricata/suricata.hash b/package/suricata/suricata.hash
index 032546fd92..38ab5e9cd3 100644
--- a/package/suricata/suricata.hash
+++ b/package/suricata/suricata.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  0d4197047c84ba070dfc6b1d9f9ee92f52a71403bfac0e29b2554bb21fe00754  suricata-6.0.5.tar.gz
+sha256  00173634fa76aee636e38a90b1c02616c903e42173107d47b4114960b5fbe839  suricata-6.0.6.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
index 36e641bf90..8c38b7c713 100644
--- a/package/suricata/suricata.mk
+++ b/package/suricata/suricata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SURICATA_VERSION = 6.0.5
+SURICATA_VERSION = 6.0.6
 SURICATA_SITE = https://www.openinfosecfoundation.org/download
 SURICATA_LICENSE = GPL-2.0
 SURICATA_LICENSE_FILES = COPYING LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
