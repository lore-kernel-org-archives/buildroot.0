Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6805C982D7
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91B8D40BC1;
	Sat, 19 Sep 2026 16:08:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EZ8aKFzMlNMb; Sat, 19 Sep 2026 16:08:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AE21B4078F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789834082;
	b=WPM+hXdY13qbGhGy5ai2hhMVPgOMIcbQa8Ju3vtQU7yrQGWWkxZchlzeJOkEOf/jd+5V
	 fyCcWqjPj3s4xt4luqVt0KMqNDjFfsjvpIjO+y4VOZfVMRVC1oh2hY5ghuhqnHaYRC3zP
	 3uS2tmSDuWAjcZ1cVqz61vzrKs9FMvFgPbxntv85B3rRnw8Av6WQFdJPMLsVcY0mZCKSG
	 2j2v8+tkJI/bKAkZq0KZP7LZRiTMVjPjgjLJx0+IA2dI1F+nK/xCx5haRbLSbcK4ObKUW
	 j4lnC+sj5zYqjayUQBkkp2Y7INiZFIDAcL56aLgydchq2h/nwpHIDHVTVjjcxXC3gaA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789834082;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=N1Ooo2eMWikPMS1dnP0bpJolKTg9wBTi45ZmIQE3gFw=;
	b=YkY6yNvY+nUo5gTj6Epc2PxWoZpQocboiJbqwHShqNW2r0ZciYg3f7SBqe+cRmXZB3G7
	 otU/s+31ZxumtjH3BBkayOgFlmBN4c7cxULBBEfPBk9/wPjFJTwYuYe5V95jTeEFfwc11
	 BgbM71K6L4YHHb+plN8ZqHQL8T2oDHA4OzwUBdHgiVMEPUswjVIiqCgLsIumO9wD4gkwg
	 bArKm9MlzVDSjTInDK6chFAS1etJuY9F+e5i6E/Wr36Lshz2Pa/gWwkpBMKzkHN+ZsNLH
	 QjdOHC0m5Oln5uBctGeXLqDeqmuCFmzCSi/uEDPUWdiR6TLTi3ebIhipoV9t/VjruwQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789834082;
	bh=N1Ooo2eMWikPMS1dnP0bpJolKTg9wBTi45ZmIQE3gFw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=L+6OkDdaEW17Zb3xqeJpd+qKXt3iB2nNXETeakfFuV4Q564T/2YuNUI1WqPzP01Hv
	 VrZms7JpnE4LLFz0PipBKbNlO/Cmih4kyC1Aw2DZ3x38Lhwes0Ga8x/V+xlk6Lq6iK
	 JoE6IuBsUqvVsKqJaa4QmHdc1ulgpN4OkCbFQ0gcLCHciK/lzcgHABlpALM4fXul56
	 nq/mCeB8INzDzrw7VWWmG9VZYC43p4zFpK3p4N9cqf5dD/ukdO7t31YVWdxyA5E2AD
	 VrreyKRmVCDApZzD2aQeV6Ce7NMXHOC8pUd2NV2CVNuu9rJMZ0qqRsGTwp/xAnu619
	 hKDgGuM0EdTRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE21B4078F;
	Sat, 19 Sep 2026 16:08:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DF5E424D
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD1C2808A6
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:08:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6xCM_gbt8KPz for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:08:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EC78580880
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789834080;
 b=svrWb7873tIfnf/rprVrBtNqpC7+KHJ97uppzHLqEOnJR6x4nqLr/k8Qrye3FSPG7aYw
 YCkmcPrmN6Hv6qvw9VXs7JUCNcrh3Kx163InPGRnO5pH6ct6X95D/7NPvnQ+VmrpnhKvF
 5EOurRbjbQrW4aRxAfL5olxMfpryjsX0o/2yV9aYtBPMnI94gJv5WnKpacfiHF0KtRxhn
 0qT1fh9QjpgXgbYNSRI7c/kKs1TbWqlqC4CQvXP1kONBguX8Ue5yGj9zzqzxoX5g5HoQx
 JkmvpES0rZ8if4karhZNxMnoHbs2S4+53Lt+Scc7H9MavcH9KOOM+WUOMajottbL7vQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789834080;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=fYOWmFJrVr4kJoUPLuonOunRH2BcKGJxc9WTvhOShkU=;
 b=Yh4Seyj+FgCukmybNuIUyewDl8AI61116Lzuk9VxUShU2QUGYoM8SDwh6O5BzRYAbGA7
 Go83U7f6Nc3FMC4O12iMnlx//W9KBTKaJe8+zGxCHMNvzDYiVAQJvcD+g9nwXPqvXQ+7R
 TyoKz4K5F2YMHIwexaJcQ5QdOYm5khPOIhIzXDJDQDr5uzvStzH9n64qt7AViYBToW5gM
 gXf2iBun96Be969xKTzHiamTb2qdcYSSVKU4V3+cBCNTBTMwAqdeqnpFG8lCpiZoV3qIv
 kC+gKaS6Jv7o6ATwjdvNYftF0xOrTPoWsww45paOtOTiEJHcA5irTuSBRcoQJgHSbyg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=BR0bwQuR; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=BR0bwQuR
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC78580880
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833550;
 bh=fYOWmFJrVr4kJoUPLuonOunRH2BcKGJxc9WTvhOShkU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=BR0bwQuR/2piz2VXCQ1pUqEZ+zXPKyPhSvi2YChuF7VGSU3SEofYC+ulM8M2o6Jyr
 0PLwZexEkMeOYSx5Qr9K6eJV8OVET7UXEwBCsNtleyVS8Iwf21by6FhAQDV9ucHFmh
 +tKrQeRRI745dLm0/ELkDM9TDYidt6QDdjaFPQ5XnPcQfMtLLayXgWcxNull1UGYz1
 91LbNXrLAlxGl/Nm2aSo/ztkstNlWx7aUXXTaIpTg6dMwrJaiIOjY5AeQk9mi1xRS0
 7uNlQHdgaL2e1ljFp03CiShRD7GQBp/wMQtIO7bm9LDHCCAnmIF1khvdmJzLgf2AN2
 wS9GrJxySG7rQ==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:6sLhdTXlB8RGMcN1FmhyGuSEirjZnHQtexOYSP06J8r1lonUEmVKPDoavvyVJgPexkqWTjmFbrBGlEOareEdvJZTlltZuacDpk4e8kTmwT8L0zyb0Wg1z5O419VkExisqCPFLi2N/AUH9/eRXiBtFSjtQYoLXvnlvJyRQXEjQxSc7iCDzfeke7VuUzhd8yJxOT1pL2uaY0m/e5l9+u1hWs9kRORxjYc9c5WKi5m2tYvnHv880qHKYplfYqVaeDlrJJZ2p/aoY1v7bffJpCdi1ZQJ/fpw86DSLPt4bxhvUF549JrEciAI1Y4Ydrm2JfMZ9FqXiAZczhH9D8TEnoEcVtvsI54pT6LaJKhEekQ1lNdWpZ188aH2J75pX0SrxB5nMwMrWp8o6HPuJlkP+ChZH4z1eyJV7vHCVKmDfTeo4KhW122yhp6FN49xTc4RUyXk9MnuYZSp4UZtVIBaBUa0olfcby5CwIrYnOWGVIRCxlyk9nvAOdP9jLu/z9az+uwSCA/XDlYBvcc2/Eh8xhyO66euwGfIOyfagyjR20EHfuHEg6oDAG4OtughEk9rFUIsk6cOIU1jf0+ZuXsNy6FUvwJNUm8KbxgACosL9IPOFDFLuA
 VVIx2VcI40hkOx2E8L2mkJLNbmEVJxcDTlh/M89F8RqZ3UUBC9vEIki7YzmFOLaxSG7U50
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A596AA4C47CD;
 Sat, 19 Sep 2026 17:59:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSq-000000005Jx-2Pr1;
 Sat, 19 Sep 2026 15:58:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:58:07 +0200
Message-ID: <20260919155845.5776-43-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v2 42/77] package/ibm-sw-tpm2: Fix build with
 OpenSSL 4.{0, 1}
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
 .../0002-tpm-Update-to-OpenSSL-4.1.patch      | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/ibm-sw-tpm2/0002-tpm-Update-to-OpenSSL-4.1.patch

diff --git a/package/ibm-sw-tpm2/0002-tpm-Update-to-OpenSSL-4.1.patch b/package/ibm-sw-tpm2/0002-tpm-Update-to-OpenSSL-4.1.patch
new file mode 100644
index 0000000000..3b4e3d815e
--- /dev/null
+++ b/package/ibm-sw-tpm2/0002-tpm-Update-to-OpenSSL-4.1.patch
@@ -0,0 +1,28 @@
+From 66921ee5ba05ffb92700b00f17cf1e8b75522aee Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 13 Sep 2026 11:11:24 +0200
+Subject: [PATCH] tpm: Update to OpenSSL 4.1
+
+Upstream: https://github.com/kgoldman/ibmswtpm2/pull/24
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/BnToOsslMath.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/BnToOsslMath.h b/src/BnToOsslMath.h
+index 731957e..345d29f 100644
+--- a/src/BnToOsslMath.h
++++ b/src/BnToOsslMath.h
+@@ -77,7 +77,7 @@
+ #include <openssl/ec.h>
+ #include <openssl/bn.h>
+ 
+-#if OPENSSL_VERSION_NUMBER >= 0x30600ff0L
++#if OPENSSL_VERSION_NUMBER >= 0x40100ff0L
+ // Check the bignum_st definition against the one below and either update the
+ // version check or provide the new definition for this version.
+ #  error Untested OpenSSL version
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
