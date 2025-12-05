Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D993D3748A
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 19:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED5CE61182;
	Fri,  5 Dec 2025 19:31:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Onvszpc8uJU8; Fri,  5 Dec 2025 19:31:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CC4261B7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764963078;
	bh=zSLy6H5UOM4i6dbCudk6u6ybCtibo/LiR+rMaqO/Xno=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KlB/btw3aCEu4d0Wu7Wdgc3ibJlbrx7LOZWyoCnCO0KdC9w9bHqLcKKzYg2fqoMga
	 vxuwsEiw+NES8M08XsB0PXIcKcZzBPkX6SHa5UfwkXImKNvaatshalREDvEy/e2Nyp
	 EniYSw98GL1xCNUVEmt9CAcR4PkQCKL9WOJu0k1KWmYq9QTz4LUBn6/pchd6nYqjo9
	 mVbSnVmEUD5BfU/V0U7VeZ8jbGYUUUErExIeNRQcUC1wUewCLLk2MzDvds7YCiacCN
	 /PC5Vxou7ExCbEigR/Ag+kZaMqsSlTHJjgN+BIMI8GB1wM8rlinSyB8ddyDeI6rIWd
	 OyFYO+ffNv3qw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CC4261B7F;
	Fri,  5 Dec 2025 19:31:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CBD4258
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 19:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F31A284A05
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 19:31:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h0NJnOArTvHN for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 19:31:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E46E28499E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E46E28499E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E46E28499E
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 19:31:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 24844A4C797B;
 Fri,  5 Dec 2025 20:30:58 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40158)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vRbW5-000000006qq-1d77;
 Fri, 05 Dec 2025 19:30:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri,  5 Dec 2025 20:30:57 +0100
Message-ID: <20251205193057.1884663-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251205193057.1884663-1-bernd@kuhls.net>
References: <20251205193057.1884663-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764963058;
 bh=yO/vUyV3zntlTnCjvkCrehqdRCjsoWPZv4NHhX2LwPM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=beVaZ8mSupGBxaO67Ol7u/EymMEuxX0y7Tk4y7rrsXTxbqjp2StpMma1Lzss3ymCn
 HnbDiBzPickfYp7wpnSqcYV7RS3qV67nglpUwBwymGrnCGECLl6QxxvK9YE9/oJLfA
 dNOJZSEBUpCOjl58RkpMEqUgYVuw4/iuvxsXRCtrf/1gw0aQa+NsP0qIdjnZj7rBxd
 lsewUTGwib0dXhWYv6KDlxP5iyoUI6Z3gA7qUUadjQnDK3f/17iLEM0TTDYFkNRcAw
 qkVqgSRYM1AvafX+McwHUNirJ/jzCqBO1OtHBdrMkR3SVYKgs5UWxwhVXfccJY+0Jm
 Bp33cWRWzJ/pQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=beVaZ8mS
Subject: [Buildroot] [PATCH/next 2/2] package/mpd: switch from libsidplay2
 to libsidplayfp
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

Buildroot commit 25af5a3b3aa3480ee10158e55c280d675430442a bumped mpd to
0.24 which switched C64 SID support from libsidplay2 to libsidplayfp:
https://github.com/MusicPlayerDaemon/MPD/blob/v0.24.6/NEWS#L125
https://github.com/MusicPlayerDaemon/MPD/commit/7e2538e07a80bd12baf2e7c328e7d1a64eb434f9

Fixes a build error not recorded by autobuilders:

Run-time dependency libsidplayfp found: NO (tried pkgconfig and cmake)

output/build/mpd-0.24.6/src/decoder/plugins/meson.build:161:17: ERROR:
 Dependency "libsidplayfp" not found, tried pkgconfig and cmake

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mpd/Config.in | 2 +-
 package/mpd/mpd.mk    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 48b8c914fa..066f53c24b 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -159,7 +159,7 @@ config BR2_PACKAGE_MPD_OPUS
 
 config BR2_PACKAGE_MPD_SIDPLAY
 	bool "sidplay"
-	select BR2_PACKAGE_LIBSIDPLAY2
+	select BR2_PACKAGE_LIBSIDPLAYFP
 	help
 	  Enable C64 SID support.
 
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index ff6f08ba65..2dcaed8439 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -281,7 +281,7 @@ MPD_CONF_OPTS += -Dshout=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_SIDPLAY),y)
-MPD_DEPENDENCIES += libsidplay2
+MPD_DEPENDENCIES += libsidplayfp
 MPD_CONF_OPTS += -Dsidplay=enabled
 else
 MPD_CONF_OPTS += -Dsidplay=disabled
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
