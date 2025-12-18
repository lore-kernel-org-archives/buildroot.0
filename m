Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC60D6E2DC
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 20:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D07B40FBD;
	Thu, 18 Dec 2025 20:11:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9idPeYLMtBbr; Thu, 18 Dec 2025 20:11:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE52740C66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766088715;
	bh=wYnG9kpvAkRJOB8oJXY++vvuFmLFETDGnFreClp0UUY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ktqzlPxU/VeAQUs8N9n5deWMcrA8tG33+F0p++HlhYmOUyvGkyrrBV0FhWQa32lLZ
	 reCOleCNZ0bRHjPaZuhPqb6ZoRFi3QDIGwDS4+GHuhDbEKvUGuZEbmPC4O1XAXXF1i
	 adx6zsx24tFGNf6Ma6DjZUe2Z/D9yN+QZhlMbgfwf98S0kyz7AewO4M3MRrZrnUTFs
	 iyovaX1obdEq/EyWybptdaP6gxSAaZi7qy7zsG++w8VjV28nGqhbFTgFwkWMTuU4SO
	 /IE62q2llmdjNJV8tHiO9N0S4HeqUNH8/3KLfS46TO2sIixcUURq3s6stHBsZdx0RG
	 UHJVSQresThOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE52740C66;
	Thu, 18 Dec 2025 20:11:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D557D1A6
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 20:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC0AC40129
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 20:11:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0VEdrRkdcamI for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 20:11:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 50D0E4007C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50D0E4007C
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 50D0E4007C
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 20:11:52 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from pc-1.fritz.box ([82.135.81.46]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MBDj4-1vgl1E0wgQ-008uU2; Thu, 18
 Dec 2025 21:11:50 +0100
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>, Peter Seiderer <ps.report@gmx.net>
Date: Thu, 18 Dec 2025 21:11:47 +0100
Message-ID: <20251218201147.2617551-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218201147.2617551-1-ps.report@gmx.net>
References: <20251218201147.2617551-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:XT86fme9xCT80dH/rUCZCj7uPyjNMtiK9V0BtVJLVSxx02G+PLW
 P+xdCdFRDUOkOMZ9w8hhkirUz7WkxAYXjCmEzIwrXiVh0fXyOss0Npmu8P+opaQVE9aMItX
 MUR46awPhU77q7s56weiYkJsjKQ8MoEbrs9iFJSV9ZeBC3bfyD/gajkcKx+K/uLS4/ccgtV
 M3RGpQ/ix5SbuEbStnIoA==
UI-OutboundReport: notjunk:1;M01:P0:yNuNTubeDks=;CIzji1FIyXJVv4AMK35CYftVmzy
 +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
 8Ovb+ia8QmED7jobtzytCVPG7UGiG2dC7lesHi
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1766088710; x=1766693510; i=ps.report@gmx.net;
 bh=I75fNuLuptG7N5/q1L8sKb5infxydIraB0MCVNjcs9o=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=rPwtA210y7bFRtDZs1qLLXR6a55xDZHhS9BXYNNvq2R2T85V5DSTW0w0STQ1pT9Z
 CKGmHMH5dInIOTR+bxNp64edUpCp8RWN+jUF8R8as+E0+x7dag4+uHY+L+0wn7P6c
 pDWW+r4Mo7qyHjBQAJwlm2n5y5Bvrh0oKY12D94CrWB/X8W1nGy8uhGjFJkiBKm1/
 bpu62gUabsgu21j0VeFt3rF9Z1gL5JXsRQCWpp/6LhEf/3V2LH4TfTD12dy/8lCZc
 024HfFrdMohJUYZP5r8BRo5tIiC99kX7PGW960BoJr7HbvKBjrX3FBFFQ/xhdeD88
 PCrma7nvlxNRDN9FuQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=rPwtA210
Subject: [Buildroot] [PATCH v1 2/2] package/rpi-firmware: bump version to
 063bcab
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Version 063bcab matches with kernel 6.12.61

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/rpi-firmware/rpi-firmware.hash | 2 +-
 package/rpi-firmware/rpi-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
index 0645d6ad77..4dd8aa9a26 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6c1b017867c3a51e606859f1cd50df61b94af311577583b6b2a113d11131ee93  rpi-firmware-95be71b8c0f63f03dc06dd0e4c2e5535e6fb4a93.tar.gz
+sha256  812cb64617d6ffbc76f9b8dce8237b31159a1216b31845faec1bb75b6b6b291f  rpi-firmware-063bcab6c8a90efb0d19f69d88cbbc7ec79cab68.tar.gz
 sha256  c7283ff51f863d93a275c66e3b4cb08021a5dd4d8c1e7acc47d872fbe52d3d6b  boot/LICENCE.broadcom
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index d0b6abcc6f..3318e9a0c1 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Please keep in sync with configs/raspberrypi*_deconfig
-RPI_FIRMWARE_VERSION = 95be71b8c0f63f03dc06dd0e4c2e5535e6fb4a93
+RPI_FIRMWARE_VERSION = 063bcab6c8a90efb0d19f69d88cbbc7ec79cab68
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3-Clause
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
