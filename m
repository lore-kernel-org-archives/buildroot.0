Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE0EC9830E
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60AD44052B;
	Sun, 27 Sep 2026 10:47:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Ddnq-4BDAap; Sun, 27 Sep 2026 10:47:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7994440501
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506053;
	b=Mo/QXWgWRr5UnsJTZN+BBx1E49r1QPdzL7hpQ1WxqL5iQD0YpeWGH5RvY00AlENvjRXf
	 /IfgehrFhEaSDk4gywsAJHJBn1Nutlh6JuSeevfEPMTgd6+a/mJi63w5rN6ye3jTSYPeC
	 tHT0UpfC1OKQXdOiZgYqLQjWUwwu4GTZjx0YDulxRBMP9HktRMHO8CL5S4eVOvqBo2DdO
	 W4o6pfL5d58SBG6BjPFUF3mPJSs4HwGWZyjAEfa4/HxYgrlJXV0Bu4Uf2aZAh15L6vWJy
	 H0GmQ9hnc9Jj5o8Fuzbf1l8verrxZs6G+N6HVGMkmXNcyB7VfFY7ODhIVJUKHx77Owg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506053;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9px9d3qOtNpqdDl3zCxSkXoN7KMCzOx5Yk4Fzmii2HA=;
	b=XvjqPRYviYYMub0BLY+ExdntmBb9HPXaESPgNf9e5dBkqSHJ3IjF6nczF2iV796eOJjT
	 HjefX72G4ONhKoyfd2IO8UygPyIuYyVPlHua9Y5bavJTHhnWFG2/BgJcZgS2qMp2pzLBQ
	 prWIJazb7lOwhkIzkEQsDl2WvjFGgTVTTrH71MWtxE9YqnVlCrZLPDHYtXWLnyDUGegod
	 womgnuHf3zch51F+e58Jq7MgZoivOi5/0L4nXxJoaPZNYgu5QKTOdOs9k/uRxW30Uh+D4
	 QbAUqyOS0Qob5L9gW1pRTorsFNa0p2WF15q4yaU2jWwPRnYmXXdObianhX1c7gX5Hmw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506053;
	bh=9px9d3qOtNpqdDl3zCxSkXoN7KMCzOx5Yk4Fzmii2HA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Red7waQp3/txFERLxg93c5drvRSl3JDWQKUhfDRX1IzdkcOJ4BDj0JxR+cDe/qxEQ
	 gzZSq0UzR4jnKwBXpJ1l0TCWOzXW4P1GRMDezNw/oFXGf8jHsEHOvBwi3bzob8XxuM
	 AVEPj/WkA2pTzl1tWCKrrsprjAzvW4Y2S6uzE4wG++PD5ch+igU6JIegXMDU++GMXP
	 Qbl+GKze92ne3eHtC730FoRhoGbXxn+xHlRwMRj6YjK1U3d9fb8cAtPvaQgS6Kjq+O
	 jDiJrznC3V0q56G+M4xbWCsWM5rgD2x6XNEcxfvwqs/l7vWgGd95L7dFEb6ZYlaleU
	 sFanC1JmzrZrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7994440501;
	Sun, 27 Sep 2026 10:47:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 18A05334
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A0F380BDD
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:47:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 90umzgzZAw-q for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:47:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1B77C80BDB
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506051;
 b=JoENj5fScdpGhSmJFcFitDE0y7rFI9vMsPkLOvzKcX35JbloDKH4yj61X0eXiBTfUJMK
 0gfXo1xkdUX+9NPnoQFb9OJHLLEwQImQqIN4lV84tP1NKHKoeOaGNjHU+/rw0QcZiCYzd
 ZlrYwcgiljKc0Q+iXU+iRZAIESUjAuhlRs7ty2J8gUat2TD6vpL1l3ew579Ib2W+Aom74
 0z9665DVsrug01vXXyi3ZS9l2wqNwIlHqa9eRPNUnie1FVbk60A9VKTuBLrA8KwvUjpHW
 96A3LKaUo7Zt0njqGGUQxeGomorzURzik0hduB6h+jpWSZa4eY56XZqeFwke1uN65/w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506051;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=40iENv0yBWyNrjjHcKXw07A5F+SLvc356scGKiuAJSs=;
 b=lZAG34r0f3O8CFIGns+NG0gUTn5kBLDiC/jaGcdrgvmcNNxahFVwQb4b0G/Cs9TSPeHf
 DdsXGOczRwZDzmGd6OUGnuMboUJ3eU6sgNKaKuDUjXxPy/1ZFgjPQqGArdRTcJD8UACLY
 lHhIVDMou8jxXK15dYMzXt+O5N1wJ5aF8D9iGR7mpuujMDoZovZH/LzZzNmVg5vOLlNMY
 BrHcE7DDYa1ZnBu589vonLGiGusEEi1AHu8w3Ao/PkTqAGf3Hwtz+T304ehCTZnLfn3Eg
 esCf9c5+A9wTOwQVfDDrH1dU0Mpvr0xNBLxCeFtxlND4uh2MF8AgvC4+2eqfECZd0Mg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=QDdwzqoj; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=QDdwzqoj
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B77C80BDB
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505833;
 bh=40iENv0yBWyNrjjHcKXw07A5F+SLvc356scGKiuAJSs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=QDdwzqojX74aCL4qC5AMcZuQmx9RT0c2wW1tAHHTC2D3j8TCqoaYqCvToqnyedOKd
 ph2+aDSNqjTcmruFn7/Iu/tRw0bueY7bjhqyBo+epR+hFcOHlKghcrKiPjorXAy2l9
 /lDL91ZDxLUEapmYQp+AJ74/VvshR7cw2Lbl49hkdETV1wBaZVDkpV57ZOGKD105hw
 M/Zw5vh6OJI9aiSstOc3z8DdrIkLZMAgssj9tKA1tiJgisafk8f9lk5SijtWjtsD+I
 TYvITyOIfkr8QQH3vZm6aLI88+G5J7GvP81BipbPAsEcbUkVGbbrfB3ykAOQQ9ru8c
 d1QMHwN1CR6yw==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 HUlMFLXyX6gC4Qko/cmxfWHhCsOcEi3LWP6JltPriYVTnz3Sj50VdOoRmziQHHhPRZUk94bginD
 1lVLCW4JBZuvWmB5NcAwMknyUBm1f96Sl4DX1yLTOY6o4dqsskG1mP//qcCvtOeRSRG11N/zmSf
 S0gblj2wdmuoIILc+OqR1Jv2O2oJc+u9Htud3L0b0llkeL6jOMopEUbkqJ68WwhQ5aPzyaiK9xu
 4nJQTu7+3IBqoFyxowDvzu6O54IJYKO+ksvtO6iCinbO3lW/D5iefTddsoSbhFx+zMRThpxYebB
 ICZ92uR726MIVQf6iHS51V71vRINeF8jnU3VrxJqTkKt08pHDpfLtC7RjJlktLRO0hUxnaUncsm
 VpGWi3tvUt9AXAoz1tkB4TJyKmhURggJVogispUNKp6qpkLdZ4ozULL771Mv4YltqpI/6bOKVZ0
 EFJ8fEcH28UH9uIs9E8HKmepF0iDrRanJ/4qBlnbhKCVDWbV8WfD2aKgVaN9QkSSUSZe0avWc/H
 4IBWQKvOKvIDj1aqraG0Pb6EIs++Tg7p7hthdmR6Lb2HDGeug56PwAS0RUcm2XqU1/cjemjLToZ
 C0/ir/HHeJm9SlaOTpGtq/hmaTsBto+eVGfl88vScP7PJVQj+gZ3jvfOW69P8h9RqOEfG8RKiGI
 PVJSZTu7tow0pfW/a37C9Ep2BMMEIOMPi1TBDHPFasmTDeXyypnGO2hHtZo64
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 54ACAA4C4F7B;
 Sun, 27 Sep 2026 12:43:53 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLi-0000000007a-21bj;
 Sun, 27 Sep 2026 10:43:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:47 +0200
Message-ID: <20260927104301.1801638-70-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v6 69/82] package/socat: Add support for OpenSSL
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
Cc: Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
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
 ...penSSL-4.0-use-ASN1_STRING-accessors.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/socat/0002-Fix-build-with-OpenSSL-4.0-use-ASN1_STRING-accessors.patch

diff --git a/package/socat/0002-Fix-build-with-OpenSSL-4.0-use-ASN1_STRING-accessors.patch b/package/socat/0002-Fix-build-with-OpenSSL-4.0-use-ASN1_STRING-accessors.patch
new file mode 100644
index 0000000000..6c53500d02
--- /dev/null
+++ b/package/socat/0002-Fix-build-with-OpenSSL-4.0-use-ASN1_STRING-accessors.patch
@@ -0,0 +1,35 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Thu, 13 Aug 2026 07:00:00 +0000
+Subject: [PATCH] Fix build with OpenSSL 4.0: use ASN1_STRING accessors
+
+OpenSSL 4.0 made ASN1_STRING opaque. Direct access to struct members
+(->data, ->length) is no longer possible. Use the accessor functions
+ASN1_STRING_get0_data() and ASN1_STRING_length() instead.
+
+These accessors have been available since OpenSSL 1.1.0, so this change
+is backward compatible.
+
+Upstream: Submitted [socat@dest-unreach.org]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+
+Downloaded from https://github.com/openembedded/openembedded-core/commit/aa435ebaaf7446ec07a88586f2de4109e02a2d38
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ xio-openssl.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+--- a/xio-openssl.c
++++ b/xio-openssl.c
+@@ -1898,8 +1898,8 @@
+ 		  case GEN_IPADD:
+ 		     {
+ 			/* binary address format */
+-			const unsigned char *data = pName->d.iPAddress->data;
+-			size_t len = pName->d.iPAddress->length;
++			const unsigned char *data = ASN1_STRING_get0_data(pName->d.iPAddress);
++			size_t len = ASN1_STRING_length(pName->d.iPAddress);
+ 			char aBuffer[INET6_ADDRSTRLEN]; 	/* canonical peername */
+ 			struct in6_addr ip6bin;
+ 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
