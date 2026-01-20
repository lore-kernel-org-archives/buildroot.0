Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E98D2ED17
	for <buildroot@archiver.kernel.org>; Tue, 20 Jan 2026 15:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99FC685D1E;
	Tue, 20 Jan 2026 15:21:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aAr0XChkDCtZ; Tue, 20 Jan 2026 15:21:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A307585D18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768922492;
	bh=kjlyfGuQ+CADVOyKwn1BYHYbGOwSBrFolnQOWciIMlQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gbU/KD7g498UwZ6OXtybbcK8wnKE4jRegCci9m4zJTrsKGEgB7qIUIKY48E6vPdxa
	 tKCsmAQfOCv5m013taU1VXMKcmHSZ7GC7h0uh/Zq2ZikY52JsMX1CiaDCpbqrTmNLP
	 LV+tLyD1mJqw97QDg67Ej1aGz19YEYKNh7hC8zQEUpzVvaZ8cm6jHIY+vbJwWVpEFG
	 NdT6C+kAjIZD/1wphLOodwNaCRRie0M7sMX6rRNfxI653vc7X78MHwnjdp9vbO/ESe
	 aXM907KPvGA0rl2EQ1netJR5hBlccnhakWT/OfdSRRUozp6z4kkZH4hO+a36sjsTW7
	 Olean1qEca6cQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A307585D18;
	Tue, 20 Jan 2026 15:21:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7477B122
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 15:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9F7E41DAC
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 15:21:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k4V9kklH9Tj8 for <buildroot@buildroot.org>;
 Tue, 20 Jan 2026 15:21:28 +0000 (UTC)
X-Greylist: delayed 22402 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 20 Jan 2026 15:21:27 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D257440795
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D257440795
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D257440795
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 15:21:27 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id F33BDBDE396C;
 Tue, 20 Jan 2026 16:21:23 +0100 (CET)
From: Andreas Ziegler <br025@umbiko.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>
Date: Tue, 20 Jan 2026 16:20:52 +0100
Message-ID: <20260120152059.413671-1-br025@umbiko.net>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1768922484; bh=k/Lv6eeakchOrScuWp59eTll965EMd95Kn4cCPfxIU0=;
 h=From:To:Cc:Subject:Date;
 b=5sGlwZuhfZajGhN54u3hoHfefEGAl+aG5V4gHGFcTVYvLwLMfGEiLaxxw/qrE0XwU
 b4U4VJ2EgTX1AspBUZJdcwhD1E16CLk4vyv9EUWzoo2VyQ1VJI4ybAKnf1mECEmDty
 i2tJngmjXtTcmHC/b7lUbeTY0cz+4CfcylblgN44=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=5sGlwZuh
Subject: [Buildroot] [PATCH 1/1] package/mpd: update to version 0.24.7
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

Version 0.24.7 change log: 

* decoder
  - ffmpeg: allow seeking only if both AVFormatContext and InputStream allow it
* playlist
  - cue: strip UTF-8 byte order marker
* Linux: disable the iowait state for io_uring
* fix GCC 16 compiler warning
* fix spurious linker failures

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
---

Tested on:
  i386      build
  x86_64    build, run
  aarch64   build

Tested-by: Andreas Ziegler <br025@umbiko.net>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index de385da77e..afdb66324c 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  8ce34a010577feb42999a96d867325c6d38bf7ae1b7a57f878d7e548c1fd1fa9  mpd-0.24.6.tar.xz
+sha256  47c4f146f39a09979ca65d232063d7df566b101c5b36ca8895083f9f278b0460  mpd-0.24.7.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index cc7bd7f0b2..f54dd58cde 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.24
-MPD_VERSION = $(MPD_VERSION_MAJOR).6
+MPD_VERSION = $(MPD_VERSION_MAJOR).7
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf fmt
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
