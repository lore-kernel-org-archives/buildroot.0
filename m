Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE50EC5B572
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 04:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADD7060668;
	Sun, 16 Aug 2026 04:19:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9y8TziKmHKm5; Sun, 16 Aug 2026 04:19:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D52DA60642
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786853989;
	bh=+NNKF1hD+M5YQtjqCyIdWKCe3urdSeojsoHBQqpTdRM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O0uxG8XIdecSfNKHb8gCI8sTKHY406eoPl6K/xQ+pMEmJ+0BvOYBRNXM1tBsP2m11
	 +Ss17xQHhYfbYSMgOMCmankusfv0nLdWgFe8WZgQ1AXwZXcu/EFCUPQ2MFqgOXMAHA
	 KhAQ2gFoXw+AH36k9lnX92g2SmHsB+9zWsH3lzFYGoMjYQqM5S+QMQyxkcd1Yn0VsO
	 PPdTwi95XNO2A5sYToISSXyVce2RBEvoW6qMYXIwuFlUA6IZ3gg60A88ws67pmTK9u
	 gxyte9M1PsjPyZzAYY6aEk2CbnvAW2ldhMWA3Tb/WICTgQdAdRUvPa8zNbAPH5EX7F
	 p0QdlZfkxxT8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D52DA60642;
	Sun, 16 Aug 2026 04:19:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 95A60282
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 04:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8769A60642
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 04:19:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VmFnY-ZCBlio for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 04:19:47 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ADB696062B
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=umbiko.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADB696062B
Authentication-Results: smtp3.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=4xj2A/VQ
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ADB696062B
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 04:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=umbiko.net; s=mail;
 t=1786853975; bh=vpGyj89vTr0qvzfXq4P0Ouy8l1S8G9s0SAK/lVFu6fY=;
 h=From:To:Cc:Subject:Date;
 b=4xj2A/VQ/ZQ8gToHcRAX5P6As72aLs7TK/J15X9vtQiMb55CRj0Ibz2Lxk3pVDUPp
 Uy0eprH2fhSzmt4BKA5h+3I/aDyy2UGw7TSNS+p7W3lE19FvXOwj3pshxUEvgDWsLh
 yjCtRnsqbiG7JTTWd89nzcJFrPNHrVnH6ET8uSJA=
Received: by serv15.avernis.de (Postfix) with ESMTPSA id BABCFBDE0AFB;
 Sun, 16 Aug 2026 06:19:32 +0200 (CEST)
From: Andreas Ziegler <br025@umbiko.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>
Date: Sun, 16 Aug 2026 06:19:01 +0200
Message-ID: <20260816041902.74421-1-br025@umbiko.net>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
Subject: [Buildroot] [PATCH 1/1] package/mpd: update version to 0.24.14
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

Version 0.24.14 change log: 

* storage
  - curl: bound WebDAV PROPFIND responses
* storage
  - nfs: work around libnfs memory leak
  - nfs: fix use-after-free bug after timeout
  - nfs: fix assertion failures
  - nfs: stop after 256k directory entries
* input
  - qobuz: use HTTPS for API requests
* decoder
  - dsdiff: fix tag parser
  - dsdiff: store audio format in database
  - dsdiff: reject overflowing chunk offsets
  - mad: limit ID3 tags to 4 MB
  - mad: ignore implausible Xing frame counts
  - modplug, openmpt: fix error handling bug
* output
  - alsa: remove logging calls from the real-time thread
  - alsa: remove option "thesycon_dsd_workaround"
  - alsa: fix corruption bug with "stop_dsd_silence"
  - osx: fix format selection bugs
  - osx: fix volume truncation
  - pipewire: remove logging calls from the real-time thread
  - pipewire: fix uninitialized variable
  - pipewire: fix thread-safety bugs
  - pipewire: fix deadlock bug
  - pipewire: fix ring buffer corruption bug
* Linux
  - support Zeroconf with systemd socket activation
* Windows
  - enable the "mpg123" decoder plugin
  - fix shutdown in console mode
  - fix last-modified check during database update

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index 4d3d63215b..bf9ed653fd 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  9f215a081cc1f7c98fcccc6620f4cb705b14ba2d87fd99e062dd0804e2e3d96e  mpd-0.24.13.tar.xz
+sha256  367e85debb4427605cccb5415f2858ebb401d849a80615553f59520f4640811e  mpd-0.24.14.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 390cbcd8f7..a5bbe16040 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.24
-MPD_VERSION = $(MPD_VERSION_MAJOR).13
+MPD_VERSION = $(MPD_VERSION_MAJOR).14
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf fmt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
