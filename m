Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88090C982D8
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5764840B02;
	Sat, 19 Sep 2026 16:08:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x347UBtPya-X; Sat, 19 Sep 2026 16:08:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org EE3A340B96
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789834137;
	b=eUgD2Q5Y2hlu8OwneCY0Q4pUJgKZOM8r7Z2I7ppROAT9LnBAZpB3KH3RODPmKYsD4dX/
	 rjWomRiVqrESP6lMr8Oy9Jysu9CsRhzORzIwfBGUtUjPn/x2cmy5b4nAHZEmlW2tqUoUZ
	 bnAglH9p77L/10PD39hgGVKp0EBUb7VN5VijbYrYsb9IInrrYyIFJQwXhmjHDLMGwSZHl
	 crH6EGTJ8BXO3UKcHK9yv6xnchwfh3/+QTXKpq/Z5j0hWGrybpYs7MGNBX6LWhkCpM+bb
	 koGvw5VgxSSeW76armahjvVa4CC4iMheIlGZV5KAFRkoFzasMZTMyneyHinpy0yp0UQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789834137;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=b9zc2FRgCwvtPufGvhXGNQGhBqh2le0NTMAIVT70MEQ=;
	b=LkczcEPI99H0OPYZYexrAKKhJtV9OcErTIMg8tE0CVr2cOwuwH8TtwwYtOsqas5qUNPX
	 K6kITb3xX3oISGW6fxbH3xlTckJMZTZrC7HDwpLFh/ZZPMoZjOC7RatEWVXhjQ5rALvIe
	 2X65C+wq8cM3KnH+xfNViBD0Mn33rvTQeXyS93QnMTPOCRJSWwYK4WNAaV1C1ydMlsIYO
	 qO4x1ii2jgIE5Q2uAj/T5CNSmvlUwE6uSAU47d1gce4rnIIfyTyEc9q/okcfDNY3Fb0Em
	 4nBuGVgSvHZ0CnYxJizAPpBmTkpF63mWFUxA0UVv3s5Kxo0IQ0xlsHkjEIfYhQGhg9A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789834137;
	bh=b9zc2FRgCwvtPufGvhXGNQGhBqh2le0NTMAIVT70MEQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Zu1CbHPgllOVGaAWgObWGeOkqOVN9/owLqXQCE/8uyFq7rPXS9z+CGE0W0Y/+DYrL
	 kWxTsAhOW24pANP+Lhewv4SYIuPbzsiwh4pqDw7506ehsR+AmfWz6JEQ49kzp5us3Z
	 Y7SmNcfciFtJTI1HS9OLRB6t+xVMeYGZ0tCewjnvN+aJZffWoqf2Qpi8nZnjznfaY/
	 rpcpbFyQ7Iek358LWZLF2OEkeg9ZfsKQlX+m1b1oFd9NNUJW+DesrLcF0lLuSJIW1O
	 VCMmEJl9ksAaWuKdRBeH5MWM6nmygXRV2iG2S4iN5+n0fpMdAFAZfJFwJ6oUHonAD9
	 OvusHwOgtTc5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE3A340B96;
	Sat, 19 Sep 2026 16:08:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BDD5224D
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A37BD606C4
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:08:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4f2hkawDD_SR for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:08:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 139A1606A5
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789834133;
 b=lcQriMOtEauiG1SWUgFqxXxsyuj/UVCWxOc50oIwt4D29fWYl6htnlPYJ6qgFeEZBneF
 L92asa6QWEM3N9KbatK5FINtwBikqMG8LTP4BsH2I55giojyNHG5etBln6WVRBtTbusAF
 OSLCNDbTwOhm9rIAsdoPHVaFgHN7NumA6bQSivuL82YnvvYjW3Qw3pLmevF6zuLHVcFIj
 OnmYGNe0olm/9WU528ZfoRM2iSS6COyjS6r4tcd1NHGYQoJvzIhNpP0AmaB5VcIN8WI2Z
 utHEIf4gOVKUXU43Ca0wp8Vs2BKyzLZrkcoN98Am5R1FKgvjCjoDksRq9lj63cb0eRA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789834133;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=yg2z97YeOEumuaymd9fRIxcsWLELvqjxQZqPNf0LMks=;
 b=rzY5rj2ogO9s2Inaot/Xk9jBUcRVt1VqktaaEgKKvhFQ/mLCb5scIV7qMdNwPuqzzZLb
 ekhdJYsP8NmOgIbK4O+NUY7dCHoppHCLHD2UZLYXJ91TfxwP7X0h9LOWu4A/VOV5diQfF
 cQ5bwILZKvQ6euSKYhQgNIhnL38FYFOarJYppM2mxx6mWcVXJNKrZ7M8UU3mpbWWc8VO9
 htmbCT1mZyS5X3RLUGgXi/nVaR6WmQx3hXHyHCcb9Sdj3eIlAhEamm8Vp6LbQlcWLDxPr
 q1U8JTknYmvYm2x7NlCcJVf2XW2OCkYJnp3BYW/6dHNuD6nysr0Ntnsx1TDobqZuajA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=X8srOwGm; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=X8srOwGm
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 139A1606A5
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833550;
 bh=yg2z97YeOEumuaymd9fRIxcsWLELvqjxQZqPNf0LMks=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=X8srOwGmDbhIAkiJSXmpNYksuppAzGxgeG/2MYHsjU5ThDsTk+znBUDaIXorSiWkJ
 sEcXDlGwqnB5v1obPI3kRfXH30HWO/ZFOpJ2XtsnFasXIiEzsBjykHayc7/wIBs4e0
 0FoM57MJEeW3rKhWCQNzpdH1mkxFirD0tqhGXdfl/idX9zYgcrwAVQcFbhI6Oru1RM
 9IqL9ptl5xeSjniMzH24AebrXBgXOQVN90Cnr9Ymiz/FEKdnPc3DmbkOCS+xHS6PQv
 uvEnnb3WPT/jFEq2Uu7h6pZH1w7SVzqtZkLa8JZR/Jye+WeVYISXgRzYM4iLPvs2wg
 rRKAtBuu3WfRQ==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:1o2A0E9qUTB8fP4510vZ3eKdxVhFkwZ7jzfC/7Y7AFzvBlFEMkXDGxiAgj3eFtfTcQV/lfOCn0JLpXi2FB005lRcykk+ZW3gc5XreqgEPh0ZwM0E5Qih3BR/GwpZbcmuDS9xCYVii4uIzyjVbySBGKvOab3j1lXW6XlGpsPrJdq94LJxeK6Hs0d+708j5n/bp9pRX1ie68+ZfDsKLIKVMko/F+sJgywYvDzUqunJ8O+mL60SuImBH1XDBs9YWG6q9H4omCDCLzhCnVAmKt6EQy+WvsP0vWnKA3ulQQAC+NuenJ8AB7m+AgKlrkDf+Kto8gFR0JfonYeLZyoC0LmhqOPo53ZUAxlVaWDQhhs0WkqEcRCi97N92Z7i7vQDFtqrMuK9iFQUqhxbrTki5kFt1BO6QQjcrmHbW2T38fZEgg9vps2XrubKTxgV2ZDVBM5WYrdzl9i7Y94jmT034LYN5k20x0pTWEFjjoa52R1oqP8Uyk1Sv1MDg8R45EiLiEnaFhtitBOeotL+iVeYE9hVx81NHAmFqFt1MFHINre6cNRqdQu7wMxQXVw5bFWrKt1pMRxMPno1n6dhd+ZlM3/sL4bTPga8V1f2fdF0G6RMty1INB
 6FKhXs05ubuk78Y/cXJPKjCHsjARpMMwaXTxd5UwzXScScBn9o4IgmVaUo0TLl633SIZEk
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9DDFCA4C47CC;
 Sat, 19 Sep 2026 17:59:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSq-000000005Jx-160Z;
 Sat, 19 Sep 2026 15:58:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:58:06 +0200
Message-ID: <20260919155845.5776-42-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v2 41/77] package/grpc: Fix build with OpenSSL
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
 .../grpc/0003-Add-support-for-OpenSSL-4.patch | 327 ++++++++++++++++++
 1 file changed, 327 insertions(+)
 create mode 100644 package/grpc/0003-Add-support-for-OpenSSL-4.patch

diff --git a/package/grpc/0003-Add-support-for-OpenSSL-4.patch b/package/grpc/0003-Add-support-for-OpenSSL-4.patch
new file mode 100644
index 0000000000..cc517a2461
--- /dev/null
+++ b/package/grpc/0003-Add-support-for-OpenSSL-4.patch
@@ -0,0 +1,327 @@
+From fb056ab0bb3ed003febe82f069ff41514288a4f3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Bj=C3=B6rn=20Svensson?= <bjorn.a.svensson@est.tech>
+Date: Mon, 31 Aug 2026 09:52:46 -0700
+Subject: [PATCH] [OpenSSL] Add support for OpenSSL 4 (#41932)
+
+OpenSSL 4.0 removes several deprecated APIs and changes return types of various getter functions to `const`.
+This PR fixes all affected code in gRPC's SSL transport layer, credentials, and tests.
+
+To handle the `const` return type differences across OpenSSL versions without version-specific `#if` guards at every call site, `auto*` is used to let the compiler deduce the correct type.
+Where downstream serialization and copy functions (`i2d_X509_NAME`, `i2d_ASN1_OCTET_STRING`, `X509_NAME_dup`) have not yet been constified, `const_cast` is used at the call site to bridge the gap. These functions only read the data, so the cast is safe.
+
+Tested by building and running SSL tests against BoringSSL and OpenSSL 1.0.2u, 1.1.1w, 3.0.13, and 4.0.0.
+Each commit message in this PR has some more details.
+
+RELEASE NOTES:
+
+* Add OpenSSL 4.0 compatibility.
+
+Closes #41932
+
+COPYBARA_INTEGRATE_REVIEW=https://github.com/grpc/grpc/pull/41932 from Nordix:openssl4 c2edc3d46ab7e87ced5d9d95710885a8a8c7a3e2
+PiperOrigin-RevId: 973935241
+
+Upstream: https://github.com/grpc/grpc/commit/fb056ab0bb3ed003febe82f069ff41514288a4f3
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ .../call/external/aws_request_signer.cc       | 16 ++++++++++
+ .../transport/tls/grpc_tls_crl_provider.cc    |  4 +--
+ src/core/tsi/ssl_transport_security.cc        | 32 +++++++++++++------
+ src/core/tsi/ssl_transport_security_utils.cc  | 14 ++++----
+ test/core/handshake/client_ssl.cc             |  4 ++-
+ test/core/handshake/server_ssl_common.cc      |  4 ++-
+ test/core/tsi/ssl_transport_security_test.cc  | 10 ++++++
+ 7 files changed, 65 insertions(+), 19 deletions(-)
+
+diff --git a/src/core/credentials/call/external/aws_request_signer.cc b/src/core/credentials/call/external/aws_request_signer.cc
+index f7fb7a25b1d0b..d3f506d095abf 100644
+--- a/src/core/credentials/call/external/aws_request_signer.cc
++++ b/src/core/credentials/call/external/aws_request_signer.cc
+@@ -18,12 +18,15 @@
+ #include <grpc/support/port_platform.h>
+ #include <openssl/crypto.h>
+ #include <openssl/evp.h>
++#if OPENSSL_VERSION_NUMBER < 0x30000000L
+ #include <openssl/hmac.h>
++#endif
+ #include <openssl/sha.h>
+ 
+ #include <utility>
+ #include <vector>
+ 
++#include "src/core/util/grpc_check.h"
+ #include "absl/status/statusor.h"
+ #include "absl/strings/ascii.h"
+ #include "absl/strings/escaping.h"
+@@ -41,6 +44,7 @@ namespace {
+ 
+ #if OPENSSL_VERSION_NUMBER >= 0x30000000L
+ const char kSha256[] = "SHA256";
++const char kHmacName[] = "HMAC";
+ #endif
+ const char kAlgorithm[] = "AWS4-HMAC-SHA256";
+ const char kDateFormat[] = "%a, %d %b %E4Y %H:%M:%S %Z";
+@@ -67,12 +71,24 @@ std::string SHA256Hex(const std::string& str) {
+ }
+ 
+ std::string HMAC(const std::string& key, const std::string& msg) {
++#if OPENSSL_VERSION_NUMBER < 0x30000000L
+   unsigned int len;
+   unsigned char digest[EVP_MAX_MD_SIZE];
+   HMAC(EVP_sha256(), key.c_str(), key.length(),
+        reinterpret_cast<const unsigned char*>(msg.c_str()), msg.length(),
+        digest, &len);
+   return std::string(digest, digest + len);
++#else
++  size_t len = 0;
++  unsigned char digest[EVP_MAX_MD_SIZE];
++  GRPC_CHECK_NE(EVP_Q_mac(nullptr, kHmacName, nullptr, kSha256, nullptr,
++                          reinterpret_cast<const unsigned char*>(key.c_str()),
++                          key.length(),
++                          reinterpret_cast<const unsigned char*>(msg.c_str()),
++                          msg.length(), digest, sizeof(digest), &len),
++                nullptr);
++  return std::string(digest, digest + len);
++#endif
+ }
+ 
+ }  // namespace
+diff --git a/src/core/credentials/transport/tls/grpc_tls_crl_provider.cc b/src/core/credentials/transport/tls/grpc_tls_crl_provider.cc
+index 5e24c18ee6127..dc95ba8457121 100644
+--- a/src/core/credentials/transport/tls/grpc_tls_crl_provider.cc
++++ b/src/core/credentials/transport/tls/grpc_tls_crl_provider.cc
+@@ -56,12 +56,12 @@ absl::StatusOr<std::string> IssuerFromCrl(X509_CRL* crl) {
+   if (crl == nullptr) {
+     return absl::InvalidArgumentError("crl cannot be null");
+   }
+-  X509_NAME* issuer = X509_CRL_get_issuer(crl);
++  auto* issuer = X509_CRL_get_issuer(crl);
+   if (issuer == nullptr) {
+     return absl::InvalidArgumentError("crl cannot have null issuer");
+   }
+   unsigned char* buf = nullptr;
+-  int len = i2d_X509_NAME(issuer, &buf);
++  int len = i2d_X509_NAME(const_cast<X509_NAME*>(issuer), &buf);
+   if (len < 0 || buf == nullptr) {
+     return absl::InvalidArgumentError("crl cannot have null issuer");
+   }
+diff --git a/src/core/tsi/ssl_transport_security.cc b/src/core/tsi/ssl_transport_security.cc
+index 6c1f20ebb5374..29ec47eeeef41 100644
+--- a/src/core/tsi/ssl_transport_security.cc
++++ b/src/core/tsi/ssl_transport_security.cc
+@@ -49,7 +49,9 @@
+ #include <grpc/support/thd_id.h>
+ #include <openssl/bio.h>
+ #include <openssl/crypto.h>  // For OPENSSL_free
++#if !defined(OPENSSL_NO_ENGINE)
+ #include <openssl/engine.h>
++#endif
+ #include <openssl/err.h>
+ #include <openssl/ssl.h>
+ #include <openssl/tls1.h>
+@@ -1021,9 +1023,7 @@ static int looks_like_ip_address(absl::string_view name) {
+ static tsi_result ssl_get_x509_common_name(X509* cert, unsigned char** utf8,
+                                            size_t* utf8_size) {
+   int common_name_index = -1;
+-  X509_NAME_ENTRY* common_name_entry = nullptr;
+-  ASN1_STRING* common_name_asn1 = nullptr;
+-  X509_NAME* subject_name = X509_get_subject_name(cert);
++  auto* subject_name = X509_get_subject_name(cert);
+   int utf8_returned_size = 0;
+   if (subject_name == nullptr) {
+     VLOG(2) << "Could not get subject name from certificate.";
+@@ -1035,12 +1035,13 @@ static tsi_result ssl_get_x509_common_name(X509* cert, unsigned char** utf8,
+     VLOG(2) << "Could not get common name of subject from certificate.";
+     return TSI_NOT_FOUND;
+   }
+-  common_name_entry = X509_NAME_get_entry(subject_name, common_name_index);
++  auto* common_name_entry =
++      X509_NAME_get_entry(subject_name, common_name_index);
+   if (common_name_entry == nullptr) {
+     LOG(ERROR) << "Could not get common name entry from certificate.";
+     return TSI_INTERNAL_ERROR;
+   }
+-  common_name_asn1 = X509_NAME_ENTRY_get_data(common_name_entry);
++  auto* common_name_asn1 = X509_NAME_ENTRY_get_data(common_name_entry);
+   if (common_name_asn1 == nullptr) {
+     LOG(ERROR) << "Could not get common name entry asn1 from certificate.";
+     return TSI_INTERNAL_ERROR;
+@@ -1081,7 +1082,7 @@ static tsi_result peer_property_from_x509_common_name(
+ static tsi_result peer_property_from_x509_subject(X509* cert,
+                                                   tsi_peer_property* property,
+                                                   bool is_verified_root_cert) {
+-  X509_NAME* subject_name = X509_get_subject_name(cert);
++  auto* subject_name = X509_get_subject_name(cert);
+   if (subject_name == nullptr) {
+     GRPC_TRACE_LOG(tsi, INFO) << "Could not get subject name from certificate.";
+     return TSI_NOT_FOUND;
+@@ -1177,17 +1178,30 @@ static tsi_result add_subject_alt_names_properties_to_peer(
+       char ntop_buf[INET6_ADDRSTRLEN];
+       int af;
+ 
++#if OPENSSL_VERSION_NUMBER >= 0x10100000L
++      if (ASN1_STRING_length(subject_alt_name->d.iPAddress) == 4) {
++        af = AF_INET;
++      } else if (ASN1_STRING_length(subject_alt_name->d.iPAddress) == 16) {
++        af = AF_INET6;
++#else
+       if (subject_alt_name->d.iPAddress->length == 4) {
+         af = AF_INET;
+       } else if (subject_alt_name->d.iPAddress->length == 16) {
+         af = AF_INET6;
++#endif
+       } else {
+         LOG(ERROR) << "SAN IP Address contained invalid IP";
+         result = TSI_INTERNAL_ERROR;
+         break;
+       }
++#if OPENSSL_VERSION_NUMBER >= 0x10100000L
++      const char* name =
++          inet_ntop(af, ASN1_STRING_get0_data(subject_alt_name->d.iPAddress),
++                    ntop_buf, INET6_ADDRSTRLEN);
++#else
+       const char* name = inet_ntop(af, subject_alt_name->d.iPAddress->data,
+                                    ntop_buf, INET6_ADDRSTRLEN);
++#endif
+       if (name == nullptr) {
+         LOG(ERROR) << "Could not get IP string from asn1 octet.";
+         result = TSI_INTERNAL_ERROR;
+@@ -1472,13 +1486,13 @@ static tsi_result x509_store_load_certs(X509_STORE* cert_store,
+       break;  // We're at the end of stream.
+     }
+     if (root_names != nullptr) {
+-      root_name = X509_get_subject_name(root);
+-      if (root_name == nullptr) {
++      auto* root_subject = X509_get_subject_name(root);
++      if (root_subject == nullptr) {
+         LOG(ERROR) << "Could not get name from root certificate.";
+         result = TSI_INVALID_ARGUMENT;
+         break;
+       }
+-      root_name = X509_NAME_dup(root_name);
++      root_name = X509_NAME_dup(const_cast<X509_NAME*>(root_subject));
+       if (root_name == nullptr) {
+         result = TSI_OUT_OF_RESOURCES;
+         break;
+diff --git a/src/core/tsi/ssl_transport_security_utils.cc b/src/core/tsi/ssl_transport_security_utils.cc
+index 7318bc3f78057..9bf292821565c 100644
+--- a/src/core/tsi/ssl_transport_security_utils.cc
++++ b/src/core/tsi/ssl_transport_security_utils.cc
+@@ -282,11 +282,11 @@ bool VerifyCrlCertIssuerNamesMatch(X509_CRL* crl, X509* cert) {
+   if (cert == nullptr || crl == nullptr) {
+     return false;
+   }
+-  X509_NAME* cert_issuer_name = X509_get_issuer_name(cert);
++  auto* cert_issuer_name = X509_get_issuer_name(cert);
+   if (cert_issuer_name == nullptr) {
+     return false;
+   }
+-  X509_NAME* crl_issuer_name = X509_CRL_get_issuer(crl);
++  auto* crl_issuer_name = X509_CRL_get_issuer(crl);
+   if (crl_issuer_name == nullptr) {
+     return false;
+   }
+@@ -317,9 +317,9 @@ absl::StatusOr<std::string> IssuerFromCert(X509* cert) {
+   if (cert == nullptr) {
+     return absl::InvalidArgumentError("cert cannot be null");
+   }
+-  X509_NAME* issuer = X509_get_issuer_name(cert);
++  auto* issuer = X509_get_issuer_name(cert);
+   unsigned char* buf = nullptr;
+-  int len = i2d_X509_NAME(issuer, &buf);
++  int len = i2d_X509_NAME(const_cast<X509_NAME*>(issuer), &buf);
+   if (len < 0 || buf == nullptr) {
+     return absl::InvalidArgumentError("could not read issuer name from cert");
+   }
+@@ -339,7 +339,8 @@ absl::StatusOr<std::string> AkidFromCertificate(X509* cert) {
+     if (X509_get_ext_by_NID(cert, NID_authority_key_identifier, j) != -1) {
+       return absl::InvalidArgumentError("Could not get AKID from certificate.");
+     }
+-    akid = X509_EXTENSION_get_data(X509_get_ext(cert, j));
++    akid = const_cast<ASN1_OCTET_STRING*>(
++        X509_EXTENSION_get_data(X509_get_ext(cert, j)));
+   } else {
+     return absl::InvalidArgumentError("Could not get AKID from certificate.");
+   }
+@@ -364,7 +365,8 @@ absl::StatusOr<std::string> AkidFromCrl(X509_CRL* crl) {
+     if (X509_CRL_get_ext_by_NID(crl, NID_authority_key_identifier, j) != -1) {
+       return absl::InvalidArgumentError("Could not get AKID from crl.");
+     }
+-    akid = X509_EXTENSION_get_data(X509_CRL_get_ext(crl, j));
++    akid = const_cast<ASN1_OCTET_STRING*>(
++        X509_EXTENSION_get_data(X509_CRL_get_ext(crl, j)));
+   } else {
+     return absl::InvalidArgumentError("Could not get AKID from crl.");
+   }
+diff --git a/test/core/handshake/client_ssl.cc b/test/core/handshake/client_ssl.cc
+index 1952c6055094f..c985c0de926f1 100644
+--- a/test/core/handshake/client_ssl.cc
++++ b/test/core/handshake/client_ssl.cc
+@@ -197,13 +197,15 @@ static void server_thread(void* arg) {
+   OpenSSL_add_ssl_algorithms();
+   args->ssl_library_info->Notify();
+ 
+-  const SSL_METHOD* method = TLSv1_2_server_method();
++  const SSL_METHOD* method = TLS_server_method();
+   SSL_CTX* ctx = SSL_CTX_new(method);
+   if (!ctx) {
+     perror("Unable to create SSL context");
+     ERR_print_errors_fp(stderr);
+     abort();
+   }
++  SSL_CTX_set_min_proto_version(ctx, TLS1_2_VERSION);
++  SSL_CTX_set_max_proto_version(ctx, TLS1_2_VERSION);
+ 
+   // Load key pair.
+   if (SSL_CTX_use_certificate_file(ctx, SSL_CERT_PATH, SSL_FILETYPE_PEM) < 0) {
+diff --git a/test/core/handshake/server_ssl_common.cc b/test/core/handshake/server_ssl_common.cc
+index ece1b6f50109e..7cb8f95e578f3 100644
+--- a/test/core/handshake/server_ssl_common.cc
++++ b/test/core/handshake/server_ssl_common.cc
+@@ -187,13 +187,15 @@ bool server_ssl_test(const char* alpn_list[], unsigned int alpn_list_len,
+   // server port.
+   s.Await();
+ 
+-  const SSL_METHOD* method = TLSv1_2_client_method();
++  const SSL_METHOD* method = TLS_client_method();
+   SSL_CTX* ctx = SSL_CTX_new(method);
+   if (!ctx) {
+     perror("Unable to create SSL context");
+     ERR_print_errors_fp(stderr);
+     abort();
+   }
++  SSL_CTX_set_min_proto_version(ctx, TLS1_2_VERSION);
++  SSL_CTX_set_max_proto_version(ctx, TLS1_2_VERSION);
+ 
+   // Load key pair.
+   if (SSL_CTX_use_certificate_file(ctx, SSL_CERT_PATH, SSL_FILETYPE_PEM) < 0) {
+diff --git a/test/core/tsi/ssl_transport_security_test.cc b/test/core/tsi/ssl_transport_security_test.cc
+index 806495f87ccca..8c3f4677495ec 100644
+--- a/test/core/tsi/ssl_transport_security_test.cc
++++ b/test/core/tsi/ssl_transport_security_test.cc
+@@ -23,6 +23,7 @@
+ #include <grpc/support/string_util.h>
+ #include <openssl/crypto.h>
+ #include <openssl/err.h>
++#include <openssl/evp.h>
+ #include <openssl/pem.h>
+ #include <stdbool.h>
+ #include <stdio.h>
+@@ -985,7 +986,16 @@ TEST_P(SslTransportSecurityTest, DoRoundTripForAllConfigs) {
+ TEST_P(SslTransportSecurityTest, DoRoundTripWithErrorOnStack) {
+   // Invoke an SSL function that causes an error, and ensure the error
+   // makes it to the stack.
++#if OPENSSL_VERSION_NUMBER < 0x30000000L
+   ASSERT_FALSE(EC_KEY_new_by_curve_name(NID_rsa));
++#else
++  // Use EVP_PKEY_CTX with an invalid operation to push an error.
++  EVP_PKEY_CTX* err_ctx = EVP_PKEY_CTX_new_id(EVP_PKEY_RSA, nullptr);
++  ASSERT_NE(err_ctx, nullptr);
++  // Calling sign_init without a key will fail and push an error.
++  ASSERT_LE(EVP_PKEY_sign_init(err_ctx), 0);
++  EVP_PKEY_CTX_free(err_ctx);
++#endif
+   ASSERT_NE(ERR_peek_error(), 0);
+   SetUpSslFixture(/*tls_version=*/std::get<0>(GetParam()),
+                   /*send_client_ca_list=*/std::get<1>(GetParam()));
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
