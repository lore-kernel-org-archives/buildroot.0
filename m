Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC788EB362C
	for <buildroot@archiver.kernel.org>; Mon,  2 Mar 2026 21:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78EAD6088C;
	Mon,  2 Mar 2026 21:00:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7O4FRHy4s-0G; Mon,  2 Mar 2026 21:00:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94BE961043
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772485254;
	bh=i69gEbRTJXZ4qrxYYVTy8bljYiv+t8AIpyVHFc0D+Wo=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MM6hXp32UtsbU4Dqb/1a7JBA2UKTYfFHkPy1Jb3WZwiQhvYMeoejyJ+szBM1t29jF
	 +k6NThbSLGJ9J6Ek6oFNgmDqr+PYnXsykDRRMxEHFNVJHmgQ5OrlzJDz0eZJZvh9rT
	 Tk3JmqALTuoDdOBMRRiK2GoJZKCJHVBBKfUQHJ4a5vss73K6Lgkcd2dXc21oexbsmf
	 oqYLGTP3Y/sjtwmSDZmCeYThs54wIsnxGhusJt2AukCeMOFHu0rK5VOB2jjbo8sH/k
	 Xo/3iDH5gKF0RJgP4fNaqtzDmiWbkZBQpzJUML+uFmzhK+2NiIGwUX55rfbTyWvaUK
	 M856tYSNOjDug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94BE961043;
	Mon,  2 Mar 2026 21:00:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5739B231
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 21:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CD5F40347
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 21:00:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AYCPsnwhJgpE for <buildroot@buildroot.org>;
 Mon,  2 Mar 2026 21:00:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E463E40147
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E463E40147
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E463E40147
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 21:00:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a037c.dip0.t-ipconnect.de [91.58.3.124])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E1957A4C33AE;
 Mon,  2 Mar 2026 22:00:37 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41472)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vxANZ-000000006VS-3Ofo;
 Mon, 02 Mar 2026 21:00:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  2 Mar 2026 22:00:37 +0100
Message-ID: <20260302210037.1931571-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302210037.1931571-1-bernd@kuhls.net>
References: <20260302210037.1931571-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772485237;
 bh=gCc/Vj7rsl/KzJjJeAweg5f3qaNd9Fv1eka6l0+m8NY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=I+jh5tO8xofr46TeMjiv/KHyST8CO8gQ9LBf+z2sRj4AIAzr0bC7O9EqNepMK/0HA
 r35BNjNLEJFwoj/0wI6pwDRrALm1BhUF690XSQWjrFsitTjMRniUg0Jts7W7BMlwwL
 LAzPJC+9av37bnV29DIskm5S9zM3xG7Bi9QX2ejzm7cfJw76+6w1euHCybRIVO9ibv
 Bv9HKDjheZuha6oATR0lRYX/JQyjhWfN2cmCGXnIyu45wtUOJVKot62tVq8YG4go2w
 fIK4eGXnHO2SQDgB53k+uZxT27btSK/znY30Zi7XeWqvgJ9VKHNUVDQYLKOw48jxxW
 zQjjW8S6p2TGw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=I+jh5tO8
Subject: [Buildroot] [PATCH/next v2 2/2] package/fwupd-efi: bump version to
 1.8
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

https://github.com/fwupd/fwupd-efi/releases/tag/1.8

Added TARGET_LD to _MESON_EXTRA_BINARIES due to upstream commit
https://github.com/fwupd/fwupd-efi/commit/a7ac71e3b391e040d9ca0d58d2d186be5b60b631
which causes a misdetection of the linker used.

Build log without specifying TARGET_LD:

  Program ld.bfd found: YES (/usr/bin/ld.bfd)
  [...]
  /usr/bin/ld.bfd: cannot represent machine `aarch64'

Build log with specifying TARGET_LD:

  Program ld.bfd found: YES

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: fixed linker detection (Julien)

 package/fwupd-efi/fwupd-efi.hash | 2 +-
 package/fwupd-efi/fwupd-efi.mk   | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/fwupd-efi/fwupd-efi.hash b/package/fwupd-efi/fwupd-efi.hash
index 42f9eb83ff..8bca799e68 100644
--- a/package/fwupd-efi/fwupd-efi.hash
+++ b/package/fwupd-efi/fwupd-efi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  96d4fc45467159b2664ce86ee7d5030e265fdb4d4a4d774080654d2f5b1561ff  fwupd-efi-1.7.tar.gz
+sha256  c9f1f9b9b967ea50eb0b478f0d7693d6673d4cd76c8e7eb80c55fc44ec928925  fwupd-efi-1.8.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/fwupd-efi/fwupd-efi.mk b/package/fwupd-efi/fwupd-efi.mk
index fbff5a9043..cc44ec7e48 100644
--- a/package/fwupd-efi/fwupd-efi.mk
+++ b/package/fwupd-efi/fwupd-efi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FWUPD_EFI_VERSION = 1.7
+FWUPD_EFI_VERSION = 1.8
 FWUPD_EFI_SITE = $(call github,fwupd,fwupd-efi,$(FWUPD_EFI_VERSION))
 FWUPD_EFI_LICENSE = LGPL-2.1+
 FWUPD_EFI_LICENSE_FILES = COPYING
@@ -22,6 +22,8 @@ FWUPD_EFI_CONF_OPTS = \
 	-Defi_sbat_distro_url=https://gitlab.com/buildroot.org/buildroot/-/tree/master/package/fwupd-efi \
 	-Dgenpeimg=disabled \
 	-Dpython="$(HOST_DIR)/bin/python3"
-FWUPD_EFI_MESON_EXTRA_BINARIES = objcopy='$(TARGET_OBJCOPY)'
+FWUPD_EFI_MESON_EXTRA_BINARIES = \
+	ld.bfd='$(TARGET_LD)' \
+	objcopy='$(TARGET_OBJCOPY)'
 
 $(eval $(meson-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
