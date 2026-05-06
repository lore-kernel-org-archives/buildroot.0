Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C594CD342C
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 18:41:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 305FD60EE8;
	Wed,  6 May 2026 18:41:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6cfC88-Gq7MC; Wed,  6 May 2026 18:41:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 535CD60ECA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778092914;
	bh=yIWsvM1LxdTrb3v6fSgD2+6wKEM4I6c6V/mWuFqgNq8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EPhg5LHqDoPXiDtzYX1bU1ZngVV0ZZ5dXGBDk0goSlvcNZlVa99WO+SnIKYJz2Fev
	 sx2ADNd4rwcdtg7jA/gcSPCii0fHO4siYX4NrQEO2gdb9RB3bwWhI3/oYbbgW3svgZ
	 1lrXTRoh7K5CH5MyzHRYNTG0Uy5A8viVN8mcCQVG0vM/5tJ/z9rSLbOkWM+eLSTFrr
	 HVg4AteiGbQD9Lco0fPgjBorZvxiHPxJyZiWvsHudRAMWNpYoVbhmry1//wscNnEeS
	 tA9i7+N9ZOWts01ly2j2QQgvJeea0JAogirGJVgQa4OGEGKXUZU+8HeNkA6N3CP/k6
	 7N1sfL6Nldy7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 535CD60ECA;
	Wed,  6 May 2026 18:41:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 84014317
 for <buildroot@buildroot.org>; Wed,  6 May 2026 18:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7584C82BED
 for <buildroot@buildroot.org>; Wed,  6 May 2026 18:41:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fkz53E3lJDZa for <buildroot@buildroot.org>;
 Wed,  6 May 2026 18:41:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4658A82BE5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4658A82BE5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4658A82BE5
 for <buildroot@buildroot.org>; Wed,  6 May 2026 18:41:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bec8.dip0.t-ipconnect.de [84.161.190.200])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C6BA4A4C20BF;
 Wed,  6 May 2026 20:40:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38038)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wKhB4-0000000040X-0LJD;
 Wed, 06 May 2026 18:40:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Norbert Lange <nolange79@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  6 May 2026 20:40:48 +0200
Message-ID: <20260506184057.665854-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260506184057.665854-1-bernd@kuhls.net>
References: <20260506184057.665854-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778092858;
 bh=DqczrSEsd6fb7ccT3KhI16jJ6ZWvhs0ipQDJVf/6MbM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=hqypf7RyBUxojXZsnpwkDHC4YlGWpeXfH4kBslGrfdcFZuDOSoH9O/ghE0xcjr4EZ
 G3iQNntuksO0VpDHObZuhpDGn5DjUB7ttAaJwwmBDHjquqM2oq7UPM+K40rrNaPO2k
 GkkWMQTpgvSWXdLI9UnXDGcOEKx+yhLSYyE9KdQlVhUrLJ45nKDeYOV+SaK7G9GTnx
 Pgs8LDRlHRRfwRvnLQie+oYyTdsup+xEoYjAhKk+bJfcC/mj73nem3LJ1oV7TrW/6J
 +WVix1C4HTpPfMEf6YWv/oVd5dcqf1C7UFJseoE9R+dW/69fIelMPTXHBomNy0WtPs
 FDshbYLEMHNpg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=hqypf7Ry
Subject: [Buildroot] [PATCH 04/12] package/eudev: provides libudev
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
 package/eudev/Config.in | 4 ++++
 package/eudev/eudev.mk  | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index 65cfc1d2de..5eefed71dc 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_EUDEV
 	depends on BR2_USE_MMU # uses fork()
 	depends on BR2_USE_WCHAR # needs C99 compiler
 	depends on !BR2_STATIC_LIBS # dlfcn.h
+	select BR2_PACKAGE_HAS_LIBUDEV
 	select BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_UDEV_GENTOO_SCRIPTS if BR2_INIT_OPENRC
 	select BR2_PACKAGE_UTIL_LINUX
@@ -19,6 +20,9 @@ config BR2_PACKAGE_EUDEV
 
 if BR2_PACKAGE_EUDEV
 
+config BR2_PACKAGE_PROVIDES_LIBUDEV
+	default "eudev"
+
 config BR2_PACKAGE_PROVIDES_UDEV
 	default "eudev"
 
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 3c22b13d86..a060e8f0d8 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -18,7 +18,7 @@ EUDEV_CONF_OPTS = \
 
 # eudev requires only the util-linux libraries at build time
 EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux-libs
-EUDEV_PROVIDES = udev
+EUDEV_PROVIDES = libudev udev
 
 ifeq ($(BR2_ROOTFS_MERGED_USR),y)
 ifeq ($(BR2_ROOTFS_MERGED_BIN),y)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
