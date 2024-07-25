Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E63C3DA5D
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 19:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05E9E60AB9;
	Thu, 25 Jul 2024 19:51:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rXOBs7nVGJYH; Thu, 25 Jul 2024 19:51:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B19560ACF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B19560ACF;
	Thu, 25 Jul 2024 19:51:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 279FF1BF422
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 19:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 241A981E17
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 19:51:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vFpch8ycRKml for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 19:51:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 179F581585
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 179F581585
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 179F581585
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 19:51:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2dc.dip0.t-ipconnect.de [79.214.194.220])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3958DA4C2FBD
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 21:51:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42564)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1sX4V5-00000000599-3oDK
 for buildroot@buildroot.org; Thu, 25 Jul 2024 19:51:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 25 Jul 2024 21:51:43 +0200
Message-Id: <20240725195143.2966238-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1721937104;
 bh=nf0VjCuYV1/f1uODanFl4976SlJmZO0u6nqI5YFICnw=;
 h=From:To:Subject:Date:From;
 b=AwaryC9BmPQZm6+XOgrxdq2QzLMtJPJRom8nJjj3nx/hZTUanommfK2a3d5GHdQhH
 6UapV9Qt1J1iyvZt/7yzaHXF0XZUZhzECdnA9TdngTxOcDOAmg/1QDKMzhQi788oSe
 uviqFSZAGrOxQ6kphlIfxj/2lsQ08sUqhD4KdxPuSw3FnR3T3TTVaRiCw8dw3gbpO9
 nZBanMGH710WdU9Dkmmlm0eR/mWlSt5xHEhQ3xNUPvsk5KylEzcY+tnsU9SdKNwwx5
 4xohOxGYKLKZH29QiuigrCjhyT8vcuTNGYlfXw2LSrwlqM3xpUFOpdHgyhznryUfch
 Z/+8VGJzvAI9A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=AwaryC9B
Subject: [Buildroot] [PATCH 1/1] package/openvpn: bump version to 2.6.12
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

Release notes:
https://sourceforge.net/p/openvpn/mailman/message/58796813/

Changelog:
https://github.com/OpenVPN/openvpn/blob/release/2.6/ChangeLog
https://github.com/OpenVPN/openvpn/blob/release/2.6/Changes.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index a4ba458bd8..7ba3ea3f20 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  d60adf413d37e11e6e63531cacf2655906756046b4edffe88a13b9e2fec40d5e  openvpn-2.6.11.tar.gz
+sha256  1c610fddeb686e34f1367c347e027e418e07523a10f4d8ce4a2c2af2f61a1929  openvpn-2.6.12.tar.gz
 sha256  1fcb78d7e478bb8a9408010bdc91b36e213b1facfad093df3f7ce7e28af19043  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 3b39d62519..4bf5b54656 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.6.11
+OPENVPN_VERSION = 2.6.12
 OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
 OPENVPN_LICENSE = GPL-2.0
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
