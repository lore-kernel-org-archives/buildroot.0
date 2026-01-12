Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3EDDD25051
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D56080E93;
	Mon, 12 Jan 2026 08:37:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pc8M51jbGkwO; Mon, 12 Jan 2026 08:37:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD93A8453F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207040;
	bh=klqe60v9KaynO1/ktIqXrhqcqn6/2Op1JeM+FPfsMmA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CvojgmEWQ1lcSovx6yzLsJ0nxNhYG8JSHVqOSSjHOkEMw5qLSDm1lotB6WRSkbGDL
	 iL1KJdtkHb/8597FvXiRVsbb/woHw2xq0WF9gFCaigJvf3oCAL5pjnDt9a7fAxsVtY
	 rjxJzMTDJCH7FU9OYXp1TSLShaoe565pUdT9i5rB2o5FyxGBs8JOSfg8/NGMZooWRk
	 ole2aWHwv+LTud649GQ0BUqPTA+UeTwSqPYintrlmgjlCi0nB+9AkfSjCv3eEHTeoV
	 h/pns99TqwYWRsCmQjH4lOlXfItAOi2Y485o8bWGzl9zY9uKzuVPVEitCPXDiSmGzH
	 5oUZN26fc21gg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD93A8453F;
	Mon, 12 Jan 2026 08:37:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D424E18D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C58E76152B
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:37:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wC5rg-WiYgLR for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:37:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2DA1A614F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DA1A614F6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2DA1A614F6
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:37:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4877BA4C3C7E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:33 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJG-000000007z0-2wYr
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:29:36 +0100
Message-ID: <20260112082950.2528445-88-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206633;
 bh=ko/zPN07ct6K69iiLWAFCkwliuk7PzW9BX3uMhcXj/4=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=D+rV1L9r0O8llf47+/vOoBlK82ALJ/fa3QgjOJaWX6PHM8DtBeTyuxVwhM89fvWe8
 w/sVCqWPgneP3MqwfFpscM/TTvZR3IJR0TvvrM7zfMsU3oLFpIi40O1P1Bou5s69cM
 xJjmMowWdcRpkWw3eYhcykfCW5bnk0WBB4ZI2qANUcsf90sJUOQ/B5D4yMbhmXwMqS
 HVJQXdEyK+roHmlLsXWLSwCOQDaOBBrcZn2BnKdzFdbLqTVEDLnA+CAwS17Ht8Hq+L
 XvwT/pZ8EpVmSu6RGZCSLqoLdaMGN08TD6wNU+GIUyvC1WB58GN9b8IfNyhAtLeWe2
 MfjbMSVS3MHjA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=D+rV1L9r
Subject: [Buildroot] [PATCH 088/102] package/x11r7/xlib_libxkbfile: bump
 version to 1.1.3
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

https://lists.x.org/archives/xorg-announce/2024-February/003455.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xlib_libxkbfile/xlib_libxkbfile.hash | 6 +++---
 package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.hash b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.hash
index 7e6199f16b..d8a1173925 100644
--- a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.hash
+++ b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003286.html
-sha256  b8a3784fac420b201718047cfb6c2d5ee7e8b9481564c2667b4215f6616644b1  libxkbfile-1.1.2.tar.xz
-sha512  0639fad7b64b36a85f8d24cdd40085e0ec18d7a671793b8b5c26449e9cc5a84c37117e7757fb1238ac353044935dd00013e42166de5af9dec428e873a47e598d  libxkbfile-1.1.2.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-February/003455.html
+sha256  a9b63eea997abb9ee6a8b4fbb515831c841f471af845a09de443b28003874bec  libxkbfile-1.1.3.tar.xz
+sha512  d80ac41f6fa3a1ffad77ea1f8f9d9542f0bd210d74b263802bc6e6c1594fe325b27f42b5454aeeb36352518963b1ed1fdbbad95d7db3690b2e36d54742b7c236  libxkbfile-1.1.3.tar.xz
 # Locally computed
 sha256  e1b3fdad8037ab3f986ef9caaa7c8da47d8d55875e680c7d6011f6c07363ea7c  COPYING
diff --git a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
index 2e7f82922f..23fddee97a 100644
--- a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
+++ b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBXKBFILE_VERSION = 1.1.2
+XLIB_LIBXKBFILE_VERSION = 1.1.3
 XLIB_LIBXKBFILE_SOURCE = libxkbfile-$(XLIB_LIBXKBFILE_VERSION).tar.xz
-XLIB_LIBXKBFILE_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXKBFILE_SITE = https://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXKBFILE_LICENSE = MIT
 XLIB_LIBXKBFILE_LICENSE_FILES = COPYING
 XLIB_LIBXKBFILE_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
