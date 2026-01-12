Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F90D25049
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89055614E9;
	Mon, 12 Jan 2026 08:18:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3WS2fDeOQj7W; Mon, 12 Jan 2026 08:18:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABED6614EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205926;
	bh=oMx3OKo9HWq0l5pRtJNKLFRGyXXEubql3PNJKdbOHuU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YFBsmuIlwPl3ySeFIhBUCVGhaPZwNHRr0n2Q7GV70ymLB+FTN1erISHTWNAuBkydf
	 INukvroWRqguU4uHqfniEMfLfMYAbAMnDUaQ1CrGvnh/xbwCmIT0xweZVNFTiQ0amJ
	 xUHWtYcWW15rujMTLco1cb61qQc9hDqaw0EcdA9l+NWxl0y8vHslWCkUDshLYQ9AmQ
	 Ayx4lwfUCozFSi9Z+qTUwQ3sLwUDzLPBHU/+wzlCpgElDsbopiLAU5OCTY2G7ZaldO
	 6rNbkbGDYV2D4n/FtfMQSGV9M70xb+/ml0ksgr+iqQOwNjHPbpNRIDwuMBqMYA/lOc
	 PBsjR2maUETyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABED6614EB;
	Mon, 12 Jan 2026 08:18:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E2E518D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E99A14031B
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:18:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B1I0g2dHJIYU for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:18:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DC8E14013F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC8E14013F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DC8E14013F
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:18:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C2242A4C3F9C
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:42 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuV-000000003M6-3wDO
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:02:56 +0100
Message-ID: <20260112080419.2516889-21-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205142;
 bh=2I4LvyY8PNCIeRpSrZMWSnXyFgI27tmlPJ77g7cnLRE=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=j72gyotZlc9nx87EqMx/GZZOUWfv/UH+zI+UJ1iLzTKG+NG2cL5D4oDskmA+UdZgE
 VNJ2GZ1+fMuYflGIuxOmfvUBwwyRsMIhULh4GRcx6/p/pf6JyJ8mP+fsh/nie5BAsF
 NuN5W5u42zlGLTEgcqrogb4DYGczusGqjYIeYuka25BxU+oNR52uertk9dbmFD4KkR
 Ziw6bcFwTY8+5kZrVUQND0h04z7/R7MEuVCuZQi7C4TC3DLWTYsCHru7jnDdWIWmzL
 nds3PNOhcVl4RpPoO2uROjjBItvvJ5LgjiJ8Y/fXH8mjHcf8z36AojE6RwUzZn896h
 gEoMEmeTq7b8g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=j72gyotZ
Subject: [Buildroot] [PATCH 021/104] package/x11r7/xapp_xdriinfo: bump
 version to 1.0.8
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

https://lists.x.org/archives/xorg-announce/2025-July/003617.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xdriinfo/xapp_xdriinfo.hash | 6 +++---
 package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.hash b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.hash
index ce11d06977..540ef0e228 100644
--- a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.hash
+++ b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003308.html
-sha256  dd838bae9d2b19ddd71fe6d30ed33abc7c85e19d223e79d35600db3fa44bf734  xdriinfo-1.0.7.tar.xz
-sha512  a368cf32c606ca78f3a23bc5d88fb57b9c1a3827d0fec3e48cee153703135e47cecd3db8ee0eba93f309d7f03b4306c3f2e7f46f36d0d2970671c5e5b78093ad  xdriinfo-1.0.7.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-July/003617.html
+sha256  00463056435b82261c227ad0de1873fd4536101607fbc57540e28e4a0a9b71f7  xdriinfo-1.0.8.tar.xz
+sha512  36ea6a453b7f3ec7caa028282c701c98dfb45886dc833e31931d3ed6333a96a5bf7d3816bf5db51b3c359297f25e242c913eae4dd01be5de557475b4cd98d458  xdriinfo-1.0.8.tar.xz
 # Locally computed
 sha256  de2fbb160bbb64c48975d7a3ebe3636a312b73227df1efe37488a8cecb9c1932  COPYING
diff --git a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
index 7672dc8899..ab383431b9 100644
--- a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
+++ b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XDRIINFO_VERSION = 1.0.7
+XAPP_XDRIINFO_VERSION = 1.0.8
 XAPP_XDRIINFO_SOURCE = xdriinfo-$(XAPP_XDRIINFO_VERSION).tar.xz
 XAPP_XDRIINFO_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XDRIINFO_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
