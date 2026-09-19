Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1326C982D8
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74CF96066E;
	Sat, 19 Sep 2026 16:06:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mkwdyfpdvwcp; Sat, 19 Sep 2026 16:06:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7A3F36067E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789834010;
	b=bqEAgYiPAkzno7+C3jXknoEWgr4JprpR67XtXXvF6qSq+Z/3/Z+NOhRavuESCfbgWNiQ
	 UslYmdSGUULGgSeVSc3h4+HgIJGap7vT5vzKQJYvWfkmDW5QeNoWAY8fygaO8hxujxMcd
	 iEu0IVojx3Y12Io7bLF94XQQyS2u+3d9dawr9oEqFbeV2yIE3IximpgNl/ln7uGpSEDDK
	 EtvpZoeSouv3+nPMPUxQn5uD5Uv6hYhXCl26M/PzaSedPi8UjuBTM7bkHozb+AoBEYMFl
	 nABipXZo7d+f2WvOAFvxJMpscIRVrLLzfmzw2DTjk5ZFF14g/+msEZ8CqKsIRn+4S2Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789834010;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=rthfJ1MNczkXmFY/TvB9J+i3xeon7CRl6K71JvMjDFc=;
	b=pb8w00oddbG73uXkESBGgPaGMJhblQJymIiyCle9lAHQ+VA+5LDU1VePlGtimNdBq5Fo
	 Nhk+vxl8aiP+Ydknr9oYi2HcRO4FsGMJ2jIkI7QjKWYiw1N4+gsYK2FfL8OGwdHVnLU66
	 SL6xESGwBTfKlxOf1JMBKbD1B6z/ZyBQr2akZP9GAlmrUk4Z3+N/jn/X/RY6YjX8CM7J8
	 8X+rqvHRyVwGltt1scdI3Aw8iwOqn8T1K2v8dW8KRgGDC493T498ZhV/1BFsCD6jGsRaO
	 tNhjpjwD7iAhCxDEvmfwXE5kCoWvucC/4ihjvRummXcs/2ZteG3IZ2BhwGC8Ka5X00A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789834010;
	bh=rthfJ1MNczkXmFY/TvB9J+i3xeon7CRl6K71JvMjDFc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=iotTSzOYxg2mtiJkizDFsMMqyNRNX/vY+Nevll1HqP2Y/3DV0oNancIy7T1kPuJ+D
	 LqNnD/9qYFTBzlxQuy/rVyJ/hr5TU0FKFsgJB6Hivn8HnsiVIAdVNUBkN4uCg9M71X
	 rj0E+qRnclqJNzgwFXr4sGG5D5ovl5OThdM4C5P8Rz5GEtwVeDEDdvEoyGnD48y278
	 cNo0qQqh2GSfK0fYClgm3W3JZXWzpVT40xYzUse8ZuirlopdkK6feLJaDdmA2s+y2h
	 Rk1iaqWbA0fnbWbRm2aqLSHkaTQl16cjg6KObe/csUQmGadqFzoignZ+9DKjMY+ZWe
	 236Ha/SgGL7cw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A3F36067E;
	Sat, 19 Sep 2026 16:06:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C3CF524D
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A33640B96
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:06:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gUlp1xILXsg1 for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:06:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0A98540BB6
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789834005;
 b=CTro9JA1OThYqpqh5BqF5FXeYn90UV8clAu3eRnlgsJpb/nFNSQNNXksiKEGIGQ2R700
 dan4WsUqcfe04E2dQFH+GLOkYjl7U1pn2JQw9ue7IphFmwQ5YGtUvdLdzkrojixAC+ufV
 LcE6bGzgQTenX3TAcMpDkPIVcJM2mxkJng8ts4L3aYUSbhtswSQ+3xqM33RS5GEXUlX8H
 weyzBSomD363exwAetS7eiWjUBUjIBL4ldcPKnS43QWbBWCIuDjwNTfhTMojcEK+MkNvM
 KEcsm4gHadiUhjzpd3VQycH/FmM/DzpgPRPlmHzs1Lw+JyAnuglHFWLVFMPExqT29zQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789834005;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=oWr+HyXqZdC7qkBCzqx/nRb0rgeeo4ZYcfTHo7wFtDI=;
 b=dEpdJ2HSSGEnVjVmTP7zpJz3Nsrx0r3Jj8JhKak/Ex2HIsYlqhjD5a8Rrp8LZZGteNuk
 FF0iH6jb3Nrm5q6cMYlsZmu1Z1c/ShrcJTUa02OOqv7zcbnbkbAwCCev2nM2UDLN76/BQ
 VdoPIN+dWJ0RlwbZJq9fHJLpLJxqP+J19eozpaVn8ZslVGLMNcb3sxm2Ub1MfseqXEt8U
 pOIbjU0bhqZ1Dxzb41QOOoHmNh9tLuvlty7gDAjV3q4Iszyak9NtZirLZoeCEjI8aVCbb
 +h7apKk2iRug9AJ9Eh9wpgWH7xUkJ5DepldorB6qnXbWbJE5G7rkk8Pm6QPrfxnBieQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="aiHk/oLc"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=aiHk/oLc
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A98540BB6
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833545;
 bh=oWr+HyXqZdC7qkBCzqx/nRb0rgeeo4ZYcfTHo7wFtDI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=aiHk/oLcp+T2BjNdKtUdpA6xz23sha9Wm7awuTmSXLXRUCuS68/i8rUxVJrxZoa1B
 tuYt1CsV7dCbTlH7/i6Yc79ZvESHMgwv8zd49d3ZvuJXb4cSVRZeVn4CXLwKVA78i1
 tEM1Gm6bEg5bLc5wqZge50zhzt0AS91uGh1Ip676JetwT54z0g5cv1VQWZv1b5LCV+
 AJwQUB2b0vjIptjpkywPhju/Xy3Zx+xAxkxL90dZrdhFfbxhtjDSJJkHB6TLK7/B2O
 lUMcKsMI0qbFZ5dhZeiFsdorgV3uXUlQFwJfJ/vPC1OR+9UVd/v7w6yHbybycA5UnT
 I5HQqlBtoERFg==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:Bkwhtb9rqiNjiew/1/dKx/SFohcLnK115Jbnt3PhrIUIucnmFDqJPO8XNwP7UCkmB/Py1LpKsGM7nfOXcqcJ7X1P2ibN06I3ENV3zuT9hIOnflxC0RFYAsqRBqusD1XNZusD0ugeuhnvuzGyFSfGlYLO0nbg1BsporNbOjna6Mz7U0g2D6RtGGOGaiY+qgijieQuOAClE8AjRbp7zoXF8aC3JCpc7KFaT/1nL3a4kkvkmnysOnDWlPhSOJ7ifF3T+EmOwwBOFh0i4BpfuplejXdIjSIEtYY3i7loapuz5IglMs77iJ45dUvE7DeDiBPeFy71mCCQG2lLriZZlXSKOBc0muXouRkS7N8dKzuPkCg0mG0KILzlJZE+di7FlhhWznHk9Y5z+7s8NRPuVZjJyBBXgEXxfpaRl3gdY7voPnMWkbD7zw9sdAS+ijPsatMcR+9cp7tyRUUSPsH2dgY6sgvF2t6P6lQq6j2M4hwqrEe0aY84JgoN0VIgdQ0WeLY51Sl/bTTFpzDYVCXQ9tDuuk8h/7g4Ut/ntrZJ5yejNr5+kzaeDu9fR1EGkw0h4yG2O5B7xaC2GZiB4U4bu3QlKeojmyPvQzTOKftFXFTujl8dTR
 wuvev50Ru7SqXvZsyptK/IatSex81qdJoMLJg/1jiPBZPpJtdPtCgNWh8++YzYDI/ynrMKke/8yRtWI5dgUsmGNbvESSrdbeMRa2jEWo52lcDKRw4=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9F3C0A4C47BD;
 Sat, 19 Sep 2026 17:59:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSn-000000005Jx-3fOT;
 Sat, 19 Sep 2026 15:58:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:57:48 +0200
Message-ID: <20260919155845.5776-24-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v2 23/77] package/poco: convert to CMake package
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
