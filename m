Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4044EF587B
	for <buildroot@archiver.kernel.org>; Sun, 15 Feb 2026 16:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D9A340A6A;
	Sun, 15 Feb 2026 16:04:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0vrBHA-q-2Qe; Sun, 15 Feb 2026 16:04:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5869840A70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771171471;
	bh=v6Bh1echPL85FoRzMA0/BDECdxzNO5Yi9hZkH1Tc4e0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SfbU+GMbp49vPlK+amQX3GZ9y+jMuZ5GbWj7ogtzAy2aPwj0f3DaU015ZglIv1uWJ
	 mc8BsyNIH4YJp0dKX3Qktu+kp9rsj0WyFk8D0Pcn0BTfT5UaH3QYWm7ZIrAQeXcqj4
	 nbO+s7ZqmaMtTW5EirNgEQEYuRxu+9+iv5z0dd+F0G4ROy+VVJSIF3fa83JSYpWu0M
	 VlckeZ1K7w1HxrKooQaWwIaw8FYccFaWmoQI+4TmPbd2s2yDW5+koIhSnwUVmJOvm/
	 dLk9Iwjtnvl7shB6vnV3UKGQSutFycMygONIux2XBeq/iHcxHzkkOJPUkQqscfZHl0
	 5cAFXaWgZbv0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5869840A70;
	Sun, 15 Feb 2026 16:04:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 300A6270
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 16:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 15175810DC
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 16:04:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LboUWuN4iZaz for <buildroot@buildroot.org>;
 Sun, 15 Feb 2026 16:04:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 30F17810D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30F17810D3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 30F17810D3
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 16:04:28 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c3ec.dip0.t-ipconnect.de [79.214.195.236])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8FC30A4C0427
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 17:04:25 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43270)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vrebg-000000008TV-3nlW
 for buildroot@buildroot.org; Sun, 15 Feb 2026 16:04:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 15 Feb 2026 17:04:25 +0100
Message-ID: <20260215160425.1421192-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1771171465;
 bh=6c+EbLpZ49GAG9zpThVgPYRg56hVaCr2wbNedFey/sE=;
 h=From:To:Subject:Date:From;
 b=Q2rl4Wnjqn6WrLmx9/3IjP3O4lHy8xrqRVpc/tVvdUddF22FsD6HmGJGxabAIP3Tc
 dJihBkUuxs5h2OtD4+ufH+Dl60g/6EfkZGtSMFeImAx31vW3vP9zS5kgLd0EEUjjcp
 /RKxhPLsCs/+Pz4SiIRKUycINle1sanfUHUNAERoEeKlOFNKtiwmM/dKO5VyVDsoTd
 teATnsMsMCcexLcWiFJaSQu6pFKKV5UPF5sFBFgc5oYXBCJRChQDugyVg+r0IUPglr
 LkIU61QaYr5B9Fs2TwYI25DnuhWeHM+CL4bVXL21IgeyNx6s7GsslfqvS1TL+cNlNp
 Fc1Ai2cHFwpKQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Q2rl4Wnj
Subject: [Buildroot] [PATCH 1/1] package/coreutils: bump version to 9.10
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

Upstream does not provide hashes in sha1/sha256 format anymore.

https://lists.gnu.org/archive/html/coreutils-announce/2025-11/msg00000.html

https://lists.gnu.org/archive/html/coreutils-announce/2026-02/msg00000.html
"'kill' and 'uptime' are no longer built by default.  These programs
 can be built with the --enable-install-program=kill,uptime configure
 option."

Adjust coreutils.mk to install 'kill' and 'uptime'.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/coreutils/coreutils.hash | 4 +---
 package/coreutils/coreutils.mk   | 5 +++--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/coreutils/coreutils.hash b/package/coreutils/coreutils.hash
index d01955d927..ce507a3015 100644
--- a/package/coreutils/coreutils.hash
+++ b/package/coreutils/coreutils.hash
@@ -1,5 +1,3 @@
-# From https://lists.gnu.org/archive/html/coreutils-announce/2025-09/msg00000.html
-sha1  a6a58e00688fe0705a7051b36592f1e43e89a9ef  coreutils-9.8.tar.xz
-sha256  e6d4fd2d852c9141a1c2a18a13d146a0cd7e45195f72293a4e4c044ec6ccca15  coreutils-9.8.tar.xz
 # Locally computed
+sha256  16535a9adf0b10037364e2d612aad3d9f4eca3a344949ced74d12faf4bd51d25  coreutils-9.10.tar.xz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index b764cb5843..01c0cc72f1 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COREUTILS_VERSION = 9.8
+COREUTILS_VERSION = 9.10
 COREUTILS_SITE = $(BR2_GNU_MIRROR)/coreutils
 COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
 COREUTILS_LICENSE = GPL-3.0+
@@ -16,6 +16,7 @@ COREUTILS_CPE_ID_VENDOR = gnu
 # if the system is compliant even with this option passed
 COREUTILS_CONF_OPTS = --disable-rpath \
 	--disable-year2038 \
+	--enable-install-program=kill,uptime \
 	$(if $(BR2_TOOLCHAIN_USES_MUSL),--with-included-regex)
 
 ifeq ($(BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES),y)
@@ -57,7 +58,7 @@ COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
 
 COREUTILS_BIN_PROGS = base64 cat chgrp chmod chown cp date dd df dir echo false \
 	kill link ln ls mkdir mknod mktemp mv nice printenv pwd rm rmdir \
-	vdir sleep stty sync touch true uname join
+	vdir sleep stty sync touch true uname uptime join
 
 ifeq ($(BR2_PACKAGE_ACL),y)
 COREUTILS_DEPENDENCIES += acl
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
