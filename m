Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B32C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36F3F4100F;
	Sun, 20 Sep 2026 17:21:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6RI8XY8fl7a8; Sun, 20 Sep 2026 17:21:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 40FF140FDE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924898;
	b=Djfm1Vz8W2qZLVHQs7sAEHAbCh80dUqkGhAj6QT3GrqOc/QcEpsolS0p4p7BNfjBlw/t
	 uM92zjZYEEgA84esGRog3dzJfwUWRKwqGpcUtxTV66gmAAa6yHu0MMHfWdgo9F0jweLUu
	 idCeTvvxZboKrauBDMIDy3DvnI6TZbOR0iL8KijqP8mtWswxNbxR4ANvNt1oJ6VlLzxEq
	 SDX28Ywvf1D4AbNgqRa6BxDRHRByHYakhzGRbOX0vNMiEOO19q4O00i6ZEXW6oKqkoV5V
	 8CBiZRNWIBDvqfRNWtNfSWTq31gr26VAPRcog1XPtM8BTCP1Smk4kQ/JEAdmmRbxoeg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924898;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+ad4XvIk8KRN3crymuuUiV/3f/jcXmWAX8WkfdtfKG0=;
	b=DQNaL0+diEUTgiBB6JTJQmCeDlU4gB6HX0s5yMYyGhWChiJ5Th1vFqHSndGN0lfFqjjD
	 koqcInxPLrRp8e1dPqh9sPBoJdNQL/Hww4NblTxnPrvy1bhcjslY6vm+9h9NH5x2pZFwI
	 54ECShTF6UyBs51+fuC+RxoZ7c9O8DF5qR50+/2qzx/wA9gLyu/JWeQvIZubrKONQf+ek
	 J7YONidrjplnCLr080jncfSHRWI93ysvZp5uwXsR8oLsAtz7HE0koX4XtaiBPlGdqlfft
	 mRH9jyVLUVXiIz2aq3NN417zn2VYqvqFm+KL/UtK7z8ROjzqFnRnBHdqwQ08nAoTEwA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=tA0YuMTL;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924898;
	bh=+ad4XvIk8KRN3crymuuUiV/3f/jcXmWAX8WkfdtfKG0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=TpybM3uv4n81dod5zZC0aoOJ+FcZNzyKqhpU2CI0UceDeQJEA0zToY70kUbjHKVEx
	 LWcfsyaNxAvsmBLkuwNpxJidz2jGjrx1MLgJyWtMOGkzpN2FUIyYNOyu+RmgRmhodx
	 REAa27WwBD19DfW9gKVJj4IsaP3R+4BvziTwpvyldsRU/nYphlWBtCKDb30o62GeQc
	 bnoWXTeJXjiJjX3iKpjrlIPtye0m5qOXmVchSmppFZf+LX2LbtsPF0z0x6KRXUvt59
	 J00SuTU0S3my+WTVMFKjN6EAvNL15dHXzi4f0YU3vGFlPvC3io0Hn7nxDTdK35XK25
	 7V3Oo7mF2Driw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40FF140FDE;
	Sun, 20 Sep 2026 17:21:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E5A7025B
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:21:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CBB8A40FE7
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:21:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wtH9NqA6jvtf for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:21:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DA07840D90
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924896;
 b=Q1/eDQoMKxKlHFhNFKqcAT6gS+f7DaTG3DbTTJnVX0QT7Y3UXNJNCp9IIw3faPoM1j91
 qttkRpKfkUYKhoBVCa4JkelcT0+wIqdUEIib1m6lJZmeSKvLw/XGSh1XdPB3ACIXMaVsB
 kDZh+WuQ8/Pc6VEuC6ESpDxRH9dzaoHi/xApK0566vyyEUDd+v5RlJr5srwpZxK0ht1fZ
 hucXu4o6zMLJiDMBCFZTGxZlD9IJcFNgaeXRzjGppFuDceH2nr8+Vn0o1M5WZw7kNzt7G
 evLpQ+Y+Q4DwzoVc102CnVwe6bUcfSmvHBALH1ZEywhNMCuO8k2XU1v4MxNhq+jjl0g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924896;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=5gDvCJ+UXhkxW77CQFBghKeHwlvChzvv2/WWLjOyl5E=;
 b=jUts7mX5TWMvZRdeV1gxOyxDBQRPy529jRLghSmnMxs7xkJ0VDhEaxrZ8F/h6rVuEiaY
 znYUztxr+M+GT10yjRUixrmD4nqfoVcBxNP9V7vGXTv3yzG7xroyi2xWGvTes6AgyBC2p
 lRMmD784WfsyhaUA5yFddreaVROapb2JT+wHwGeZ5WIQZtWZnbrE7LL0Tu/HinaQb+4aD
 xHa+iiIqf7U0oYwARpMTuG0PkzWBgWtU610ZNBcyyyNEtMTVXU4z8jSoaKS4Xn0v5uC0C
 Lngz+z4W2uAyid2bdAAyHjGetoskceWaAAc2cK0Go2OlaXDh66rdJYTW3992saHVBhw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=tA0YuMTL; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=tA0YuMTL
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DA07840D90
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924167;
 bh=5gDvCJ+UXhkxW77CQFBghKeHwlvChzvv2/WWLjOyl5E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=tA0YuMTLkO30XTujVIlkh5h9419anVj5d0g+eVi32jcoPu6EwXY65jd9Gjv/TzPqU
 mWjKQUBnm//AA+eBhdEfuzW4cepANDr26WhVlbfyy+OmKzw0dM1wznXhrkll1tnYv4
 EnL5jr3qY/mvxemTTTLo6mWWLFhFf6TIc47mundGhauGz8JiCiw6BzIytapdqV61qa
 tig1QTUWocRLx0ayDHS9IZZQl9yjYeBDeTpj9qkwcDmXY9ElAGezFMXhLwzEeemOWR
 4+Pp2U4zFbz/fA09KTq4CR7uDp7S7CyFx3EUd9NOiNhu+dF8QVHTNzSHu1r1VaNNvA
 +Ry57Lt43ZnYQ==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:ZMlRXEzK2xircD72wM912TZf6P5ArfQsDFy0z1lyXOIk+eho4wgymgoMgNx1xi9F9/mV97Aoz1GSlzb5xHD7JUMoEDxdUPDekFPBgQMvADjccMwEOWywMX4TgJAZWHRkmtUAY605q3mzZCLy8V/tK9WW/v0e13IzkLn9QGLDIGSGWq5YItZZx5gZECYor9TmDSMAMWgfa0bF6zBtzwDMdubs9Bwnjg7fHbNkMq0Q2n3CeZQIAJUd6EnHrewYs6dO4svoZETuEE4fegMhNpTMQ1B2y6RWKgbNuI+QNzx7XDthak/qpA7bR82rE/8Gwar4vcZiFgs/y8KkcQFB27fuuNpfUxrEKlqn9ipQr0orjDocNk8UzToAOyOMPMaNWM6WrNNDIO+1YhHmDHeTbBdEQ6xuozG2e/KHniFphPJlUASTA2c8v9KhSK+OIPZlvJq39kw21Ga7vRdczKnIyjwUz3ToR2f3eNqyC96X+hnQ6OFaiLrJP462CYYqF63J/clRfYWd58xjO6aKeK/DSwj0fEnxreciBRmB8t6WE68R++/nD7xfH085PhTJ9Untd2SdSppF9C58zrOEw44bwWZZ9W/NYsilBPqxO/mo0KZWi8ryY5
 mR4QFbKT6FNEDMzA0Xam94EB8UHng6Xcxmj05nkoCpQ9TCKpEfT+6VsvIYkp7PcWkNAzd2Bcc=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AC146A4C48A6;
 Sun, 20 Sep 2026 19:09:27 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1f-000000000o7-1UNT;
 Sun, 20 Sep 2026 17:08:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:08:00 +0200
Message-ID: <20260920170815.240247-54-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v5 53/67] package/redis: Fix build with OpenSSL
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
