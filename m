Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8222CD98ED
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 19:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE0CB615D0;
	Thu, 18 Jun 2026 19:55:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pkeBVidioAt7; Thu, 18 Jun 2026 19:55:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87D5E615CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781812508;
	bh=w/qvfrS6tQEi/DpfW33N5a4DT6kaS9wxOr456Ecjoc4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LrMWnT5AKiF+ALyFaWNJoSnUq6aG0Oe6JWeamxUV0rV3jxF4Rgn/O+NVkVTwA2c5r
	 nTgVmBXT5ZftiVhejOEkgN4YOBhNNe+WVnsU2CP47d8aLtqi6X5QS/MT4zevBi2HkH
	 LeB1VjyxBOw7UwwPy75yi4HqLAeyKSemWhYtcMGjmh46OyM2W1E8UXTbmFhoQ8C3Jv
	 M6cjzY9ehob3MAkb3oVqru3TvYY/Yw0xZlfOKQmNJqApNWW5oyZ8OD0w72yWUrw9ZE
	 7kLK6WrvK0K+E527u5VeghsQM3rjVP9dPWCyqBHbfIHYRqj4fqbp/9PAj6VBKyPlav
	 fFPk2SZCCWonw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87D5E615CB;
	Thu, 18 Jun 2026 19:55:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 435692BA
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 19:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2949A403D4
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 19:55:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mo7pSGw9YqgC for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 19:55:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7A16741496
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A16741496
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A16741496
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 19:55:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a06cf.dip0.t-ipconnect.de [91.58.6.207])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A14CFA4C0602
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 21:55:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38628)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1waIpJ-000000001dF-3Bg5
 for buildroot@buildroot.org; Thu, 18 Jun 2026 19:55:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 21:55:01 +0200
Message-ID: <20260618195501.2584001-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1781812501;
 bh=6f1VCvxRYSlvW6P4ANRS9EHKHGi267971XdiwiLImrA=;
 h=From:To:Subject:Date:From;
 b=tp4yJn2oU+FKQQa8Mj7hhLy0YTMH4iSQv9vntHghMEErm2760P/Nf/pFWBdMpd5Tx
 jHWI+jWEoqiqByttNH5cjP1+P0fhhXWLVYbB4eFlmaPr767/aDmyHxM8IkZNPZhYvk
 63BEMZiK6s9GFaQWSLdEclaLVrI2HnYmUUAJzM9AMogMQNHJnQUwtxfFBoS/2P8cGr
 rcfwKAJU3+47SdGwsTp0owqGFaSGKWsK2PkZ4gLVeKCjZZm/cLd6CcJIsnp1/AG2D9
 Sb85fuQV+GaPTnTAthBq/Lc21JSH2u4py3wZaYJ67wh1uxA0ULBnbF+q364fWcb94r
 Wz8PCCU5WBDGA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=tp4yJn2o
Subject: [Buildroot] [PATCH 1/1] package/usbutils: fix comment
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

Buildroot commit b94ada76083824475e92c51b14042dc8f2a66717 added "wchar,
dynamic library" to the package comment displayed when the package is not
available although the package does not depend on these features.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/usbutils/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/usbutils/Config.in b/package/usbutils/Config.in
index fb37b8a9e3..4a54626991 100644
--- a/package/usbutils/Config.in
+++ b/package/usbutils/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_USBUTILS
 
 	  http://linux-usb.sourceforge.net/
 
-comment "usbutils needs libudev and a toolchain w/ threads, wchar, dynamic library, gcc >= 4.9"
+comment "usbutils needs libudev and a toolchain w/ threads, gcc >= 4.9"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_PACKAGE_HAS_LIBUDEV || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
