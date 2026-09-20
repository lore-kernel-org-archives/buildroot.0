Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25EDCC982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3D636064C;
	Sun, 20 Sep 2026 14:11:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g1YQswiXR9JG; Sun, 20 Sep 2026 14:11:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D804B60672
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913470;
	b=AIT5JCUoG1MeYAY/sHaawE+R3vfFySSWrh4hlOw88U7wahEWEQ2Z9fFM4bttdulYXUEk
	 QHX4T2U14BI0hGlHPsFZpytg8GIDOCKHx4hbq4+oU4tRiD47/MnrJVuvoYnpp//gmKVs/
	 5iG8sMljreeTZIXkfj2/l47BSxDBIGCwdglsU+QkicJEkvLO21oBTBEgSLzsivHcPn3Cf
	 PCDik2ucAp9FYf5nsCidDec0FV7XFPB0V023j4T5+eElon5g4JCJ84Kos1SyZM175SPeA
	 23S9h5Pf2GVZPzYPdGB5gbCyapn/inIi6TdsATg+BATG9Z2r/JS3D2mhRHm9RzDM1lQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913470;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=rthfJ1MNczkXmFY/TvB9J+i3xeon7CRl6K71JvMjDFc=;
	b=s5FxezroIu1Ow8TP6FK5LKXc7o0T4vYzrF7vMQpyUpIOGeJUyHslDDyDmUj3CfLWewIE
	 9WQJVWTr1QfiViF1E+t8hvZTvqyzf/sjcUGDFbRM6idZU8PJYSE3HZO7GYwUUChoMY117
	 0gXIl9t7/tqbS+ZmV6zuuGe1vgRsUCLlFnEYIW1MSHlwiPtxTsL8dzt9W+5GGuRyiQ1X/
	 dcjkPmBwOC2Q9RUjaPsdb3tyWskSVD4coEjOZmvzj+S1fWcIbDapBrgrmj4X7u3/S3JkW
	 wsbwVwvjNPZbgLci3z1Q+86rjTLDo07C4IeAlZkhl2eFjKgBY/s0yAh93bqrMP66Byw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=ImBjBxBP;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913469;
	bh=rthfJ1MNczkXmFY/TvB9J+i3xeon7CRl6K71JvMjDFc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=PrcXJ4rwXt9C41Q1XGbuqMNojCOY60RvZdhJcb6bh6Zt6sg2+PETZQ6P2kKl6lhsj
	 XtBOZ7JFByiEBMAIFa5jhUkWEv678iyN+d6bL7xTIqPgaD0wG/PO12TcL/K8aiwETu
	 DWHk5yNGbpI6mu7moSctubR3rBzsvk0v46Z+3w39HWeVbSHXWxSojb1SkIPvHAIVkq
	 0vMmJS3peOeN0JKPTDCHa5lZk0cAECT4gF7xicu1Ah6UiMLqC4UpdxgTw8DAmYhw+X
	 JIUi0Mc5UDCc+vcO0souOEZrAkZPCf4dknrENeJrqA+B89qGgZv9NlMR/dYL7VtEhs
	 WuPXuqxcoR8JA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D804B60672;
	Sun, 20 Sep 2026 14:11:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DAB5392
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0432B606A9
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:11:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cyi-SA8ZNMDE for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:11:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B88296064C
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913467;
 b=TPvKwLIh82W71mqfwK3zpnUD8qyBllmXdZd3EJmzYmkHIrANkbb23K4dal4AKPtli7WN
 vWdmgFAEl4Op+TqsdBLeO9DkRqGTBUEjLb8YIYjOOzdIGKpe/Pursy5x+g/4t30UBbmVO
 3nuCBrM+tLM7RCKX+Ne4QcCpEqPJVyXEq12NNuY14Sem16NF2pvo2vur5GJWaqZRKECQM
 EoL8+JzAVHeE+HvuUe4ZJNa9kmA2jmWFZImBl9sBDbK/q4taSjB3GF4DBqPkRmEaPZGY8
 9ls/mhGcavLCFhAHZ9/7LWNWj2QmMZB48RF6AQ86FzP5lE4PghTmDoCKfJ3Sv15p+zw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913467;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=oWr+HyXqZdC7qkBCzqx/nRb0rgeeo4ZYcfTHo7wFtDI=;
 b=oFJKylEBehp0iyL7G5qBXQUpB3RnbIXO/I9PcCFbVsjcFDBKak9dLjaruq+xL3jUq8Wk
 SKQofPJzzkiO+BkGL/Yt2uxNgQRKGrSxiZ9s5SuybNpIPoOgWIrq+lnEbCiiMwudYZiW1
 ugfBKMSf1h9FzVb1KXSR1x3io7fMllQDcgOOisVREO5kVLSViJ8X8+OJcnuHZTBizbTWK
 lp9nvYOktv28WkH9kKy4qzMKHGbS7yTU3UPN/iBMmoHj+p3EFBiI8a+N03XIHnphsoy5A
 Dhk8RKTyOs+G0EfpVZSPB5mKT3VbEPp/maXuTRrauWNoVmzrioUWhXekydAvK1MG8vA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ImBjBxBP; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=ImBjBxBP
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B88296064C
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913229;
 bh=oWr+HyXqZdC7qkBCzqx/nRb0rgeeo4ZYcfTHo7wFtDI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ImBjBxBPdv71VjAKbs4oyYkqO97McvbzAcyHUPwLc/7zauT7hQEiNEMbSOG5o47I4
 ZsafpP1I8vVjY6DYoKUdpedf+sf/T3uYEtCRGPT7D1cnNJUmi9kj9cttMkmQSz6DMX
 YsML940Mfv2VrHUyBBqJAxKhv0vX+sXA//2acRudPC+XkswCYzaeCGwgT1Sma1nFIN
 vdfMAzLAAFnDvMmLjQ1nNeLB57IDoF4atdXz6572ZgiyF7M54Puq7k22raX972uXub
 rqf4Gjy0ZQLYupCKHq23G22e7jK3/S5syCdZOgjoGCMgb/fSSy265G/eTXmAqsCgJg
 bILrkYmkoipMQ==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:ZGWHSKD7CX2O9rZ0wmTYT83zklXUjv4a5lDG6A6qq0ql5t/AodhYP6UHakEVOCPya2GZ651b0P8rl67y2HycR2t3KUrmi1i8azqjy8wUCOKTQXg7Ht0bIdSLtoJzLt+zMnB8FhVHy4dNkn2NF6DNg2Ua5nvBLRCW8+uB35zK4Jlf9C4bt7NkWw9t+hi+KEBETWs+nXmKG/Vd/hRdAvwPmdoXrFaoHG2P8vyxg3/Vz5OP9k9LBf0aPI1BTEHaNdkY+2Dai7j9UgkhYd3YPdHlCp+PxPLASeptlkQlM1W1XqzhQNfFCCz69PAKIVbYq+7ctxFamKNMi0nCc3qwb394zgGRFShUg4tv2oIezh6F9jVec9m4Lpuf0OZdYR3s5++PagACM2INZHbbKIGXBAoQm+JREN/ddeHHGW4w/vd0sZzyKma9iDpaCc9aAhLFRyoImjMcZYMp2x0Vb1sN7P7thfA5TK2IfSI/OzFuHtJwi6P77Jr29RqbDkzcg2QXxQoOVIMArDgMVIoHtINnH8r4c3ggaXdohXZj2IwB+r/OncP/BsQ5q+o378+uEb0+AFP9AyFfx5h9DuJHkZ5/J8MaxuEdOL6u4Cn0NK0/d3UTgfVat7
 J9rs1l98hiqmVuG/TKU3kaHyCKtuhfDoApoJNwYxO2pgCHExEO++3nh5elvM3/CXumfP8i7pzKkAHvrmHT+sj8os5OQefso6QpT+emn515H+VeN2pylBw=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8A9A9A4C4864;
 Sun, 20 Sep 2026 16:07:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBG-000000002J9-03mr;
 Sun, 20 Sep 2026 14:06:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:05:11 +0200
Message-ID: <20260920140605.3005461-14-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v3 13/66] package/poco: convert to CMake package
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

From: Yegor Yefremov <yegorslists@googlemail.com>

Currently when building with make, the cmake config files are not
generated. This leads to problems when integrating the package in an
application built with cmake.

The CMake build system links the PDF component against the system
libpng when POCO_UNBUNDLED is enabled, while the legacy make build
system always used the bundled copy, so select libpng for the PDF
component.

POCO_NO_FPENVIRONMENT and POCO_NO_WSTRING are plain preprocessor
defines rather than CMake options, so pass them through CMAKE_CXX_FLAGS.

Poco is built as a set of shared libraries, so -latomic has to be
passed via CMAKE_SHARED_LINKER_FLAGS as well.

Disable File2Page along with PageCompiler, and tie the ActiveRecord
compiler to the ActiveRecord component, to match what the legacy make
build system omitted.

This patch is based on this one:
https://lists.buildroot.org/pipermail/buildroot/2026-April/801019.html

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/poco/Config.in |  1 +
 package/poco/poco.mk   | 98 +++++++++++++++++-------------------------
 2 files changed, 40 insertions(+), 59 deletions(-)

diff --git a/package/poco/Config.in b/package/poco/Config.in
index 4801b36a24..b0eeaa1dd8 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -94,6 +94,7 @@ config BR2_PACKAGE_POCO_NETSSL_OPENSSL
 
 config BR2_PACKAGE_POCO_PDF
 	bool "PDF"
+	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_POCO_JSON
 	select BR2_PACKAGE_POCO_UTIL
 	select BR2_PACKAGE_POCO_XML
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 40dcc1c502..63279d530e 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -22,80 +22,60 @@ POCO_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_POCO_DATA_SQLITE),sqlite) \
 	$(if $(BR2_PACKAGE_POCO_DATA_PGSQL),postgresql) \
 	$(if $(BR2_PACKAGE_POCO_NETSSL_OPENSSL),openssl) \
+	$(if $(BR2_PACKAGE_POCO_PDF),libpng) \
 	$(if $(BR2_PACKAGE_POCO_XML),expat)
 
-POCO_OMIT = \
-	Data/ODBC \
-	PageCompiler \
-	$(if $(BR2_PACKAGE_POCO_ACTIVERECORD),,ActiveRecord) \
-	$(if $(BR2_PACKAGE_POCO_CPP_PARSER),,CppParser) \
-	$(if $(BR2_PACKAGE_POCO_CRYPTO),,Crypto) \
-	$(if $(BR2_PACKAGE_POCO_DATA),,Data) \
-	$(if $(BR2_PACKAGE_POCO_DATA_MYSQL),,Data/MySQL) \
-	$(if $(BR2_PACKAGE_POCO_DATA_SQLITE),,Data/SQLite) \
-	$(if $(BR2_PACKAGE_POCO_DATA_PGSQL),,Data/PostgreSQL) \
-	$(if $(BR2_PACKAGE_POCO_JSON),,JSON) \
-	$(if $(BR2_PACKAGE_POCO_JWT),,JWT) \
-	$(if $(BR2_PACKAGE_POCO_MONGODB),,MongoDB) \
-	$(if $(BR2_PACKAGE_POCO_NET),,Net) \
-	$(if $(BR2_PACKAGE_POCO_NETSSL_OPENSSL),,NetSSL_OpenSSL) \
-	$(if $(BR2_PACKAGE_POCO_PDF),,PDF) \
-	$(if $(BR2_PACKAGE_POCO_PROMETHEUS),,Prometheus) \
-	$(if $(BR2_PACKAGE_POCO_REDIS),,Redis) \
-	$(if $(BR2_PACKAGE_POCO_UTIL),,Util) \
-	$(if $(BR2_PACKAGE_POCO_XML),,XML) \
-	$(if $(BR2_PACKAGE_POCO_ZIP),,Zip)
+# PageCompiler and File2Page are code generators that are of no use on
+# the target, and ODBC support is not wired up in Buildroot.
+POCO_CONF_OPTS = \
+	-DENABLE_DATA_ODBC=OFF \
+	-DENABLE_PAGECOMPILER=OFF \
+	-DENABLE_PAGECOMPILER_FILE2PAGE=OFF \
+	-DENABLE_ACTIVERECORD=$(if $(BR2_PACKAGE_POCO_ACTIVERECORD),ON,OFF) \
+	-DENABLE_ACTIVERECORD_COMPILER=$(if $(BR2_PACKAGE_POCO_ACTIVERECORD),ON,OFF) \
+	-DENABLE_CPPPARSER=$(if $(BR2_PACKAGE_POCO_CPP_PARSER),ON,OFF) \
+	-DENABLE_CRYPTO=$(if $(BR2_PACKAGE_POCO_CRYPTO),ON,OFF) \
+	-DENABLE_DATA=$(if $(BR2_PACKAGE_POCO_DATA),ON,OFF) \
+	-DENABLE_DATA_MYSQL=$(if $(BR2_PACKAGE_POCO_DATA_MYSQL),ON,OFF) \
+	-DENABLE_DATA_SQLITE=$(if $(BR2_PACKAGE_POCO_DATA_SQLITE),ON,OFF) \
+	-DENABLE_DATA_POSTGRESQL=$(if $(BR2_PACKAGE_POCO_DATA_PGSQL),ON,OFF) \
+	-DENABLE_JSON=$(if $(BR2_PACKAGE_POCO_JSON),ON,OFF) \
+	-DENABLE_JWT=$(if $(BR2_PACKAGE_POCO_JWT),ON,OFF) \
+	-DENABLE_MONGODB=$(if $(BR2_PACKAGE_POCO_MONGODB),ON,OFF) \
+	-DENABLE_NET=$(if $(BR2_PACKAGE_POCO_NET),ON,OFF) \
+	-DENABLE_NETSSL=$(if $(BR2_PACKAGE_POCO_NETSSL_OPENSSL),ON,OFF) \
+	-DENABLE_PDF=$(if $(BR2_PACKAGE_POCO_PDF),ON,OFF) \
+	-DENABLE_PROMETHEUS=$(if $(BR2_PACKAGE_POCO_PROMETHEUS),ON,OFF) \
+	-DENABLE_REDIS=$(if $(BR2_PACKAGE_POCO_REDIS),ON,OFF) \
+	-DENABLE_UTIL=$(if $(BR2_PACKAGE_POCO_UTIL),ON,OFF) \
+	-DENABLE_XML=$(if $(BR2_PACKAGE_POCO_XML),ON,OFF) \
+	-DENABLE_ZIP=$(if $(BR2_PACKAGE_POCO_ZIP),ON,OFF) \
+	-DPOCO_UNBUNDLED=ON
+
+# POCO_NO_FPENVIRONMENT and POCO_NO_WSTRING are plain preprocessor
+# defines, not CMake options, so they have to be passed as compiler flags.
+POCO_CXXFLAGS = $(TARGET_CXXFLAGS)
 
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
-POCO_CONF_OPTS += --no-fpenvironment --no-wstring
+POCO_CXXFLAGS += -DPOCO_NO_FPENVIRONMENT -DPOCO_NO_WSTRING
 endif
 
 # architectures missing some FE_* in their fenv.h
 ifeq ($(BR2_sh4a),y)
-POCO_CONF_OPTS += --no-fpenvironment
+POCO_CXXFLAGS += -DPOCO_NO_FPENVIRONMENT
 endif
 
 # disable fpenvironment for soft floating point configuration
 ifeq ($(BR2_SOFT_FLOAT),y)
-POCO_CONF_OPTS += --no-fpenvironment
+POCO_CXXFLAGS += -DPOCO_NO_FPENVIRONMENT
 endif
 
-POCO_MAKE_TARGET = shared_release
+POCO_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(POCO_CXXFLAGS)"
 
-POCO_LDFLAGS=$(TARGET_LDFLAGS)
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-POCO_LDFLAGS += -latomic
+POCO_CONF_OPTS += \
+	-DCMAKE_EXE_LINKER_FLAGS=-latomic \
+	-DCMAKE_SHARED_LINKER_FLAGS=-latomic
 endif
 
-define POCO_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) ./configure \
-		--config=Linux \
-		--prefix=/usr \
-		--ldflags="$(POCO_LDFLAGS)" \
-		--omit="$(POCO_OMIT)" \
-		$(POCO_CONF_OPTS) \
-		--unbundled \
-		--no-tests \
-		--no-samples)
-endef
-
-define POCO_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) POCO_TARGET_OSARCH=$(ARCH) CROSS_COMPILE=$(TARGET_CROSS) \
-		POCO_MYSQL_INCLUDE=$(STAGING_DIR)/usr/include/mysql \
-		POCO_MYSQL_LIB=$(STAGING_DIR)/usr/lib/mysql \
-		POCO_PGSQL_INCLUDE=$(STAGING_DIR)/usr/include/postgresql \
-		POCO_PGSQL_LIB=$(STAGING_DIR)/usr/lib/postgresql \
-		DEFAULT_TARGET=$(POCO_MAKE_TARGET) -C $(@D)
-endef
-
-define POCO_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(STAGING_DIR) POCO_TARGET_OSARCH=$(ARCH) \
-		DEFAULT_TARGET=$(POCO_MAKE_TARGET) install -C $(@D)
-endef
-
-define POCO_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) POCO_TARGET_OSARCH=$(ARCH) \
-		DEFAULT_TARGET=$(POCO_MAKE_TARGET) install -C $(@D)
-endef
-
-$(eval $(generic-package))
+$(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
