Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A554C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66EB440F45;
	Sun, 20 Sep 2026 17:16:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EHITO1LDSVVO; Sun, 20 Sep 2026 17:16:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7BD2140E37
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924566;
	b=WPY5Bk/S3UeN0a4vS+ZMTPLAhB0aSYft5+vWeBEwf+014splo+nKYopIbHW84qbeu3YP
	 P/P2pAMtH74anCvws7uvrujroesUKhxY3aL4zyFych4ZPqBKxlZyfWruh/F7bzKZPHZNT
	 ILoZAM2PeYscc+beIRmwsJ8mlvV/B7xEP0U1/AfPKUVkhMmhTWeUDy0V/ac7zaoNbSabF
	 EOecftC9f3rH5K3aixs1I0qvDZgRLvyKJL+aMrIea4eiQLMbxw64y3Z0zzvKkzb4PAg7k
	 X8/QMa5HxqKhenLuNVxNGpTKGaR7vaIYfgHjsa+TvwwFjZbKS2kCz7O+ClYW2VWu0JQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924566;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=QsIOSNeeF6eNUk1SzxTi6cVVk6a01ZOuu9ouF6/ioW8=;
	b=bpbUeYEKBUkB5Gx7KGzOdM1wdx6FivcJiUbyVD2Oi3P4RCC4iXcvwVkDfxH/AGx7zjYn
	 LEpq2a0B+6MI8HU/7MIk8YDdawy//xgaGn/SPwX3fr5hh6kLH2sxMSqQnWTzdFea9eGoE
	 rlSc1LGZT7EAOkJoqYQKKA5sFsiCOXj/Sy171CdrWMeaajdw3vKGPNlcVWDE1J4xwmHzS
	 ggh4h9zAfJEym7OkaAUPEZjzE+6P2svyEevju9jLstyaUWGewpJOzGqzV3IHuyGRaNr/S
	 eHvyUM1MV1OplPUQkwWcig0qlagK3g021aF4bg2KipAA6SdjlShNHGt3d9SLw577AVw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924566;
	bh=QsIOSNeeF6eNUk1SzxTi6cVVk6a01ZOuu9ouF6/ioW8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rEsL69WOkF9a98n/nAEMMCwvhu8amoHagfu9ML//QEmKCYYUJ6LbnXTgJB3azoK+I
	 nlbz/mg6tp/GlCqRavi6de+EIs34t7Ag/fXDUcTBYzZWWT3ewB6y6vBBd+dsc+nBj7
	 8cx/+CLEvuIy0FtTrIRUqBCY+HWmGVEdA3Em78CRTiq6TvMZO1qfHAZJCJPWYJWu/j
	 zfFDN6/ox6I2L20LIWA41fumbokkrTkFM8XpGxTU0EUYxhM7z2ZiMTU7yjeqAj6e2L
	 8+m4Xt7kRNhzB/ix+QmCtEgtoizpI9MC1f/iFQ/lhBXkP8n1w/VvxbySxWtgvSvM8p
	 2lckE9xblgHDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BD2140E37;
	Sun, 20 Sep 2026 17:16:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2888E37A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E9F54007E
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:16:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 321RUB2kr5NK for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:16:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 1EE9640022
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924564;
 b=kGahqN+BUlcxorBWpmmnP7ujt3xnXQli0GwStQ1erE7CFVL2pbsPq2aympRSd5uP2Jp5
 8tee9HflTtpg3Ah86tyPlZIYnAVRHI8h2hVobC4f0jpKjUGu2tVJ7dE88g/Lvx3k0MS6A
 z80MVjDK4sKezQsQufWEzH+kHLNoGYzEXgk+xDMKCacxRQIcel6KzbcKm4apu+3D0lEAU
 ezVxUzs1dWC4yO17km7xP6xeIziHkqhcHUwAaa59dwN8evFH17B+7Z3aPP2oid3zgJLbi
 LV844k86kSQPxYDDOX7vV0X19zOZLSUJqaV56ObVrwmgXKp5S26+hpuocZ4abNxol4w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924564;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=eS+ZYrlXorlxC5Msf5x7HU5ym7C392UqGLKTnC7hbes=;
 b=eSZ1JdOjgwGkEijXlqXV5WjnOre676DO9ipYz6o0wEpnH2aWvsFMB/8jYPOCnfIRfp4P
 Ib3vsA0ZhUF/PJnwVjvPkMiUJTeIJKQhHrWQQd2QPQvyMrecrpkQkdR6v29x4EGzMM43A
 2wTAQn2qyUJ3mU3Vk+t1Qq/pFxVYkHTIQ3CF8Z/kQlO09l1Sof4tyfM5HQ4JGgObOtnzK
 g8tPAE/niWSzinuZiTTKr6aaHqs4DF1mOexoMDNgqiHsnFnVdP2DyWgIGhocbPbM5Usoa
 icfvbb+u1n5+LVtn1zSzgvkLytC3pxSblxzfY+hdDG3MnXNcxcTSMkVqNE9leJ9SzQg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=OuajVyAH; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=OuajVyAH
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1EE9640022
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924155;
 bh=eS+ZYrlXorlxC5Msf5x7HU5ym7C392UqGLKTnC7hbes=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=OuajVyAHZVYPRP5W4+rg3/wJ+FZhlyaB7TWhSNUxHE46sAlLXXpLiL96xs9NKc0pL
 g5edRWxhr8BE7mNivlga8nsLwfbkzui0iL3lg2Sx5qmie87XL38Vi/37SnY3AkRkUg
 Ex6lGC4hyJZVo8Exu7PhZEuAuEvMgCRhSv4lgLwEKpfAmkMmHhBshrCRp+OJsmgA2W
 Y4U1SCW/KHy/dkW2YrY2ZYXBj+I/6wxmTw1XOIY8lRBAl1sipZs9XVSUx291Ka4ZT0
 OsuOu6+lb4GfMvYjs03dzAHti9h7z1XUh1i7f1XuWYZ8/WyocG0xJbz7URaDj6xUuh
 +6AW41qOuIyrA==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:40iIY67Zc3m9pQIDb2DKTkBjPCph3Cb+j2EUtCT4qg1Xo4/Oi+tlLAxkPf1xZU1EQlJW0FZAKs9qAYjLo1UIaEOunG4Wa2tmwlFwwFuNaAPa8vzR6EliDxam88CduX4NTNXbSb1vNWABm8RI2h8r7QMx34XaZcyXy6sxSQ+tV3wwdglQI7no6Be2Pg8/rfCwVg22i+npzmzleqD9ByfCkAF5FPBc5I9qJMEQpNBD3sg/QV/ikI7RDmIKUKujYt57fvMEhVXa5DJu6nCbGjA8vKktloLmAtOihjK6uByaA8OGUuMlqCYiRcaqqnTnxwJvM63dsjNR7FZmfhka/0ShKayvKeYfRywkpq9QtewyBHiip9yg/M+D+NyghVxwhIJd5PF/m2Y9B4jEAcZxZwABl04o+NVPzH6zr3IO1lYkBsXfAcryG2k4QFs01Sn5DlgGODLSq4xTrjRsWLhgj70axPIEm4bDjjksYuyXleapZiWN54xt2PRv0r3g+0PMldpxEJBhhQNEWnTsmEvFZRbeA5ML0K1MM/qhIPEa2q+FWHXjBoO3sMmv7oMOEZE+55uzSN+Wyi20RsOvpYhEDdTBXpjrYly2lsXMJLDxE0N9kwDDEN
 Q01xzx3qEO+yxLfc8Xzf/GErLYFaFZyTiuxHUQbaWnzxg9OA35/IzXEbmluK5HzKyjobzxmBY=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2813AA4C4889;
 Sun, 20 Sep 2026 19:09:15 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1a-000000000o7-07I0;
 Sun, 20 Sep 2026 17:08:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:07:32 +0200
Message-ID: <20260920170815.240247-26-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v5 25/67] package/boinc: Fix build with OpenSSL
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
 ...fix-a-build-failure-with-openssl-4.0.patch | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/boinc/0001-Adapt-code-to-fix-a-build-failure-with-openssl-4.0.patch

diff --git a/package/boinc/0001-Adapt-code-to-fix-a-build-failure-with-openssl-4.0.patch b/package/boinc/0001-Adapt-code-to-fix-a-build-failure-with-openssl-4.0.patch
new file mode 100644
index 0000000000..22e2ef65a7
--- /dev/null
+++ b/package/boinc/0001-Adapt-code-to-fix-a-build-failure-with-openssl-4.0.patch
@@ -0,0 +1,26 @@
+From 9cdcef8261be4891b4814c6f728dcee65027e5da Mon Sep 17 00:00:00 2001
+From: Gianfranco Costamagna <locutusofborg@debian.org>
+Date: Wed, 26 Aug 2026 12:27:54 +0200
+Subject: [PATCH] Adapt code to fix a build failure with openssl-4.0
+
+Upstream: https://github.com/BOINC/boinc/commit/9cdcef8261be4891b4814c6f728dcee65027e5da
+
+[Bernd: backported to 8.2.15]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ lib/crypt.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/crypt.cpp b/lib/crypt.cpp
+index 17a9b57b3eb..b54e2f050ad 100644
+--- a/lib/crypt.cpp
++++ b/lib/crypt.cpp
+@@ -774,7 +774,7 @@
+     DATA_BLOCK sig_db;
+     BIO *bio;
+     X509 *cert;
+-    X509_NAME *subj;
++    const X509_NAME *subj;
+ 
+     if (signatures->signatures.size() == 0) {
+         printf("No signatures available for file ('%s').\n", origFile);
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
