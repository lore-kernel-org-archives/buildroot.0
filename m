Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413E9C982D7
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 158A360BE2;
	Sat, 19 Sep 2026 16:13:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4dkUR3kbogzP; Sat, 19 Sep 2026 16:13:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 20C54606EA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789834387;
	b=rcfnEJHn1n9k+Skge9fWjjYLSt4UFeTvSXKwQ8rQqM3BHhFWkIAZi+6zKN+tBDxP6V88
	 o/3z7NCLqhxbVAKxiEd+7fWgryH+pxGv4P9TEb/902c/GQfrfVv6TOYduowSgbve7G/55
	 7Q8/WQRRovnCqfMgVVVl+Tx4Ii/WeGp5QIDPYPfjIbcwYbWcg8BmTvfYFRZzJlMu9LrNp
	 XTAuZS0DKGRQZLC9f/l5z+OuUKS561CBFEYJ6+dI1hXI6uOJoKc96RmVBnCGmM1VpGA1Q
	 VSvhBzOm5pKH17mWi3Yzqmq96dgYJc1a3CWl0gZwSdKSTVwTPkPLhvGkOU+WDpL7ywQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789834387;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+ad4XvIk8KRN3crymuuUiV/3f/jcXmWAX8WkfdtfKG0=;
	b=nYdVgx6xMyUyEfFgWdvpplYkXnFEn0NtLOkUqeJxOgwBgXjlz9Zi81jGJDrtV1ZuH0Pw
	 5pZPZnS1bGxwsLF8tRTKmE/1+x/n86sSfjRlRxyfQvDOHTJpS0Yfd6MZDZiMKa8yPWIcD
	 sGze/AYgNs/JUTpC6t9mThrKA0/W+hpqiip+fRCwtav9kVpb1OjpFwvl4wrLtSCA2PXqy
	 LuoMl9AmgOEShYsT0QIWXtcZodMgqcT6BzIqMRpG3vCREsqb1F88fHOMXQbOxaAo++mjC
	 fgQ/HiXm8IiiOLq8LDhAwJCubxOwTqoAbfjn52AKoGu49pYOknDFJOwYhEyTvNJcdYg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=rfBtRYex;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789834387;
	bh=+ad4XvIk8KRN3crymuuUiV/3f/jcXmWAX8WkfdtfKG0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=o9Dgmg6uPlBUnSnni/BKF3F3RJllrzkcyy3Jl6VJba6MPYqRucGl8uZ3dj0Ac2LKZ
	 hjkTbDUlmmN8q8vcB3hj2TMYE4xp4mWxIz8Nr0DIaHAi5VxDEIjEsxLshn2wY+Y1HR
	 Twmvs18TWyYueaCN/y90mYVX/liUSFmOBklXmPF5Q/VItGfqP8Ub/btT1K1EzHBjfE
	 bgumvxZE/InYyavPWGR5ds1qrSh9GFIokx884EAt+b0lwljMYsdb8+xqGQOWO4y6a6
	 PmH7fFOBpS+1tyO76TLjRtsmaDH0P5gxbyQoiANysUFaf3r7woB/q12sVEwX+2a9Ed
	 fW12gMSLSyc+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20C54606EA;
	Sat, 19 Sep 2026 16:13:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FB6324D
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24483606EA
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:13:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lMm3z1K7UyFz for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:13:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 32993606CC
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789834384;
 b=jOPCMdNR+Gmhcn9nbSK4IswZWA9zcQIhdZcKJbA1ur2zI6ydIgQInCZA3FHaJzONhCSC
 4in18SZ2IDU/Nk9wIyAofoDBFluHuwsralWHjFDoplg+XRjSEuWFo2Fw/E3Lr0s5jneCu
 0W90k3VgxLs/2BtPR5O3sS8yQokQhRa1EkSXrrSFKCn8eF1uRBe91YGTdjvzE3/sdKL78
 yUvpVKxR/Crb1UG1FkqJNvGgj1iBdmKcByfGNoFteXs3v9dhscUxvYlmp9AfuK+vKLQoZ
 C4hPwkQMRJwjdfOcGI5UVwxexMq0mn/zXW6BzOz4tP5LcxuuzkKELi3WIamdmNNSlvQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789834384;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=5gDvCJ+UXhkxW77CQFBghKeHwlvChzvv2/WWLjOyl5E=;
 b=AtmXe3TA/afhjMChAjIgVCuzkXlO3FhLNp8Mbc6J6buI3umhjiH5Lb3DUAvK/JuaSV1c
 qvjH6nN8ohkgk/sUwuQXPCCaZChxSlg7aLDTXu1RWlczuMmSeMlAKg3o8gy2AA02DkDiz
 5L1NHnqcsIgSwNdOfk+7A6Q7e8CAhRVGb+c1lieY5QOsz3h9vlIFrxvWTOkWvcAQCQsB6
 +VUEhfdWzl2GP/6zsWwjEv+ffKAgkeJHqejkWNckxG0/TiV2qtvlVXpGilT8lJiqZWkkc
 OQcSjKoClyot9J5BKpPgb2/iDBZiC1BVC7MMCc7FQxHRYw98IkHkXtpKLfbjTIfTQJw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=rfBtRYex; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=rfBtRYex
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 32993606CC
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833556;
 bh=5gDvCJ+UXhkxW77CQFBghKeHwlvChzvv2/WWLjOyl5E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=rfBtRYexo3aIvWkT32kF2RYIgCE6MUa+4+eKBTAKUWymNYYL+uZamLFNSiCbbryi7
 zL4OYrXTddK3JdBfC9oyqARi8/oHay2sCJpw6dQquu+UqKOOxGwiL6tTTJl8TeVDa3
 mpwPj0PAndJ+bdBW5koEOtTfA333VVHO5G55RNuw2yoBkIzAkc44K8h/njmnQyLHpC
 3klauXUppSOyOWLXGjchnn9Oq6YMiGyRBJe9WI3Wg74qDZsvj3W1vEgsmI14G3/nws
 OYR5g8JTdZy69qTE/RNgC2xsjoH9/XJJhg+57z90LQ7dBTQGcLAOrFnAcR9N02XDpL
 77N78UNF7549Q==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:FsyjCgyysidI0kPtb/CpwGKTcU5QntSnCTR/AINzQy+hA1B6IkxoGz0Y2/LxugvdK/yI3FnyoI++8QFKJN1Txij3MS4RuhhwO37udSGEBtA2Qnv4925GxFOgxtG9E0aP7PmfsuoXRGGhwnfnb/VCckf9H3E2HzhBJu3WBRYEecHj3A/oKNaft4llSL3fqWFykrOg6UtkDILJhoreswgvhBo2+5FT9vTtlBcIl+6XMczz45YaBg0c0DNz+RbCC8qn+Hja3f90kXWA9LYxSy2yyYOiN4fIa0ktsfB49fPkxM8JySPfm1mQfMyykKYkz65sFW56VxWJb6L0zkl6evbQxoot77or5w5I0boFoXOwSvdKxqLPavGiDhQcvIetPmNQW6LmVND91zfnL8zxJYGNSTWJdiVjxj/HX/khyDKOQ9bkPprOk/VqSrE61VvIi6eJI59tdVwJSsBv0VDcuDjxQIoSpLPKMJ9QW2OOqAvOoG6axWaujJzOwNLOM55QC5h5lxzRScjDnCmj54T55FkeFene3FgTtyM3Cs2lXTmKoUE00055hfs1XQUhCFYCU/aJ3ozlF1Ah6S6cZAipUxfJAeDP3MMRaNIbDtGWbM2F10YKjp
 JvBGLORjN4YbbmmVPL9B1hx7aL6WavEXUKwS4ML7kLcvH8fURHWA/VvD1aIuaD0AU3mU/t
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B63FDA4C4856;
 Sat, 19 Sep 2026 17:59:16 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSv-000000005Jx-1WHy;
 Sat, 19 Sep 2026 15:59:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:58:27 +0200
Message-ID: <20260919155845.5776-63-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v2 62/77] package/redis: Fix build with OpenSSL
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

tls.c:676:5: error: 'X509_NAME_get_text_by_NID' is deprecated: Since OpenSSL 4.0 [-Werror=deprecated-declarations]
  676 |     int len = X509_NAME_get_text_by_NID(subject, nid, buf, sizeof(buf));
      |     ^~~
In file included from ../../../per-package/redis/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/openssl/ssl.h:34,
                 from tls.c:22:
../../../per-package/redis/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/openssl/x509.h:1041:27: note: declared here
 1041 | OSSL_DEPRECATEDIN_4_0 int X509_NAME_get_text_by_NID(const X509_NAME *name,
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors

Upstream PR exists to fix the build problem:
https://github.com/redis/redis/pull/15227

Added buildroot-specific patch to remove -Werror=deprecated-declarations
from CFLAGS to not block the bump of OpenSSL to 4.0.2.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...emove-Werror-deprecated-declarations.patch | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/redis/0004-Remove-Werror-deprecated-declarations.patch

diff --git a/package/redis/0004-Remove-Werror-deprecated-declarations.patch b/package/redis/0004-Remove-Werror-deprecated-declarations.patch
new file mode 100644
index 0000000000..3c33456d52
--- /dev/null
+++ b/package/redis/0004-Remove-Werror-deprecated-declarations.patch
@@ -0,0 +1,28 @@
+From b42c0326b542b0e5d29cbfef2ab08d0d36430803 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Thu, 17 Sep 2026 23:58:19 +0200
+Subject: [PATCH] Remove -Werror=deprecated-declarations
+
+Upstream: not applicable
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 205508596..4f31a3af0 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -52,7 +52,7 @@ ifneq (,$(findstring FreeBSD,$(uname_S)))
+   STD+=-Wno-c11-extensions
+ endif
+ endif
+-WARN=-Wall -W -Wno-missing-field-initializers -Werror=deprecated-declarations -Wstrict-prototypes
++WARN=-Wall -W -Wno-missing-field-initializers -Wstrict-prototypes
+ OPT=$(OPTIMIZATION)
+ 
+ SKIP_VEC_SETS?=no
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
