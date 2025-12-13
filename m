Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822C0D5AE45
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 11:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53F0460D89;
	Sat, 13 Dec 2025 11:57:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id okeg17p9Uqaz; Sat, 13 Dec 2025 11:57:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23BD560D6C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765627041;
	bh=C4OiowXW+a//7qlhfH4CK6aqsaCit4gYhZ+PvLMN7og=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j8tsPFqlao2OdFBsc+y2ZJXlrzO0UdUA2XQIUoe+gW3CB08eHoaYW9kSH1HBI6dOg
	 KaFIfP1bUxCXv1V6f6NufYRSQiYWDSaoRFManANVyUb9Qk+KIK3TcLufkKOzc8/9N/
	 fEpJD7XPfHX3DyH9lToh7vjaRY30tWlYhud1fTi4bwxSxLfmRl3gDnYFD6jlJViyKC
	 4W1kq3NlrCZOpLbVBxveEuFdw0opU30QHPiEZn5OUizWA2EwMyg7ejtX6wZqyZbEF+
	 ykHodqJedw7X/4g8paUpSGefGsZRA01mB/oPAcyuzQRRB4jdFGElzzl0sLu/hntmLY
	 BXzZ7jdm3pODg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23BD560D6C;
	Sat, 13 Dec 2025 11:57:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4335C2C1
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 11:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 358E060D6C
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 11:57:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nwc8wb8cdQVZ for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 11:57:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1992F605FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1992F605FC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1992F605FC
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 11:57:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc21.dip0.t-ipconnect.de [79.214.204.33])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 710E6A4C377C
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 12:57:03 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37308)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vUOFD-000000006tb-0dQr
 for buildroot@buildroot.org; Sat, 13 Dec 2025 11:57:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 12:57:01 +0100
Message-ID: <20251213115703.1277141-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251213115703.1277141-1-bernd@kuhls.net>
References: <20251213115703.1277141-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765627023;
 bh=4fsBvKMMFRbNhmqLPb+tBlfXedzrFlviMDHccppNvnI=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=TFlWooHjKVMzV0ml0CP4PRF2acueKRKF52Pf3jFBeqErHynVFuwErBLySVK5PiED4
 hMoS57gTeZ8LG2iDfW4CtznmygQoY2YjscrQDPiupxPooPILht97fhZ+Txgr5yszPi
 z/gF8CPwei628al8qfyjLNUM7q+bIY0yh3/Vi3gb2xev50LBc1cFkPPcWWib5t78cK
 BwMYaL4xY6PKJcppj8xzgG6GVraa6TLZ+M4FHQSHXricetoxs+k1AksDTRoX+EvVs7
 9/zQoifP5U/Wjb/grIxApVGyPLeT+W2biLbkgenH+nSkBf2hYm2orIE+3+jOCEy0lr
 CZYrlFVcEczaA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=TFlWooHj
Subject: [Buildroot] [PATCH 2/2] package/alsa-utils: bump version to 1.2.15
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

https://www.alsa-project.org/wiki/Changes_v1.2.14_v1.2.15#alsa-utils

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/alsa-utils/alsa-utils.hash | 2 +-
 package/alsa-utils/alsa-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-utils/alsa-utils.hash b/package/alsa-utils/alsa-utils.hash
index fd03588294..b5d0f4428d 100644
--- a/package/alsa-utils/alsa-utils.hash
+++ b/package/alsa-utils/alsa-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0794c74d33fed943e7c50609c13089e409312b6c403d6ae8984fc429c0960741  alsa-utils-1.2.14.tar.bz2
+sha256  d3183d2ed2d69e9143c5beb97036267c3fdabfe8bfbea8bc6863f17b1f0b568e  alsa-utils-1.2.15.tar.bz2
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 64da2201bf..8659fa245b 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_UTILS_VERSION = 1.2.14
+ALSA_UTILS_VERSION = 1.2.15
 ALSA_UTILS_SOURCE = alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
 ALSA_UTILS_SITE = https://www.alsa-project.org/files/pub/utils
 ALSA_UTILS_LICENSE = GPL-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
