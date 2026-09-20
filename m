Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 027EDC982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF91C40E31;
	Sun, 20 Sep 2026 17:10:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 93Elye0S1ocp; Sun, 20 Sep 2026 17:10:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E04D040E16
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924256;
	b=SKNNfj5wMJ/qDuVna9ebNB3veD6of6edcPljP6eRKW7l5vQbAXF+yPAt5+Tz2/Xt/OAc
	 m9k5UbPz9jS/pTfXP6GBzX1URDAo9QmZPEDl8ujSG5yqP3XRD4F3DA1emt3LpEtIzWbge
	 4yDJrKy9DZAi0wydckaGSzPupSt8R9WfP1pLIfASMp4TXv9zosejOihTvIvbWcFmnwK8K
	 IbmzJkFFnroLCLg+m4vFKgn58BgyGV1hJqpL7WDY7Mo0LSSBhRe0kmtznHk3lHSJh1sVK
	 v0qT4urGmelDXDM+7nQoxMZdJAt3yiZh/bUTjH9U4/gQDH2RXLyG1CO4YFdTsbYfcvQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924256;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=235skMEz307yiyV9CXz+xd/ZQkAz+x4P3WQCD2hRQuM=;
	b=jdHJmWV/Hd2J8gkMjTXUbMLUOhektzrxZtaL+5lRx8EHY4hOE93QkktQfI/Ii2mgTszu
	 X8kAe9SKFpxkKatCiZURnHiNrQK0wPb+SWD93Zka7Pf1t0EO7gs+HdEuiMXwWsik/vcYd
	 KqIwS3FaaC6n++0VI/ldWASz59VgyXOru48PCHqG5WIPGd7IjBI+xoMyJKwWIfeDluUPz
	 UJpQVaCluxYL4fs83dJphh0yDXGT+4vQi1jCHYmeJcqbAK9A6me8PTRBi553RMx3+Uhbw
	 m6ajOZXOXXDMq+xSNitRUUrGZkJzBueguFiLNtx+yRehVCTXU2GiiQjrA4bOx+FtnBw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924256;
	bh=235skMEz307yiyV9CXz+xd/ZQkAz+x4P3WQCD2hRQuM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=JwognuIq/zj4vYAXwxWj/VXBRl24PxE3VvEuUPRDxswgMEyO1jf896xVnD4Ks/X6n
	 7n+SIA+32ZxL3epNZD8T+3BsUJ0tkr1Ur1YELo1SR6G2bnq73w/4/PyLc27z7zaPdv
	 N+foRlxvtdndhQMAX1FwNgLDYFfVzSGFW9g9eAi9CUTFVWqKD3xFNMwz2Y2itgrCTA
	 afXasR/JaNQxNh9fBEGIZ124pnHo7wD89sHeg+UYQmLbnb2Jds7ap24/FYLgDC/KwH
	 kXgyQjh38E8RUk9WhA9cCE3Lg0TZGBpkeuUyzQOW5tfOi50bH01i5XYRTwW0yIzWcg
	 JaV2zX8xMM2Aw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E04D040E16;
	Sun, 20 Sep 2026 17:10:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 968EB3DD
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CAE94007E
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:10:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vsgBDEYOX_Pb for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:10:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 921F140022
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924253;
 b=kFqyFB0qolB9oSFZAjKZ9yBqQZ1b6IMqSkL7dY9Nv1TIkpLHXzrLWy2UAEMRonqcLKS2
 W5feF1+HvyW8XFiNhJNwSqOVM0PEdAd4PRvezFB4eK6p9nIrQtJPNS4tHrli9PKYn4Lqp
 RsQmrck+NSIHyfpE2tQWeB5gDSaCgRAyoigdmuIrLIqJgJZWDxbXX763kqfBC4wfwgY0H
 LsLjnsI4sv3no+EoIZEg100QacJmIyKl9ni2iEl+4c0wpG0JrQOJv4eLAEwHWj7KtaLKD
 ZZqFzFg8/qSGNgLZC8KD+4D/29qI4AJ29NTPZrkjKg9lbX5KOkKVGhIZPhV3hE71gdA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924253;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=3aKZb4LJYzzut3vuILtIB9xtnqzSTwUpR3VdLJSINBs=;
 b=ErKHaLKRrlE1+9eJOgTnc88QulMiof4RQALxl14hyKdPPCFn+Gxy7g1T2m/SM6uS+AlX
 ToR89+ogSrXdmII5VlbRj8X/wGHBhuRNGx3ozO5LRtu2xs9jY2mv1igaj/QgSb+3cRdRZ
 KQ/Clv2nuBbyJ8xm1tNNAcKRav7w9nLBHMrT7I7A8ALynGyY4jpRlSo/sX7Ei8yN1T1wx
 JUi27AulBdVxjpKngTOM0Owfqfg1+fgutCf1Na2krWnkQqP3EcpCXk85VEnG96xM3mOwC
 qH8A3fR3ulr2bqC4341J7flpGoVDhudaNY3HvYd8ZHBXeWprBfulH+UwGgGKnjFaC5w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="E/WRS7C6"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=E/WRS7C6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 921F140022
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924144;
 bh=3aKZb4LJYzzut3vuILtIB9xtnqzSTwUpR3VdLJSINBs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=E/WRS7C6bG5rFaUuHv166svY2aIv8xHYpqDRrerSuAA/Ak5EuROYANsiAsraF8wI6
 q2ELo99f4bXX9ygnJB9vBdUBWFI9rsXO3P762LJ7tuPcoXvPeiG0cXlRwjFxqL+Dej
 gkEn5GOT4pxvWqn2sZQzF+8N7keGZ1gn0TJxPGJUjTToesL0Y0gikHYqlRlQ8iW29M
 CeNOG64aV8NmxcdTsojXEpGIKw4kuqU9QVX5pFLkEztA3qo6UxPH7KTakWEMnwqRGk
 WuRCJk6L0kOIif49sqVVldOv7mPEOJ3thuTdLLwdICXYx7+GZEmfOo/dIGg0x0KgeF
 HME5QVB/pIEAw==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:ob+tZZlDaaTB+tltGud/U/P4iYdi3hZ0T5SDzy0Y++o61fbKimnxamVfG+OD9SJpinE0Ro50w+0+vb/t7Ql0XS6d7goyNTRBEuJ+LJS61vz7DCbfn55m0PfbK74mL8Et6yNQzVkUed8m1/8sR9uo3KHKsa1O7Q6FVgs7lr5gHEQPWrBv5rV7qqAzlEKHj44C+bNhPXXv1B4U/ZXtF4z16zOMM8nTC2ZAVYA5UhaIgd8iLVaoS8sUGFHoG5O/XHnZpxAbWCKglQaiz8gE1BSK1Lrg2CCclvPWXY1MM27y0BFl5yVJZnUi2MWpCy+ozfpDURIQJ9VGofCxRZs6BSnTHmpzZSSba9K8vVrETwz9qJew2I3TuVoReI1lXfGAGL9oi9xceZTlFRXH/lanEhE2m3+oUEJkp/q3Q2g0BHACPGax8WMsTr1pzj8mzo7Hi4rxNJMGIF+txe99aAIg6GckDs822nyjlbNGT0kDAp/UFCUN06ol0l9+0/5YfVqa6HLlCbSJnqMN/zIHfWBnLhKyGQC9dVPeIGoFrs6BcKN5grG0AANeB/BjG///26KHxjKxIVmAfGnvzrcdFZmyfaMUy8zY3RNMCD5Bgibuq1rorraPv0
 n1IyHUXHIVWPLYYrOcke5Nb6AHmARcHkpUPX93GwIy6R1o7JOU56BCI2pt4M8x2hPl6HuoYeU=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 328BDA4C486F;
 Sun, 20 Sep 2026 19:09:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1g-000000000o7-2Nqx;
 Sun, 20 Sep 2026 17:08:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:08:08 +0200
Message-ID: <20260920170815.240247-62-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v5 61/67] package/thrift: Fix build with OpenSSL
 4.0.0
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
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
 ...recated-OpenSSL-API-ASN1_STRING_data.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/thrift/0003-Replace-deprecated-OpenSSL-API-ASN1_STRING_data.patch

diff --git a/package/thrift/0003-Replace-deprecated-OpenSSL-API-ASN1_STRING_data.patch b/package/thrift/0003-Replace-deprecated-OpenSSL-API-ASN1_STRING_data.patch
new file mode 100644
index 0000000000..279daef4e2
--- /dev/null
+++ b/package/thrift/0003-Replace-deprecated-OpenSSL-API-ASN1_STRING_data.patch
@@ -0,0 +1,35 @@
+From d586077a37e14446cf385893608ea9e60a59d083 Mon Sep 17 00:00:00 2001
+From: Brad Smith <brad@comstyle.com>
+Date: Sun, 23 Aug 2026 01:26:50 -0400
+Subject: [PATCH] Replace deprecated OpenSSL API ASN1_STRING_data()
+
+ASN1_STRING_data() has been deprecated since OpenSSL 1.1.0. Replace
+with ASN1_STRING_get0_data(). ASN1_STRING_data() has been removed
+with OpenSSL 4.
+
+Upstream: https://github.com/apache/thrift/commit/d586077a37e14446cf385893608ea9e60a59d083
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ lib/cpp/src/thrift/transport/TSSLSocket.cpp | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/lib/cpp/src/thrift/transport/TSSLSocket.cpp b/lib/cpp/src/thrift/transport/TSSLSocket.cpp
+index bb8dfd13f..48b96ebf7 100644
+--- a/lib/cpp/src/thrift/transport/TSSLSocket.cpp
++++ b/lib/cpp/src/thrift/transport/TSSLSocket.cpp
+@@ -770,7 +770,11 @@ void TSSLSocket::authorize() {
+       if (name == nullptr) {
+         continue;
+       }
++#if OPENSSL_VERSION_NUMBER >= 0x10100000
++      const char* data = (const char*)ASN1_STRING_get0_data(name->d.ia5);
++#else
+       char* data = (char*)ASN1_STRING_data(name->d.ia5);
++#endif
+       int length = ASN1_STRING_length(name->d.ia5);
+       switch (name->type) {
+       case GEN_DNS:
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
