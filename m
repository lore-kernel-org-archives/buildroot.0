Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49AFDCD4F3C
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 18:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 094876067F;
	Mon, 18 May 2026 18:05:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q-HY3VXDaujG; Mon, 18 May 2026 18:05:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3231060683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779127507;
	bh=bbS0LeWY60aI4Xs9haBixl3UtycnQQkh9Abwl8KHtMY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Avo0k4efr8CRD4foW3jANBda85iX22moME01gABfon/pKgDJSAhE37hVMhC92y9No
	 ztT7oMOs2X19KVLFXA5g/aqBUo578ST30cpEiWp8zUZAwh2GmWsIquWFQ/2NNH7+wt
	 J8pGmlZVYtt3wuPRZSVSygB1+Ygpxog6b+ab2qGhMuBafPd2LIRgBTRW9Ke6j3IzxM
	 j8R9c2dpzzA0fDArq6RZBPZ5H7WkenPO7F/KrRpdQAqW28panvh5r+2rO/SMw+AJYu
	 PNIXiqHM33LOABLRcXrnTYWJy08ZbQhvbwXi1TTGoHu5H6XTUaVwaIU98OND/3LEPL
	 UYE3ep3ffKmlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3231060683;
	Mon, 18 May 2026 18:05:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C50C265
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3230D40078
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:05:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8_4Z8SnGADck for <buildroot@buildroot.org>;
 Mon, 18 May 2026 18:05:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A6D024004E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6D024004E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6D024004E
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:05:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b8c8.dip0.t-ipconnect.de [84.161.184.200])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3A5F3A4C10D8
 for <buildroot@buildroot.org>; Mon, 18 May 2026 20:05:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49320)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wP2Kr-000000006uV-0RcC
 for buildroot@buildroot.org; Mon, 18 May 2026 18:05:00 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 18 May 2026 20:05:00 +0200
Message-ID: <20260518180500.101442-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779127501;
 bh=hzXyTktq9utN47E1EX/CWVVSDkzfDy7NhULg155UxOY=;
 h=From:To:Subject:Date:From;
 b=Qic5OdbTraoMn6P39+t1noFNNd0xNYCOezYImTpKkcM4WVF5LjJhNrQumifATyCuG
 faEk8j/04ZROL/A5ZHeyUxtA0xRjYOph0JQ8FuzwQFJrhGcGi+Z7ts/O8iDgeP7cBh
 E+gZKdjg99K4clSoLDPvQYv6nYg+5PvYoUehgAaYFvRuxnYQ06I2S5mOGPECbAEUeC
 /YaxB5lvex2asZTWUNw3vA93deM1nralZV+Pa9G5ufedfMSLQHEOx6LChbvv7QcqNr
 6GfKo8gf+0afEKxp6ZW52ZiJLegCbs5VLp1kJXjkmTB0gyoWzlMsKGmPJv4sbphVP3
 3kiTf9M/3wxuw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Qic5OdbT
Subject: [Buildroot] [PATCH/next 1/1] package/libinput: bump version to
 1.31.2
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

https://lore.freedesktop.org/wayland-devel/agWtsIBqMXTVknR_@quokka/T/#u

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libinput/libinput.hash | 2 +-
 package/libinput/libinput.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index ec6e52e1e2..c813993358 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  e0bb6537de892ce7c63fc5be9ad373eae894b7655c92220ef00316cc33097356  libinput-1.31.1.tar.bz2
+sha256  1daebac6cb5b8946139c9669a7e5c0e4c8f17320de232a6b9bf470f37dc569e4  libinput-1.31.2.tar.bz2
 
 # License files
 sha256  80de50b2022a840db044c56db804ca3565600a692c0714babface587acc6d1b0  COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 8b930805b2..33fd012076 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.31.1
+LIBINPUT_VERSION = 1.31.2
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.bz2
 LIBINPUT_SITE = https://gitlab.freedesktop.org/libinput/libinput/-/archive/$(LIBINPUT_VERSION)
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev udev
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
