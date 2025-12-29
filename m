Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC60E92FCB
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 17:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D32CF60B5C;
	Mon, 29 Dec 2025 17:57:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zrvxyJ6hSYv5; Mon, 29 Dec 2025 17:56:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D686B60AF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767031018;
	bh=tzWxfDSvWDU9tuwKtUaoMQQVKnBx8XNmyiFJPjJdo3k=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ssA3GuuRwj4PV/MtOOPIwGVYd0Q55UNybu1IrV/r1AtNcOEZr+Cc/zx3KtkYv2+V+
	 VPTPTmcHDpt1Z5It/TfNEGIzntrQkaXtIBH+xS6OBLKaH2OaGowhdJwq+m2ZNXVN7y
	 Y9EyycInMh3dwkNY7IYUttbbYak0bjqR8/5VImi4u81ji3SiGsNtteYcPxRDKc1zgK
	 awRgJIbkUS6e1XxLaSU1H5LtCbWn2KphYsHHn8LOYsYNxSJudGqOAP/Y+LflC22e2C
	 COMg1BMv+S5A1y4USrKD3xVLNi/tqMkEvSu3GoW9Lh9Wwb5ZXsfH1iAmI1Z/iGrRxH
	 u3lThmbpBLRDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D686B60AF9;
	Mon, 29 Dec 2025 17:56:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DCB2C177
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 17:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2AEE407CF
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 17:56:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CTx-0yiJDQVc for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 17:56:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B8B074074C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8B074074C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B8B074074C
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 17:56:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6764BA4C25F4;
 Mon, 29 Dec 2025 18:52:12 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38202)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vaHPY-0000000012P-1kkY;
 Mon, 29 Dec 2025 17:52:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Matt Flax <flatmax@flatmax.org>, Romain Naour <romain.naour@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
Date: Mon, 29 Dec 2025 18:51:49 +0100
Message-ID: <20251229175158.3548903-22-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251229175158.3548903-1-bernd@kuhls.net>
References: <20251229175158.3548903-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767030732;
 bh=50XQJoP89Plvw4VfZOkBuidMAl+MWq8e3RC8//UWV1c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=YWT1rgC7Vulm+9axCfP4s4Yzh+/rEQF/rp8nuH/r/u+ZadAbIlSpGnpb7aDI/Tjm0
 kUgzDmD/SKT463hvruvo950aL2Ef118ExvZezWnF+3vQjtbNFUQunCMSWE+5ZNaiT6
 ZR/kAejTWn+bBED1POtNem26AdpX5zpyliYSRXXp9/5YjZ43BnHBXSVG4Jc45Rg4hF
 xEvNQNocEvclHh353qMkBRgqf1DlsauQvPfSeH9FzXOLg+1GyLQHSat4FfTAiFinQX
 r+aNKqpJSOTZPs/aq00NDDAFJrX9IsbO911X3qVoyxnz5rqkmQHkCgQlJM9DrlGqDm
 yc30qZEeKvTzQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=YWT1rgC7
Subject: [Buildroot] [PATCH v7 21/29] package/ffmpeg: remove optional
 dependency to opencv3
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

OpenCV3 is unmaintained and will be removed from buildroot.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ffmpeg/ffmpeg.mk | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 983a87eb2e..6e4ccd5b8b 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -297,12 +297,9 @@ else
 FFMPEG_CONF_OPTS += --disable-mmal --disable-omx --disable-omx-rpi
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV3_LIB_IMGPROC),y)
-FFMPEG_CONF_OPTS += --enable-libopencv
-FFMPEG_DEPENDENCIES += opencv3
 # To avoid a circular dependency only use opencv if opencv itself does
 # not depend on ffmpeg.
-else ifeq ($(BR2_PACKAGE_OPENCV4_LIB_IMGPROC)x$(BR2_PACKAGE_OPENCV4_WITH_FFMPEG),yx)
+ifeq ($(BR2_PACKAGE_OPENCV4_LIB_IMGPROC)x$(BR2_PACKAGE_OPENCV4_WITH_FFMPEG),yx)
 FFMPEG_CONF_OPTS += --enable-libopencv \
 	--extra-cflags=-I$(STAGING_DIR)/usr/include/opencv4
 FFMPEG_DEPENDENCIES += opencv4
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
