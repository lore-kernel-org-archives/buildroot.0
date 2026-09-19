Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB69C982D7
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3573540676;
	Sat, 19 Sep 2026 16:00:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ZCsBk-8jRU8; Sat, 19 Sep 2026 16:00:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 316C24085B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789833643;
	b=GGDgdReuaiwroGYLGvRFtsZAnHXxTdYIeVqlaDVNxEhKrPVSYCiodXHxasXZuNJz4rYt
	 sbY66+/gU+CAiADzhwYLi2jexPSSosOM1iI4TMd4yjvj/wAELAA5FtK7K3nwZ3f8aGZld
	 GoBVJKEqHscR8wfGX6DAfXu2UAz/u79G8Fy8c2orVfRbB6P6mUe42JZGgWvFkMZZSo8Og
	 ebey+aqOE3Dk1yeBp2Zk4iZQGSOdmXe9Nd1h6fHg1XwEuNKqQ99DuQWPsiGYX1vKt9XLo
	 UQCDiSRldEEkGAJ66FTUhoZGw0LrEWu0kXTVU26+uFrlVtjS1UqPc0NJam8x9Fd3M4w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789833643;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0pOVhoIwe8dS7/x89ug55m9uDEo/HW72tkTIlS29VN0=;
	b=svUT8FjyAsDDpPiBbK3XDrMnLhzy/RdyfCj2DDDv29lAuw/B9wfVFLZCJvyBuOXqLRMM
	 xDek2nYpP94hgwyKVFaPTbv+Rj89BbBtjdH2nWUOV5Zyp6UXeZdzGbphAxi3ATdcA5ObV
	 g3gfm9w7nsBrZK0z/fNgR5MC94MYXfTSrfxsrRdNhijKJovnQaziHVYjvMHOPdvLTeAq/
	 zUjW1qtFOD7aDu3ckycSKdoXCJli5IIlC+gRd+KQmhbSMaAHEXWxEL5JgeVtM+BgbD51w
	 D3HowOCnvOaNuhoK+Gl6WS/NttC39NVv11m7gTMjw8GOR5lOj904sEVNAYfRKBagEhg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789833643;
	bh=0pOVhoIwe8dS7/x89ug55m9uDEo/HW72tkTIlS29VN0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=lrd+V6pnmM/CYQWDcLpVqr8M7EIRs+Z3yQT1TT2qPcwpMbmPVnzrf8CaB6EbH7nWg
	 R4yJiiLKfSJ2Gq7PK0eLkCH09WL3PZCOouI+kx39aE2HkQZeL6SDsi5mLEB/tb7PaR
	 QNT1eqVmdqsUhDVnjVPLfLk9cOXUicElc9by/ruMWfVlP7KDLiD41Xqc1FsUQbLC1M
	 ABi4VhhGlr/JBqStcKXTtRSGlAI0IwbHdsS0GutB6wPo1YUFuIujohhCe1pc6ynniu
	 YBCcLPuUdc62MKZ9TCGXvOWMnYDZ1zJmkUXKoDj8XhI0VrF9B61AHFmFNLOoFu/ZVC
	 1+b5cn3zEZRtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 316C24085B;
	Sat, 19 Sep 2026 16:00:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 94AFF24D
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 121CA60662
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:00:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LX3UeKbxqhp7 for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:00:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org AD2AB60666
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789833639;
 b=Uh+14UfzADE1SJXEiayc4J1k+DQjCOZZpssjuXp+ECurJSd9N95sVV9Y9a00G3Txzr1L
 XBt/Kz3WWTi3eSLwJQlDLqtV+uuniqTEmzifWOtz4zxGr6poWqJmAH8KY+KRhGt26NpRn
 cK2z96x3qSX1bX+VkNsFiVQxKN/AyhrmwBA47PZzYHYwYPFVDvBaLkPDMIuI2ZMhyyknQ
 a59gTaTFonBYqIiro4Se2/4cUZlyiHPu5JJr/xFIw21s2C9GlKMMj12gjYDdyk9oorgKn
 EbYBPGbEQzw9uJv5gz956pLuObGtnNN4BfSlyWBoYJZ+4KQBLKTWGn0xpkujw4YW8rQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789833639;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=KwpHgyCHlPl17l6gaVeNG6A5TyfD29sDyVuWooktQ0k=;
 b=BkKEUIgvvGZsO/EsdAqNeBk4Zii+vVUsQaEZvVDBb4yL/zNAVvf8kplK3ITVIdKR+vq2
 bTBPSplRFerR8me118CFb8Ep5dcJPvrduPoybVoftBYWb0eV1ImssKc4K4ly4ehyo6//w
 AqfmcNhwIbRrScsekqsZ8uMT06FGopC6pGTMUrfacF3II+Ehw4VEcT0oRzrbV0iIx4sak
 g2xcdmNJgOmvdB3bx6/bsNExeMLR2CMtZi1RnOPadQzXYKTdGr5Xj/y9nuVPINzGnorip
 Y8WyZgSEyu4B1bts1H0o3fm3RMEQHO1laDQ/rryNfeJxJ6297VyNcIqODrcQOXM9gjg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=IVpB5ok9; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=IVpB5ok9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AD2AB60666
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833531;
 bh=KwpHgyCHlPl17l6gaVeNG6A5TyfD29sDyVuWooktQ0k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=IVpB5ok9NLbkiNTQxJFk/JqKriNJgzSYX9y4bjx8DfsFTfYsrfElqcsN12Dl9QY9S
 ++Mw9mf9kxDbJ/rNBsdxZtrC09+MymSd1/5Dc0CMacD8LyR0RbEM3UxpeAz5gsNRD6
 HSfXRmnEs+OvFHuGjsqrZYENmbC3fkpNnQtyidso61HfiLZQQvqkCv4MQTQkCLtmH1
 kJVbXvEgO6FoZYVRX7vqw0zCXGC4zqWWkrZ2skOgMzQBavLiBaPOnbd+OvXfbNwB2h
 j28XJEhaSEmhqTw8pl4Mh9uRqVWUxbBM2zugVi9fSn5SYgcvLV1j69vYc3MyOMnTDF
 Vgon8fp163HHw==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:t4cR6RJZ44zSQWedReIb5W4/F+Ntx6Opfu3NJ6MgQYK9XXCLBY1I9PUHiAcAVjl9TUFHmFx8Vq5mw7gvNFQBQYkIu8v0+B11niyhnIJ2fr60x4Erm71CaZKPcbLT5iSAHxOGJpNf+qsmcQ+aCf0k3G6j+L4NDxjcjJdh80DwXQsh8bElOfGMQS0pioek6rrwE6eNOxnIgipHdwKnfMl4gbjOmP8r1429P9jMzFFbYLAukYS6cv3haVk2mkh84TmZN3SQUMdKFCzQVrSRpw+D4KRETbq1rLGZYbFR2iGrOk/3w2TX7WwJmfcFiS3QMpLx0uvP7WNqGBKezlAkacIDIIRaQj70TdpVul0z3mabsT7nz432Ez1QHHvaGzxGAj3OHLD3ZbG6KFrnt2SWngKA+6L5GirHobuJ2rbvO78FbL0cdplZTK/5veNYzY4U5wwnb3DjdhtxsmRvpMWm6jEagBiafsurcYZDg9ukuGkFDThQRCxVwn9bn+XyWnH03J0+Q1Donk2pnFVu4JHzyNk8f9s1dhHRpxFBYa0bM8kNClFDPyqXqqY6f81cJsX+OoxkodzAuQhVsCMdOG7UvkUTTXEJTFzAV2Uknq5rVORVAhuFbt
 McVcrdhTTjc6cOmFE5TWFf9ZuNjscA3ia5I+6n1wzBxtKeRF8Jsp0nPl2mlB42OUdyKIdYNDbPYrfxr82cw6uNC3bBHiNooLYLRIA9oO5UQsE=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 33700A4C47A7;
 Sat, 19 Sep 2026 17:58:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSk-000000005Jx-2Dje;
 Sat, 19 Sep 2026 15:58:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:57:33 +0200
Message-ID: <20260919155845.5776-9-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH v2 08/77] package/jwt-cpp: new package
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
Cc: Koen Martens <gmc@sonologic.nl>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>, Marcin Bis <marcin@bis.org.pl>,
 Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Needed for domoticz >= 2025.1:
https://github.com/domoticz/domoticz/commit/b30d9e9436ad428a2cbfd1fbb273461bdbf50a82

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/jwt-cpp/Config.in    | 12 ++++++++++++
 package/jwt-cpp/jwt-cpp.hash |  4 ++++
 package/jwt-cpp/jwt-cpp.mk   | 18 ++++++++++++++++++
 5 files changed, 36 insertions(+)
 create mode 100644 package/jwt-cpp/Config.in
 create mode 100644 package/jwt-cpp/jwt-cpp.hash
 create mode 100644 package/jwt-cpp/jwt-cpp.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d15fffea27..9963b77dd9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -405,6 +405,7 @@ F:	package/intel-mediasdk/
 F:	package/intel-microcode/
 F:	package/intel-vpl-gpu-rt/
 F:	package/jsoncpp/
+F:	package/jwt-cpp/
 F:	package/kodi*
 F:	package/lame/
 F:	package/lcms2/
diff --git a/package/Config.in b/package/Config.in
index 968ad126bc..8dd0560a2e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1908,6 +1908,7 @@ menu "JSON/XML"
 	source "package/json-for-modern-cpp/Config.in"
 	source "package/json-glib/Config.in"
 	source "package/jsoncpp/Config.in"
+	source "package/jwt-cpp/Config.in"
 	source "package/libfastjson/Config.in"
 	source "package/libjson/Config.in"
 	source "package/libroxml/Config.in"
diff --git a/package/jwt-cpp/Config.in b/package/jwt-cpp/Config.in
new file mode 100644
index 0000000000..3feadfe3ec
--- /dev/null
+++ b/package/jwt-cpp/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_JWT_CPP
+	bool "jwt-cpp"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_OPENSSL
+	help
+	  A header only library for creating and validating json web
+	  tokens in c++
+
+	  https://thalhammer.github.io/jwt-cpp/
+
+comment "jwt-cpp needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/jwt-cpp/jwt-cpp.hash b/package/jwt-cpp/jwt-cpp.hash
new file mode 100644
index 0000000000..38df18ced7
--- /dev/null
+++ b/package/jwt-cpp/jwt-cpp.hash
@@ -0,0 +1,4 @@
+# From https://github.com/Thalhammer/jwt-cpp/releases/tag/v0.7.2
+sha256  7c1b4f767bdd14f727f6114d9e35b761f10d00d6a27ef7650ee8c628f08df27c  jwt-cpp-v0.7.2.tar.gz
+# Locally calculated
+sha256  35c2d7d6824a1e1ed2b266ec334b7862726ae593855c3cfa68b952bb75f082c4  LICENSE
diff --git a/package/jwt-cpp/jwt-cpp.mk b/package/jwt-cpp/jwt-cpp.mk
new file mode 100644
index 0000000000..27e7d23691
--- /dev/null
+++ b/package/jwt-cpp/jwt-cpp.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# jwt-cpp
+#
+################################################################################
+
+JWT_CPP_VERSION = 0.7.2
+JWT_CPP_SITE = https://github.com/Thalhammer/jwt-cpp/releases/download/v$(JWT_CPP_VERSION)
+JWT_CPP_SOURCE = jwt-cpp-v$(JWT_CPP_VERSION).tar.gz
+JWT_CPP_LICENSE = MIT
+JWT_CPP_LICENSE_FILES = LICENSE
+JWT_CPP_INSTALL_STAGING = YES
+JWT_CPP_DEPENDENCIES = openssl
+JWT_CPP_CONF_OPTS = \
+	-DJWT_BUILD_EXAMPLES=OFF \
+	-DJWT_BUILD_TESTS=OFF
+
+$(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
