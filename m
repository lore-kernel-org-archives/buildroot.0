Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF4BC982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BD7960E43;
	Fri, 18 Sep 2026 18:50:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gntUy_Nvqb2w; Fri, 18 Sep 2026 18:50:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 957C660E3C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757443;
	b=fEQGzGf4D01J9VbjaojLgC5Cxbj5eLrivbVCnulqfYS1lq6fCYqj2LcLoZ+VbMwEUnH4
	 u8bxuTiv+8HNqPR5sRvGLAxKdk0X9HFvraoguCvxnEoIIOmM3mktPk0Mxw3csGDRg10ue
	 pGG4/uC82tsbtz3GJ1l9CyOZxX51nwmNYUKBkfmYOhYQnsNC47MCfPgqr8E7xJ4a3RFw0
	 Bt52zAczs95OpeVRxNhmBIOpZp0qVBMq3Kh3CcXEAZAApboZrJFeIjnfeiug7nErZcnaL
	 v/iYc8E0v+1aV0i+VHeASsKi00VwPTrgyap92/fwwJiE4kL29HC6d085DcB4vdfubLA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757443;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0VbkXkk1xpEOQhMO+zVipGweQU7rpa5j5oBRNvrA59g=;
	b=Fo/hGjAPIrqyjL0oTlOy0Msk/h1Kdee55pMaQ4/SrFZCKiTcKwFYXD7iOuYRKVxmMXtm
	 aFcgQRzPaRtjQlJEX9eAOUO9JzEiDFzSy+TGbL5ceUnpIsq8GQyeJJdNdUDYDMGsxzQYl
	 91slr+eXt9o9U0z5yjSqPZVgzZEb+3RWUiti/Fela1/ZcwuVMnPNmpPmCZ3oGBw+xAwB+
	 hbQhwiLA5bQ1JfQsctkzYK2rd6HgonOrzZz29LaC94rFhDBAtFn5+48LJ77+MmK1N1W9e
	 /7oxkJXxl15gOzIVd/o1fs7/YJRSShoZayNlHNLkRk5n9XQy5iuBnRzHnCIb30fwNag==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757443;
	bh=0VbkXkk1xpEOQhMO+zVipGweQU7rpa5j5oBRNvrA59g=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rFqgnjQlA1z3RqklgyJOULv5VfH2qUJH8S9H5n5pGLyWWdJEJww+muN9Ood9m2IAW
	 UE5Nzqi1ecvb98W06GcrkdXYylvlJMIhd2rg9VCDy6rNLnwREwYqqPMV9GSomLFVFt
	 FS5QaVguhl2SIRIFzmsekAwCjbKqPlD8MH59qQ1rO2JJTkwLVaIIPciykz+lJNPM1l
	 89mXINECwtx3HMiImV2sTUXkXh4YeLtSk66ATNvEt3Y63XQOtr1s00pUntZ/zEXfbg
	 iBHVPY20+r6aM00FNEJrcvZtjVItxNMTOG3njRW+I4qx99k6YIYPqyLQgRuhgGzgrk
	 /yjGIvQEkJahQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 957C660E3C;
	Fri, 18 Sep 2026 18:50:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 31B2C3B9
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1828640CC9
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:50:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 61m_mttsHwQ8 for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:50:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 446DF40CBF
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757441;
 b=BYZUc0INs4UjYL4dmIkXeVehWBbEPz9/TwnsTbtClW2StLFDz6lwGhHjOUAGCYgdVyMP
 DiwP6k66cZdS4A858Nl+ITKuRNUy7mT+0G4IsUkTzfMy0gi9HfSvESBjOda+DJ4+xOmHx
 9K70vkFY3dWYJKJlBPFlt3frT/CjGP4ndKRSrm7A3aCP0JDfnETBPFnDGsBPCD1PGcunb
 Me7QSP1rIgbTb89jCenbSHpz41BwuxWZjgGfwW6jbrKDma9ZD1AlYl8H20QITSFfR0+wQ
 35kD8qRtXeOgMA9DIU+j/d6GPqr+3uff+SIJXiRYUadC9IobpX0ABPeljh67cfpMW9w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757441;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=uKC7KxSy17C813qamL3f705ZVvnyKQr8JXL0DuQ+7mI=;
 b=Ga/FLnxyFLPGDQDNP1lFGttUca8JsJNiyt4Tq6u3vNyLYEXqNO69tiyJbCuCaCtD+Tq/
 1l1MAeP9UqY9Qml2pH2OxA7swVuDsmnqueCVC7n77d1Jbs1nXgMflxJQPRRwW5Y4N0Fy1
 3OhWwSC+HlQO3NKqdlrnXvA9/rBepBffRfQAqoRVoTULGvrr6WR21+HOwCfNFy3mlRT+5
 PXMOORQ+yg6NsISE5pGN4PiJcnAkd0gQkhZrkIziNArgIHLfj6yRjL+nk1uId4rlwnpBh
 cKmGq7/EsRc2nQWP2zMCktOYKdMWZPBzzXXgItuHxkA/JjUO5Jn5HwRj4sYt++CH36Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Hh1y6VL7; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Hh1y6VL7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 446DF40CBF
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756935;
 bh=uKC7KxSy17C813qamL3f705ZVvnyKQr8JXL0DuQ+7mI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Hh1y6VL7KmjLDldWh2kM1Clf5cY6ryCBwE2Enpiot5bf5gtfQhqzC9F/Yt7IR9N4/
 z0qWb2PRHvdSyAv5xmtC1QGj7in/SHXcJccuve0vNyvdMtGGzuMm/R+cphUm0KT8RF
 UO8ED2pls46J8ZHChaa8TvjYvn72wIrEwetqf5QgOmavaLO0RHkYlz3sX7KH7IxxGJ
 jnhQXNayXZK9EYK5VOa/+73KiajFVdj+qsmTSfS5VEyxWXqtszlPrCHf0Umva8Vame
 gb5G+vTxuGj58zEjsv1jrl86G34V8F3cY7mCFzTP5wikF6M2lw58WTP3TBuV7fuhD1
 XVCIi7c+n53bQ==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:1he2TcSKj0LiGBMWXduSMQuf1OUdIZ3B9aULXazhl47O7bc1D6owdA+kfTqKHygSZ09Bf1yZ8DJ9nj2HxnW9zawSvb9dQLuDz/KjS8ZZqsFdXHF5Smr0VmAZx+06xahtxK/gaWJ3tExGNtDFW4QlYoY0CJpWHCdV2Fb6K1hk+oxuOMce5UcaIpLmbQy8QGkbt2v6AaPwuMjMu9mcZnurFYae6GIadOCFf3UlQ7n4wSkscJQNIL5NpdQlgOiGrGL9WQRGSZ/e8IgxJlhcC+VBqB1mWEqfL/UHGwJdfhYwBoG3PhlTe3XDZzrsaLDZdKtxYVPWX8OMeqvzbEIK8/sAjLIRvZ5BlUZcHSNOyKsfx6jbrYbw35KJzDUIZ889Vu9geb2YuxXJ9qXnN5OiPGzJ62QxVA7xnkevFSLybbnJvRLuf+hz+Dao1lh0dKc12D9Fc3cSiBtvu/ihuXDmEX4O41fViRS4xxIv0oDepdXSiWIp5j/XyHlVmLnxBNlQ90Oxe24pMV6MsXHb4MgJtxxbxkN1rGsrZRcYEgLwWE3qsGVJMAhO0PAG/DjI+lz1XfNj7Wyu2wBGznZIqHwF6njEsv1tC90sCiO6YJvYDGz3NXYpdb
 6YT98sfOPTZjskybZ+LOyAb+052EsMjCsmG/w6P7i0ZqjYOVYba5UlCHTPL6nd8EE4BUNOcYinao8hEcQyZ6ogVunEOv1G5dwhCrLI5j/Q8YKiXfuI
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 13C0BA4C472A;
 Fri, 18 Sep 2026 20:42:15 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dWu-000000007cB-3b4h;
 Fri, 18 Sep 2026 18:41:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:40:53 +0200
Message-ID: <20260918184140.3631274-32-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH 31/77] package/libp11: bump version to 0.4.20
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
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
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
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
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
