Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10706C43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 10:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4D9D41104;
	Fri,  3 Jul 2026 10:28:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lv_zPqe78LK2; Fri,  3 Jul 2026 10:28:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D463541115
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783074515;
	bh=JO+gMgGPDp8leMeXheZ+A970c60PmWdZDJJ9zmXxxvw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CyoFQMHxmn7a8YTyrV1L0DeNahXwgcQTCY/w+/r17AHCxgttN0eJ7dc1xd5xq15ZR
	 WT6F4RaIfyg4ePxsmPD00aUcotJpbVXvcHOrN0LNWYTz6AOoqNHDJyQAkr/IMfSaGJ
	 PCDZ5ohv9etxDiPAPw9UfjwfBiOlxPjgKsYTxZPm8oX5/amm3NqSscmMXS2jU5FCxv
	 1vkVAA6Xfo8rLxTIAXv//yU5/OZjAOFF4y+s7M3m0p7oyxe4TZ0Crs4U69ezVSmJK1
	 ksOojUc/SzGo1bPqJD3U+BT9QPxGuLXREuw2H7PqF5OuxgNmlv/WGCpOA5RZGFulEk
	 7FfGopYzBopeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D463541115;
	Fri,  3 Jul 2026 10:28:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E48D0363
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 10:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB46341115
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 10:28:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g4vVkkkA6B4J for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 10:28:33 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 183B641104
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 183B641104
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 183B641104
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 10:28:31 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 44A29BDE0C78;
 Fri, 03 Jul 2026 12:28:29 +0200 (CEST)
From: Andreas Ziegler <br025@umbiko.net>
To: buildroot@buildroot.org
Cc: Marcus Hoffmann <buildroot@bubu1.eu>,
	Andreas Ziegler <br025@umbiko.net>
Date: Fri,  3 Jul 2026 12:26:52 +0200
Message-ID: <20260703102732.782347-2-br025@umbiko.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703102732.782347-1-br025@umbiko.net>
References: <20260703102732.782347-1-br025@umbiko.net>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1783074509; bh=7eu4ioOv82/jhoojrQdgKgOAmRFWKSJCx31mIbEX3k0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=B5afdm5KBYKN40ndupjsZEIqr7Ssk6RWk6qF/PTASDzmXK8k+wIvOCmXN1kYV0sG4
 mV0aFRMriZuStwmZK//qY4PwBQ++XzO/nSeI16ujoX9aM5IHPTCUEBe+zpUj1ChyRU
 QGDP73/pheFItOROtuLbqIMXMf4t0bokRYKULOU4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=B5afdm5K
Subject: [Buildroot] [PATCH 1/5] package/mpd: install provided sample
 configuration file as mpd.conf
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

The configuration file supplied by Buildroot is only a sample; it will not
start MPD on a default installation. Usually a custom mpd.conf is supplied
in a rootfs overlay.

Drop the Buildroot configuration file and install the sample supplied by
MPD instead, it is more complete, contains useful examples and is updated
regularly.

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
---
 package/mpd/mpd.conf | 32 --------------------------------
 package/mpd/mpd.mk   |  2 +-
 2 files changed, 1 insertion(+), 33 deletions(-)
 delete mode 100644 package/mpd/mpd.conf

diff --git a/package/mpd/mpd.conf b/package/mpd/mpd.conf
deleted file mode 100644
index 5956b75e24..0000000000
--- a/package/mpd/mpd.conf
+++ /dev/null
@@ -1,32 +0,0 @@
-#
-# Sample configuration file for mpd
-# This is a minimal configuration, see the manpage for more options
-#
-
-# Directory where the music is stored
-music_directory		"/var/lib/mpd/music"
-
-# Directory where user-made playlists are stored (RW)
-playlist_directory	"/var/lib/mpd/playlists"
-
-# Database file (RW)
-db_file			"/var/lib/mpd/database"
-
-# Log file (RW)
-log_file		"/var/log/mpd.log"
-
-# Process ID file (RW)
-pid_file		"/var/run/mpd.pid"
-
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
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 65cd390ff9..2014488520 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -346,7 +346,7 @@ MPD_CONF_OPTS += -Dzzip=disabled
 endif
 
 define MPD_INSTALL_EXTRA_FILES
-	$(INSTALL) -m 0644 -D package/mpd/mpd.conf $(TARGET_DIR)/etc/mpd.conf
+	$(INSTALL) -m 0644 -D $(@D)/doc/mpdconf.example $(TARGET_DIR)/etc/mpd.conf
 	mkdir -p $(TARGET_DIR)/var/lib/mpd/music
 	mkdir -p $(TARGET_DIR)/var/lib/mpd/playlists
 endef
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
