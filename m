Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C6DC982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:16:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1FDA40F1F;
	Sun, 20 Sep 2026 17:16:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i96RUk-EJMBU; Sun, 20 Sep 2026 17:16:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0981F40F55
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924590;
	b=b7bQC5WXIx+ayg4vRpxSzWdLcUzgnrjdGV/Bx0Etz6iJWvA+cB11XzVk/PHND3WsMnCB
	 kjsALkD0NnBenJdvF9vMahfwMhjsMr+vZOi0lcVEjaWtb1fO1CUW5R3uK1DfycKE+g4TL
	 sc/Le5jBbkyuu58aPvKpkFQpmpWiR/I9UHD4lQvEZi8UicnNhs9KlxY4GMONr7CORP50c
	 rXDNEjzFpDI7v6bBnm3P1w3tyQhfZmscWcRhO7ta/5qtt1q/ZSiPABtIOFSCbyDsH7Ocy
	 5k2s06B9vyEao5mCWayq69OlGtBwNf2VXoJS0qWZq/js8MFVlld7sDjMLDCy8jJ6qvQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924590;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3FPubjymHSUzD6get+Z0rxrhderv55hBEp/mi2dXTXE=;
	b=Jxx+yGtFYjEdYGhVzttcqs9vgML2YwBj1v+HXg9W2MCCyX4Vsiv0Tz5H4nAlnWEIBjXJ
	 HoTF9oV6lqETep/edw+ZTlO+1JrD+1v63nXQK/Px7/SOToY/aI1oc5RyVdJ8g+M9v5Fru
	 HViaxCF+yXLisQYjydv4CUm9dMKWNSzkYyenAfbTi8gXrnhq/EsEMntD3zsSqE/DKK/fd
	 MLPzPGeKdxqeps4NbT/oABuUoLHRwyCgfUlvB+1Rimj8ERVY57AT9rBXZPRbD8yjeE0ox
	 M1lkBTlUTO8hC7IrjKu9TggTB/JilHd70s355ocS7iXpYsrL9RPxrBiKmLAe/uePAkg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924590;
	bh=3FPubjymHSUzD6get+Z0rxrhderv55hBEp/mi2dXTXE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=px3emsrRTP0YK6ryNvgRWSkGf/4BHlwFlaR95r04tcK0mOU3FvHM7AYFYnJ6ak5i9
	 YbjnUD7P8XBQuhz6ArJjUc0mhOu7gwHcwlZfHvHkB/EDb9AnvqsSBNznM/ChUuMBcd
	 gozI29XUvbux3GGNToGph9rdnpYmNTOz1ObsAjuaxqloo3Iz9aYdpprTKFT5fsg2EH
	 AgJI+/Y0M8FMOP7pLNVtnlaDUZk5YmEkgnqWa1sDy8yLSL/hHIQCoLZiwqdxgjTAWq
	 8941TZrQ3PW2xFEMdvP+u4lBmjQbL46qJ6LFltI6AzWJoaVbF6iLUg6j1X7YnJcVff
	 jnLymVEBCBXBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0981F40F55;
	Sun, 20 Sep 2026 17:16:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CBF023FA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD5C780DBF
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:16:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G-wzDAXs1-Rb for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:16:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CC6CF80DB4
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924588;
 b=DdoQwroyvapTnt3hXKeg9xBZFxNSWBEPpxxLWPfeAgzQf2HZmvcpirV0h6yEcinkOccF
 BkHbWEiBG+adOa2hKhE01PWBEwCybNlyfrdx4+Noe77W03fMcbhZOKmNrEA5CMFJQhUI9
 TdNKaXpl1k/HeXFnJ2SQl4lr01IpViBPRQ0Pnqe/BdpwKfhZhWovVS2nZsIJUk3ju6SLr
 qAa1+rIObTlG500kasM2zULaJNMNqKkE1SpV3qZOiMFe39uUl3Lmi51QlsZm/Io2ptrWi
 FuUI/srEyE0nZSL/6MlBzQbNDs0QfqvTZc84BtL1CW7qDtiWcsJcJPC/SQl/gWI4QNg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924588;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=DWqBja6LqOlclvBbPOxQRJyRP3Ezg9Kl0ZLPlYk3eJ4=;
 b=WQ66YT9CjxskZY1HeqVB0piZKFmJdOevKVWw5N2kApIzeBsNsr0Y7CVide8nINRajlEy
 ukQVo06VymtSSSVI0x7e531uVCTNtCns0CbD7OFreiGIG3vW8bsL+9E8rA8lnak9IdooL
 AzucG3ntQI3PfwFybuok0qbfANQio8kR7b2AS1Ly1I5FMZut09bDvL4F2CSenvLWdzYTW
 FRI+BPrGX2gqf/HBYI77D9QOMTRrSkc/VcbArveGLzwR5Ul6KhjW6vuVbKgC1F7oF+aML
 aWSrKcZdWtJTJ1Rg1g97jI3W6PeVSuOmmmnA3lFWrZXMT+SPxIRNlUzcf5N/faeQCYA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="l1zP/R4d"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=l1zP/R4d
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC6CF80DB4
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924156;
 bh=DWqBja6LqOlclvBbPOxQRJyRP3Ezg9Kl0ZLPlYk3eJ4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=l1zP/R4dYxnFNjq7QyQC8REGNdLzoRnOqLazuvMcM55QfzqDl0eBglxVfMm8xoRaF
 ETGtC65N9fZAyH/t881yE4OdfusfJkDrMPVwR2+d4g+DSXlZLNEFpHSMqulzL/xGrW
 cfXmuFp/Z/r0rRRNkiTYxSVnQPC3SD/QRbewKfD7oIOQ5ImQpWtY0kBq1L8aaN9C+v
 RqkZcbBNBWtAZKhbLPM7lf304qBvthoDw04JgHiD6O8vgf7tF5tXyZ6zV5x0yscepp
 CLtUxC9HyNXzezR+BoYdpTv364segK+Z7QGnO1IHK5t5EHWiUiPEQFZi0YAnt6ydUp
 M9v+lmZL6V4Nw==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:jfMcrry9iXw8UQIpg1KxeCBjoWfazb8J6PNqAfJ3dyqbvFuzooBNpuJFA/1qpJvIyhRzd0X656okvSK4w3mHtqEAxLBUV8C+sjH6Ax3q6gGYARhOlnTuNgU+qrazUk6TeJftkUyhYn9eczxkJI8UynaeyLi2u9TIAArtgy1GNowac4Ko+5d9LKUee8R599DHeIoeGtY0Liq1z6msdY4NAR47ngkn1luVk4vem7wOXcGquGegQ3gfypTWX6CS2dPfCs+UEQaCwJGfETzAHOWZpOT7VKJMCgiaYBid5AuxwpmawFom3SqfPq8/vdMQwJ/ZS0ZlgEPNwClvU4du552MYfQ23sBUdL5zj+SuG4n+yzNZuUkdgNDMgU3cCPraOvoZ2SzjSvscsat4MYRyOHugcM7VLOhpQRL1DwtazNBG9XCUsmPC+RTSJLZFteCW8s0nXv9SNkNX7zlzVPipaDvZJUwuy1U46eCoYyzp+FvN+Lc7zWKVcPyOR66SOUb72OMXBk6rxdOrjGSBaeH8CVqnTM8245H5wVltCIGwBrRMjajyxpxxrwmxt6gU8776PunIafSQO1x3Jd0r43Ky+xNrjIxhnT83Oajjlnr184MSp+fWBr
 x+Nb7HKrSK7wTwu5I9aTerg/3/reOBffhJx3+kS+++dMwYru3o85U/mjElxo8dzYwzAC/1MQ==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5BFD1A4C488C;
 Sun, 20 Sep 2026 19:09:16 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1a-000000000o7-1Pzf;
 Sun, 20 Sep 2026 17:08:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:07:35 +0200
Message-ID: <20260920170815.240247-29-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH v5 28/67] package/ecryptfs-utils: remove OpenSSL
 support
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

OpenSSL 4.0 removed support for engines.

Please note that upstream considers eCryptfs deprecated:
https://lore.kernel.org/lkml/ZyKf6ZSZrETI+4%2FS@redbud/T/#u

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ecryptfs-utils/ecryptfs-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ecryptfs-utils/ecryptfs-utils.mk b/package/ecryptfs-utils/ecryptfs-utils.mk
index 03e7f3e34f..aed1cae2a0 100644
--- a/package/ecryptfs-utils/ecryptfs-utils.mk
+++ b/package/ecryptfs-utils/ecryptfs-utils.mk
@@ -32,7 +32,7 @@ else
 ECRYPTFS_UTILS_CONF_OPTS += --disable-pam
 endif
 
-ifeq ($(BR2_PACKAGE_LIBRESSL)$(BR2_PACKAGE_LIBOPENSSL_ENGINES),y)
+ifeq ($(BR2_PACKAGE_LIBRESSL),y)
 ECRYPTFS_UTILS_CONF_OPTS += --enable-openssl
 ECRYPTFS_UTILS_DEPENDENCIES += openssl
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
