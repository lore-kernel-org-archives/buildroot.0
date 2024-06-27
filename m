Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98BCEC3064D
	for <buildroot@archiver.kernel.org>; Thu, 27 Jun 2024 21:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 677276067D;
	Thu, 27 Jun 2024 21:05:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CdibJP7qmDU3; Thu, 27 Jun 2024 21:04:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D36460E8E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D36460E8E;
	Thu, 27 Jun 2024 21:04:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 677F41BF3CA
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 21:04:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51F6481336
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 21:04:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4HQ4VmG6Tw-w for <buildroot@lists.busybox.net>;
 Thu, 27 Jun 2024 21:04:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 83FB581334
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83FB581334
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 83FB581334
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 21:04:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bb6a.dip0.t-ipconnect.de [84.161.187.106])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BC7D2A4C213C
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 23:03:29 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43114)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sMwHB-000000000PR-2hai
 for buildroot@buildroot.org; Thu, 27 Jun 2024 21:03:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 27 Jun 2024 23:03:28 +0200
Message-Id: <20240627210328.1560834-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240627210328.1560834-1-bernd@kuhls.net>
References: <20240627210328.1560834-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1719522209;
 bh=DRjZRt1VC0GnRzTZglK6ySZ/GhrR20mVURG99WGK7fQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=PJryx52VHVLXzB+TAj/YH/8DIS7t1628Ba2KCTHY+wBHnJukYxQjl/lnPuS8O6NeT
 h5omj3kCVscCSAOOGm9Ep9jM+R0v36CJIP/dyYWLwP1QSA7a5Lt+JrZSXZ2a8FNUo0
 YuLoDIA5lVUezlJqTyYZk6iKQ6VLynQbZoRHJ/II/o0swuKxGpC1ANgiBczm98n4y8
 YnydvTzgJABzyLNIAcRoMwMNwxmG/CMWjkt6HoLOINU/5W31i3TFuKIFc/rM2mz0x2
 nQYb1kvc/qrKrJm7p+1zQh34IxDcNVTl9TUNxXXWM4ryVc5BmyOFdsEHW/Bp3Bnl+0
 Dp4mhQmzEdY8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=PJryx52V
Subject: [Buildroot] [PATCH 8/8] package/kodi-vfs-libarchive: bump version
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
 package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash | 2 +-
 package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash b/package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash
index 1e686715ea..729a569f9a 100644
--- a/package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash
+++ b/package/kodi-vfs-libarchive/kodi-vfs-libarchive.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  22977bd2479244c4b06e2149bae891bc7dbc64649a89813f4e6fc88e78169f68  kodi-vfs-libarchive-a5443a3896b9638018e69d1e4430a7524ac20ffc.tar.gz
+sha256  23515c84f4a0cceaf845c1d6c0c39947a28be2d515cff995b384b29e93b11831  kodi-vfs-libarchive-0333aa5e189221e76282eeefb3f573e27b187551.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk b/package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk
index 069c92cc5f..257a0d04f6 100644
--- a/package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk
+++ b/package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VFS_LIBARCHIVE_VERSION = a5443a3896b9638018e69d1e4430a7524ac20ffc
+KODI_VFS_LIBARCHIVE_VERSION = 0333aa5e189221e76282eeefb3f573e27b187551
 KODI_VFS_LIBARCHIVE_SITE = $(call github,xbmc,vfs.libarchive,$(KODI_VFS_LIBARCHIVE_VERSION))
 KODI_VFS_LIBARCHIVE_LICENSE = GPL-2.0+
 KODI_VFS_LIBARCHIVE_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
