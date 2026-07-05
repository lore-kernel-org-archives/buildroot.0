Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D73ADC43602
	for <buildroot@archiver.kernel.org>; Sun,  5 Jul 2026 18:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8596380EEB;
	Sun,  5 Jul 2026 18:18:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SxgKddw9kMv4; Sun,  5 Jul 2026 18:18:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D7C48102D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783275519;
	bh=dZVimQJ8coWw+j3hDYuyDgJZ76v70VdEbE+ECFVKLSo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aKOVSp3CD+SJOzflCRPMqdHs6RIKrp1NgUQsZt/QHnRbDF8nmd8FN3Fn8Gb09ukNa
	 G9jN6AhZa6LNrSRQdZUPLjTq6ItQGty98f/mPLwKOAZOTYaFvuZX0L7ul0sMQzPAeR
	 JO4G0qo0X1Okbhvt3hJNQhWi5bT0yoQrp6MSKDaWXfPGxHiDPRGfLU/Y/beKpbjCQ7
	 a2eOpbcKrzcrUkEeAzs26QPnxJitNh6xhv1L5rTwjlhxvjpc7Sht49JqU85PCpC6zQ
	 EhqJTZHjJ1SeWDtyz/VPyEXTZ1DpggPllrDgErcCSFXz05FY9yEfpQOVyROooyE+Xj
	 mAH2xkQMsnslQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D7C48102D;
	Sun,  5 Jul 2026 18:18:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6514C316
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 18:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F148408DF
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 18:18:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WYea1zc8iwNR for <buildroot@buildroot.org>;
 Sun,  5 Jul 2026 18:18:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 11A514085A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11A514085A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 11A514085A
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 18:18:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c6b5.dip0.t-ipconnect.de [79.214.198.181])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E8169A4C0272;
 Sun,  5 Jul 2026 20:18:34 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44988)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wgRQI-0000000057l-2RsH;
 Sun, 05 Jul 2026 18:18:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Murat Demirten <mdemirten@yh.com.tr>
Date: Sun,  5 Jul 2026 20:18:34 +0200
Message-ID: <20260705181834.3258669-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783275514;
 bh=EdBmuleIqrs/VVBlGnHl0l5oxl2XXsQkIOoJp9ykX80=;
 h=From:To:Cc:Subject:Date:From;
 b=qFQv7JjBfKF2h0PWgGxfgoBgfxNnrufQn0NeVDHZR4iKswVJH5GuCHUNmIUDOCh0M
 lRpZ5x2FLYNjZRbFlt/PPNVmq41VepNxJsmga3h8rQ3S0RkSOKGxY9fgddTQ+JMr3K
 LoO4RGFbzf4Y3o9AnyCizx0E1BAKW720sGtPLi49xKSSS0U1ELvf/K+4PUw3A21J90
 8XTXNJOw/afEI80YS/hFJWrlVoINPEUo4Q3t3w9XS9ZI44r9LYrIDDkuP2nDq5qd0C
 Btu9MpT+jiBN3EdCFOVnAsKlK3+dSFJpspdjf4DVxFF79by2pkwDmM1k3CZ2hiF5Qe
 wm+lHtRYIl09Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=qFQv7JjB
Subject: [Buildroot] [PATCH 1/1] package/jpeg-turbo: bump version to 3.2.0
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

https://github.com/libjpeg-turbo/libjpeg-turbo/blob/3.2.0/ChangeLog.md

Updated license hash due to upstream commits:
https://github.com/libjpeg-turbo/libjpeg-turbo/commit/54bd58cc306301892f1cdc2a00da64576ad1e232
https://github.com/libjpeg-turbo/libjpeg-turbo/commit/42b75222d502faff3316ea82083b873add354f06

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/349a95ab9a9bc6f6ebfb0d4b907c03d635d52cc6

 package/jpeg-turbo/jpeg-turbo.hash | 6 +++---
 package/jpeg-turbo/jpeg-turbo.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/jpeg-turbo/jpeg-turbo.hash b/package/jpeg-turbo/jpeg-turbo.hash
index 382f780f23..40314214f9 100644
--- a/package/jpeg-turbo/jpeg-turbo.hash
+++ b/package/jpeg-turbo/jpeg-turbo.hash
@@ -1,5 +1,5 @@
-# From https://github.com/libjpeg-turbo/libjpeg-turbo/releases/tag/3.1.4.1
-sha256  ecae8008e2cc9ade2f2c1bb9d5e6d4fb73e7c433866a056bd82980741571a022  libjpeg-turbo-3.1.4.1.tar.gz
+# From https://github.com/libjpeg-turbo/libjpeg-turbo/releases/tag/3.2.0
+sha256  6f30092cef9fb839779646608f4ee14ae3cbac989c47fa05e841b0841f09878e  libjpeg-turbo-3.2.0.tar.gz
 # Locally computed
-sha256  e10114e6e40f3d0311c401ca25245ac5ef459a43c20f976fd63f03e816f5741f  LICENSE.md
+sha256  ba6bceebcba0fdd35488477c2cca8c4632ce82c74dbfbc87d886ce6fc4433579  LICENSE.md
 sha256  75815e3bf6484201a3c3d17a1bbf10f2e8e3237f84df10a2357ea896db2a81d6  README.ijg
diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index b00a71a231..9a10110766 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JPEG_TURBO_VERSION = 3.1.4.1
+JPEG_TURBO_VERSION = 3.2.0
 JPEG_TURBO_SOURCE = libjpeg-turbo-$(JPEG_TURBO_VERSION).tar.gz
 JPEG_TURBO_SITE = https://github.com/libjpeg-turbo/libjpeg-turbo/releases/download/$(JPEG_TURBO_VERSION)
 JPEG_TURBO_LICENSE = IJG (libjpeg), BSD-3-Clause (TurboJPEG), Zlib (SIMD)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
