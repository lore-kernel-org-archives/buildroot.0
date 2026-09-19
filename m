Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD60C982D7
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82C9060677;
	Sat, 19 Sep 2026 16:01:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qiBS5n4m1eSe; Sat, 19 Sep 2026 16:01:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A136A6066F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789833705;
	b=oU2T6Ar0UM/HBSsROACOuk4V9dLSIo3k9NVOKQEceBFXPcuq2LzsFi2UWHh/URHrhYuZ
	 mMisxTraqBNYCm0G1q6/ltpHyiV+rLVIBdrk8nAUQFXWIdu9FXDsC86K1w/jZ2ywf3kdx
	 OF5izrriPhOYgF6gVshGtnnYX2zRozt4BSuxx16Kmn6PQK5FGxyouUtCZkXqAxgAQidHo
	 MnNzDCBz2cBPgddQwF/QZTvgT6MQ44bbTFXXzF19TTwSku8HXzdg9Bpxe1m1V1DYIU/Bq
	 kzny59WsoHGOWzBEBJOAePM1EXSrFUl6uPsGbVuJKw+xBj/NgVYYgq4w1hsCp/bjZGQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789833705;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=k0uayTYwj9Tr0/NkcDfUU7j6FDvFamYZXu6JGs/z6g8=;
	b=Gq7mSwm6x3ggl+paTgzt12co8cDapYrvDfochhNyeodtrCrAFuKiEQ5AE44ajvKCyA9v
	 dNNrqz3m5cflGN1FRQJivkJZi1WuAdMZdd3479fDFSlRWWEKJIp2uoxAVwbWN9N7rXPU4
	 0WxCe57cWRorsNfMlrPWWMBcNhzZteoc2NsQH1RZWxYs1y6QYMcZXOmKGOW11rgznrj35
	 +w1udd8YdfYwXT0eZARdUunGy4KVdaOhByjd4VnL5XfQ2AwfjDyijrmEHNZmM3Rfb14sr
	 mh66rUBN5eAz6tZRoahlpo54y7YSgpabXhRv/ZxYkwpqUmKou3ZpRQgSbzB6Wt1ax8A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=OkDuHS0y;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789833705;
	bh=k0uayTYwj9Tr0/NkcDfUU7j6FDvFamYZXu6JGs/z6g8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Uuv49kUSbAWz+4W8F4CvXiluM/TmDh7s8K7aDZEUZ70cjn3l52UW4A4jsRkA2jnQL
	 PUhmyb3yP8y9ptqaMJKYstsAQT4GhGF37tmddSeEVIGHtd5hy8y8iO4vQQEzAn5Fh3
	 zR2+U9v35lJT5NtS8jkPW7q0dEM1AqnJCctbkK3xTnMvg7GNGt9MK4WdRER1a2TUJi
	 mvTUjUqYfVU3u18yLleGrh5QsvFPi9PmklBZIjIHYwVIzv7wtHup9hHcamFo6ZXxNI
	 RfLoWAiwa/PINY7M1SM+aFRIjItnW1wm0/JeXdHmY62RyXqfxo+MPdQO1BQOtE5gJ+
	 PtDzCiLCIaBuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A136A6066F;
	Sat, 19 Sep 2026 16:01:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DE0A37A
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B76E6066E
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:01:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zkmGbd42akui for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:01:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9ED4360662
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789833702;
 b=XR7XI8JFWuM78/TZa3EFl7cG9DHU6P8Qi0EH6lLM/VYEwiTreEhJ6tEshjiXnV+e5+Rv
 9FqSx+awsh40A8agj96QPgaFxgOYvl+FQ1VliJn1T0sXfkSn67TVRBM3dr4optUxjctSQ
 M9h18EnmDIG1BIXafsSn1sES2AqV+7dZadTMPUAxSKIVasoVSTyVYBbgKGHdxXcMKbQ8W
 4aDmPfbq5uLATuMxiV8d31Gyz3YTZp4hBhLEgYoWhQ7vIr7D1cnQnKCattnkLuoiIdph+
 6FDeWUIqNxxXTw7KKqoKhHLtNGTYgjQbN3Gl8gtL6lJ3ImjuA2pOJTd9M3kxuxsTtFA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789833702;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=0pbGfPwyrsLphRyAiB+7qF8WaaqKiBlbHBnYqy0u7HE=;
 b=VaXzDPgcsch5x0Fl0+i20HmZx+c34A8jkv6KhKqK3xlIdmfz2sQCoGS7s8s8i/azC+S1
 pl6i8ghoGpt4GZT/+7Z9LzgQcThC3/bi+0HlYUCucntkI3UCrDu059kTh2IIm7CevPZyH
 aflE0DAj9P7Dt6cvAI8SVr4ALmn6PuAZu0NLqO7jKefldJmN5C7sgUHl8lTi65vAhs+VP
 SAEXsDoaWiPPkvLhuaHovpFfsw2XwThKqQAG84tP9MjaqvSARNh6AR6Lr/8mvXLrh6fB1
 60+yhGGS+bXB6o0Q3p2cc/3eVVVwKVR8KqvPCZuyZ8vIT6TxJXd8SIc8q9Br5FjYj6w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=OkDuHS0y; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=OkDuHS0y
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9ED4360662
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833532;
 bh=0pbGfPwyrsLphRyAiB+7qF8WaaqKiBlbHBnYqy0u7HE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=OkDuHS0ysNwMxztufVpiQr2KvMk1Yx17GEgR/Y3AnTnbpvXGFMpBf/Xm1taRsRgSb
 +SuNgZw3Q3Fpyc7rnwCo68T3g0Evv8kgg+OzrIY5QaC68s2UFqtym3Yjv2nsELL+oK
 eG4MhHDGuzrwe43Mz8BW+G6KFao7UfKc8/FdZLMDbsqwwcgDHoGJyeoIabmhDBj6TB
 RNOL+/mdLTkLy0dtu1zhhV+RTDYwYCgdRe+wNzvGEyGoFO8BChekfEhzvdGghpZdSp
 cJKmH7cMRUZJE7mrG1ODBZjpAlHE9CxbOYxIfeHPqOwrm8SbMFLEIP3FopUCMQyJ/L
 EuW0VAP+x2eGQ==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:Gz9bihiYtfNh12qiuhkml+pqlPpWn65rz0Ijo2Ao7OUhJEyLBmxhxO0dECuYUfKe9/yqgGCIEeofl8idCYwx7s3NvjdDQeo7Wqf3Nbc3MTOC1/Fvsvgdg85SJhMID1h7MEa2WfGU6kZECHHrv1QQUWRyVOc8KpzIO3MIc2KqJZGmrfNTSWJhanKhYUXuptJY5zfi8Vh9fLZ+yykUQPDMLkeZw+ekYAhz8gQFSCuGrfkDzsTKONyOydw2sXudX6Wfw617j14bOYP6eXeJ+EcemtLrNboGQBEd99ZESZcSaTbrBwhgVHVedpfDsw/97G4F1NtoU8D+NYtQrnOxICNxcapdvnzg5pkop0cTceu2wBj8uk6OOOb/VzgBnrCZuEhWX3zfEfRgAGUSKrLWcaxXbGjrcAG5LsmUUJGwUwMmxPW+n8GFEFclH3tu0q7lD61lqraoBPB/HJi+w3+18QvHk6GVNLJu1BDU+XOPwbbjLce4tOVy3WMFdRbCV8m/25yiEJ7ZmEQTA3KkwpMxV4iE4NiWd5A545IlesptTLnL51h0tXXFw+rdZWqgO+J/EsC8tBb26yl5gbeF9Hy997LlTlyVs6zAUUqbJGDscR+tSB+KBJ
 hxUnV1a23n4ZsIC6qS1LBVolw5z0FHNNn9CtNiV3Mb7gJxZt/GuJHiFB6dBAiwzIwimqjy
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 19C23A4C47AC;
 Sat, 19 Sep 2026 17:58:52 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSl-000000005Jx-1xjX;
 Sat, 19 Sep 2026 15:58:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:57:38 +0200
Message-ID: <20260919155845.5776-14-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v2 13/77] package/libpjsip: Add support for
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
 ...l-fix-OpenSSL-4.0-compatibility-5036.patch | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 package/libpjsip/0001-ssl_sock_ossl-fix-OpenSSL-4.0-compatibility-5036.patch

diff --git a/package/libpjsip/0001-ssl_sock_ossl-fix-OpenSSL-4.0-compatibility-5036.patch b/package/libpjsip/0001-ssl_sock_ossl-fix-OpenSSL-4.0-compatibility-5036.patch
new file mode 100644
index 0000000000..4d8f0d3c37
--- /dev/null
+++ b/package/libpjsip/0001-ssl_sock_ossl-fix-OpenSSL-4.0-compatibility-5036.patch
@@ -0,0 +1,44 @@
+From 3923fad2e4f6f3403c3d6f1176b113c1c1b91066 Mon Sep 17 00:00:00 2001
+From: Ravi Kant Sharma <rks1986@gmail.com>
+Date: Wed, 24 Jun 2026 11:30:40 +0200
+Subject: [PATCH] ssl_sock_ossl: fix OpenSSL 4.0 compatibility (#5036)
+
+Upstream: https://github.com/pjsip/pjproject/commit/3923fad2e4f6f3403c3d6f1176b113c1c1b91066
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ pjlib/src/pj/ssl_sock_ossl.c | 11 ++++-------
+ 1 file changed, 4 insertions(+), 7 deletions(-)
+
+diff --git a/pjlib/src/pj/ssl_sock_ossl.c b/pjlib/src/pj/ssl_sock_ossl.c
+index 000aabad6..93fcf10f1 100644
+--- a/pjlib/src/pj/ssl_sock_ossl.c
++++ b/pjlib/src/pj/ssl_sock_ossl.c
+@@ -1645,10 +1645,7 @@ static pj_status_t init_ossl_ctx(pj_ssl_sock_t *ssock)
+                     if (PEM_read_bio_X509(new_bio, &x, NULL, NULL) == NULL)
+                         break;
+ 
+-                    if ((xn = X509_get_subject_name(x)) == NULL)
+-                        break;
+-
+-                    if ((xn = X509_NAME_dup(xn)) == NULL )
++                    if ((xn = X509_NAME_dup(X509_get_subject_name(x))) == NULL )
+                         break;
+ 
+ #if !USING_BORINGSSL
+@@ -2105,9 +2102,9 @@ static pj_bool_t parse_ossl_asn1_time(pj_time_val *tv, pj_bool_t *gmt,
+     pj_parsed_time pt;
+     int i;
+ 
+-    utc = tm->type == V_ASN1_UTCTIME;
+-    p = (char*)tm->data;
+-    len = tm->length;
++    utc = ASN1_STRING_type(tm) == V_ASN1_UTCTIME;
++    p = (char*)M_ASN1_STRING_data(tm);
++    len = M_ASN1_STRING_length(tm);
+     end = p + len - 1;
+ 
+     /* GMT */
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
