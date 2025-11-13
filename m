Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B575CD98CF
	for <buildroot@archiver.kernel.org>; Thu, 13 Nov 2025 18:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E64F883BD4;
	Thu, 13 Nov 2025 18:49:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t8gMUzw3wHUg; Thu, 13 Nov 2025 18:49:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3DF683BD7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3DF683BD7;
	Thu, 13 Nov 2025 18:49:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F26CD5
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 18:49:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CC1440DC4
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 18:49:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y3PMwEo2gkfI for <buildroot@buildroot.org>;
 Thu, 13 Nov 2025 18:49:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B431040DB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B431040DB3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B431040DB3
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 18:49:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bd38.dip0.t-ipconnect.de [84.161.189.56])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3709AA4C6475
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 19:49:15 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42652)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vJcNe-000000002Lp-0iOa
 for buildroot@buildroot.org; Thu, 13 Nov 2025 18:49:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 13 Nov 2025 19:49:14 +0100
Message-ID: <20251113184914.79263-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763059755;
 bh=PYQPzDtV3GpYPUBgEIywP2CA08MD0oMKYaRX4brln4c=;
 h=From:To:Subject:Date:From;
 b=UqQI0S5wbUcpqqthcTKatgKZecfX7cpCr1pn2ditZIr5bIicn/AO0j6Ncb1MCeIpx
 VzwCgqkoKh7v3BNgjYLOHONDp4Yk4x22edo+leNZsiDZyd3UdKXk7Lgay5x5W6DhIT
 OGWn4pgjQO2PlHopm85GQl7XosdkLAuUzNP7e9dy57jhc8FyeaqQvh2NuDZzlPiHIr
 jsjS3C3DH2iAI+Njhg0dbSN0Shn5WyNdTG1wo2fle1wlQn1myN4z6yT4oBQHA5yxMT
 qAo7s4pbZW6mHByO/9LD96qFldJC7EzvYCj+OBHOx+yGEYPEGERjBPkELvOVdAUUBa
 QTmMzjMof0q+Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=UqQI0S5w
Subject: [Buildroot] [PATCH 1/1] package/kodi-inputstream-adaptive: bump
 version to 21.5.17-Omega
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash    | 2 +-
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index 181e6c1d9c..b3bbd1b06c 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  da61399c2aa3f1f67b4e3f293952b0fa16c90a7e1effa606f99676ff8144d25e  kodi-inputstream-adaptive-21.5.16-Omega.tar.gz
+sha256  f07c72cc0aa4b379a41c991adae7ccbb31ba5f94da13e986d84e53b67e332bdc  kodi-inputstream-adaptive-21.5.17-Omega.tar.gz
 sha256  48632d57fbb6ab8f50cbf4deced5c91e733fa7ff292687c4816b77f28e483df9  LICENSE.md
 sha256  02f864f3e07456785625968022ce811c5640301bfd2ae70963efea89d306790a  LICENSES/README.md
 sha256  0b7f5dcb3d2c28ff78d999786028930e762df0baa2f52955782e378ec5b636a8  LICENSES/BSD-2-Clause-Views
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index 63e92f0103..a886960721 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 21.5.16-Omega
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 21.5.17-Omega
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = \
 	BSD-2-Clause-Views \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
