Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECBAC982D8
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 876C9606A5;
	Sat, 19 Sep 2026 16:04:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iNA_yvEGlYCa; Sat, 19 Sep 2026 16:04:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 97A5360673
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789833857;
	b=Mks3PQp1EXtgIzRlX+MAPYkeofc7xAjArM9HMX93D8SqIhb4Qs2GT/pHeA7T/q8fTiwI
	 A5YPqICHAcbvcF7/nmRUGCiCAWlfij4Hb6hIZC7hHC/pKzUPSy5ELBQfOD3ozxngE3hAd
	 VaLfGDYw5cNTlo92CiGdk1+ZYin+SeRqvzpQ3AsU1H/aUyX5jT2g5K0kmfXYDM9sso5Cg
	 EpdxYH9SIe6bLO5NYqOQNH7c59ovn/XOYYK5py4Q0J1gjD2K/gANA621JIwS2G1XUTnQI
	 73s6yBf0PACwNxZE9GA3pLHMSK4w56ub795iZEkSJH4MEANfxePXEEUYnQ6HasvpycA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789833857;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0VbkXkk1xpEOQhMO+zVipGweQU7rpa5j5oBRNvrA59g=;
	b=Z1HFEeVudZXoV+vJuJaBZ1WNrQSlbDz5dhiHcCCnFMZ1Av61G0uF4o+dQKdIlvG895ov
	 c8OAVGIbRFd9FhEZoENJV39RE/i//nw37c6eHJ6EZsjlvI63WhKlH7iVS0RVcF9c6PeU6
	 TzYBvz92W62iGCqmURQJ3MUvA/7Fcj5ZNkKOrV+ezD6XgOW3p4vq8nW8vHAsgl7yS/ejI
	 pl2PI24lMF4QWkGtZK0K3M1n8/Od+oWVGxTBUPr1eax8lxyfc78HYxWHSjXTVC+jviM8X
	 NsGxgPPtTsWSXawS56MJpeo8QwWuxdHwMurg4Ek35I9XHur0zs9mXA4xeSld6c5AOKA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789833857;
	bh=0VbkXkk1xpEOQhMO+zVipGweQU7rpa5j5oBRNvrA59g=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ktT47eOeLvUwu/PZg2v/rUANfhnX2esfQlUVtFPSgOtK2fGFxAy8gm5zyU+auuwS5
	 IGaLUZxrjOmmm7QayBf4HlpcYjMykEo6Yu4zNZzxKPUqioQQpmFvjrLZ4J/5Vv29vK
	 dYaWvUIjpWX3pV5T02FTcl5+wGG4tP4Jurxj6S0rZ+1Q8JCaMrENmiJ6wym6Kjv1/b
	 lPZYQDBO0s+cu8wIMBBSslFAtETyUUE+DsWh+4tx+n+CrQgrU8FGxH7c+y2U9EUvF+
	 VzdBcYI2153Pe0llMbEB7+DIS3pzy35C67xPmBOpap1HFrggYg9BTafUdMqa8+Jued
	 1sNiS/GYQpcww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97A5360673;
	Sat, 19 Sep 2026 16:04:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D31D24D
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5E20400BA
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:04:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jahFicmff58g for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:04:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org ED8C240026
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789833855;
 b=BhiWeS+MOBSNPGU8DpvBU+iEpl7gm2V1RfcWpQAv4KqvpFbtNXPWgEqUDl6B+0LkCDy6
 cstsU8ejm5haThG21vMSw7UQbrZRqtHweWkFVkGyPPrg253rF39ZIXjmu7Hn3tpLCsUfw
 +KUkgs8BFVa1sTcX2/z7NMQeaSZM5xR/18jfndunyNm8oRc95y7o8EI/ZtipXEMnohSm2
 mjN6EjS8M1zwOatRyy8AUGc+/hYRE2iVCbdCzCAIKG2yZqm8e17/blQguY9fhRo2a4uri
 wUxGnpq0ZvYliZKwY0UGv7QbGIUyJo4yZPo4OYqeeMOr7aOxTdua6NuFVYd58jyZvEQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789833855;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=uKC7KxSy17C813qamL3f705ZVvnyKQr8JXL0DuQ+7mI=;
 b=nnX0Li96O31siTIZ25pvuHtSEY3PKj3uFY+rvedwpaRwY+U9whTPF2orBGZZnZ+0uplA
 4aAO0bzEr7Pt5vTQDQeJZ5/JOSy9rx0ntnrH+whbJhCfUVO2skbJhr5wHo45QGlMwSg9Q
 un7inq4mGPHTz9Fl9HjIESTSQETEJ4g1x35Zw7Qg7f7Ue7aajJKMMSya2kFmJ8V0Qs+99
 P/8UI12eLAutpNcVHrmpLwSstRamIdcF0V41L5Pw/oId+2E7wm8M8jKg8B9jRg535+nLL
 wevVbE45wO/1OQo92+W/WK84uGHLJOKO1qC4ksK6ea5Hkie+dqDuYnD5SjQKPFBcuAg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=CIzM4Unc; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=CIzM4Unc
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ED8C240026
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833545;
 bh=uKC7KxSy17C813qamL3f705ZVvnyKQr8JXL0DuQ+7mI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=CIzM4UncQm365AbBPPwubbg14BiCSf9OKdPNaa7/3DisFw6OXfg77HZE7A5btrb6L
 d+tkGNDU8O+TCVNvFnV2GG65LHSP6XooPqStgKKrnZ9Gf/l7GbTxaNUhHEciK5t4zV
 KBqbY+GswAeKelzt/kka/FkmR5ge5brHefF28TtIyx1VEYmrbNt1FmbuXFK4/iDMPt
 t4dpQAzGCn12lqLWJV2pOMJJKvmEf81xYTiY2aTucFP9ikoPJtorw3m0Mj2dLyy6eB
 QxtSu0E+eGyxTNAQ7lyclY7bkvHPAIAVoL+TYyysVYr5BuNPVApJd+3HVazw5UwBBb
 qHceOIUIVhsYQ==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:9bJIWXgi8gyMqGa+0ur9wHEAp/AkvMp5PP9hQLhHxCkbiIvtqtf5gJgYq7uEx+TJo9Kxt7bU3slXOFZEZ9S8woti3kgPGNtwdG25t5ZgHo4yxIG1yUPEbA5XhDLIwKHsHLjEznKFLT+eWehZ3jIKVizLOlV8SKNgPyvWqGhNMZJTItMROCe8G4kDJHOYu1oDR7Dt6hjhYO9zOB6KKLZvJBFWXnHKF2b/D8qtJ1Ats4oGFPSoOwYYgkdLFTXSQx68BIFNVsXH2RrUEyQdixYY46qsL6qR61yHlbxcubaJW/j7jLdITmG9mBHEm+KGRonGBzFxVKsYBk0IbZGTiL3qgsI0wMFO8KmHw6GtmEAAO3AdG6ExOaajpy9QR21hD+/gQ6xticktt0gpTTRTv+3361jZUrJ4QPoPHA9WcKAJjwx+DGT4sc7EmHKX4AdbYgRTkPCZo9ERD6Y0mKDAjyt+BMTS7G7jv22MK1JPVrRPwEa51H/pv6N4WGk5+Q41Mlq1E6Q+GpKfcD95FPm0W3Yj9kjwwzNMRUmH+qcYjPrKQJLzWEQeDFSEuGbsx0S8gNG7nP1BT1B8rXznsCfY5xt9xMN/Gha+PKmcs+uuKRu/eamvEK
 Kb4UEg2NCYyrvdJI5EPRmgKPJ9uQIEr7EjIKlccwAFWZ2Mh4wgdlN9n9QNIWwKrOGrU+sxVcmmg4Vs6KbF6vLydz5dxVmE+BRDkeE2wgVymbd1
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0B07AA4C47BA;
 Sat, 19 Sep 2026 17:59:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSm-000000005Jx-3I1Z;
 Sat, 19 Sep 2026 15:58:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:57:45 +0200
Message-ID: <20260919155845.5776-21-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH v2 20/77] package/libp11: bump version to 0.4.20
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

https://github.com/OpenSC/libp11/blob/libp11-0.4.20/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libp11/libp11.hash | 4 ++--
 package/libp11/libp11.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libp11/libp11.hash b/package/libp11/libp11.hash
index 8a31a6f39e..10ab7388ad 100644
--- a/package/libp11/libp11.hash
+++ b/package/libp11/libp11.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OpenSC/libp11/releases/tag/libp11-0.4.18
-sha256  9292de67ca73aba1deacf577c9086b595765f36ef47712cfeb49fa31f6e772fb  libp11-0.4.18.tar.gz
+# From https://github.com/OpenSC/libp11/releases/tag/libp11-0.4.20
+sha256  a125e0310ff10c189fc1b32a9652101486ea94a6b07c677a30e90e3638d2db48  libp11-0.4.20.tar.gz
 # Locally computed:
 sha256  d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  COPYING
diff --git a/package/libp11/libp11.mk b/package/libp11/libp11.mk
index 51a44f5b3d..38cc1c2e6d 100644
--- a/package/libp11/libp11.mk
+++ b/package/libp11/libp11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBP11_VERSION = 0.4.18
+LIBP11_VERSION = 0.4.20
 LIBP11_SITE = https://github.com/OpenSC/libp11/releases/download/libp11-$(LIBP11_VERSION)
 LIBP11_DEPENDENCIES = openssl host-pkgconf
 LIBP11_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
