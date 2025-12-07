Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA6BD1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E481606D9;
	Sun,  7 Dec 2025 14:42:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D8E_3LJdljJU; Sun,  7 Dec 2025 14:42:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A41D160750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765118568;
	bh=1dnzZ81BD2AOMeSyGeJmm9y6b1ocwb2/Z5A0DpCvFcI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Rx1MCK3kxGgUo9XSlJlTGaddIWOkjnuepDE6NcOPtKhy1XLr4xUO72UMI0TN2g3rR
	 pqCXJTd3oi62HiWs1v+Hs96WYaFqgVziLCg4RgEOTIM2G7qDmvMV1LttQ86On830DE
	 0EYpZYqfYkRpRTyV1I0G973pEhlgXuI9LAQ6pkRyveD+MowgKxWky+qVjuwVh+MCEY
	 S47OE/5XZZgxc06n84Swdu+1CdIlUBQSlEsh5VyVdoqazmpcsERxeheOEd+s3FhzSA
	 5MFwgDZH4AazBbrA38opOQHF+tavnecRoFwWwIJi67jOkLOv+yogqAIm9H4AhH225s
	 msAc9LNIXE0vg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A41D160750;
	Sun,  7 Dec 2025 14:42:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EABB151
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05CCE4047D
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:42:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4kcRMrrsHhYd for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:42:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 347B940479
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 347B940479
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 347B940479
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:42:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 717A5A4C090B;
 Sun,  7 Dec 2025 15:42:44 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56734)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSFyF-00000000416-2gn1;
 Sun, 07 Dec 2025 14:42:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Dec 2025 15:42:11 +0100
Message-ID: <20251207144243.3696572-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207144243.3696572-1-bernd@kuhls.net>
References: <20251207144243.3696572-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765118564;
 bh=VOhxLG0kFt9biivrtFyQ8GytZWQ2FF9sM/TAZra1Oxc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=GHo1ubY0J+jHTwIhDBPN3ZLnNB/v3hMD8uTEjWd/5H11isAGrFGnUArzMVRoWjmJT
 +M/1f+yp+8VjppyFV8LGpS2mwHrFy2VjSp4h3Bt+Bfjk+oTclNqw7E9XLjYbDMosrj
 oDmsrkTd6UIGWP81qBfjnoh0pGz0tQCcdQ9qyxKLxnAAaoXVRrDrEXa/+qksSzckJR
 tvH1GiRBqqZ29yjMCdldEXvCS2SIuOLATdt5PUzA+Na37MmiQgLQAVpS4QCsak8Iu+
 r5l5VbpaxvRvl2c/yTOWsHfWopr5DYht2CpCZ5djVMYWJxr+joIGM9thtkL37wMsj7
 weDjtsbQsDRMg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=GHo1ubY0
Subject: [Buildroot] [PATCH/next 02/33] package/linux-serial-test: bump
 version
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
Cc: Alexander Clouter <alex+buildroot@digriz.org.uk>,
 Jean Burgat <jeanburgat33@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Alessandro Partesotti <a.partesotti@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Prabhu Sannachi <prabhu.sannachi@collins.com>,
 Denis Bodor <lefinnois@lefinnois.net>,
 James Hilliard <james.hilliard1@gmail.com>, Jianhui Zhao <zhaojh329@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 James Knight <james.knight@collins.com>, Simon Dawson <spdawson@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Michael Vetter <jubalh@iodoru.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/linux-serial-test/linux-serial-test.hash | 2 +-
 package/linux-serial-test/linux-serial-test.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-serial-test/linux-serial-test.hash b/package/linux-serial-test/linux-serial-test.hash
index 38b98a610f..d1ecef6fd5 100644
--- a/package/linux-serial-test/linux-serial-test.hash
+++ b/package/linux-serial-test/linux-serial-test.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bd612ad9c10cb8090765487d5e2969be09dd0d024e7215dc764e770fbb5cc9e0  linux-serial-test-bf865c37ccf9cbb1826ada61037c036dc1990b7b.tar.gz
+sha256  00001938766fa3cebace913907b3715f23d936636b75861ec95a8e9b1a1be041  linux-serial-test-e3461097252e51fc527839884e77449cfd976701.tar.gz
 sha256  a2a6760c2c6fa779a635e4a7ad00f668862ebcadb2a8a57d16662543e103e08c  LICENSES/MIT
diff --git a/package/linux-serial-test/linux-serial-test.mk b/package/linux-serial-test/linux-serial-test.mk
index ccb39280ec..7ef675834c 100644
--- a/package/linux-serial-test/linux-serial-test.mk
+++ b/package/linux-serial-test/linux-serial-test.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_SERIAL_TEST_VERSION = bf865c37ccf9cbb1826ada61037c036dc1990b7b
+LINUX_SERIAL_TEST_VERSION = e3461097252e51fc527839884e77449cfd976701
 LINUX_SERIAL_TEST_SITE = $(call github,cbrake,linux-serial-test,$(LINUX_SERIAL_TEST_VERSION))
 LINUX_SERIAL_TEST_LICENSE = MIT
 LINUX_SERIAL_TEST_LICENSE_FILES = LICENSES/MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
