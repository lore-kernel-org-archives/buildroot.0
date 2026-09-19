Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4EA9C982D7
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 940DE60624;
	Sat, 19 Sep 2026 16:02:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gRR877NovBON; Sat, 19 Sep 2026 16:02:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 841D960631
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789833769;
	b=hb7Ro3+t1MqhNoISO+pNAHW7HYr65Pht4EydYRmEx0WcHCx2N7RGajTUOdJQ+u8DJKW2
	 bPlb9wK8CJlbqAxblAv3aTQ57lZV6zsToZuiQsJ72cm4vnYKNGQ5ILsOF0nZTCNbp/g94
	 85Nql5vfHD09r1+Q/ZS84mOg4iv2L99Qxp4+AwydwWwlMzG0pp0LSv+uOBHq5BXrje+Rj
	 I7Jj0/xjuHrM9fBQn6YWKRiUFgKBM/X5nSRuVMl2+lWl1AwEZsXX8UGeBLYZo1djK8uKE
	 07Bi9A4Sx6fTmuKFpP6hnY16TTs72+Ndrb99RXRP06TFK2C455TnkUdRUeS244O69fg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789833769;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=IsuHfl7Og/Utmeii2Ki0dQ0+W94OpZnCp94s9QnohFg=;
	b=D9p5L0Z/CFmhLXLk+NaKwBznlHBiJk8WpLBCSlgm1h4BklU7QPP2S0Bl4eMpsgHvBfj8
	 MQWIvl1xALuepu3w54SYqYBLMrNOQDrkUpO/UaoG3SHMafN8uQA78B2zqHPlPzA3MkEyQ
	 kt6MRjPlf2uDttiuZ5Ywhc8yfVC2C4vj2cAe0GZZgIkuPbRjDfvR8alGFmvQH6J+HfE53
	 x+JTXbHzxQemH/RdqBDCrgQuPUTOgVphrK+eTpa/oM1U1s/AGvlkpXh0GfmgE1NBTPNyX
	 CCefaUBtcIjX5ZIMdEXVq9BcaUIaIuPQvAK9QL7Z20H1ASy/uhaEHFf8ADh5Md/otEg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=J7XrHw7e;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789833769;
	bh=IsuHfl7Og/Utmeii2Ki0dQ0+W94OpZnCp94s9QnohFg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=sm2AkaZuueyBJ+YlJSnfXKgU8IM0xapL+1oMq67ckdG71ntg2nBDEhVbs0/T4j95b
	 Icf8NZP22uTjB3ryL9/qNJ1PsaNLAdq7f5jw1P5yTTkZ9AyRjOkauKPW6ViJtm/SMO
	 Qr3uZtOFxFaSkFbdnyM9hZFo2b06qSzJUTSiIeAv3WmjTomjzc4zMWBv7qX/BBWxKq
	 LckqjhyUhQvie4NwuYPzmCcrx/ad4yqQmCyWIu4ptIcVnDNW4C60wOwn3JDDzxvShz
	 cvJ4Ic12Pfc6H3hPy9auxx5MD1/4Ljh0TEgYuMDMD+F1nRmEpUS7zLjlGtQ4BwzBrB
	 pFZx+HGSfhreg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 841D960631;
	Sat, 19 Sep 2026 16:02:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BB5D937A
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD5FE60624
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:02:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ORzeyymrxMW for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:02:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8B5C960631
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789833766;
 b=TuR2X52XnoPLdWFQYymrQ8COZKsenT/2GtUirsyuiEMCGUkAl8Ahi5iDNEoZmIrLUzZR
 DenW1oh5uKobkIeRNNxh3sp+FcMw1xRFyAz5G8wOtvTLP7HT1HDAesa8d9Hyzje5o0U3P
 7HC9bV1GMwWH2d4jkC2EWFCVbPV5y2FD+ymj7F+4GeLcT6oQ17ftgJfDnk48x5kzJDF3b
 R9gHwIpZI7bkzZy02jKjUpLd0krEy08yXof0IV4WLW+Y8pNbktL8buJPzDFry9UVr+Q6Y
 zZplvcnTX6UKXRIruANQl0tbKZWf97yE9edy4HT4gFCSzalB8bIUJ5e/SIcDWZTiLfg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789833766;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=ewtWUK6D8mkX4QKtdgjlQhr4mbsptfEzmSPrxXKuzOo=;
 b=EG6MYr1Ml4EcO97QS9AaD1/m1kxkJqPI4p3EvUEiZgvzawH1IUNjxQcjN1JGGIabx4TG
 uSiDLULxuX57MVHxOYqWE94a9sZ9w9CX4prQ+NTGyB8+hjPztSqD614nyGDKtxQ4cP+Ia
 C0KLVqB1QuvzC7VGu4OjGAURMhSklOkrmgAOwbJgr8ouIFFP/KhIGvpiSSNek8mmtpgsZ
 p+vidpYKCqr180tpKDEU/7zxbDSUE3yTxV6PoNZb/Pad3Qm64Wu2hDdQALGhNO1TMEYbk
 XG6es0cew4sLbuvXgLyWiThVSGEPm9MhX/BjLj+VzgPuu7sLIidjwefTYHyP89NSf2g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=J7XrHw7e; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=J7XrHw7e
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8B5C960631
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833542;
 bh=ewtWUK6D8mkX4QKtdgjlQhr4mbsptfEzmSPrxXKuzOo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=J7XrHw7e7YG1/x+nhnXJlnfoYZ6CxES0lXi8bmC+Q2WPlhYwanXbdjIaCRYcFQJLT
 rfVOTCwI9I+0l72aKb6V4XQ3Fi2TQRPIjYd8/e/DA6EOZfC4JSfOsVX+mw8NCiTo99
 CdQ+a19h/QUvQq2tXYWI2AS5R3Gsu3/PvgZ8Vip/zkWEc/JOahn8qA43SpPUiR2Cb/
 ARonDVerVSp08GfELH/arE4JvtWFb51EFtLBEAn5dLC5wbXuoukWawRil9eaP6/n36
 SCYfxZIE4ft4ArCl9KsQyv1v4C0jYq0N9/m8Ud4XcilsM7p5IiZPaQTjac8rQvM0cs
 Aea8ysFE1Owkw==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:D3ZI19zsUUdre7wU5aXWo4+ktgaTPC/+dULH2rMRb2FTzFVjKeXvQ/SbAvEiqdO40wgQ4qKhWUnkQFldyl2aTh0/sF2jpoZwUMl9NDEk7Gq1pOnhOljEMscbU+QeJHO46ABnj2vImT3avY8IaoS+Wy76A1QiDXD5O1COHWW/TLVKCGuXHLuzVP8icZj548VykYaWdneQj7DWAAAEnAchCxySZiridzZSx8z6HCK8VYlrSjA0dV3lWZHKlQ7uaqkpenhlyekIrNVvm+sySvi2Q6cZaxra5BwsHPQo2GJkOrEMoHPiKOEwgA0mPICYm2I9zMy/ew8p0W4BiRwH4AAmfEB1mwPzfWa7+0YiZMUmvopXvi8+o6ZdKQlhnYux7me7dXVA1mXZeOC6ShkYypoDUtHxZyqvwIaqYOmFNCvWxkTimzL6OHAMfYXHkXaQBLdvZrYjr0MYy3+4ElqW0zgH7iI71LdL/lY3XjzLeajt8g1OWR+rSHbIXjDKoVRH+30KfhGYGALOTf9mQL5YTK1aXqMNmAav0bmaLFB1ZkdgyRRsg5OnE6m+qx/dUNyOhKoVFWhniTxN1Mg5CpwsJOSkWEYVJeHj5/ffcQnmub0U0ddIyU
 KHEDd6Jfi9P+BnDNE4MaVD+0LfcH2IuySsPrVVe2yFK0EJaGsk9ze9a4lDdPbMk80PDvxI
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D32F5A4C47B4;
 Sat, 19 Sep 2026 17:59:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSm-000000005Jx-1zAU;
 Sat, 19 Sep 2026 15:58:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:57:43 +0200
Message-ID: <20260919155845.5776-19-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v2 18/77] package/ibrcommon: update patches
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

Replaced patch 0001 with an upstream commit.

Added Upstream: tags to patches 0002 & 0003.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  3 -
 ...mplyfied-POSIX-method-to-get-the-bas.patch | 46 ++++++++++++++++
 ...File.cpp-support-POSIX-basename-call.patch | 55 -------------------
 ...-added-openssl-1.1-compatibility-264.patch |  3 +-
 ...sl-gcm-fix-static-build-with-openssl.patch |  3 +-
 5 files changed, 49 insertions(+), 61 deletions(-)
 create mode 100644 package/ibrcommon/0001-ibrcommon-Use-simplyfied-POSIX-method-to-get-the-bas.patch
 delete mode 100644 package/ibrcommon/0001-ibrcommon-data-File.cpp-support-POSIX-basename-call.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 7e5d774821..50c1631df3 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -400,9 +400,6 @@ package/hplip/0001-build-use-pkg-config-to-discover-libusb.patch lib_patch.Upstr
 package/hplip/0002-configure.in-fix-AM_INIT_AUTOMAKE-call.patch lib_patch.Upstream
 package/i2pd/S99i2pd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/i7z/0001-fix-build-with-gcc-10.patch lib_patch.Upstream
-package/ibrcommon/0001-ibrcommon-data-File.cpp-support-POSIX-basename-call.patch lib_patch.Upstream
-package/ibrcommon/0002-ibrcommon-added-openssl-1.1-compatibility-264.patch lib_patch.Upstream
-package/ibrcommon/0003-ibrcommon-ssl-gcm-fix-static-build-with-openssl.patch lib_patch.Upstream
 package/icu/0001-dont-build-static-dynamic-twice.patch lib_patch.Upstream
 package/icu/0002-link-icudata-as-data-only.patch lib_patch.Upstream
 package/icu/0003-fix-static-linking-with-icu-uc.patch lib_patch.Upstream
diff --git a/package/ibrcommon/0001-ibrcommon-Use-simplyfied-POSIX-method-to-get-the-bas.patch b/package/ibrcommon/0001-ibrcommon-Use-simplyfied-POSIX-method-to-get-the-bas.patch
new file mode 100644
index 0000000000..e52981b38b
--- /dev/null
+++ b/package/ibrcommon/0001-ibrcommon-Use-simplyfied-POSIX-method-to-get-the-bas.patch
@@ -0,0 +1,46 @@
+From fcea9d27f5153c8da77ebab956f75eaa1fd48836 Mon Sep 17 00:00:00 2001
+From: Johannes Morgenroth <jm@m-network.de>
+Date: Sun, 20 Dec 2015 12:51:53 +0100
+Subject: [PATCH] ibrcommon: Use simplyfied POSIX method to get the basename
+
+Upstream: https://github.com/ibrdtn/ibrdtn/commit/fcea9d27f5153c8da77ebab956f75eaa1fd48836
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ ibrcommon/data/File.cpp | 12 +-----------
+ 1 file changed, 1 insertion(+), 11 deletions(-)
+
+diff --git a/ibrcommon/data/File.cpp b/ibrcommon/data/File.cpp
+index 31af4ae7..5f8e24e3 100644
+--- a/ibrcommon/data/File.cpp
++++ b/ibrcommon/data/File.cpp
+@@ -34,10 +34,7 @@
+ #include <cstring>
+ #include <cerrno>
+ #include <fstream>
+-
+-#if !defined(HAVE_FEATURES_H) || defined(ANDROID)
+ #include <libgen.h>
+-#endif
+ 
+ #ifdef __WIN32__
+ #include <io.h>
+@@ -225,14 +222,7 @@ namespace ibrcommon
+ 
+ 	std::string File::getBasename() const
+ 	{
+-#if !defined(ANDROID) && defined(HAVE_FEATURES_H)
+-		return std::string(basename(_path.c_str()));
+-#else
+-		char path[_path.length()+1];
+-		::memcpy(&path, _path.c_str(), _path.length()+1);
+-
+-		return std::string(basename(path));
+-#endif
++		return std::string(basename((char*)_path.c_str()));
+ 	}
+ 
+ 	File File::get(const std::string &filename) const
+-- 
+2.47.3
+
diff --git a/package/ibrcommon/0001-ibrcommon-data-File.cpp-support-POSIX-basename-call.patch b/package/ibrcommon/0001-ibrcommon-data-File.cpp-support-POSIX-basename-call.patch
deleted file mode 100644
index 5cd302c979..0000000000
--- a/package/ibrcommon/0001-ibrcommon-data-File.cpp-support-POSIX-basename-call.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From d667b13a87cf3207599a19eb981a893a1d7a67ee Mon Sep 17 00:00:00 2001
-From: Brendan Heading <brendanheading@gmail.com>
-Date: Mon, 14 Sep 2015 23:25:52 +0100
-Subject: [PATCH] ibrcommon/data/File.cpp: support POSIX basename call
-
-Firstly, and somewhat strangely, musl chooses not to provide a basename(3)
-prototype within <string.h> whenever __cplusplus is defined. This can be
-solved by including the <libgen.h> header defined by POSIX 1003.1 whenever
-__GLIBC__ is not defined.
-
-However, this leads to a second problem. POSIX defines the function as
-char* basename(char*) and this is the only version supported by musl.
-However, the std::string.cstr() method returns a const char*.
-
-POSIX says that the string parameter can be modified. However the GNU
-implementation never modifies it. glibc therefore supports an extension
-when compiling under C++ by also supplying
-const char* basename(const char*). This extension is not present on musl
-which is the cause of the failure.
-
-The solution is reasonably straightforward; test if __GLIBC__ is defined
-before calling basename. If not, use the fallback already provided for
-other platforms whereby basename() is called on a temporary copy.
-
-Signed-off-by: Brendan Heading <brendanheading@gmail.com>
-Upstream-status: pending
----
- ibrcommon/data/File.cpp | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/ibrcommon/data/File.cpp b/ibrcommon/data/File.cpp
-index 31af4ae..68e9b4f 100644
---- a/ibrcommon/data/File.cpp
-+++ b/ibrcommon/data/File.cpp
-@@ -35,7 +35,7 @@
- #include <cerrno>
- #include <fstream>
- 
--#if !defined(HAVE_FEATURES_H) || defined(ANDROID)
-+#if !defined(HAVE_FEATURES_H) || !defined(__GLIBC__) || defined(ANDROID)
- #include <libgen.h>
- #endif
- 
-@@ -225,7 +225,7 @@ namespace ibrcommon
- 
- 	std::string File::getBasename() const
- 	{
--#if !defined(ANDROID) && defined(HAVE_FEATURES_H)
-+#if !defined(ANDROID) && defined(HAVE_FEATURES_H) && defined(__GLIBC__)
- 		return std::string(basename(_path.c_str()));
- #else
- 		char path[_path.length()+1];
--- 
-2.4.3
-
diff --git a/package/ibrcommon/0002-ibrcommon-added-openssl-1.1-compatibility-264.patch b/package/ibrcommon/0002-ibrcommon-added-openssl-1.1-compatibility-264.patch
index 90e5147f54..8e890de965 100644
--- a/package/ibrcommon/0002-ibrcommon-added-openssl-1.1-compatibility-264.patch
+++ b/package/ibrcommon/0002-ibrcommon-added-openssl-1.1-compatibility-264.patch
@@ -5,8 +5,7 @@ Subject: [PATCH] ibrcommon: added openssl 1.1 compatibility (#264)
 
 This patch adds compatibility to openssl 1.1.0.
 
-Backported from master branch:
-https://github.com/ibrdtn/ibrdtn/commit/a801d10a081e3130e24042256a43190c9eb6c112
+Upstream: https://github.com/ibrdtn/ibrdtn/commit/a801d10a081e3130e24042256a43190c9eb6c112
 
 Signed-off-by: Eneas U de Queiroz <cote2004-github@yahoo.com>
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
diff --git a/package/ibrcommon/0003-ibrcommon-ssl-gcm-fix-static-build-with-openssl.patch b/package/ibrcommon/0003-ibrcommon-ssl-gcm-fix-static-build-with-openssl.patch
index c55b227c0c..2045b8cbab 100644
--- a/package/ibrcommon/0003-ibrcommon-ssl-gcm-fix-static-build-with-openssl.patch
+++ b/package/ibrcommon/0003-ibrcommon-ssl-gcm-fix-static-build-with-openssl.patch
@@ -15,8 +15,9 @@ Makefile:560: recipe for target 'dtnd' failed
 Fixes:
  - http://autobuild.buildroot.org/results/1d3b4b6cf043a3e185ce758b617a0a18c3d36cdb
 
+Upstream: https://github.com/ibrdtn/ibrdtn/commit/103bab3d4759e56b7e46cb9848e64037cd666911
+
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/ibrdtn/ibrdtn/pull/269]
 ---
  ibrcommon/ibrcommon/ssl/gcm/gcm.cpp      | 10 +++++-----
  ibrcommon/ibrcommon/ssl/gcm/gf128mul.cpp |  2 +-
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
