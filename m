Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB38D25050
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42F1960740;
	Mon, 12 Jan 2026 08:40:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i-XmS4LcwI04; Mon, 12 Jan 2026 08:40:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 663D16074F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207256;
	bh=MymmeVtL78J+YTAvEg3NFdFX531AHlRWwFc/3n0Yc3c=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jQ+RHkm5vf5uQ70e8/f/U7c4kVISUnj7agINbA4TDIPaEWtJ9RBbAYGVK+dZfa54w
	 a74ccpTKeIF+R92se2vHhC5JN/BbYDLNRUK13C2sNtHHc/duROaAdliGt+KHS9ShOV
	 fVDQSuP8e7VLxiR3E86ycSZSjVZPGz1MVVGwLk5rpKtPYP7z9BYIgxGC5neYfc3Qos
	 b1ewaIpTSxORhdFWGm3wX9uJxNN5Ucw95S45yF/UpJDOpRphOHdZScHoLdUshkT0Dj
	 RIcvTQAJwhmIEpFI6Ct4YIMLfEWBu57WAo1cfCVB9Qgd8mTSWHKzMLDZAPcf/+Vzll
	 6Oh42BcMYqU9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 663D16074F;
	Mon, 12 Jan 2026 08:40:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4557518D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C0D540357
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:40:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t7g_u-CfEjpd for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:40:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 27FC740329
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27FC740329
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 27FC740329
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:40:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 83BD6A4C3EE3
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:44 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJ9-000000007z0-1Usg
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:28:16 +0100
Message-ID: <20260112082950.2528445-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206644;
 bh=WV4SqlElsnqoLLvkAGc96fxfwXUDbbkvF/J5IAKVEuY=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=GXFXVW0dC/qPg/RN1V2CxULeKOEGt716skTZG7oWLQJ3uOlbv/QAn1dijxYC2Ziso
 a/5zsrC4SR8oeZ/stAqrWrae1pJPNgDiYonZnYYKZd1Wxo2E5uz2cEAkjSQZCfxgGe
 dZEaO4hRM3/v530uZishWdczHqZOKI57cj3meo29YMcI6l45hvXW3XIsC85fHMJV1f
 hdQK0PrD5dX40W0yKB9FrVqpZNI4c/hVn4gKzk2Ul0Ea0XVDUPjihgIq2d9F0jvu3u
 eqULURsbWgsNbPeQwVURAfBWqGaUwQrpQQc/io/TsYggAQPaOb/0OTMrx5GCLtuzfD
 wx/11k0x32GuA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=GXFXVW0d
Subject: [Buildroot] [PATCH 008/102] package/x11r7/xserver_xorg-server: bump
 version to 21.1.21
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

https://lists.x.org/archives/xorg-announce/2025-November/003643.html

Switched tarball to xz.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.hash | 6 +++---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index 92030d4307..ceca9c215b 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg/2025-October/thread.html
-sha256  a51aea1cbb29cb8122e39c1c8728469d4fd8db71a538565fbf017df11841bf04  xorg-server-21.1.20.tar.gz
-sha512  dabe7e637df4b964a1ff04a15587157b9596851a722a753447c257253ad0422007078b74053e1a51bdfd2178e3140a52f94dff0f205242a8589b6fe02d27e8a8  xorg-server-21.1.20.tar.gz
+# From https://lists.x.org/archives/xorg-announce/2025-November/003643.html
+sha256  c0cbe5545b3f645bae6024b830d1d1154a956350683a4e52b2fff5b0fa1ab519  xorg-server-21.1.21.tar.xz
+sha512  bb2eb4e6756eb9e38b61bd47c017da44bcf5f45f2b7a906b4bb3a56b3d791cec64abb9bf37b224efe1e4fab9cc296f3672c9b2f8e00e1cdfc54337bef63cd16c  xorg-server-21.1.21.tar.xz
 # Locally calculated
 sha256  abbb7969df55e399e91104ded4d0a20a1b67de7c01138e63d61b7ed4f81fec0d  COPYING
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index c9456c66b5..0dc3a4a5c6 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 21.1.20
-XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.gz
+XSERVER_XORG_SERVER_VERSION = 21.1.21
+XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.xz
 XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
 XSERVER_XORG_SERVER_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
