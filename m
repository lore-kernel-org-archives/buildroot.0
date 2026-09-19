Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA6AC982D7
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 963AA40B28;
	Sat, 19 Sep 2026 16:04:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nvrAcom7koOz; Sat, 19 Sep 2026 16:04:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B3B0540B47
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789833884;
	b=RR0/JYYJRFt0Mw+0QiS/ZFdSL+eRmx5y8+2o4Kkw+yro8jB4ugo1Qa/O3R8AY9aNq8uo
	 vgmD0+8TfEU9GhrJk7aEtpVpLmsIPy0FRNzoSWnhlOcKsBn4yH8S3/NNy4jAw7XYxcqr6
	 vRd5uTQ7T3Qv9JvcZsSOrFETrWAtWzSyGH5eqCk88uHTP004d+Ina2QuY/AxAD8P1LYQk
	 26ooxdUWUkYEWD3LztieC4/KqpuFgMVkJd10uje8DZwKGhKCWA6HO3GE2DsiNkmx1RuEI
	 +MU9nEFxIuyPkIW6mX3u/qOm4QT8bR6qoCt77tzwE81MAWhgeZEiGEkEqifJBM2Ahlg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789833884;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=aFic8FrKzANVAxKz+PnWbFrRrNGYGlBPUJ+llmnKNx0=;
	b=YFvBOpqSRoI8oZeJWSaPpH1LZQ+b75GzGwwBmP4Eefh7sS7TAWMltMHMvqnitjKfIQwT
	 9eDjaNMu1dFa4u47phha4NG9ATgP5gsHoP5Bwm3Ee8ntCu16QDyWix8pVUzdC4fHPeFF3
	 qOXNbkWKl/kVs98L5iNd1DSjJl2Tqi9AXueGmIcqCEakrCXveuxGT+sl5zSKyYA6uBlf4
	 GiATN5k47/qEBe3gM+5zL6OctB5LhyZzhZ0iz2zqLT1I6YBLoC6K2ZcRjCb5klb0b+54H
	 PRkO8fR+/8Iel/ffwmLEwK9/3qAUFbzNSLJRWDW3+sIyeH4QO433c9SZtS8Pw7pqrBA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789833884;
	bh=aFic8FrKzANVAxKz+PnWbFrRrNGYGlBPUJ+llmnKNx0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=L+t4mxgo0wZeqR6lil+UhfuctaKIQcfr75k48WUor6VvgeZOak8UivYc75BBf236i
	 gxyq1ZJ4XIuYtso7x/zUskV64hMEEeKzjeXZU3bkhIn8/QtU3l+tzqMkhnR0b5/wmg
	 SSB1ykS6cvXp/+AM0CM01xqKwS2M7RdJJNgk7I1Rmx0ejsdRA7XzVg+XKP4ycAJsr3
	 7I3G1ZxwC5r7GWzdn5ZupnHG9p/RhS/pSWxmNX6pEXmKxWD4PI4Wc2fbIQzQ50MGd4
	 o4tHfQYWf9tOFRSgYYbNwMY4rPwNygWL+coiJz7qQ+FCburm8wzTaQ/rVdg2GTQuHj
	 V8bzvlbgHrFoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3B0540B47;
	Sat, 19 Sep 2026 16:04:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CA4D37A
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B9EA8113E
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:04:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r7u0iqZS6dom for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:04:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A968E810F2
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789833880;
 b=SGZMKsTjlwOdHJZp5fDMFw8ZC8qwiZeiFXlljJol14sqm2OHDzANkuv2gBjwBCYinFIu
 RhVrU9tnpn67TmH37NIRH4WxvszgW6NC8Miv5Ujmk3Gwppho1JpoT95U0Ne1GUxye2aG3
 x89/ycsstIFRkRvoJBUAAG6WjzDFBotV+xmnwZ01tz0kYtRCnZ+tBsOeClWOWIdb94sn2
 YaT6o5vCBklw3IHRGk+xJwWauBJ40rg43/GuaQQmBhIktEHu77K+iUlSMSBm2iRzrfM3o
 XyjG784Fd/98FLHiAzxf0WoGedCdN0hOfqbBW7QaqFQXVdXOQ1VGoVmauG9+yIv5BKg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789833880;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=5PkZeO3UEe0e8x7VCsoB+XcXnDewbRTw7cY+TxHD+ZI=;
 b=fBk2Zb8mcMFGtJf0QEc+3bKOJk4JVKA7/76GuVs0mYcJ1ypa9qdE8IeRJrd/DhGwJs/o
 U9LMCoAV03B+6dTz88kpqEQk1FGiI5Sh5Fljce3w30AgY1RrLg04ODZ1H47Ao6xdGg3cL
 8zJuSfZZQSQsIxjekkL9EFntBtQJCNyk6JnHkAOpmBVs2bqHHQSg5iFmE7LQ9hZ3QCRVn
 +HLvVw9iFVY832c9aZuwOefgDEJHTwIfWC1iLIysZMrmLYVzgkRygTwsFJoVAAUX/FVZS
 wDO4zCtlD2pU4rgxBGOyP8LfO/MIjoSSqNvvDrHjLF9qrRR1lxsff0+ZcqBC17P8PDQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=r+ReXOhA; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=r+ReXOhA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A968E810F2
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833545;
 bh=5PkZeO3UEe0e8x7VCsoB+XcXnDewbRTw7cY+TxHD+ZI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=r+ReXOhAtHfcP5wMfDUHftWv3byUvwlIMvQHRDABUJYTI5TVuVTbqCtIEcQG2V1mq
 PD+/KiLL9i07WO6Qksy2HXEngV0Yqn9W239g51MHYUMUsGIKpIppYOnR6COIPnbtmK
 zmkq0UKkMTEuQmveqG1PHg+vKIXA04e55dGJHl59dfpUK31uqR1sJZq7RTGO7whQbI
 sFhfdA6UBe+RjXxopwejOz8DEZw3KUCoAQvFiYgwLwyEZyFhGvyH+x+XLAqJqZWGyv
 ickPJjT74GpwDEQiikNVkKAnTIPFXceAM9DZTZbabm23r+RqFWaLKyCUXmpRNzgDka
 nk3I2wXWhPLYQ==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:Swp+LMBGU3ybwOg7A7iukhzcPuzUv6dlL1xkt3AmMz5jSsQMJmGkLU5lEToDBhatjgNdNKKbB0QldgHKFdVvesc7K5BCr0LH4Qq43zsu5O034PCknOBwBoEVh+/4SaTUygJljddJCo6VYjn2wISOCPRFvxjrztLkxSW9+sZdDCw+sg7q5Zuq5Fw8LYEr0L2OpBPugJ+MTkxsUsqoQMI71tTB2a7Yny9Rg45TxpvTvyTjxDreS9dFL4KJIVQGMbIJqFOIk+WOHSYiTlY3VrlCFjMiH8sWH5V91AjNusz1bSfwcrfZzyVqKzIo9ADRPLjR5viNd/mGqsb8Zu0/nFqXs9r2IjlNfkeifS2IL5a21HzIYYcdSiA/+Re0K8wlgwvmbyM8qV+oc2W67BR2BUjzfCODAhKZ+Fgi0Phsv14JIZryVXgvvlLytYMgp2Na4oYRgBe33uHssSROAzupLku/l6jA/jjPWfG9zS9vP/Xp9E72Namn8KAfYALrYEDCw4PoKM5xomM2qMpPy+0lDvQVil9oiUnB0NzKP5syzikQSpM7te82m/GsFIxKb3fLYQF54H6QWPnCpwlFxAdoeWK8Sj2ffj650qRUXmLcLGqzMv8BAm
 5zItbAhQoqOdhn5rZM7H8ZgzYSvJs6Tw5ZPwHB5lc1YP6W8eUo+onxHYrmy+RX1iHsRTTR
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 20843A4C47BB;
 Sat, 19 Sep 2026 17:59:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSm-000000005Jx-2pj5;
 Sat, 19 Sep 2026 15:58:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:57:44 +0200
Message-ID: <20260919155845.5776-20-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v2 19/77] package/ibrcommon: Fix build with
 OpenSSL 4.0.0
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...ion-without-deprecated-OpenSSL-1.1-A.patch | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/ibrcommon/0004-ssl-Fix-compilation-without-deprecated-OpenSSL-1.1-A.patch

diff --git a/package/ibrcommon/0004-ssl-Fix-compilation-without-deprecated-OpenSSL-1.1-A.patch b/package/ibrcommon/0004-ssl-Fix-compilation-without-deprecated-OpenSSL-1.1-A.patch
new file mode 100644
index 0000000000..8a8b21ce7e
--- /dev/null
+++ b/package/ibrcommon/0004-ssl-Fix-compilation-without-deprecated-OpenSSL-1.1-A.patch
@@ -0,0 +1,42 @@
+From 073a1b779826d1e1bbf473ba45db3ac1e273efce Mon Sep 17 00:00:00 2001
+From: Rosen Penev <rosenp@gmail.com>
+Date: Tue, 27 Nov 2018 10:18:37 -0800
+Subject: [PATCH] ssl: Fix compilation without deprecated OpenSSL 1.1 APIs
+
+Upstream: https://github.com/morgenroth/ibrdtn/commit/073a1b779826d1e1bbf473ba45db3ac1e273efce
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ ibrcommon/ssl/TLSStream.cpp | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/ibrcommon/ssl/TLSStream.cpp b/ibrcommon/ssl/TLSStream.cpp
+index b18b43c3..e336db55 100644
+--- a/ibrcommon/ssl/TLSStream.cpp
++++ b/ibrcommon/ssl/TLSStream.cpp
+@@ -259,16 +259,22 @@ namespace ibrcommon
+ 		/* openssl initialization */
+ 		/* the if block is needed because SSL_library_init() is not reentrant */
+ 		if(!_SSL_initialized){
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
+ 			SSL_load_error_strings();
+ 			SSL_library_init();
+ 			ERR_load_BIO_strings();
+ 			ERR_load_SSL_strings();
++#endif
+ 			_SSL_initialized = true;
+ 		}
+ 
+ 
+ 		/* create ssl context and throw exception if it fails */
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
+ 		_ssl_ctx = SSL_CTX_new(TLSv1_method());
++#else
++		_ssl_ctx = SSL_CTX_new(TLS_method());
++#endif
+ 		if(!_ssl_ctx){
+ 			char err_buf[ERR_BUF_SIZE];
+ 			ERR_error_string_n(ERR_get_error(), err_buf, ERR_BUF_SIZE);
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
