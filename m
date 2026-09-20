Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC17C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D56FD40F27;
	Sun, 20 Sep 2026 17:14:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hY-FLw1EhuvN; Sun, 20 Sep 2026 17:14:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E1B3540F1B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924492;
	b=k9krbnksuA8HW+d06xeOTkqEbMd4quKx9ZShkGYrQyBe6QWbF6VLPLroOkxWurz7yYTr
	 tQP9sLWGIFdZLCa8dHAFFg9IRNs0G6Efam/TKaDeH79zuawNT0Wab5YzJERzkSlJuEyB4
	 nhvad/roqiQLPpStev+QBmlKzA5/HhpD2cyROq1XqNQxTv7pfEZV1/Teqs5Xk9VmrdtJr
	 2QynAx29EHnnYd0eDy9sm2DOFUTQJXG4L+g4Idm7StrrwsP8FcdxA83T6VJLbN3YE+YQi
	 tMYa1kmF2LxwRWAlK9tUd/A0gbISk3xCVx9Vm6c8JpOqnehKXexltEuwn/dbscxsc1w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924492;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=aRiVEgXoDjtm+Fe3Y7oEt6VWwLbN2f142nxkkTDc7Ow=;
	b=R5+hbJqFVdtwn5fhqbhFgkcngmAxDi01HYqeA9a1EajywAdOYkww3KK8irb026EWFo7m
	 rwiHfRd3lR8cpUji3wrWNUh0EMPNj1wHN9Bgkfz+lMRRvw93zIdfaLJZWpBi3shDn+oAM
	 m01Ewau7KUL1iE1vdFckmxkivdV8PwHZ4GVKK4/UOgE4H5i86uh1cD0vlCQUZMi5nKUHu
	 RN7F61KJZXruwVKiG45hvSDowCAbSOvS1kmwRKKerQg2GKUax23wADeL9zGlpezUZW/kL
	 MRBNvlLnWsUF/DXgkxXlVseCxxKH6+oBoeUnhii2Aqo46rqq3ReejlrNvFqPj1a3dPg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=mPd7wOwo;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924492;
	bh=aRiVEgXoDjtm+Fe3Y7oEt6VWwLbN2f142nxkkTDc7Ow=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=aQs9H1/qU1LiaKJRVMipibFilyh4tybYDcyibeLH2rFhIw0oNJ5JV/lftZ6ZX1OJI
	 x6mntcOb2U8ZR57zmLuc3vwj+KBxzNFXZyQXt9g+hg0ta+gH8Q/8WrX05L0XoEZ/lW
	 W4QIuXKnF1DuotZkUuDKH8GDYWc9WoUiTPhEUMzpCwAFcoqHpzveUJRptV8sV9tMI3
	 FYFDTVwqhddevQcCQAdvBXZ5xcEN/Pht/zanY4qRKFtu/0Zl2I7njTlJpALpbDGTgP
	 QGoxAbwOyzJV6azMhDQFZpuNpxsJqbqiak3ZNeCLoBV5SZipYBkB5GG6ENjp9KmqX2
	 HD4EvehGt9eyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1B3540F1B;
	Sun, 20 Sep 2026 17:14:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E868F37A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D60FA40F1B
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:14:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aaGb5RuOtEpJ for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:14:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E8F9F40ED7
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924489;
 b=mwD7YGbzjydgH0iKeGqXxsJOv9yYflKHiGA6ADM1Mn7xU/X9keEGtU36PlWEQYVKxwIA
 izAsBahefr9dLNZSfBzMeHLHx6nqBNAmId+nneSdAbyeyT1GizNFInRPAWq9bw1QTaTkW
 YE1YNl/nd2f+U0qYrY97Epk5y4VOMwCYHt5tz1VvzShsBjWiuRH2HmB30KsvLOP8s1Qwa
 wPOnrW7aYpi6Bg3PR7uOPPOi+rK8Anx/OgWcFXazP4/pQuJXH11Oj6i2gr0U99raknqaJ
 8buiFpcHabN+NkFWD4U1AJvS3IaDRA9uBJ7y0Sunjar91ElIbJgEkVWI0oGbgQajh5w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924489;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=3O3DnL6LfnkCgxNFRYdPkZcCcenVZCICDFGJ3mUv5tg=;
 b=SYe6n+ucKhh10Q/zS4bJtLbUf5DbvwLix6p25zjkShir4wGgvn86UMEmB8YCHy0nFYTv
 xwb/V+wXRzDlNnDtEmKrSWt8HtUThefm8enY6g6WMEXwXlu6HCoC6VZHSJrFfiVJQiZqv
 dXH0NgT9gaKXuPsw42Vtgjgtj3BVEBZ52pdgZV1SoUzPJIYy6BQ/hjFy3njrTLgbMV/yh
 BIlhcEQ2kl0AQAmNt5KivI0cuFlBHZP9RuRxfxKanhy3C/EIXkypqm2PoOPAjBluVr/Wx
 v9jxDXxkuEjV/j6Db+2zmatJP/+SH+e+kW2KHHCBBVtki14KBk37fk0V74p5h8Rx10g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=mPd7wOwo; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=mPd7wOwo
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E8F9F40ED7
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924153;
 bh=3O3DnL6LfnkCgxNFRYdPkZcCcenVZCICDFGJ3mUv5tg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=mPd7wOwom1DHyiCBy+2nhKl/IM+wTU+9Q0762vEw8zvZvCQTBIa9TDdaVluJrT6em
 rP7/PrmozvBPVeKS4CTL5HgsktVS1K7HHPG1zFrucqyX9ChNv82untkmjSKFwL+ryC
 bOQCBLUJER3lK5UMsLL9tlCceV0tSJbuFqAQ+dWU/1OM4CkujygMyRTkQiitBiwyU9
 Oq2WRVMOsluqpvgKANhpn1TWOv61vvaRmkC1C+UyDPXP+qoWW8awAy56TsVCYk2CWN
 3EmeZtyZNYHslGiJOkHyzmrMbl8L55S21x7t2vwQhVZVcWQrhroyZCm0ZitgH2aKFe
 a7nHV6UBTfZOw==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:jgX+dwZD0L/B7O8dEmzwz1K6Vxq6DLBGK6lFGhb1vTuxOQHcMC88miq5G92WqqO084BBoH57f3WP9d/rxWEQgqjOPUcStbff8kYWj1N3V1rToCYw01XWTjVfVzUWXDbBd7gTvKRjz+f0fsoOM6jbHGfU2X9sAkmlScooKcs/IVTNur2b7vFTf55+pMr1b3sGUkFLSURkrGoeiYv81QKc/lLQyPef+P3nTPS4Knex59CkGOcE4fFkncqwWUWTyhkJzOS07FDQQMhq7PGuQZpHIfmGj7iMicRTIweBpf83JKBrQbirLVzvmWW1cKpC8SlBIP5PZd7ZRjCD5/hyXo4rqguwt/aAg1igC0x7CmoYcLzx8qTp9SD4K96wta7p7MxzOwppmy2gNFX/uhYiegUFXC5yiF2ojOxV8XPrzpJQu6jzlDC0gFLnoeUdUhWjGhlfLTXB8k5EhUV4tKtNNj2Qb0eCzimOAb036zY/JBO8naMz02nWU/9o6xMlVJHuKloxxcFiy+NDGny1NcnEzLY++Wa0eycqKR6y8nx1nU92Hg36Lh8sojY/UzZ/GX/YvUeWJPLulM1f+E2dfNrgikKSPULrzzQDwY0J561UaXi7QZkWL5
 7VpPdOhKN8gtETwenj2Z1Tz6/r3W6LjaXKNwbBgaBWrDmNy7PvtcH0gwA0DtMAPW4ZAX/VSg==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 06BDBA4C4883;
 Sun, 20 Sep 2026 19:09:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1Z-000000000o7-24ji;
 Sun, 20 Sep 2026 17:08:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:07:27 +0200
Message-ID: <20260920170815.240247-21-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v5 20/67] package/snort3: bump version to
 3.12.2.0
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

https://github.com/snort3/snort3/blob/3.12.2.0/ChangeLog.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/snort3/snort3.hash | 2 +-
 package/snort3/snort3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/snort3/snort3.hash b/package/snort3/snort3.hash
index 599818ee24..02ebcf85c9 100644
--- a/package/snort3/snort3.hash
+++ b/package/snort3/snort3.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  9465d19b0925088266504e8962e97e55359bafd6a19f66b4169dcd21ef1d8ec5  snort3-3.11.1.0.tar.gz
+sha256  43000d6b0e0307bc1a735874d00deb61e8b6a96d074f8cc9b2fe2cde0058720b  snort3-3.12.2.0.tar.gz
 
 # Hash for license files:
 sha256  3f1cbfb20bb2c608e1a474421880d08b8cba6abb00ab7736d22c481d71656a6d  COPYING
diff --git a/package/snort3/snort3.mk b/package/snort3/snort3.mk
index 273aa56709..a6f296a062 100644
--- a/package/snort3/snort3.mk
+++ b/package/snort3/snort3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNORT3_VERSION = 3.11.1.0
+SNORT3_VERSION = 3.12.2.0
 SNORT3_SITE = $(call github,snort3,snort3,$(SNORT3_VERSION))
 SNORT3_LICENSE = GPL-2.0
 SNORT3_LICENSE_FILES = COPYING LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
