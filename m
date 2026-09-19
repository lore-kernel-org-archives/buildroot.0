Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2070CC982D7
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2AB8606CC;
	Sat, 19 Sep 2026 16:14:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OC1LyopbM-8N; Sat, 19 Sep 2026 16:14:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EAAB6606F4
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789834460;
	b=i21sg6V8ooqHg8AXVlVqMWv6SRmZ1BS8zd9+lVqfLkuAvuI6yxH0QwWuD7JyN05owjyo
	 uF1YXyh2MvnyhNhahVGdmG/V01pjASiZ/L27nQarhctoPmNBrDT5bZBGIgl96phkFP9Zp
	 3VXTeA2kSuMxlnLcZVkDStwwqb6ew3ZRFmymR2MhEwJiqWgwgcsm21Aqv+eMJiFjus69U
	 pdC3b3oSUgDmmqs0zFK/Q5pWP+ftPLdk/s4ulj62vwqZ0hwBLp9hpO/fnoub0ErechBeS
	 Eg3O6UrCdLRDKaVYZ4Dx9VdIRa60zUtSsCPxfIqMGJ4Lwv/1MLV/4IVXWjKBgsuTzCA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789834460;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Tye6tSHh1abjSnt0/bmPBHrBUPt7Gd+H7nLmSetX4P4=;
	b=famYcW5yoco19dweaExOOalYbqLAGrLsvkmP75S8GcU30clHwB5fjmy8VoSWV62nAGGh
	 VPYWJQEFbIf4SFi06hU1TWOu3qssEfGjEmgNjdGsJabW3w+q92YcJyyOE07Txu580zkyi
	 LEqzjoGb0m2HN8A/4mM3Nr5GflTTWfrAuMxsP17eDBw3oe6mSvw3L8fUOxS4Etrh//gDX
	 jWK0Ntb75UG5byMEBJaJlCPYqlPhfb4JXC2Z9wCD+m1xNY35BrIPm/cxxnucv+gsMPtx7
	 46H9cBVc2lsLEGsOXQPbEImP6o3AlqpH/ZfmJEf0lIXSuPKIQrCcuvdI1RhN3fiLM2A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=kpIqCtbf;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789834460;
	bh=Tye6tSHh1abjSnt0/bmPBHrBUPt7Gd+H7nLmSetX4P4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=NSM03WXn6eeFrDgoQ58xVFMAaXq7R2PIuq2UXvKvo1eYXYnon3y3xmS7O1YYSHSBE
	 9QhpRdqJxwWCuxNyFINv+/eJLY+a0SOV6ou+uy3xkkbJHW/Dkcq5yfhEpT464a7IlD
	 j+7vyWuV8nyTR+SU6k0jdoAI6v74ZOV3pkPviTOGPRwwWxlWl1mbbhm6giFQB2mpuW
	 YBBm39jQiECye4Mbq++/2nDiwsvL/9KnYdKu0bi1eXsThFkp3gSrmwFaKwFoQ7hQZK
	 S1gXydftob9+pC1ODJSjRGwH9GP2uR963EVb654faBd/b0wHlA8A1l4P75MVzzrCBV
	 8XybmKRuqJDag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAAB6606F4;
	Sat, 19 Sep 2026 16:14:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5713D333
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4834B606F4
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:14:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ixilSD7Ty2u2 for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:14:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4F842606CC
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789834457;
 b=WmYC/ioGHqif8ubS49Txaso7ZItXai6Tl84S8yjCIcrWO65KU46Cr+zcJ2ZNf8utPx9t
 F0vtj1UQxUALN7cBbPVb4LfeEtMf6/IDcEKIvdZOaADxI3sneXq/nMwG1Lk3IulBm3ko8
 bQf2CZ0AChscAml03lQZmG7a0uW1GiwspdFENBO0w8wnbhrH2QJuM/JMsXV1Zlqqjrvb9
 4TY7epH9pveiqwN7gJ8FH9CTwSR4KpZf+o54a0+R/JwN27dVcSvVP+NxdZTKr1j5ePr33
 /7pycFuR+B35l1gU/LLcq4dh02P927ofnkGR124RaHU6kxrXwVl8RhMhwveeioA6F1w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789834457;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=n9qeUgqkQP0378J8HrA1C33nQzJMtFnfsbkk2uRvb7A=;
 b=E9IlnQlet5W8i70e0CqWaAAQAbrN/18/ZymO5K5BzT2RgL0mRYxHihbfz3YGmFVRK/NK
 7LoBYK3GaSF88V4+GvcGpkecZa3DpMn1ddo6t/4JSb69cnEFQGOtUvmifYis8CncZr+Aa
 oCGvdgLa/rfcP/gGb138a4uLFOX2vxQVp+bc/YGbD+PIcwCr5pL2SuOtYiawmpKY1Db0K
 GVDgg/ELD/Vi/9xwRqEwBN1uExmTtKKVkM53G/VENBhx6oiwwb/MZS50hhKbUDRaQvgLP
 SDUNwK9FjfNs8nUkkm9DZ5uNkyBDgL6diHDR/511bgGHlT67mlradnOyHSkGXpPe6Mw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=kpIqCtbf; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=kpIqCtbf
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F842606CC
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833559;
 bh=n9qeUgqkQP0378J8HrA1C33nQzJMtFnfsbkk2uRvb7A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=kpIqCtbfXQsGxWU3MRySSKpdif0cfq1b8kWpnWBbSnfQdIwxyTxcrNUsFmu0tb/J6
 s8d6jcYBLg8CqM4t8ULV3jHMFErNp0fp9IcI54qWOuAz6qW3bTi+WLC72CSzffvkC6
 l09RDJ9mYgEIeiMH5slLPRXlSQPxA8L+ANnIMcWhzF6B7DDOUMbTcKsu5Vplb/eESR
 bbBJw5I/ZhstOu4uAXAKh2/g8Z2DpeB72W/laLmN2ANzGN7KW0hkaXHSwQTsPy8eYC
 C88RnQhNFh0MxPUg+8t34Qfuvc7LqBjZCRxq6n2t4r3KmWZfX3AxG/If0SykeGf+Ok
 iAOgsq5oCd2tA==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:ayhErEy+NFV25IF99UiAgUwOvsprJozxdi0SI9OzT7++jycWE0dj2PXBuSHXqnFiAPHfk5RNd14F4F040Z3VRKWR5KP3DYhmB7w2QRbRfl7ghYYZgQ/jkW4CFold9x/UYTZaTw6QDq7F6jX0dOCcB3YjS8AeWT05ducvaC7wPdMQsJkQC60ghlBHT6lR/htwlaJhvnrhQ3DVScA0wAiqzA+lkZ4UgOlrQSdcZNPG24pK52CNEN5wpHKdWa1vcwPFgCno1t6qqYfckGNu6R4jrhF6fXA3qQBMda/+d/sKuyjUSFsuSdFmuo7RiGgN/9S4aUBnY5N52rNUhOtpOcLVdqKg4cOh5WZ948UEz6DLVLr4sRoG2mQj3JhQ5Nn95+qwDsTj9Nu5fM7VCnHiWEfwtgrYcu5bk76IZJ6fU8twfoALil4stO5gXmAvocdfq2BG7NUGrSrUkxA/dcWnoozGXXCYMk2Fc6TkCtYyF5eNJkZ46AvS/qDE9uU8Lvek8TzM+KqmIvCZKb/jXxAWbg6zUK/cldjzJcxg6ZpjGf9z9w2KzGItsUt2I5SjaLYfE37vqA6yRaukVGT7kq2O6QyceIWp+RBoOcfc0lnMyFgdDM1MgX
 0c8esUuaVlY6JSbbvaCQAoMhMM97AFMkFe4KT4KRJN/cJFSuJinwBUQKqP26GTK6Hojmtr
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B8405A4C4861;
 Sat, 19 Sep 2026 17:59:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSx-000000005Jx-1JJt;
 Sat, 19 Sep 2026 15:59:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:58:40 +0200
Message-ID: <20260919155845.5776-76-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v2 75/77] package/xmrig: Add support for OpenSSL
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-Fix-build-with-OpenSSL-4.0.0.patch   | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/xmrig/0001-Fix-build-with-OpenSSL-4.0.0.patch

diff --git a/package/xmrig/0001-Fix-build-with-OpenSSL-4.0.0.patch b/package/xmrig/0001-Fix-build-with-OpenSSL-4.0.0.patch
new file mode 100644
index 0000000000..966744abbd
--- /dev/null
+++ b/package/xmrig/0001-Fix-build-with-OpenSSL-4.0.0.patch
@@ -0,0 +1,40 @@
+From 357fab10b79e49dc9b8f42dc6cf425a8124a3f40 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 2 May 2026 16:45:38 +0200
+Subject: [PATCH] Fix build with OpenSSL 4.0.0
+
+src/base/net/tls/TlsGen.cpp: In member function 'bool
+ xmrig::TlsGen::generate_x509(const char*)':
+src/base/net/tls/TlsGen.cpp:118:32: error: invalid conversion from
+ 'const X509_name_st*' to 'X509_NAME*' {aka 'X509_name_st*'}
+ [-fpermissive]
+  118 |     X509_NAME_add_entry_by_txt(name, "CN", MBSTRING_ASC, reinterpret_cast<const uint8_t *>(commonName), -1, -1, 0);
+      |                                ^~~~
+      |                                |
+      |                                const X509_name_st*
+
+https://github.com/openssl/openssl/issues/29117
+
+Upstream: https://github.com/xmrig/xmrig/pull/3808
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/base/net/tls/TlsGen.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/base/net/tls/TlsGen.cpp b/src/base/net/tls/TlsGen.cpp
+index ad2e648b..59e4f0c9 100644
+--- a/src/base/net/tls/TlsGen.cpp
++++ b/src/base/net/tls/TlsGen.cpp
+@@ -115,7 +115,7 @@ bool xmrig::TlsGen::generate_x509(const char *commonName)
+     X509_gmtime_adj(X509_get_notAfter(m_x509), 315360000L);
+ 
+     auto name = X509_get_subject_name(m_x509);
+-    X509_NAME_add_entry_by_txt(name, "CN", MBSTRING_ASC, reinterpret_cast<const uint8_t *>(commonName), -1, -1, 0);
++    X509_NAME_add_entry_by_txt((X509_NAME *) name, "CN", MBSTRING_ASC, reinterpret_cast<const uint8_t *>(commonName), -1, -1, 0);
+ 
+     X509_set_issuer_name(m_x509, name);
+ 
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
