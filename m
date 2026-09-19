Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6C4C982D8
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DAF340676;
	Sat, 19 Sep 2026 16:00:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WExDm-5c26st; Sat, 19 Sep 2026 16:00:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8FE8340ABD
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789833654;
	b=Prc3jLvpfk8NXyKjzm/ArGFzZTH3/g6yAJU66jNzpS+ETUT3N21urRbhiQql/eqlQqz+
	 yZhtv578HpunP6GEHyOtXGyS6Gc7lhz6pzJbqxlJYEXAyRqidsmicxq1NNfiz+A05Uq0J
	 rRO2K+WguLuuWW9cxuDZ9ybV65q7XIrVzNlX3oIAUjmPxVrA68Gs90dwTmn5k2YgQJ3pm
	 66PrKoW5dHSxNz12qI+I+TpfgVPHOT17b+6SaiaWBLrJY2bY3rSsS2i0h3IwgYYPi93ZU
	 xtJ/ofiGUDFaQftjv8FazQTybgpiOsYKamZQGri07M6LJYf3hbykbemGdZv4Vj5HSSQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789833654;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=URJudjj74RJUv3OQ45S7B+cpNX+9uSDo4TNo9f9JzvE=;
	b=VrVeftaBwiYaUFxHQUQRUZGZgZG1ak1F1NH2Rij9Li+xP7NSkqAgRWxQPc9fTuD+y8y9
	 RDGiiATCbKArzvC8KmM/wLeczTQr4OMI6pjhmRViYMvu60XCaQjKAXXUjRqVCIjs2ssY/
	 dHNcglsT+M8tS156TVQvJqlHOMmebZ8VDFiPfDPf3AxVA2Q/cG8G7x2skqd67OA698Sn9
	 Z6OrJY8nXhF1EXeXVLOOUNjHbTLywseu/v3cvdg6h5q0+cXte4LuzgO6Ij9BLlnXzQVop
	 CBcz1sTJN0oxrLQOUIMq9VH8vSx4zxDHyGyJ/u4cyO0zZWj7sExeb6c+hWwiZ+WH6xQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=OWyL7Ms6;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789833654;
	bh=URJudjj74RJUv3OQ45S7B+cpNX+9uSDo4TNo9f9JzvE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=gqfYvcJ4jvdL9dt3CRgdSNzGZ8gS4B4smJUM53SavdUVezTyzF+bIe8rTk5snmwEk
	 9dyPP1L9Z6dowrVo7adfIkkKXZxCP3pQ7InAOxyajUNURZ9LaMayfwPQONFjQWnFz4
	 Wh4KHBuGdTSfkCs+EwIp3vLGrZyQARxrfu+/8R0HBeAQ70WAP3fTozQ1yjxoi85xwT
	 BsJhwABPmeDiTrz3wcthfiAOKL/y9RxKv9QtkrRiq7fADVgcH/4pL/EYEHQH0R1We5
	 feSo6bGxCMShdUkp8UxstcELL/U4XKX+DWcUN8+Dr+8UoASkavBV2YlsVdU78mq1Rc
	 WNlc/0RDlxeYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FE8340ABD;
	Sat, 19 Sep 2026 16:00:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6239437A
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5441040AE1
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:00:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ulExpTP683P8 for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:00:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 35EFF40AE5
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789833651;
 b=lDYHTt1pYmDApxs445DMBjATliqsbIdsEOMBtLo+X+whRLukhQTGR9umsUZ744BjuqkH
 0zTi3hQZWxxn/t2t5iYP3TMI3NnSS6MLmI3KsSjWB34dly5Es+ZMcqqa0AsTL0A4RTGWp
 P64jPZTNvoHX+WiJHYe4i9WbjCOXBthT/g4GSp+xh/IFnHwORLYuf8H+q0Ao/jGaobflL
 clTn0vE8krawuAElmYTYISykDGO+GnO6d+V+au3QWMVRAtB+MVWM6yRW64kI76UqeJLD0
 +kDchJCVIkUYflswwPtdWd5xUXXXeG8Fw7dqT2r5XdV4OdmaTty4N1cWc1RqK46D43g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789833651;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=vlrtVZvHmYfPDJ47aKKr33RL5eELc9JPdXMbfl6cUJo=;
 b=XBZhBh5GDVTS4RvQve9R0UYlaPl7GVDm+gyQWKrzF7kTO0ZPsEbCLiAyycREeSYhZJ1K
 eS16QHa0pbizXo5KHsfJHmD788pbuvbdgj/TrB7mHLjjnGhuNGGnV7zYmNspDG4iTzSZP
 MMFJlWYuvJrTIWLhJyBW+/+9kYRDuYwl4NdDPldPp1BJsF1IjKckLTM++vgCtCGmx53JI
 hZmlkSPX/hgHsx/u9J1up1C63AEpTl2lYRvtkDMw52QcySzLOeMX2B/DLjWHvuS8KAdjB
 n/z22c5KxH2LYIw672CBOLK6dpPrRlBl0jMfblUmlxmAIDANe79RQteJ+3iHObwF6Cg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=OWyL7Ms6; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=OWyL7Ms6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 35EFF40AE5
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833531;
 bh=vlrtVZvHmYfPDJ47aKKr33RL5eELc9JPdXMbfl6cUJo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=OWyL7Ms6HQNSi4pMaSmE+CzDaXttxKfs72NpX6TO+nwEoZJQM3rjt+XH2YlGo9K8A
 gA+V8hH4paF40HQgOB/X549/VqFPSRyT+GZhYuqIwM6kz0KhjP/lnRpZEs9PhmRhIX
 /ZgoPnGfIVdoPk2/S7wUKHpIc2OqUKpY/Hhas2z/JkBY0lPTqVCnpkTCBJlpbcb9lb
 cW1O/N+fx5ne/vOi6F+NoIofJ1kAbMoUfFLi8qCYm26hLMq+8r79W3p5LOKjnMGAFD
 uOzACv4SYK0P1mttJ3bqfl5HzWOjatzby+cZu/W+7zmTP+wrUdRZ/Vcq6KyqKUqyk0
 1EXYTxb4ZDpPQ==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:tB/66iJQCDGhSd1QRjL9CUehRb1dRA8hAE0M6gRyndrvRrQ7eSitwIn/VJ1HlFp6g94hL1EyzeQQ6b5p+h8XkJlOgwsjkVrO0iuXTZE+ZRUVYqTrDeVv7nUITA16hq8vyON+kQ5KAxDi/XZnU5r/RO3bjLH5oIuZA+SDk6hjF2egI7pLLZFaMrtL9ToxwF24sVBFcEuPjLxYQDc17LLkZ6SRfSASK4xSBGsNSOWCnWKATzStmqo/3GNzT+eD1op/L/cEcQqf7GhGncTunbefzqMp2sTs3M5zkfPDw+Yemj7MRewGZB3no52z4VU1mf6WBnBcWaBVCf5oMY/uNk7S3+yKceVlQbvaDUzJwumgOlAD4oZe9KLwfCwGYe1xNqqOMdiDQDTZSgRzJO1XKmi5oum79ZdYmkKn9WI5bzavUTw0cgi/FlSm4NoLQw+VYGNIsmEj91PxU5pMa/RvKzsJe/lZ77RStZvGqcSf8tB/FG59PY9btc4t1efmYnnBFsd8zXi6TSTjZFQoOEqm1TszJDsgmf9sfWrZdTKQfEmxa5Cm6D96hR+oaUhn/XvValuP7sDoat8ku/hPhT5E8QI5P3EuMOj/EZD6MSUrX7KohHJgWS
 kLpz0qhwdGQ4vflL4h/GTjzkcpZ/fmY8uydkGLlhAAChllwpYGzbhfFa1CX2oWXZxtHaGLsyJFW8143fZ8xcpsAWJAtcZuZkTld/mD5xzbcZIE
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5A686A4C47A8;
 Sat, 19 Sep 2026 17:58:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSk-000000005Jx-2ktw;
 Sat, 19 Sep 2026 15:58:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:57:34 +0200
Message-ID: <20260919155845.5776-10-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH v2 09/77] package/domoticz: bump version to
 2026.3
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

Added new dependency jwt-cpp needed since 2025.1:
https://github.com/domoticz/domoticz/commit/b30d9e9436ad428a2cbfd1fbb273461bdbf50a82

Added _EXTRA_DOWNLOAD for libwebem after its split from domoticz:
https://github.com/domoticz/domoticz/commit/7de4834e9959e8a9a21a2b82bb7700ea5af6e618
to avoid fetching git submodules. Use version number from upstream repo:
https://github.com/domoticz/domoticz/tree/2026.3/extern

Raise minimum gcc version because libwebem depends on c++17:
https://github.com/domoticz/libwebem/blob/master/README.md

Removed configure option USE_BUILTIN_MQTT due to its upstream removal:
https://github.com/domoticz/domoticz/commit/be95eec094bf524c1ab011eebcd797d3b19b17fc

Link to libatomic to fix a build error

output/per-package/domoticz/host/opt/ext-toolchain/bin/../lib/gcc/arc-buildroot-linux-uclibc/15.3.0/../../../../arc-buildroot-linux-uclibc/bin/ld:
 CMakeFiles/domoticz.dir/hardware/Matter.cpp.o:
 undefined reference to symbol '__atomic_load_8@@LIBATOMIC_1.0'

detected by the Gitlab pipelines which is introduced by upstream
commit
https://github.com/domoticz/domoticz/commit/ec5488a7df963af4b260a92bfecea53edc20b136
that added hardware/Matter.cpp in version 2026.2.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/domoticz/Config.in     |  7 ++++---
 package/domoticz/domoticz.hash |  3 ++-
 package/domoticz/domoticz.mk   | 27 +++++++++++++++++++++++----
 3 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/package/domoticz/Config.in b/package/domoticz/Config.in
index a0e69a7601..2af63baecf 100644
--- a/package/domoticz/Config.in
+++ b/package/domoticz/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_DOMOTICZ
 	bool "domoticz"
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6 # C++14
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	# pthread_condattr_setclock
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # mosquitto
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -17,6 +17,7 @@ config BR2_PACKAGE_DOMOTICZ
 	select BR2_PACKAGE_BOOST_THREAD
 	select BR2_PACKAGE_CEREAL
 	select BR2_PACKAGE_JSONCPP
+	select BR2_PACKAGE_JWT_CPP
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_MINIZIP_ZLIB
 	select BR2_PACKAGE_MOSQUITTO
@@ -32,11 +33,11 @@ config BR2_PACKAGE_DOMOTICZ
 
 	  http://domoticz.com
 
-comment "domoticz needs lua 5.3 and a toolchain w/ C++, gcc >= 6, NPTL, wchar, dynamic library"
+comment "domoticz needs lua 5.3 and a toolchain w/ C++, gcc >= 7, NPTL, wchar, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_6 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_USE_WCHAR || BR2_STATIC_LIBS || \
 		!BR2_PACKAGE_LUA_5_3
diff --git a/package/domoticz/domoticz.hash b/package/domoticz/domoticz.hash
index ae86a67b79..fc3904ade7 100644
--- a/package/domoticz/domoticz.hash
+++ b/package/domoticz/domoticz.hash
@@ -1,3 +1,4 @@
 # Locally computed:
-sha256  d87113d7cacd0b52b9126fcc1ef24e140a4f7042d5bc6262e86e4b4752f5cf38  domoticz-2024.4.tar.gz
+sha256  10053191b4f6becdf244d2a416b9e655c91d357b51dd8280832c6e36f7d5d5c7  domoticz-2026.3.tar.gz
+sha256  937e31bfb4b414bb33e70cad1403afd023dfff6cebba3213ec62a9c91525dcab  libwebem-9126af0ce3456c24b936dfb20d1b5a8bdb797104.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  License.txt
diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index 95d3335adb..5387076b97 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -4,16 +4,30 @@
 #
 ################################################################################
 
-DOMOTICZ_VERSION = 2024.4
+DOMOTICZ_VERSION = 2026.3
 DOMOTICZ_SITE = $(call github,domoticz,domoticz,$(DOMOTICZ_VERSION))
 DOMOTICZ_LICENSE = GPL-3.0
 DOMOTICZ_LICENSE_FILES = License.txt
 DOMOTICZ_CPE_ID_VENDOR = domoticz
+
+DOMOTICZ_LIBWEBEM_VERSION = 9126af0ce3456c24b936dfb20d1b5a8bdb797104
+DOMOTICZ_EXTRA_DOWNLOADS = \
+	$(call github,domoticz,libwebem,$(DOMOTICZ_LIBWEBEM_VERSION))/libwebem-$(DOMOTICZ_LIBWEBEM_VERSION).tar.gz
+
+define DOMOTICZ_INSTALL_SUBPROJECTS
+	rm -rf $(@D)/extern/libwebem
+	mkdir -p $(@D)/extern/libwebem
+	$(TAR) --strip-components=1 -C $(@D)/extern/libwebem \
+		-xf $(DOMOTICZ_DL_DIR)/libwebem-$(DOMOTICZ_LIBWEBEM_VERSION).tar.gz
+endef
+DOMOTICZ_POST_EXTRACT_HOOKS += DOMOTICZ_INSTALL_SUBPROJECTS
+
 DOMOTICZ_DEPENDENCIES = \
 	boost \
 	cereal \
 	host-pkgconf \
 	jsoncpp \
+	jwt-cpp \
 	libcurl \
 	lua \
 	minizip-zlib \
@@ -25,6 +39,11 @@ DOMOTICZ_DEPENDENCIES = \
 # Disable precompiled header as it needs cmake >= 3.16
 DOMOTICZ_CONF_OPTS = -DUSE_PRECOMPILED_HEADER=OFF
 
+# Uses __atomic_load_8
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+DOMOTICZ_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
+endif
+
 # Due to the dependency on mosquitto, domoticz depends on
 # !BR2_STATIC_LIBS so set USE_STATIC_BOOST and USE_OPENSSL_STATIC to OFF
 DOMOTICZ_CONF_OPTS += \
@@ -32,12 +51,12 @@ DOMOTICZ_CONF_OPTS += \
 	-DUSE_OPENSSL_STATIC=OFF
 
 # Do not use any built-in libraries which are enabled by default for
-# jsoncpp, fmt, minizip, sqlite and mqtt
+# jsoncpp, jwt-cpp, minizip and sqlite
 DOMOTICZ_CONF_OPTS += \
 	-DUSE_BUILTIN_JSONCPP=OFF \
+	-DUSE_BUILTIN_JWTCPP=OFF \
 	-DUSE_BUILTIN_MINIZIP=OFF \
-	-DUSE_BUILTIN_SQLITE=OFF \
-	-DUSE_BUILTIN_MQTT=OFF
+	-DUSE_BUILTIN_SQLITE=OFF
 
 ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
 DOMOTICZ_DEPENDENCIES += libexecinfo
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
