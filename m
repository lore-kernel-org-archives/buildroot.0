Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD8C4D25047
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8D2B809A1;
	Mon, 12 Jan 2026 08:13:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0fkc_pUNqgc4; Mon, 12 Jan 2026 08:13:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC33F84419
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205613;
	bh=soK9hjkXOQCMSycQJnV9pYYqSlNkue2OnOUBjvJJo1A=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=COWHXzJzlk6P8OjE/0HsRZ3rddwoakcAMEiN4HiQEk8PBHeDFRYY0NsV7dQWpTQTY
	 ejmy0cSppzq1axSROz78m9Jq0Xed09RvVmtcztGHCz21FCbpbLSyVHfOm8E7V4ufRG
	 89/TNCBzN2m1JV8QqLe5GDsGTDfsI2r22MivPARihtF90p6zQebSwswlUvpLr3ilVK
	 RjR2uJxZxHujsBmnEfoUalKATkkxWBY/GlJEgKvKio7hFpsnO94Pvu01EcHXBET/j9
	 ragV0YXqD9SeErTXCtsTLYJ5m7bWWcHGgYhti4QTUcres1N9A6rg6ZeI31G93h1Pnb
	 NDPp6GmeAEO4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC33F84419;
	Mon, 12 Jan 2026 08:13:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 37F3618D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:13:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1DE6E614CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:13:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dtCvX9COTklY for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:13:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0D2F8614B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D2F8614B1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D2F8614B1
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:13:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EF4B1A4C3C4F
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:28 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCub-000000003M6-0fSx
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:04:09 +0100
Message-ID: <20260112080419.2516889-94-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205128;
 bh=p4XvjiPQcpw2jXLfzYaKZjRZ9nJhJK28VOCtvbAo9iw=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=IkK2Fb7q3KasgS+dQDYwBgokuOY3P1+ewHyzwwyZX7xkCG48YE/xaGsyl6x/RBiwi
 K0C/MvKgzXWHCuLBuuvj+XDXASd1YbqWbTiGIXHPpQguyaFCoDmGIbDcyBHq3gDfG7
 ff/2XLxLS29AVJxzVlImw/ke91QfnYOEAxzcs+NSQUj0B93VoD7cX0hNvCfUdZurIl
 b7q7m7+lwxsM/8HXMA34hWsRmy9/ZTHpZrBAp82gfHohhiH4wtzafi93sbBXfmYFFv
 gRy26ejv5ShEtb4gmQi+VEmslmfzQoXWTj566x0aMW7ZGnHgWr/J/xI6krsNdoh1qK
 9OCO8XUQocCfQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=IkK2Fb7q
Subject: [Buildroot] [PATCH 094/104] package/x11r7/xapp_xbiff: bump version
 to 1.0.5
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

https://lists.x.org/archives/xorg-announce/2024-January/003445.html

Switched tarball to xz.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xbiff/xapp_xbiff.hash | 8 +++-----
 package/x11r7/xapp_xbiff/xapp_xbiff.mk   | 4 ++--
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xapp_xbiff/xapp_xbiff.hash b/package/x11r7/xapp_xbiff/xapp_xbiff.hash
index 690c932e37..20fb16ca0f 100644
--- a/package/x11r7/xapp_xbiff/xapp_xbiff.hash
+++ b/package/x11r7/xapp_xbiff/xapp_xbiff.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-July/003009.html
-md5  66dd3ebd6351b1911b831b89b2dba8ec  xbiff-1.0.4.tar.bz2
-sha1  193c0a2be1f7f374bb9d32217a198c92a63619e8  xbiff-1.0.4.tar.bz2
-sha256  e1e1a39628a5678585008ef7fb1ff2864edaaa0e062989c2331f8c74e0fec971  xbiff-1.0.4.tar.bz2
-sha512  0fb920a08640ec59f23d8a8a47bd244565dfbaff7a21c38a8a2abe1edb5eacabc970b5dbdc409163fc444fde5b75a2dc4e0114312938efec5b77228f3bf785ac  xbiff-1.0.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2024-January/003445.html
+sha256  cffb10e2488b09695da8377f395a4fed6d33f5eb9691322ebaa969e8ead7b0c2  xbiff-1.0.5.tar.xz
+sha512  4dd8943daf670dffb6e108b192977f6ad313d6b0535da0c809699e05f0509aba45be81c72af341e1fef31f59d0a5f209d87441230b3fdcecb4a7a8fe7a9c0658  xbiff-1.0.5.tar.xz
 # Locally computed
 sha256  9b840f2e1900889124cc999f3158da2b6b07bf6d0d77bdbb01ce65d2e702dc83  COPYING
diff --git a/package/x11r7/xapp_xbiff/xapp_xbiff.mk b/package/x11r7/xapp_xbiff/xapp_xbiff.mk
index 2c3975c167..5c626acf19 100644
--- a/package/x11r7/xapp_xbiff/xapp_xbiff.mk
+++ b/package/x11r7/xapp_xbiff/xapp_xbiff.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XAPP_XBIFF_VERSION = 1.0.4
-XAPP_XBIFF_SOURCE = xbiff-$(XAPP_XBIFF_VERSION).tar.bz2
+XAPP_XBIFF_VERSION = 1.0.5
+XAPP_XBIFF_SOURCE = xbiff-$(XAPP_XBIFF_VERSION).tar.xz
 XAPP_XBIFF_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XBIFF_LICENSE = MIT
 XAPP_XBIFF_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
