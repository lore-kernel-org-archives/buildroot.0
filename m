Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71051C982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3887E60E7E;
	Fri, 18 Sep 2026 18:53:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1I8SWfmH1A8a; Fri, 18 Sep 2026 18:53:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5714B60E85
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757634;
	b=JUMtmS8AnR/aIIvXN1s689FTp7Zp8oP78hf/yOkG1yxFrlcizp/kGdeIduU6FQ+j34wu
	 0yqYjBsRRICZJxyI5k45ipcLa4ANBHtT06oWOMu5Nmb6m/u2AeFgQv2j8l2FJZfJmTcxc
	 5lJ8daxsw/gKtja99gRhwJCUtPWv7SxdikjNjzB6P7bX2QvU2ShDAlEXo9WP2i2nC2ajN
	 yERgvQ/YihMuGmNBgtLDGgIww9OseJ/YZJAE3WmHYHAjgSdktgTMzb+AUxx80KNCzGb1Q
	 Ak//c/gcuvPnCLXESnYV7gZfpF9wicgJ3w7WSIaAws1he3TS3TwtbBR9HYXJ3Rcactg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757634;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=CoKHt1SZEX9LCuTA4d+WI9H8Uc8vErfaVcWjqzjXnv0=;
	b=J68kf2zc1borz+OBTI9hA4wRKDmpPHwe0WQMs7EUUiUDuak/00MAnfg8tWcYHSvyQ5kJ
	 HENjVM4QopE6Ccs6swpPYJSLgFaMAlOch8Yfnd++5Md4mTxsUqgcgR6OQ/xour4v6TxBG
	 5XCqLjU/a2gvCk/enFSSfwOgHQmKtRia7i/S2I/G+lSTAeFJn9PI64KMUqYxnKLrl0bsS
	 nCdC1i+2Gs+5k8h4YZlqYe6XgZaQ67MhBVX5fRHciR0UIRkH0bk2QIm2DBumYYvtKwcK4
	 p/ND8E2yZVctbW26PMDH5pTt+qmozLCeuzsRm1GsKydqsYy1EDxLeQWKnEWdKLjipqg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757634;
	bh=CoKHt1SZEX9LCuTA4d+WI9H8Uc8vErfaVcWjqzjXnv0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=UVewEJXWmpAWKa5AZbNak+t1WcoefQ68q9cM32LObXfdg3lT75xmK1kctF+RHkVKj
	 +kB4++ENmZobIvSFprIRe/Y+DId0pcGeOF9ovTYflOVZxcCj+gm2fhUVSK4pPggIWf
	 75IuugR/CaUsJkCVNfVaxtA9aYBTGLVd3l2IKbgZNByWtE4z6sIgX2ybjikeWr0dcA
	 j3C+VZshC/S2xu5P2vyTV0YkLLeLKdDNWFW7f0FmE939QFLy2anT5W9nw4mGX61geK
	 0VYcKgenw9+Rrq5dJr1ag7bG6F2cXsglEU9HYTEblNpiYSV3HTIdHlo+MPiAk2beci
	 RH91QIK9uxLdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5714B60E85;
	Fri, 18 Sep 2026 18:53:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 106DA237
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA5D5812F4
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:53:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id moPR_gzRgisr for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:53:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B98498124F
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757632;
 b=a+YSkN+yUbi8WIXHIthYZJR9TevB0C8s4oPG8S8dvHLrEUQ246DSNy7pa+i5BMM66U6r
 69+hMpiNAXgbdAfoPYJSQLa/+DXw4zyeLuiUY4lF/YQCMluL6hOunkDxxNqLE1MFhHyYn
 VHzOZM7xSbjpooscSFL6uL/JwUYcNwZttK6USpXrfHQDGrvQbUAozAoBvw83MOg166mjR
 NUQhCUNQkKRPac8dOBXz47oh+XdmuXEhU7XVtjzthlaqaUmQf9jpKchPFz6Y8jZq2dNgn
 5MIIaSlbFmCCI9pjEs+b6hhljC9w3yX5fxtda0Hrz9ityUYI6WF5jsWb1HGaLXjMrrQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757632;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=LHOJTIGlY+j1RG0jlzs/vsKcOKV9OP98XT1khlQkS30=;
 b=qGwbVG+pIZii7kFk7M1k/k5wedDHhJH5OBZqwb+ETecf0PjwV1MB5qkatYM+tEg3b1xV
 qG5CFLDMoBhLcYQEIbY8rT1UULFJl6bFM9xl7XM3GlQRVlUsNSLLmVm0RwT/2ot9Te0K4
 CEA2bR1fnj7PkvUdT0y6Yv6HyKQm8sjv9gAcCvY0Fy5ZTZwg3tYh5btF7sADyzZyygvw4
 GgznFe3AOv7/tZIqQqlO/w46srwamHMtG4PS8o8bMg9/lqLIW9FC+bN6GOGnSrMe9UnnY
 uhkmX9iTbogjLlNHVWk85fNg4NoIfRn5noFZYAlUdLU6s7ASeWFuCDUHVu1CHah0onw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=nEv43zS+; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=nEv43zS+
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B98498124F
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756938;
 bh=LHOJTIGlY+j1RG0jlzs/vsKcOKV9OP98XT1khlQkS30=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=nEv43zS+F2Npdxjo2X2aCeCMgS3dAkvLtTfhdu/9eYCrN4VI64Ifs0PNiQrLq7E4L
 9yrBiPN1F7kpyuIjPXCNCCzJKe52t+CV071lO7mrERAWcWbd/wi2zy+EwKMdZ3snOU
 I7fqnJFenXeTofDq6GBfRNB0PcmGzXewdyaRIIFMnDtFfhJlqNQ7vRu+tVMurUdHyG
 G/9cNPYHDTMQBgQPaANmL0321SpXGZA6rDWi759f8W+p08Lh/fSRN6zS2q5LySHD9/
 f1UKXg968PISbXqxDXuuCWzuYliJDpMybDMEBdpW0CcbDSINzZ+/ZlwwS+1NipvUYu
 H77cZuwYdzRFw==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:GP2r1EOLYTqe1WjXTkoY8TfNmuq2/Tc3Q6i3+qR5SylL/w2BMuBIrFOsRhkjg3Ysl5jxujhZX/8/v+VFgM50E7gp+rKcsZM7aoI3AH7NKDYZE7CWpHKOIdn2/AjJ+vjj+gq1bvp1ed29hjdnoNrS0aiFwxBi3wmfGadXnkkZ5jjpAne2Op3O/8OOSmXXKq+BKkDiSmHRN86zMLHz0iYgRB4Sc6wW0HWAaIDwneA8vlz8sVUXyibkIlb8FBmiwaGTW1aUk0B2jpE8kmLPyzhy5015OrBJ9db0Clv6/rtOFjlM4i4L8NaqXUMg6AbrVJuRc+YOVv98hKJx1VbJMq8MUlWxnvFn2w70N3Z9j3QFBHywUGhI2szWtidQqWbrgDBAZV8OWk9Gnm4SlDPWj8Cutr+/z3IsMefs4CKcQ13csG1d9zzhwQgeRWfo1X3pqRmNYlTtFzr++vN2XTXpMSdSrczPVyNRGfdFC2saVaP+jlJanH6IpsOOoVVzboCngB7F0lU0AKUI5Rkgw3llCjxpYUtLu619J64c9SZV8vn2S44kfdOgQ39NnLJHCzynmEdJv75+tikfqwXVTRLoRNP0mTZFxDzLlRoD2DpfEO6/ahfpBp
 XlSUxhyyWIi0glXm7ch49YrFiKqYNEmdjn1IHBSuTof9AstsDvC4f5bQBMmGHR/8E=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CF51FA4C4737;
 Fri, 18 Sep 2026 20:42:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dWv-000000007cB-3CoD;
 Fri, 18 Sep 2026 18:41:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:41:01 +0200
Message-ID: <20260918184140.3631274-40-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH 39/77] package/freeswitch: Add support for
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
