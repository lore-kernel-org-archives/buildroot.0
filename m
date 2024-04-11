Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09967C4345F
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 21:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCB57612FA;
	Thu, 11 Apr 2024 21:01:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ibEMrqEty3s1; Thu, 11 Apr 2024 21:01:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9A616130C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9A616130C;
	Thu, 11 Apr 2024 21:01:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E7DD11BF330
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 21:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D57B482274
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 21:01:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zZjvOWdiGRuk for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 21:01:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D52CB82269
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D52CB82269
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D52CB82269
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 21:01:16 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1baba.dip0.t-ipconnect.de [84.161.186.186])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E826DA4C3057;
 Thu, 11 Apr 2024 23:01:14 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33130)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rv1Xm-000000001DB-0fvS;
 Thu, 11 Apr 2024 21:01:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 11 Apr 2024 23:01:14 +0200
Message-Id: <20240411210114.2127887-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712869274;
 bh=uHeBRNwT1GS9MM4Eta8HmFiRN2HcKorcIiw2BkB/Eeg=;
 h=From:To:Cc:Subject:Date:From;
 b=ijk7ij0M8DQ5/cEaPOKk+RIQyf2uDc4AqNqwmJtUPyaV651XKggDLQb0UCU+Q4JXy
 8Y3+jwzYMxitRkWgw2TlwSeEEgr9HYwjxvV1VmUKZUzae0BHdPkz90DHzqsDTqirqy
 TiNvFnWBZTYn9s7K6OqtxSUpPjjuohAHEyihLXCbqvoroCu7pTQ/bu0xbonPaDFTXK
 uZUY082WLWLA0kNn1XvLunBBnenjXd9AIfpUjX8TOKkkWIBl7NXUIjMKMhQi+0pJuW
 smp/NqoOF/zOco8cMtA6lcvw6m900E8o/c+Rs2rZnGNQdBA+TnYxIH0knitNaPvIzd
 bXm5gKy3PaaQw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=ijk7ij0M
Subject: [Buildroot] [PATCH] package/libinput: bump version to 1.25.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://lists.freedesktop.org/archives/wayland-devel/2023-August/042967.html
https://lists.freedesktop.org/archives/wayland-devel/2024-January/043396.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libinput/libinput.hash | 2 +-
 package/libinput/libinput.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index f6a67fc1ed..643cb16213 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  fad7011705a21f500229199f789f3e3e794b4c9826b70073745cdaec23bc1d0b  libinput-1.23.0.tar.bz2
+sha256  193bd592298bd9e369c0ef3e5d83a6a9d68ddc4cd3dfc84bbe77920a8d0d57df  libinput-1.25.0.tar.bz2
 
 # License files
 sha256  80de50b2022a840db044c56db804ca3565600a692c0714babface587acc6d1b0  COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index a4d30b5910..499ed5ff4b 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.23.0
+LIBINPUT_VERSION = 1.25.0
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.bz2
 LIBINPUT_SITE = https://gitlab.freedesktop.org/libinput/libinput/-/archive/$(LIBINPUT_VERSION)
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
