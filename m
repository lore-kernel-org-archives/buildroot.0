Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 818F3C624D6
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 04:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 129D280FE8;
	Sat,  5 Sep 2026 04:03:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gVRIiccgEu4X; Sat,  5 Sep 2026 04:03:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9EB6D80FF7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788581016;
	b=A08+paCl8JEVjr/jaJ0bm9gRXMceZAhDmo5BtZ28VJnX4MyynmNdI0J2uSNFaaLcK+9z
	 zYMPGtI/Quvr7uV/xGn2Id16IJmzxFu7+7NxSDqrT4qAEjAShUdjMWBzlJVyYkFP1vKpK
	 eDmaJAjGJSJc9PioYIBa2+KJJbjmxYeZyLJChy67EcoHhUk1q8ZClFRP0VXelY6CvF2EB
	 7Ovs+EYAr/STKZquA9NjNOd07kv7RsrZ9lErYR/Aed3UeDWdZBbxqhIZIBTPUyzcs9V1n
	 Gw6atbJOY2ew8dpO5B23qn/5Srwmy5e0v9WGETRarz5wN/f/Zq8jiXx8KtITaLthR4A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788581016;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Virus-Scanned:X-Virus-Status:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=0UyULavE2NaB0lZb2d0a1FDlBvc7ljVoIGwOyWrMGvY=;
	b=kQ9/TtgC0LGByVWxI+EWVY7pHyEhULY8TNiQaRlg+PVOw/jnssopt/FSdm8ZJWQmDXih
	 BRV8BxgO3dPS4r/oPDmMcy12q7m7M43Khb8k+1YHoHMPCO3Lz0CWavf+4AeFslnwkYp/C
	 Su8O6pTysPN30kWwUCFqeUBhQPuMC364RwYFpYuyFqHBcxo3Wgw1v06zLLxkFoKLqV+zI
	 ytn6B8Uo1maObaVKGsd4PZGlV3TOyG3KULjjAQ65Df5f5F8ZBKYjsDODRqw5iZm7azc99
	 aJ/giAlM9nVa9bM9+Wn4REwD1zgSPaFU+MswcOY2CpNjId06PL8cUrIA6yrxK4XYOCw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788581016;
	bh=0UyULavE2NaB0lZb2d0a1FDlBvc7ljVoIGwOyWrMGvY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gOPLCuUWwidWkcTuhkpRT1R8ypkaMGL9xQqtjZEp16YDTyH93l54/zTJsSS4jSKUb
	 VdS/9t3w3wxn80XyTZrv4LfxeykeyywVPQXhwhncEOfQE9Xc+LIBRjmBTdLeFd+xQz
	 xtTraSIbazs7Sf5aqy/ZCzjrgE36dlebglqpK85/ssXKJcg4ngwRnEAmorUHsu3ETz
	 lRYuVVw/ZqAEsMuIPCGYX5cXTWMTKQH33wzshcN6xy3QIcFCm5dEpdq36ojogs9yeX
	 ESDZ8me/hN9au8Xy7hGmMJKK4Kycm6AtUr7ddNs5eZsJ4Migm5a8ZZENRu7oemWuVI
	 UlXjZ09GNP+BQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EB6D80FF7;
	Sat,  5 Sep 2026 04:03:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 532501F28
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 04:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40F6740BEC
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 04:03:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Av0ccf8BjMs for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 04:03:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2EAEC40BF0
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a01:4f8:151:30a2::163"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788581011;
 b=oleA83sReGMI1TSSwIO6Btj8LTZt2Q7WgmxZhdooy1pINovU4Ze/XMozB+BMrWHsFps9
 dXNJEmMPUok/fECPfo7mWxndZ6svsJhamnao1OihI6fmnGUHLoB+XwvBF5rh1tofVIego
 RWw9LFFn9dQu4lT+d0KF1D5geYSZyZqpgJcxZpB/nsntdRzav1Y71z3+Xoxp9QV+WnsLU
 PegNO+3+OgV2tN6kahXla+d0+sJXVTwPX9Qj85PK3BAboGp2szGlaYEwCactED9AHfLtP
 unIdgz0/PGOoxC2i/sdlIdz+fU4PYwUdnITafwNYITfwWhyhA1EUyFvP189e8N9cqPg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788581011;
 h=Received-SPF:DKIM-Signature:Received:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Virus-Scanned:X-Virus-Status;
 bh=OjI5Qxk5hTMA5VsgX+fAHSdh48XeIFg5tVznZJxr4tE=;
 b=DpDUs1hc8hjXle0PBsq3fgYxzbx1B1Nvn2c2D0x4O+FVFpS3GaP9gYIGmEbwx7DDGIem
 MiCCpCw2eD1vKevd9uKim6KASzYaaKy0qQT8eW5qFiCjsKvKEYw3tiSV+e7fGlnpPfuOM
 JVTv15NdRKOWgfJXC9iifvpVLWN0NLEDsbbLfQN4+PRL86DZfbFKaYEiVjPPFvd0XUIeQ
 8GpqIhy0iEIgocwWsCXNXAFzlcCnRvVF1jimop6oZ3tIHTLf0AKsFPH1YqYYKe7Ewy6+p
 vO+YGiBkvYjKkUMaxDqcXl9balRdwv7sKjcyW+iZ9lZkAiig0UEeSe29+Df4c1crawg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=none header.from=umbiko.net; 
 dkim=pass header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=kqOgNpS9; 
 arc=none smtp.remote-ip="2a01:4f8:151:30a2::163"
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=umbiko.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=kqOgNpS9
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2EAEC40BF0
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 04:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=umbiko.net; s=mail;
 t=1788581008; bh=BuY1Ry9fUqRa9uOq+rBBKlj8xRyuVyEfV0tb/QoHeg0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=kqOgNpS9/2t0NK/qZ/QSSXxOSzBteCZ5jBj3vC6OEw0XawF+h+cPlbNA0V1CAsREi
 UXf4/Ii4y8P4i+TGYO3A4arDArtwAnWQ0Tc0Qq4FPXLbS1McER2TrvlY6MOU9tJFPJ
 8wOgVO84Rv7L2x2sn8rV4r8EiC/tbTexIGiXJo2g=
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 6C469BDE0236;
 Sat, 05 Sep 2026 06:03:27 +0200 (CEST)
From: Andreas Ziegler <br025@umbiko.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>, Andreas Ziegler <br025@umbiko.net>
Date: Sat,  5 Sep 2026 06:02:52 +0200
Message-ID: <20260905040256.2221199-2-br025@umbiko.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260905040256.2221199-1-br025@umbiko.net>
References: <20260905040256.2221199-1-br025@umbiko.net>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
Subject: [Buildroot] [PATCH v4 1/2] package/mpd: remove unused,
 add mandatory configuration items
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

The configuration file supplied by Buildroot is only a sample; it will
not start MPD on a default installation. In a production build, a custom
mpd.conf has to be supplied via rootfs overlay or on the target system.

Supply the necessary configuration items to start mpd in a default build,
and discard unused customizations. 

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
---
Changes v2 -> v3:
	reintroduce Buildroot mpd.conf as fragment file
Changes v3 -> v4:
	drop deployment of upstream config file

 package/mpd/Config.in |  2 --
 package/mpd/mpd.conf  | 31 ++++++++-----------------------
 package/mpd/mpd.mk    |  2 --
 3 files changed, 8 insertions(+), 27 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 1b6815e904..bbd6fc16e5 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -119,7 +119,6 @@ config BR2_PACKAGE_MPD_LIBSNDFILE
 
 config BR2_PACKAGE_MPD_MAD
 	bool "mad"
-	default y
 	select BR2_PACKAGE_MPD_ID3TAG
 	select BR2_PACKAGE_LIBMAD
 	help
@@ -244,7 +243,6 @@ comment "Output plugins"
 
 config BR2_PACKAGE_MPD_ALSA
 	bool "alsa"
-	default y
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_ALSA_LIB_PCM
 	select BR2_PACKAGE_ALSA_LIB_MIXER
diff --git a/package/mpd/mpd.conf b/package/mpd/mpd.conf
index 5956b75e24..b9fba3179a 100644
--- a/package/mpd/mpd.conf
+++ b/package/mpd/mpd.conf
@@ -1,32 +1,17 @@
 #
-# Sample configuration file for mpd
-# This is a minimal configuration, see the manpage for more options
+# Buildroot mpd configuration
+# Example file: doc/mpdconf.example in the build directory
+# Documentation: http://mpd.readthedocs.io/latest/user.html
 #
 
-# Directory where the music is stored
-music_directory		"/var/lib/mpd/music"
-
-# Directory where user-made playlists are stored (RW)
-playlist_directory	"/var/lib/mpd/playlists"
-
-# Database file (RW)
-db_file			"/var/lib/mpd/database"
-
 # Log file (RW)
 log_file		"/var/log/mpd.log"
 
 # Process ID file (RW)
 pid_file		"/var/run/mpd.pid"
 
-# State file (RW)
-state_file		"/var/lib/mpd/state"
-
-# User id to run the daemon as
-#user			"nobody"
-
-# TCP socket binding
-bind_to_address		"any"
-#bind_to_address	"localhost"
-
-# Unix socket to listen on
-bind_to_address		"/var/lib/mpd/socket"
+# One output has to be defined
+audio_output {
+	type	"null"
+	name	"/dev/null"
+}
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 4db0aee7cb..5852bbe73f 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -347,8 +347,6 @@ endif
 
 define MPD_INSTALL_EXTRA_FILES
 	$(INSTALL) -m 0644 -D package/mpd/mpd.conf $(TARGET_DIR)/etc/mpd.conf
-	mkdir -p $(TARGET_DIR)/var/lib/mpd/music
-	mkdir -p $(TARGET_DIR)/var/lib/mpd/playlists
 endef
 
 MPD_POST_INSTALL_TARGET_HOOKS += MPD_INSTALL_EXTRA_FILES
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
