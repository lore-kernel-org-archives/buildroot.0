Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDCAC9830E
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD4F46069B;
	Sun, 27 Sep 2026 10:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TFFmRSZ18ueh; Sun, 27 Sep 2026 10:54:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 941DD606A0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506481;
	b=hgizl/DuEKiCnB4rB9wjEC4ynF0fS77rahgKMHBtE7T5V4s/IIaGVwWCzAhDmeJsXqGs
	 xiNE4yL2X1uXlkK9bSD1B+H8J+JZr0EU2TPcUvmRtiKdWE1uK2IpwXxnSfcTMwdcHML/u
	 x8+5W0HQE1td5LzqdbGg9mmJhNIL09smTAzeO9qZ+Oe0CdmIY/B4IpQxF3ximn1QuuVNH
	 ETe/aUbMeXVmp9B+ojHglgc6H+26blYYIhOQ6af+/9EL0Tm4Avb0dsox0u2UtPHlP6b3p
	 R4CAfAjUg8+Bx9k60kSI9fmnc3+Dt1qHJ22LF/re+pVIWXhYyGIPg7pDFGVtOhZFLSg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506481;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=rthfJ1MNczkXmFY/TvB9J+i3xeon7CRl6K71JvMjDFc=;
	b=Gi+k3+84frIQbSagdYUa96af9d/W+vBwnjCVUZgsO2u22CPZ6tSrzFFN/t38Gzd3Gnyr
	 k4JzQRDgYIKTyndI5kQyN9UGOg6coQ9kl8pz7ipneYgOVTyB9lBWPABaK+/a/jfxeZyDm
	 +jCTLniCKo+MTtmyPL9dikdFRt/9Tc4yknlH3ELQuKBYUAV3WlzIfurLfyrXrFYEhTa0m
	 Z6Bshbm6ZPBraQhy9CarvQY1vaueg2A2OTccNGvd5lRs89hVsMulvDwYyOPZ/xmQbR45w
	 ZMC8fCu3KwPCAKmixec9VWWbL/5QiUuu58wXkfbklxKtfwwUQmI9DNpKtz9dqPsd6wQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506481;
	bh=rthfJ1MNczkXmFY/TvB9J+i3xeon7CRl6K71JvMjDFc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=AO9C30kJ0swsZpLmeOIhIvOsl3gqm5j6ntgKHiiS0EXjM0CLFeKTJBS9GLoD8aLR8
	 89s0EPWiZBdqiFvznK+hDKb8yE2HqYWSoy7PHVaohjgaSe7QvfB2dDd1vjkao/orhQ
	 uBGdTYRO4SPaaJxfNJrka3V1jwDz+JYZWxsLLRamsoDh+znX66YGgZ1jFBR1UQMtek
	 DAaSh3vk21KQ8oGP6x7NoiAcyWrF5rjqxyA/kLSXLzhXcTqq4qfGGKvEoOLnS4hVyS
	 sGpCJk9DNEN9Ub77Ty6dpHY7ZoV2VTce4fvJk4fbV1D6vauyJ80vf/mH+I1WtyavJC
	 4VxM25UMYiWag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 941DD606A0;
	Sun, 27 Sep 2026 10:54:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AAE9FD1
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90F0240B16
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:54:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Whad37ElobA5 for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:54:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5165940B0D
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506479;
 b=BKvQYnuUGmGTpqPUBp5N5YuBMsZdmzwfPh/wDU7JRmGrqbrgqkOu3bFmCSJE25NvNi7O
 flOmOMwlU4ny/pK1KQRXMaZabdmEfB3uz2yW+oHirrHjSYlMc8HlKlj7CcbhuHwasKKsb
 Q7LZZaro5/CazJg7TK9RBpSnyloSK3Y9x7cZq8lHUmU3usRK6B5lJ6DxGgLdSWQ0uLu23
 a7MlqIeedGBPxQ8v0FEIz6plV1P68djosvRYqla4nYe6NaF4e7kONjHo8dRfKz1TCtSTb
 94E37ffoOi6u/++St3zXXBtWOwo5k1yv5H+hWrf9Yx7b+4RRjkYEmJfbzU7FBGMwhpw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506479;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=oWr+HyXqZdC7qkBCzqx/nRb0rgeeo4ZYcfTHo7wFtDI=;
 b=G0BmlNCisnPsGQGtidgwJS6eDcPJ+jI2yNbKI0zgXRtd5r92eeyy1T2/kZF6rH7jCnGq
 8hC/gA8o3evfMNOsgr3Yhs/oKCfbb8PjFqa2zJh1fplGVnDyBwiaAKTufSSwz85vD5ev2
 KwOnYlSAuqj3KgjtV5LJs8YW6N7TaToPbpRR6j+fjdCOE1xvT1cueQ69I39cLHov+h48A
 FpTAxgWTMd3UpAH2TC0aJAc8k8VpN4MfC0iQdyHN2yPGGfbeGZUM9aMJMNWfsJCxnIqj/
 YzoktAlXqKW/UOvWuD86gCtYEtpqj4ry4UnQ8krgVUcGJXledGOjcVmneSyz2Yk4RFw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=cHfiLhR7; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=cHfiLhR7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5165940B0D
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505857;
 bh=oWr+HyXqZdC7qkBCzqx/nRb0rgeeo4ZYcfTHo7wFtDI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=cHfiLhR7dPjPlqnX7BEGgSpJIpxrFS/PBXz6r3bgU9bdyJK+QY23g7iHtpfIbIftM
 X3oOVQHPkDS9Fkhu/wuhYViaHtRB2bXXFEuZM9FZYxF8YS5+9B4JGOrUEyNvaZJ76u
 hZ2PfPYdBzMGuxw42GsHrODGeksYC/zqNLYLeBkxJxiDprwKMEeNNXsH3RwkcVqYRM
 n4mD5wrp1IKXzDdrvDCZVkl8w7WgRkZReEAz0gKjTUCwYDUznmpjx79/d8I0zPjPBF
 I+iXK2KmZ3dYf4QK3TYxSbCgEP+NQVOuCKAflNkdOAHZViWRJzQa0VCvWWFqxhNMNC
 qmCOCMj6Ow4xA==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 FB+490aIhhDo8aqw2y+1aRm/JWgTAN86JaMPLxn82AFKrsDiBHiuGx6YJm42S4TiqXfvV11MNNK
 e298EXEXz6PN41uN3RtaitFtFXBQVZL/XbMeMtH9w1ohQilgbit2hLZThryxvPBJsTdby1iQ3NV
 yMfANB1guQWhnRh+yaPlXTczQoKoiM62iqNu5ES7l6OzO5u2GjAMVcNp2dBRidxkCKhrh/BJnZc
 m0ipVFIJ6qiDXT6guWGgUQighhAF4hNd+LziHfUpnX1Vn3YHcLnsWNNbfMNJarqlEon2N3ptvXn
 p0LYgnfP6tVfxCLgO1gzKDaNcIw6s+DmephQN06IZy9U+nS11kCZR3MG5el9YS4xsLLIu5enHtj
 3kcC6fb4wV5lMugbb39mkjKWq/B6wjkYCvhfUIcaabZ3wxYKVsZoz5PHWvIy+D1jWpykkLl3pNF
 CiDMudp81/34CAp6r58+f/l3xMjt9JIIcpZO+LmuqQ/bKUZUuavo2W8VLXwUKExjnmJvvgVQ5IB
 SflaUUwL/tjZ5feil7fsFh9JSUf1HRoXU9+KbZqggV+eQLoubcBbbMqYWoecVasJmcYPnVpHHBs
 aqMA1aQ6dbKaw+9NYQjvL9s8bzi7QAIYuOHj0lwPWOcNVoCTQk90osAhj2iHHkLA8mSZZkCJHz3
 8+ueDGsXbaWjCb97qKxniYSV78Z1XgZnZb+VvMTBeDgID3go6bgCuu2Z6eaQOojY=
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2FE6BA4C4FAD;
 Sun, 27 Sep 2026 12:44:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLb-0000000007a-0K4c;
 Sun, 27 Sep 2026 10:43:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:06 +0200
Message-ID: <20260927104301.1801638-29-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v6 28/82] package/poco: convert to CMake package
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
Cc: Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
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
