Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F7CCCA471
	for <buildroot@archiver.kernel.org>; Fri,  3 Oct 2025 20:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4EAE61510;
	Fri,  3 Oct 2025 20:12:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RiyL8EQLpl7o; Fri,  3 Oct 2025 20:12:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C768761519
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C768761519;
	Fri,  3 Oct 2025 20:12:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E343226
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 606FF6151D
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:12:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PyeUMW2NiE-M for <buildroot@buildroot.org>;
 Fri,  3 Oct 2025 20:12:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 545F961510
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 545F961510
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 545F961510
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:12:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a03c3.dip0.t-ipconnect.de [91.58.3.195])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 75537A4C5BC6;
 Fri,  3 Oct 2025 22:12:42 +0200 (CEST)
Received: from [192.168.1.144] (port=42792 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v4m8w-000000007Lw-03tP;
 Fri, 03 Oct 2025 20:12:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri,  3 Oct 2025 22:12:40 +0200
Message-ID: <20251003201241.2430247-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759522362;
 bh=YjVQXcl9ttVVzZylnVu1qVFvDZf7yo9kWqryhgXfjVY=;
 h=From:To:Cc:Subject:Date:From;
 b=Xn6e1HC2KCh//NMDsmzwEdc1RlWFP6I3k7ouq+IhYSXEjBcGksNNXbypRE/hnb6C/
 9PHRTKq2f8QiYANK1vrZL65zAPm8/EAp/ACszuS04Mbt+MHFkk09wyZZhuqGGRL8WQ
 /dSJNjUZXchOHxKb6hHi6MhHUrYkVMwDfMvpJZIl0MCm9Wu1zp1U8Q4K46JLqqF9bD
 FGM6PsJeVVRO0cW9tV4yZ70duza4cE8wKIxodaCrwV2fCw1ROW43HdbkZ+lq7taYb1
 ORSsc86dkXqHuLAnLhmOOBqBnt/yBFwEXu2pCOZHSKILa++VAhAhS5sQ+T3ZzZ+09e
 23fKdQtcMHfLA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=Xn6e1HC2
Subject: [Buildroot] [PATCH 1/2] package/libudfread: bump version to 1.2.0
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

Required by libbluray bump to 1.4.0

Changelog:
https://code.videolan.org/videolan/libudfread/-/blob/1.2.0/ChangeLog?ref_type=tags

Use xz tarball and sha512 hash provided by upstream.

Follow upstream switch to meson.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libudfread/libudfread.hash | 3 ++-
 package/libudfread/libudfread.mk   | 9 ++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libudfread/libudfread.hash b/package/libudfread/libudfread.hash
index 332b472d59..6936a37f1a 100644
--- a/package/libudfread/libudfread.hash
+++ b/package/libudfread/libudfread.hash
@@ -1,3 +1,4 @@
+# From https://download.videolan.org/pub/videolan/libudfread/libudfread-1.2.0.tar.xz.sha512
+sha512 e3ed8dc7fab472ad382b1b6cd068f1dc0084c34e5ec2c460c1dd84fa14a9d368c4d7af08a23efc5057e7f021f5812222c01247d5f304632716c94fc8c689a1a2  libudfread-1.2.0.tar.xz
 # Locally computed
-sha256  cd062016d78902da53a34c4d536479dbb70b2a05116354d46ead4d0c498ed375  libudfread-1.1.2.tar.bz2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libudfread/libudfread.mk b/package/libudfread/libudfread.mk
index 55d4fb8e47..1e74c42076 100644
--- a/package/libudfread/libudfread.mk
+++ b/package/libudfread/libudfread.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-LIBUDFREAD_VERSION = 1.1.2
-LIBUDFREAD_SOURCE = libudfread-$(LIBUDFREAD_VERSION).tar.bz2
-LIBUDFREAD_SITE = https://code.videolan.org/videolan/libudfread/-/archive/$(LIBUDFREAD_VERSION)
-LIBUDFREAD_AUTORECONF = YES
+LIBUDFREAD_VERSION = 1.2.0
+LIBUDFREAD_SOURCE = libudfread-$(LIBUDFREAD_VERSION).tar.xz
+LIBUDFREAD_SITE = https://download.videolan.org/pub/videolan/libudfread
 LIBUDFREAD_INSTALL_STAGING = YES
 LIBUDFREAD_LICENSE = LGPL-2.1+
 LIBUDFREAD_LICENSE_FILES = COPYING
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
