Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B850EC2A060
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 22:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FE9960AA5;
	Sat,  3 Jan 2026 22:43:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2r02arde17o0; Sat,  3 Jan 2026 22:43:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 963C060A6B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767480232;
	bh=XIud550Z5ViTR2IWeKCO+MS5WgMtntdEEDW3iSDrTN8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gTcOY6Y7uN6SHzy57oEClRNk/TCP1KXF3cN+IWnUTHtbCQ8W7purtLqEY39PqaJbw
	 52fty/pQdRsUj/bFF0hNgqhkhVGJ7vMvWWur1t+cdYvljShrPsvdf5yF0x+uGHRQIT
	 ysduAAzTh0uETWtSgyammoxBA1ur+xn55aiDhbaIo8KXtALeS10JOL3GEAG6aJDXtx
	 gPAXym7Zs1pSEnXXVZZDzqLHG3Wy8KszNXhLiZoyCGMuxaLKrDRuoxyNBqPyRNpL6e
	 HqRBH00FZtplEOgMXul6WJGgoXUW7qKPYDX7jsE4xa7d7p4m3iODfLcOSWde7Kv0Sz
	 FTPI7KW755hQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 963C060A6B;
	Sat,  3 Jan 2026 22:43:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A760D70A
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 22:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A56944058C
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 22:43:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hGGfiW_t_Eqa for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 22:43:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3EE2F4057E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EE2F4057E
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3EE2F4057E
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 22:43:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id E5B36C1C95A;
 Sat,  3 Jan 2026 22:43:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CC36B6072B;
 Sat,  3 Jan 2026 22:43:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 34825113B06CE; Sat,  3 Jan 2026 23:43:46 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Sat,  3 Jan 2026 23:43:20 +0100
Message-ID: <20260103224330.2933161-7-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260103224330.2933161-1-thomas.petazzoni@bootlin.com>
References: <20260103224330.2933161-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767480226; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=95OfwoCQI+SovO61vlixe/uhW5UdgkN6jAR8vCIkbJc=;
 b=YTmGV8QS+znhCq7Myc+utXpXW4pxU/EQbx3hgrL/pN4Oe/vXF0GlcqNj0Yeh+Hbp7VawHi
 2tETge8F23z6P0T7Q1Ql8FZfBk3vCxCqnqcmE6K65AKcoBh6xRShOaK0rSRIblS+vpdKcc
 ERxLkGuDxPCiyC/3YmsH8jeu47+97kM669m+IvYO60oBCSBhdXHLOYjsIxM277Q3LScWFd
 qhDqdC4eLMLmxLCRdjvNelNL62lEjOVHZw+Gyx8cEnv28pwgjT9cT0aEpo2Fux8dyNADMz
 Lpj25rAb9E5JB8a0JxfWS4OvsfjunZ9EIGFww6IGr0sQsoSvXqigTTd4+x0RQg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=YTmGV8QS
Subject: [Buildroot] [PATCH 07/11] package/mender-update-modules: fix
 dependencies of BR2_PACKAGE_MENDER_UPDATE_MODULES_ROOTFS_VERSION_CHECK
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since this option was introduced in commit
a474642fdcd8c69e12126bbe8304479aa855d916 ("package/mender-update-modules:
new package"), its dependencies have been incorrect. It selects
BR2_PACKAGE_PYTHON3 without replicating all its dependencies, so we
fix that.

Also, it did have the !BR2_STATIC_LIBS dependency propagated, but not
mentioned in the Config.in comment, so we fix that as well.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mender-update-modules/Config.in | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/mender-update-modules/Config.in b/package/mender-update-modules/Config.in
index 1158bb42b2..88e0805976 100644
--- a/package/mender-update-modules/Config.in
+++ b/package/mender-update-modules/Config.in
@@ -173,6 +173,8 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_REBOOT
 
 config BR2_PACKAGE_MENDER_UPDATE_MODULES_ROOTFS_VERSION_CHECK
 	bool "rootfs version check"
+	depends on BR2_USE_WCHAR # python3
+	depends on BR2_USE_MMU # python3
 	depends on BR2_TOOLCHAIN_HAS_THREADS # python3
 	depends on !BR2_STATIC_LIBS # python3
 	select BR2_PACKAGE_PYTHON3 # runtime
@@ -195,8 +197,10 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_ROOTFS_VERSION_CHECK
 
 	  https://github.com/mendersoftware/mender-update-modules/tree/master/rootfs-version-check
 
-comment "rootfs version check needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+comment "rootfs version check needs a toolchain w/ threads, dynamic library, wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_USE_WCHAR
 
 config BR2_PACKAGE_MENDER_UPDATE_MODULES_RPM
 	bool "rpm"
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
