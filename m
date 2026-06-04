Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EC4CD6E75
	for <buildroot@archiver.kernel.org>; Thu,  4 Jun 2026 19:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D5D085587;
	Thu,  4 Jun 2026 19:16:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i8JP-8eWc6tz; Thu,  4 Jun 2026 19:16:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6650C85588
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780600608;
	bh=3Ckyrn+jisI4Gs5A3A9AMDikLqdkg+xK7TOS08DodFI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=i3ZVt27RFniEK1NEdjXUu3PpvDMQvPsTJX9DSZmOHX4HSzC+T6OmfwhLiNoocK440
	 ZLQOI4aJ2e7Wav8sj8QEgSFjIAnMCvSrSuyn0e4TcqFfoO9EivxfEQK/nzVXQTewck
	 VJtumw9pzYXKj57P8EZGtcnUkgJhFhn2Uz1mJ0gkIoiMZ5dZ+KRe5raK0UCatMXACT
	 gi4vhQA39ZVXXa8U8EnuTPsbc0OtLR5nP0VpUlrF1dx80iqeO3GCEzZr5kkKp5Fh0m
	 +/zyzwQhtbbURrGr6DRfyB7Y0StO8WHQqtYwwUw3dVW3q4nOCxAjm42Ynsg9EHI1BU
	 L9PJVgQNttA+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6650C85588;
	Thu,  4 Jun 2026 19:16:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E1D0192
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 19:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F78F6F865
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 19:16:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9L3s9ZooE0o0 for <buildroot@buildroot.org>;
 Thu,  4 Jun 2026 19:16:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D35C86F864
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D35C86F864
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D35C86F864
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 19:16:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d62.dip0.t-ipconnect.de [91.58.13.98])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C09DCA4C377A;
 Thu,  4 Jun 2026 21:16:43 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59328)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wVDYZ-000000005T1-1qA0;
 Thu, 04 Jun 2026 19:16:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Thu,  4 Jun 2026 21:16:41 +0200
Message-ID: <20260604191642.2162777-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780600603;
 bh=MME/G5ITI0jfy6wq2yzTo3y22eoKbOEPpREyUPWMkIo=;
 h=From:To:Cc:Subject:Date:From;
 b=sccYxcxGl6vfO8RULtF7Icuu9BOT7rWN7LUQlC3TPrtzoUMLr7V1GuNwcSp8kukOZ
 pYKNIOT2e6Lk35nqMAbXnoZz6/s/nUFxde2G4wFvVP7uCj32u1qZg/6hx+cWzOnFI7
 LiNAfWGWUqo2zvCAcyrYAjVMCweAd0twRz1GTRCXMepdKWWvWZ2Ohbj3SWjo0lLg2/
 KzvOSIk/wscPRBCpMAcSYuEnRyq32MP4BBUAKDwvM40/fUEnPv2PivumvEeZGCdt69
 e+rmVhqG9BH2CxvBGfCffLOqDBeDQfRxx2n1+E6SQK5z8t9HxXPmK+YoKGwHMSyWfA
 vPEssKP1m5f2A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=sccYxcxG
Subject: [Buildroot] [PATCH 1/2] package/libinput: bump version to 1.31.2
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

https://lore.freedesktop.org/wayland-devel/agWtsIBqMXTVknR_@quokka/T/#u

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
cherry-picked from -next to prepare for security bump to 1.31.3

 package/libinput/libinput.hash | 2 +-
 package/libinput/libinput.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index ec6e52e1e2..c813993358 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  e0bb6537de892ce7c63fc5be9ad373eae894b7655c92220ef00316cc33097356  libinput-1.31.1.tar.bz2
+sha256  1daebac6cb5b8946139c9669a7e5c0e4c8f17320de232a6b9bf470f37dc569e4  libinput-1.31.2.tar.bz2
 
 # License files
 sha256  80de50b2022a840db044c56db804ca3565600a692c0714babface587acc6d1b0  COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 8b930805b2..33fd012076 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.31.1
+LIBINPUT_VERSION = 1.31.2
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.bz2
 LIBINPUT_SITE = https://gitlab.freedesktop.org/libinput/libinput/-/archive/$(LIBINPUT_VERSION)
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev udev
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
