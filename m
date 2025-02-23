Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9519C021B2
	for <buildroot@archiver.kernel.org>; Sun, 23 Feb 2025 18:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 503A360B3F;
	Sun, 23 Feb 2025 18:37:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mOXSu55zt58D; Sun, 23 Feb 2025 18:37:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A63360BA0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A63360BA0;
	Sun, 23 Feb 2025 18:37:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DA802943
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 18:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A861581208
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 18:37:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e3b88WRbRSvT for <buildroot@buildroot.org>;
 Sun, 23 Feb 2025 18:37:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 374DF811FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 374DF811FF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 374DF811FF
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 18:37:27 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b302.dip0.t-ipconnect.de [84.161.179.2])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 183C7A4C508B;
 Sun, 23 Feb 2025 19:37:24 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58840)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tmGqx-0000000050f-1u0s;
 Sun, 23 Feb 2025 18:37:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Feb 2025 19:37:21 +0100
Message-Id: <20250223183723.1517477-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1740335844;
 bh=SttOkLEfXtnsqs5VA9Dsm+SOYTJYgpK8M5024nxxyu0=;
 h=From:To:Cc:Subject:Date:From;
 b=AFnp+w+FoSwn9p8enkkUwRj/Lhiyv1Ua+ayQ2qnz3X1hiITUPan0WQ06QXOfKAqYZ
 z90GI0HmPNTlP5aHAHWo2xCJDD9jyInddV7Yg2dMj0pjGN/qm4WrHHIA3UVvW1flgw
 yWsTxvGZGq4eMmYrlsszleccfkoww6iIdI1ll3RfaL6sSaNM/4IDDQZz9x85lofE5i
 l9/PZx4RTbGpv8QvQJDSew1IHSee/KFX5j21IWRMLbsI8kejsaDABxBtwyizhVdSaY
 sMe4Z+xMTb+on1nP4XXcnhGQPowU6+ll65B9Z9wddLVuOZYzLxu/TN6La2UsCy+Vz4
 6O89HkseLydDA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=AFnp+w+F
Subject: [Buildroot] [PATCH 1/3] package/stellarium: bump version to 24.4
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
http://stellarium.org/release/2024/12/22/stellarium-24.4.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/stellarium/stellarium.hash | 2 +-
 package/stellarium/stellarium.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/stellarium/stellarium.hash b/package/stellarium/stellarium.hash
index 4c1e0c18a1..328d2e2bd3 100644
--- a/package/stellarium/stellarium.hash
+++ b/package/stellarium/stellarium.hash
@@ -1,4 +1,4 @@
 # From https://github.com/Stellarium/stellarium/releases
-sha256  03dad30f4031bdc2d200146e7c587249ea75dbdb88c8ae13632829aac5540b08  stellarium-24.3.tar.xz
+sha256  84386ad6261bbad7851a56febe673ec73adc7a3b49156b33af6c534e85ac8f8d  stellarium-24.4.tar.xz
 # Locally computed
 sha256  3aeeb5bb98bf7041ab82cffe15efa28ac58ee2bdf162b71301f5c192be631259  COPYING
diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index 51b1688742..4c5d84347a 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STELLARIUM_VERSION = 24.3
+STELLARIUM_VERSION = 24.4
 STELLARIUM_SOURCE = stellarium-$(STELLARIUM_VERSION).tar.xz
 STELLARIUM_SITE = https://github.com/Stellarium/stellarium/releases/download/v$(STELLARIUM_VERSION)
 STELLARIUM_LICENSE = GPL-2.0+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
