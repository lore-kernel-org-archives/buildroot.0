Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E04ED2504A
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0704C8083A;
	Mon, 12 Jan 2026 08:24:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mKP-7CpBVKfv; Mon, 12 Jan 2026 08:24:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 258B6842CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768206241;
	bh=jbP8OJszdgCIjTO1sRfInSZhHjHRt7kXSMOV0NnFgDU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XEPMr9qEfuyB/6HiiuqRb7Jx6KvXN79UKxZFd1KtsEY19Ya+9AoMhZnIX6bma8LL6
	 saAV7arqiSguFSAjUquL6CEx3CehxKQ0u8vO/QRBYkJvYAKNpk6iSauXqUl9CI1BMu
	 71tv3cU3pTo9hibVnn8kidus1EAO73TdE7vdNv3dOLZ3YgkP0eUoTBV36qmWPd5yPf
	 irfA7nrWlB99+mSX4lgJVTmxclg5ImBCr/N676vo9Ob0aiSDssrxP5D1Gm6My36wRy
	 cHWp3qp1C7G2Ht5vwu7Q8nXbTrM4zkhdKWYdcFrVHy1goUqzLSOANzmPgrHQh/drdX
	 dPFE7nF9MjdzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 258B6842CC;
	Mon, 12 Jan 2026 08:24:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9447718D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A15B611E2
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:23:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id joMiQYay8wJX for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:23:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 71BA1612BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71BA1612BF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 71BA1612BF
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:23:58 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 26384A4C4233
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:48 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuX-000000003M6-3Hut
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:03:22 +0100
Message-ID: <20260112080419.2516889-47-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205148;
 bh=UtJ6UiqUEPeZLsHcuQRzCVYiPFuiAzbUVS4xxPe7JXs=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=fZvJKiB3NBRZalilO1FVlRQd/OFNiH+fE8C0iMOqqE4gxfqa32wfDKyuhGe5IarZM
 luY+2bmheF7GrV53C2ciHQaNzyB4JfzTLDkWA5cxzGOh7KsVVEYsq7Rn7eNa67vWDR
 MQr5tFPUeAW1DqsQ1f9aRMeZVs8QYI4nuKXNvwTdmLyFItdLf4ZSoPbGczK8DuPmh4
 2z+cnb2Cry7Ni4vk/4tAFK85OkauhObC2+87eN8wp4K2KIF1FB51h9Cz9rh9ns4ti/
 F1S3zRiugLPrIoFy/vP51yz1b6nxxxbCXqKl4WAhHsrEM1SB1JwNu6DtTE41fKUROA
 qB8TBwMC8dfIg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=fZvJKiB3
Subject: [Buildroot] [PATCH 047/104] package/x11r7/xdriver_xf86-video-fbdev:
 bump version to 0.5.1
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

https://lists.x.org/archives/xorg-announce/2024-November/003553.html

Switched _SITE to URL mentioned in latest release notes.

Switched tarball to xz.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.hash  | 5 +++--
 .../xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk    | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.hash b/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.hash
index 0b38a9b41b..3d3593c540 100644
--- a/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.hash
+++ b/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.hash
@@ -1,4 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2013-September/002324.html
-sha256  dcc3d85f378022180e437a9ec00a59b6cb7680ff79c40394d695060af2374699  xf86-video-fbdev-0.5.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2024-November/003553.html
+sha256  9c2bc0fb9af092804138e8d5cb5627cabf2919ef60f0d1544a95c4ac2047f387  xf86-video-fbdev-0.5.1.tar.xz
+sha512  ab345d796fb6a404c44a5caec31497fd36dce8882befad644b3f6fac1969c0a4ba9243e911e86a29a149ee7b0847ba676a28a49e15f1789238f2726b9dcea1a8  xf86-video-fbdev-0.5.1.tar.xz
 # Locally calculated
 sha256  e437aed89c3440a9fe7e19968a3f2eeb97041ef6c9616837a3fd42d0874fc0e6  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk b/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
index a480befdd0..65b2c19b5e 100644
--- a/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
+++ b/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_FBDEV_VERSION = 0.5.0
-XDRIVER_XF86_VIDEO_FBDEV_SOURCE = xf86-video-fbdev-$(XDRIVER_XF86_VIDEO_FBDEV_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_FBDEV_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_FBDEV_VERSION = 0.5.1
+XDRIVER_XF86_VIDEO_FBDEV_SOURCE = xf86-video-fbdev-$(XDRIVER_XF86_VIDEO_FBDEV_VERSION).tar.xz
+XDRIVER_XF86_VIDEO_FBDEV_SITE = https://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_FBDEV_LICENSE = MIT
 XDRIVER_XF86_VIDEO_FBDEV_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_FBDEV_DEPENDENCIES = xserver_xorg-server xorgproto
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
