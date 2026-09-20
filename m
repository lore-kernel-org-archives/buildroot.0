Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51993C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BB6440F5E;
	Sun, 20 Sep 2026 17:17:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YjpegxNpLntb; Sun, 20 Sep 2026 17:17:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3AEFE40F76
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924628;
	b=AVB5dv2F9vjtMilRV++PPVqv+LAdm4tMONxhZ5D04vrFYIzjNcq4oqHFQXJlz5n/QafR
	 nzlx6rioRDAZrkW69MQ8E8j8mCmChcmTcQljRekwBRcrTw/O+p7EhjeHxBEZZpDo3d3G+
	 UnbLxTEW0MoPIM/hCMdP4DLkhdKZdgvL0JBirxf3j10ofYy2JpuvnZ04g+KH0R5SErI8q
	 nkCeP2RTd9vwb++Oh8U6ImkG1NejO5GfJ/V3LNUNz+RWW0+JYbkopyCwl+NJp7sszmR7g
	 i+1KiOgU5KSzSTYrwEYkVT1MvyKBLYM2h+I7hlbl+h2k/cUYC+e3+wDUZTxapwsZ5/A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924628;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=CoKHt1SZEX9LCuTA4d+WI9H8Uc8vErfaVcWjqzjXnv0=;
	b=N2kEShup3iR+za28VsyHNEXyuTIxsdiqFiZbIB02smNKGleBgX8a6op18F9QXPsv/4p8
	 LXROp4VF5lfEMzZx7CQvHQT5zy8zpVLWgY4lK7vf4QYdi0nxNua/EZNNJxdmZlPodKPrU
	 w/OkATGtr4NrFM5c8ybZnEHMhuhonZTgSh8ucZypuwntBwXAA6T6oVdCh2scYKDIgoCAP
	 amNGWs/zkwFgGzZussx2FWNMqtmA91xCX6syXZe1CNpqM14C6wIMoHCneg9sF4JUwcJf5
	 AFcCMSTRgjwgKrgAdb2v3jlfWT0dWOOX1YrEP7rFzDFNXvg2pAseO9AVZFK4mMbTCEw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=R2V1a3Y3;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924628;
	bh=CoKHt1SZEX9LCuTA4d+WI9H8Uc8vErfaVcWjqzjXnv0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=VrWkzsONhjyi123/QmwOQDOsdLMbXTrQT1whmGzsy/aIymHEANiu9xaOxZaGuSoGf
	 v8Hmrxbigw/r2ELqGWnaj101WZ4DIcquSlXq5nrattKVXUVRo36pc3UVNLpxeW20Hw
	 lWNhs4K1Dynw2fSm+JOrLp9stNxIfR2jnUckuD9zXADySbSx5Uo9rIyXqPBPko7lnj
	 tBvKqzC9SeRdw+Lc7sUW/3ET1JcOMMH2Jr/1mVN/5QLyyM9vU698VXU0BkCwbSaXDI
	 sOiCE7O44nWF6Gr6es/CWHidRV8CzZviMMVRqa04cw1wGkcPAWTDtGIHpmEpa4tODu
	 1kT1HKyDlA68A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AEFE40F76;
	Sun, 20 Sep 2026 17:17:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 05DA43FA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E055940F65
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:17:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vQg90AIZHRLE for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:17:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org F015240F5E
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924626;
 b=jnc2vHpqdjFwmFIipLJ8Fp820efAOfd+Nclm7Fjcedqd7HtsgdTNf92a/k0Pdxyqem0G
 9DpiPCV0y85VO3sAyZ3r9uET3NGMbyqdlQHSlkVPl5foQisGA6a+Nd29A1aMdHT/mxZ/F
 K9/0R9GTAQ9ieI6Y7fQg3yWjgtFGtxEbY+SBUo0Hu9iXVGQwnJbwhvd0Sbw3Jmv7mNap7
 36Na5Ajy9k4VUrX7HcoW8f4V1p6go9ZlBXgi6iS0PX1Bg5uZaUvRznE0/H3SBNcW4PPRC
 Eqn4z/vkZsFa5ldbMiF8YDi5jDhN6BhG7w4btuyK4oXOMxwsNMqUb1sBN9CqFBOfgdg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924626;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=LHOJTIGlY+j1RG0jlzs/vsKcOKV9OP98XT1khlQkS30=;
 b=FbBJSJP1a5Au82/1Yv298dUHI8NnhfnWAySBd384BGKAAiYB/nUP4n4QkJxKzL2QEXrL
 qJkG0NZbZC1VNpLrNBqd2n38YgWyFC7MpLCSVm4cfM6AYEqkl0AHbPvCYUgTLhwl+q9iY
 PRfnFQv3jroWUUZUvCElMvLCBG6bBJwmZCJ5JtPXFGwi6etW96u1zpZzczsF02Wr1HFp9
 niv54seiSWxad2CXUZDmFSWjTzZnr5JA5e0ORb8MYooBMY/DmspPAlwe+TIWEQzP4JR7A
 NUID0y0TZeQOUSzjR7KCDGeAHD9bl0kijz9SSfUxvIGGGZvvdxqc4LBSSmq3FjV2Y3A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=R2V1a3Y3; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=R2V1a3Y3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F015240F5E
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924157;
 bh=LHOJTIGlY+j1RG0jlzs/vsKcOKV9OP98XT1khlQkS30=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=R2V1a3Y38QS/H0nUc/cAQWtG+UBEoBj7IjDaGWz1weK2j4BiTHASJYHU0HNLAuth7
 KgWCF2+CK2L1ucHtEPLYYUkZoH/Z8yZ0JlRMEabA6mpao8RTMyeasTa7rvEdGMVFgZ
 zzF1ExJOvJ8uEYdpXD5LemuFpwRYjSLXkxcelZljqnTC6Ibwbnmq6S4Q47nxPF9GhD
 T+c1wt9h7ttmRMZoRjy2omeiVYlcJbt6rh4c1whzfTIdQ3BAfLQ50fV6QhIhxgCzW7
 COUs+V2U+sxVRK4h+7WVzMx6MYm11Xo2ZpsoXt/9lN8uAFrKZhAyOeSqDIvrvhlPe7
 z8woajpcinZzA==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:pMAsxmy2/ofJFUAl0GeSn7X1r5jueW1rcjMziObqZxbKDfeVUD6RzvcnzZIQM3NeVNDuhlBix+RxcIC62MuzOzW7FUhdusm7KWqwuptbg0oEVUJdMxwXVP6QfMrQXOGdl1TBEFEe6KNv1ybLFFBtXRrXfVMHUqkjQwsn6Vrv1S7v5CuD/dP67EdeP0wltwep3ZulXG0jgah0dNLjZtuSaEFDqfEBEGCyl1CvJz7MPm1jq1rmGjLwLyA7Ytc/VNOi/OZEeDcJLSsBCuikpC1kUxsLX3h7A7f4yqftRKkKIon9Yvoa2uRPmHnuiZh7MMJGoHbiRqaHUwK4n1qxIo+j7GD040Mxsx2GMjGCmhs+DzByoXF/Tcl66lMbULzzUebXyTkcXO7ybFNOvxQrpxMVii+22sM81j8PP6FUna+EexjrZ5gRLACbqecmRGMkXSMEP/MRHN7gL5IH6DtpHihfTMO8L3+uQ4PB6zI0BH1pEAgxdoWS9ThsAX+luWXb/rPl8P7/aFnUtToV6fYGgbJwljgPGzloLqpe+h1VBJPK680wUmYua4/4PmKmo5NCmw8/A6igfnIB/bNX7H3hYyQH+nKQ9PqOXElQIBEoY/U0fKxeVc
 EGi1XH9w+TR+pydDjW4SSjzy6XuzZPsw+qjJWRCgG3aDtDSx8O30fumpGLJEAZTw==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 474B7A4C488E;
 Sun, 20 Sep 2026 19:09:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1a-000000000o7-2JMJ;
 Sun, 20 Sep 2026 17:08:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:07:37 +0200
Message-ID: <20260920170815.240247-31-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH v5 30/67] package/freeswitch: Add support for
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
