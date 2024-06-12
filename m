Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3FEC27C75
	for <buildroot@archiver.kernel.org>; Wed, 12 Jun 2024 19:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38C73400B9;
	Wed, 12 Jun 2024 19:22:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OY4D0tWpTWZg; Wed, 12 Jun 2024 19:22:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E52E7405EC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E52E7405EC;
	Wed, 12 Jun 2024 19:21:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9A7141BF369
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 19:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87449405EC
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 19:21:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tvgMOM_5_HK7 for <buildroot@lists.busybox.net>;
 Wed, 12 Jun 2024 19:21:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2AC37400B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2AC37400B9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2AC37400B9
 for <buildroot@buildroot.org>; Wed, 12 Jun 2024 19:21:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cd5a.dip0.t-ipconnect.de [79.214.205.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 45999A4C2E27
 for <buildroot@buildroot.org>; Wed, 12 Jun 2024 21:21:55 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35246)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sHTXe-000000007h4-3GLh
 for buildroot@buildroot.org; Wed, 12 Jun 2024 19:21:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 12 Jun 2024 21:21:49 +0200
Message-Id: <20240612192154.52253-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1718220115;
 bh=vSB6164mK3BUK1mgI/l1hDcFkHptP/BkTSNtz//V3p0=;
 h=From:To:Subject:Date:From;
 b=ZyHk0fEKKEMYeoM10xE+g6GWyk4DDOpFk9IW43PJo3/xBeNjgjpxP/2KEzmJNxltj
 PA8fkiYObhMJwtlK4Rpe0Yb+Tt5xFsZH+4WCXlNnMOLrLcnDvjNYSTSpSwbSyb5lHO
 f16G+VP5fW/R1xyVzq/nEnkXobFfVHRnr43r0RZhMaxSEynUE7v4uuWPwu4dwosyO5
 9DIZlnMu77y9IGIAPB69dWhRjw9vJRhSdG+i14hhRy5oaShtaygJXGVEqmCGhkAZ6z
 AzwXh3sI6hloPaFOVfBCdguQud0k3lLnt3T1TVPw1I29opc4GwqpKE1EfFws0xFCwG
 fBDg6bCGInc0Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=ZyHk0fEK
Subject: [Buildroot] [PATCH 1/6] package/kodi-inputstream-adaptive: bump
 version to 21.4.9-Omega
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
index 85945c9a54..f94fdc08e2 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  0b3a78763ffebef64ac05bcf55951f26e334f7ee8bbe042f885dff288eed466e  kodi-inputstream-adaptive-21.4.7-Omega.tar.gz
+sha256  cf301f3c221199edd3733487c7f57bd3104b9bd145d9f2b84953db3bb40c263b  kodi-inputstream-adaptive-21.4.9-Omega.tar.gz
 sha256  48632d57fbb6ab8f50cbf4deced5c91e733fa7ff292687c4816b77f28e483df9  LICENSE.md
 sha256  02f864f3e07456785625968022ce811c5640301bfd2ae70963efea89d306790a  LICENSES/README.md
 sha256  0b7f5dcb3d2c28ff78d999786028930e762df0baa2f52955782e378ec5b636a8  LICENSES/BSD-2-Clause-Views
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index 5cc02e45c0..931469f231 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 21.4.7-Omega
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 21.4.9-Omega
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = \
 	BSD-2-Clause-Views \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
