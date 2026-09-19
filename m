Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8027CC982D7
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49F38606CA;
	Sat, 19 Sep 2026 16:07:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eEL4744k6Drz; Sat, 19 Sep 2026 16:07:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 700AD6069E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789834070;
	b=nQqQmzO5HHda9dQdSvRYWTUak2tkN5x5LFgVi5R4U7/BtbAmmMMuNPzjmJMz3XqzCLco
	 Lb9x1b23/OGLrYG4/cugK/eCsMQp1EJxMTMeOJBPmPi/hY3uMvioYK++qdmXE8KvEEJSD
	 y6lwauCwwPityZwckX/31d0XEHntx6YG7YkBq3U9ITDMro3GURdTpj2lWob6StHixAjbL
	 cTROHhFxu9gIqOpK1t2k1V9+0OF78nGmZHoJyWwYkobMtI/sKpPDgcAjxFhLOiNXVHG+P
	 iF714tq1HK/DDEvIBLgXuNvgX2yJWhQ6HXKBR41+J0uXZMbsMe06OmhB76v/v94SSxg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789834070;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=CoKHt1SZEX9LCuTA4d+WI9H8Uc8vErfaVcWjqzjXnv0=;
	b=PlzubAdEp3yRU0FZf9EvFQJmBE7WqAwuDPZ8PWCAPJfRopLVG3HCb2djSR2/uyXln0qX
	 u5xM5kv1+UADFnVc4oLuMNvIKThUegYaUHbt0xP613UhHpmzLTCPRIs9Ip5W9Z5AIbZca
	 F3b4HD0nrgBmA/nUQMkeFAxvUrns7e4MWa31gLPL6LviGgkVZeztVuO9zu5BES3o3bxha
	 JLoKbHBbSmnmqgp9Lnda4dnFvKGk8DEaQqe9+QJHjet4ZqkgviiaRSbPgB2liAHEk8d50
	 5BhvOEuM8YsMbr901jAW0XNHajc78JRtXY4XoOcCkfEpuq48WkgjYWnn9N8PLCMrFZA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789834070;
	bh=CoKHt1SZEX9LCuTA4d+WI9H8Uc8vErfaVcWjqzjXnv0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pnlqC1PqFTNbb1qQv6G6DL4gM4s+sFRVqy4JwRns5lFv23z0y8maq8MzcdJQe20FH
	 k2j8VKnklzz28ItLExmeLCWUzaoktjw7sSIYVz+C3Ngw6+9MD5D0qzs+TJn6cT13Nw
	 8pdST4bEtjyo9GkP0Untcs4MaPHr2Dm+t0AgOvBXJ53KRaRNNhuzxdCbYZKLgKhHiF
	 gYovqQEAfMY1C/cGTtRVknb7WxdozzV8A8mB2qIQ9/aTypOfL6ql4lyHljmW6XNSWc
	 L9VH4+W/s+GoZBI+rSBq2noTLjmVn3PXCl7MP5SU/BTY6KRUX+5r/8CoMhYpFdOwxH
	 EX2SJVwjfZXOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 700AD6069E;
	Sat, 19 Sep 2026 16:07:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B203E37A
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97C6340779
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:07:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5bO6bJGctWGY for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:07:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B268140604
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789834067;
 b=UQPq+EGoju6yl3J7/pr1+sNfT1ukkXPt2IVB+A+cvgMAX6+G8Y8N0pe5ftJ3VISqe0Ik
 czVY26Oe6o7S4GLmX6BTqqm/KPx5fXYNKeQJMMvCBp2eRxN4lG4p+4JqNGN+EZuTYB3eG
 4kkGa1XrN7OYc0M/SdgUda2EOo9PDRZvN37zWsrbxFRwglTV6/xSLNEdfRlrqngyul5Gi
 HZvHOlpUQf6zI2/3YBDDYMsL/9H5zlleInT0GJMBMDz7l/EADDs7METo8xX6SmaOrGdHG
 Dw0td/5KVC+TsPtr7YvArvlVSRo/mKMth9fVGwK+N3Q50Fzyf8UqUrTyqJQjHNMzqLg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789834067;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=LHOJTIGlY+j1RG0jlzs/vsKcOKV9OP98XT1khlQkS30=;
 b=mA12KnGjADO4v24l2smXMWpTwOof31bOXZKREa83MIVZm9YlU5lz3U664s57CvtQE6Is
 txlMRwjcQrCQGNlUqH+P8gQcFqFnWZhgLWKMicFxAcDHMHTzry+x9GX9Hk4AoOFHLIII4
 mZm21bW98RFZNxzJaPI1NsfzwNi+xQ/2KVhSTsSoAlTptOeLC5n96uJmOzDVasPFrMntH
 sZjtsJq+0ghU9LhJJkH1fqD0ylF8/kYSnGDfjSCRMriS9NA4eENf/F+06INaILvOM3gxb
 XZHHfh3kipABOwjfBUPR5E0Cp1athV5T0oX2muIqW3wS4sp7DZR2d40QknxSnD7ZRUQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=f97i+iVv; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=f97i+iVv
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B268140604
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833550;
 bh=LHOJTIGlY+j1RG0jlzs/vsKcOKV9OP98XT1khlQkS30=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=f97i+iVvJqEhEilx8VNqqkm/rNXI/k+usXzATVR4F6NYWiXGQwmYm8PDH1ZJ/3Ckz
 EBp6lLilEUGq8RctsV7ElscOdShqbVjW8mcJguGt+USK0ItMMHSlPifFoUNdV6bYDC
 GodfBam/jBZVsUDRgo1m7N82vwmevN+oL8C+Di1UhX0VXur2zB5ROg9ZMVW73vBfQX
 qsq61E3Gaj6SqHQaoeJ6KA5ApWc6G92SOyt8aRq665kpKTnmGFebde/9IQAAdZcc4B
 vgTgUKz1tn+XOtBdaET9p8X+8RpsDOg3vYiRiXLxJQARdamDzgRxP59LgrM2EHKw05
 oPb+Q1z5M9TAg==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:09TMGbRfTDCL0CqvbAtLu9qpI0iFUgDDG0pEmNZOiXiFV1Ki6AqSfXmH9FRuH6kSqk225mt0BN/hDSxBaW/UEVk4CKH0btRVDOq0PIyOCdpjtMSt3bYmbR+7e6iRB3TKNh07Q1m5QChaTBJ1XD8nTZveeoCq91SrZ1CnWjxM1BSsSGvp6g73yJYYfL1G8inVxdk8Y+dNzj6b7NDti4daUmavNNEmSl1YBwxheb43gJvn+lRJ7XL1+0J6C2ibRgTi1rFTzCqDJdTNsOHQhoX2CeCX4AXMvPrw98FJRjJeylq6OZVOUA+wgTmIFWa9at+tdfhgg7tXW0ovxNecQOXeHwlYNY3wvKvx2Mit0xCuzWpCNc8MUzLwIN6xaa2fFiy4RUh0XlzdPnpasLzCG+Q6mvtruLS+y7F6z3GVyo+m0TsGdwpR3QosaPF3XIOh5oYP8CzDihuMBHvhTOnr11suolpg6FAsPLVAEW7oHrbPpkInVNJzjMbX5LALFwNSbh+Nl5MlLNPdaNfVXKxgyAb0VhHC+987PgmRVIueB8xxu0aHFb5qoGfPI3WFnadY3gUhnLidea3jLCXdo2QsdEU95W2wa3v8BfTzKy5+snW0ioGNb3
 TlKoZyzvei5AQzVQ9NkmnZhx69rHuyFB1VgA9d+B4jMxNBwJwLbH84J1ri+fQ=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 179FFA4C47CA;
 Sat, 19 Sep 2026 17:59:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSq-000000005Jx-0IXU;
 Sat, 19 Sep 2026 15:58:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:58:04 +0200
Message-ID: <20260919155845.5776-40-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH v2 39/77] package/freeswitch: Add support for
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

configure checks for DTLSv1_method() and DTLSv1_2_method() to make sure
OpenSSL >= 1.0.1e is used, the functions itself are not used by
freeswitch. The two functions were removed from OpenSSL 4.0.0 breaking
the configure check. To fix the problem we let Freeswitch force-detect
the function to finish configure successfully.

Bug was reported upstream:
https://github.com/signalwire/freeswitch/issues/3159

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/freeswitch/freeswitch.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index e27c53650f..524599870c 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -75,6 +75,11 @@ FREESWITCH_CONF_ENV += \
 FREESWITCH_CONF_ENV += \
 	ac_cv_gcc_supports_w_no_unused_result=no
 
+# fix build with OpenSSL 4.0.0
+FREESWITCH_CONF_ENV += \
+	ac_cv_lib_ssl_DTLSv1_method=yes \
+	ac_cv_lib_ssl_DTLSv1_2_method=yes
+
 FREESWITCH_CONF_OPTS = \
 	--without-erlang \
 	--enable-fhs \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
