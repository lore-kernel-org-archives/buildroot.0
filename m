Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F1ED3E778
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 21:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D9164056B;
	Tue,  5 Nov 2024 21:58:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oVgm00Rrf3we; Tue,  5 Nov 2024 21:58:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F2C2405F7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F2C2405F7;
	Tue,  5 Nov 2024 21:58:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A2ED73B
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 21:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90765405CA
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 21:58:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nOqckdcK5FC8 for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 21:57:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 87DEA4056B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87DEA4056B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 87DEA4056B
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 21:57:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0255.dip0.t-ipconnect.de [91.58.2.85])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9DE4CA4C2460
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 22:57:54 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51816)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t8RYf-000000008M3-3kfy
 for buildroot@buildroot.org; Tue, 05 Nov 2024 21:57:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  5 Nov 2024 22:57:52 +0100
Message-Id: <20241105215753.3077420-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241105215753.3077420-1-bernd@kuhls.net>
References: <20241105215753.3077420-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1730843874;
 bh=0IIf7+q9B+pqo32XdtjbIZYEF+eKz7GGGn3TcSqzG18=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=bUc9zDtNCjKE7rojQ9Q4sDr0G3i3bk+v9QyftlVPHYFiikwuNMEH82oCIhv9mgu0o
 WnY/7Leh72Z38YKYAIONyC8mEn2ZLuT10WxFwPffZIgbbjE0Sd62zdWVM2PGUC3iha
 7UWZP/IUFJAUaxrdN65+59hne/yyKQyXQyCjk10T3dlitzmwt92avmoMbIWutJVPRT
 LM+PfWWKQhg9vRzjG9w310uz7PxWUJRF735XnJ0wTNwoEdyaLEnsnuHNwKbBeXmwA7
 Vtz+gADli2iL3BGJgNk1w2ihLqTWM5B6HXa31ZMIyKuIKN5Xmk+AV1cWoPNAdDvkaz
 MSS7TuOoTJlLg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=bUc9zDtN
Subject: [Buildroot] [PATCH 2/3] package/kodi-pvr-iptvsimple: bump version
 to 22.4.0-Omega
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
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash | 2 +-
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
index f11be5f500..7a25ecacbf 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d64e3c2f9c421f6617d56befd3574d4e9a495b68b94ee2b3e0d38781efece7be  kodi-pvr-iptvsimple-21.9.4-Omega.tar.gz
+sha256  87b9347596d2c7009f9aa498df8e91d8413ebacca3deec93bcb8629356ed44f5  kodi-pvr-iptvsimple-22.4.0-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
index d961c07929..47cc248598 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_IPTVSIMPLE_VERSION = 21.9.4-Omega
+KODI_PVR_IPTVSIMPLE_VERSION = 22.4.0-Omega
 KODI_PVR_IPTVSIMPLE_SITE = $(call github,kodi-pvr,pvr.iptvsimple,$(KODI_PVR_IPTVSIMPLE_VERSION))
 KODI_PVR_IPTVSIMPLE_LICENSE = GPL-2.0+
 KODI_PVR_IPTVSIMPLE_LICENSE_FILES = LICENSE.md
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
