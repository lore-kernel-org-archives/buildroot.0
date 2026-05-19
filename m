Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A41CD4F5B
	for <buildroot@archiver.kernel.org>; Tue, 19 May 2026 20:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF4A660BCC;
	Tue, 19 May 2026 20:56:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ChW8vF5Wrycp; Tue, 19 May 2026 20:56:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C6BE60B8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779224169;
	bh=vyi5OlBnQROOImjcUt8ifkAewlvXRfUSg+sIJV8lEwg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=C/3G7l05J7MlxHvhuEDeZscueXaLVNMSAiT3I97AclVoKs3EG1/S3uD/tmY0zcdrt
	 /fpaSekG1XfOCGtld5oR7YavzQMqzw8EoLeHBev5NPB6aNotCO7ne9zHH2DOdvsq/3
	 dsdvzivUg8VlBI8stw4MWBH1BJWIGaUToVYyLoXC7SpzKhitVozwV+jnt8HNElhJ2/
	 StDMPQqr+IQqBX7qhMkaz/I8mzrcsy6pesH8XyRm72M1y1oJMJYmWtI/k6Gl4sBd7Q
	 zztPojrDxnFP9kVMxakbDMhaAYzEzL5xAKVbLwsnEU2e3vmgDJ/VoispdyTwjRTrUw
	 QBW5C7tfcOMsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C6BE60B8A;
	Tue, 19 May 2026 20:56:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F3181B2
 for <buildroot@buildroot.org>; Tue, 19 May 2026 20:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8066C8115D
 for <buildroot@buildroot.org>; Tue, 19 May 2026 20:56:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ssGUA-TRHULX for <buildroot@buildroot.org>;
 Tue, 19 May 2026 20:56:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7865F8114A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7865F8114A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7865F8114A
 for <buildroot@buildroot.org>; Tue, 19 May 2026 20:56:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0431.dip0.t-ipconnect.de [91.58.4.49])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 25FEAA4C0B8B;
 Tue, 19 May 2026 22:56:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44802)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wPRTw-000000007Bg-3xhW;
 Tue, 19 May 2026 20:56:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 19 May 2026 22:56:04 +0200
Message-ID: <20260519205604.1149227-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779224165;
 bh=RyYHS3Lxz1smoSVwXbpB7qZiVG+2TvMtA9yH3z0HrKI=;
 h=From:To:Cc:Subject:Date:From;
 b=nP9i40SRkPoRHfI8l+ujNfk011Yn7BaRkUQiybUfxUPkm+lCyOgM3iHjCQg8D1x0c
 +9OCSLofyfmleCwTqbHjfJL13jtamRqI3OqqPUdlZ2Ta7gNXwONeqs+1lj0W/K9F0v
 y4I7xYnQuqHq6AFIWsURS+tzOLRNCIRcW2wx+Yt+6EELZ0oOtCnwQX+opppftXJB71
 CV17rCBUbH3xqvXqHALwe8JfnqXrmnjo4Lmadk1YxSY5LV/Hkk02bzZr/Qw/1JiaE3
 RYS8dwY4zsV6dee8CK2JNP90ffD/vL2lIGnIS8Mp80vQvoHsFEJZfv0YZH7kbxri4s
 okCBzry/hCmFg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=nP9i40SR
Subject: [Buildroot] [PATCH/next 1/1] package/libxmlb: bump version to 0.3.27
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

https://github.com/hughsie/libxmlb/blob/0.3.27/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libxmlb/libxmlb.hash | 4 ++--
 package/libxmlb/libxmlb.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxmlb/libxmlb.hash b/package/libxmlb/libxmlb.hash
index 5a202ebfbf..a7a0c53be1 100644
--- a/package/libxmlb/libxmlb.hash
+++ b/package/libxmlb/libxmlb.hash
@@ -1,4 +1,4 @@
-# From https://github.com/hughsie/libxmlb/releases/tag/0.3.26
-sha256  a18bc447fff0dd0d76a2e6cd4a603b4712047c027f9bbbdc31ebc25f0e2c1ed9  libxmlb-0.3.26.tar.xz
+# From https://github.com/hughsie/libxmlb/releases/tag/0.3.27
+sha256  63fa0275f7454d77c10e0af37f79dfdb071821caf429a57dbd9598ea3a9defd6  libxmlb-0.3.27.tar.xz
 # Locally computed:
 sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  LICENSE
diff --git a/package/libxmlb/libxmlb.mk b/package/libxmlb/libxmlb.mk
index 34e7233f4b..e9829e4c4b 100644
--- a/package/libxmlb/libxmlb.mk
+++ b/package/libxmlb/libxmlb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXMLB_VERSION = 0.3.26
+LIBXMLB_VERSION = 0.3.27
 LIBXMLB_SITE = https://github.com/hughsie/libxmlb/releases/download/$(LIBXMLB_VERSION)
 LIBXMLB_SOURCE = libxmlb-$(LIBXMLB_VERSION).tar.xz
 LIBXMLB_LICENSE = LGPL-2.1+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
