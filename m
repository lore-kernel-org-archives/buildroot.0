Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354F1C71136
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 17:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07048610D7;
	Thu, 12 Jun 2025 17:00:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x-BPzwHMK_dr; Thu, 12 Jun 2025 17:00:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3640E61083
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3640E61083;
	Thu, 12 Jun 2025 17:00:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 925731E0
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 17:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F9CE60FCF
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 17:00:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W6sAWD_H6Y5F for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 17:00:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 84BF160BC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84BF160BC1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 84BF160BC1
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 17:00:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c09e.dip0.t-ipconnect.de [79.214.192.158])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5D14CA4C213B
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 19:00:00 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49144)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uPlHU-0000000047F-1oJa
 for buildroot@buildroot.org; Thu, 12 Jun 2025 17:00:00 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 12 Jun 2025 18:59:59 +0200
Message-Id: <20250612165959.3474050-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1749747600;
 bh=hAD02LFQk0Vvn4Xn7P7u0VBbaJnvEM8EBB/a8roXye0=;
 h=From:To:Subject:Date:From;
 b=xoZjRHHk3uCwgrSK92fKPv29azI0lFwu2UDk1YfqgRFGup959V6z3rZmUcAhQ1LPy
 OteJjDH0wJ+gLbFeYzQmCyaHxXIOgrCXyjYZ2Bsljj0NfCH9jkEIKHrvR3ThvuuhmQ
 xaIPKEYSatMH+sIY5uY6uhvFWKXJARLIS2t4lqBFabwAjo0iedu8WogqwVkkhfEbGA
 iLaCuB+FeKtx6y2OYhiaETAEDZj/bGOlms2g4wusP755se0HliJucfZPZOVI0jKKv+
 TTSwr7/nYdqcmMEPIcbcNfJOIN1tJoHIJnMqW5QmwPHfnoUV5in8KKE35zPgJyaTwU
 dXOEzeVuTV8bg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=xoZjRHHk
Subject: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.125
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

Release notes:
https://lists.x.org/archives/xorg-announce/2025-June/003606.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libdrm/libdrm.hash | 6 +++---
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 3ef978775d..8e8f6eb663 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2024-December/003562.html
-sha256  ac36293f61ca4aafaf4b16a2a7afff312aa4f5c37c9fbd797de9e3c0863ca379  libdrm-2.4.124.tar.xz
-sha512  0408c3ae5780c57d19321a9a7b046d656e252b2f48e520b2beb18f83495bea39c445deb9a9a6795b46194051c2ea4da476e08c63972daf841064099df6dff365  libdrm-2.4.124.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-June/003606.html
+sha256  d4bae92797a50f81a93524762e0410a49cd84cfa0f997795bc0172ac8fb1d96a  libdrm-2.4.125.tar.xz
+sha512  faad141f48a49915c0312eb635df76968f0f4d41bb6851be625a7ae0e24826e7283b5ec9ec3b09ead9a96297bf42221c411288f9b000c3dbc159ed8dde93a7e4  libdrm-2.4.125.tar.xz
 
 # Hash for license file
 sha256  d0a616a9020dc0271e36e6dd4bad174b4e2c2a42636f13785f8e18dd5f85fd83  data/meson.build
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index a8a912859e..c6a40c0f61 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.124
+LIBDRM_VERSION = 2.4.125
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
