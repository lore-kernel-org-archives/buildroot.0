Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5923C98324
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86BE740501;
	Sun, 27 Sep 2026 10:48:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CGAT-5grWkMR; Sun, 27 Sep 2026 10:48:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4AC7A4050A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506129;
	b=J3OA6k1tGUlSF8h1kKPRx6qnN4PafAMqoJbanVZShqrbCGXu7LkIzQ+dyuJMUyoHWbkM
	 BbLHxcDuKVUmlyn25hRDDO90q7UiaS5AAi5Imxhf8NLGSISREpKfkHeOnSMToUwh8eiMe
	 0bPEFQul3T3uFW78vU+K6C0E9vFgC8kUj8Hm6Crpv51XY73nIfLqzaYZN344EylmR77jl
	 QYd0AEJefDQYMvzZv0WuVuYo8Pm3uG8OEbeJpkRtJkRTG00gz+nDusj30x1PyU3iR1Ohe
	 8r5uLkou7+jxhw+2uK+hGtbJay5EVRWH3KwFBnt7eGRtlu5JfG2+X4RLg8yvkAXVWQQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506129;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=LkCRmXzEA14VekCqJmC8pfyK8xjF+wrdKE3bdo/HKPI=;
	b=qwMkTXMj+6SCsHBKSXRg9ZOhhx4WYUetKsnM1Ooszof9SFswjs5xvmzElvkoXFZBfkQ5
	 KppCjTOtIBDQAIbPmZZtm6xH27nFdcAMbnlRHrdG11gpNEqWCtUkAy938RxQNIqP8RgZr
	 J/HbcZDb4EByvyK3kt5GRZ2RVqYzMy4MeYfi/qrKOpjFKCTS6kuv9Y50KbQw4wYupxQsP
	 igwUjsUfuI0vvR2e+JfPcXtpi0HyG8L3wiuh8hnIZZFk2zZp9x9ejYNxu1MPFxextfRQ2
	 SpGiwP5zLKj8wlp2z9wRDFlDhnsPHy94CJZPJPSbd7W8JYaDA46bymjdDstDF/r7ySQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506129;
	bh=LkCRmXzEA14VekCqJmC8pfyK8xjF+wrdKE3bdo/HKPI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=XBqUK4IVrRZMPdzNESj/rsMchXJMVKSHH1uZepun+pUSu7Ajt+8IFRWZJNIWcU5AX
	 dDGJXxOS9tckiIr4GpPDHwe8JlE+AdmabQeH+r6MuhRKHh5AaEU72MtF70zIEWm+5j
	 UFaWCPu5Gic/dprXVdx/OZ/HKJIeQgfG5xSVntzQSSFPFpW6bL5g5gH1IDaL1NSU29
	 tyBu/NRCvo3mvJnZi20KJonUDNGrZnoogQNGJT0Zz/9u5Tx63/gh5Wn9mJkQLYXNoc
	 /WlBPeud1hdm+1EKQ549Gw19aoHOEcxGPJvdamMclcopala6dVnR6/U3T/RMuKe/zl
	 3rJ3ymF+b1vJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AC7A4050A;
	Sun, 27 Sep 2026 10:48:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B725335
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 412C0810C3
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:48:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jXfs1-fay2FM for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:48:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DAE45810C2
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506126;
 b=gWq5Tm2KjB28tkqBLQowgYPO8AWWbOXmdgPdfhZ6uesrgL7CtgtWVzs0/i6HVqh8kIQi
 xvGkXHK+VOC+lFNhmX4NpfP9Zl11zXGRsSBw+/8NJLctM1o11P/Oh0fysYvOdcPg3bmvM
 dv2a05NMRpADiXIVUTxISUAhmZa+ZZDwI4RTFFmVgEtb1xNGN2jnaPv9qgeTCAwcs/dP0
 dMPUwsYc1yUCswNZp48RCoD6UOGFzXqq3NLmhEABtCTXvQg9PEegGbMe8EHX/Fb4Z3X3O
 5d3RNFmvlVbLLRg0AAABeQldXV6iny5MldRRpX3bnv+BTWkGmUByxMqdrcn+rz5lAqw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506126;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=El5Eb0+i8zpcTDiZtpWOe9Z2uNOQ4hE8n0T93bTQeys=;
 b=MrlyNolCeyXn9HYwnzKGhvDhkHfGJ1R1Z09gNJbtQUKThq//M9h4sSVyN41CJZOtxreQ
 DixjNI69qnBHwJYJE2XN3OLFf2zlcDaGx5JNpUByz/7h+KlwxjPKTKfKTxsML/ckp6fIu
 +l6QesKCHaI2tU7aQGBpFN2dDqUtlL73e2LYq6Ns6fDtj6vQYOZWm/8zeyJa7eSn41OpI
 sh33xMOuFFHZ4UkIPS4bP9mgJE35BupuwG84ThqvFiPDySHHF3ALmEK53xkZTF2SP4Cji
 j2B4V0pYKo0qejHz6S/yCo7bKku46tjgsbUu9sBD4XywiPiXBo08lIzEwipAPNuXM6A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=cb1SxdBL; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=cb1SxdBL
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DAE45810C2
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505840;
 bh=El5Eb0+i8zpcTDiZtpWOe9Z2uNOQ4hE8n0T93bTQeys=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=cb1SxdBL1+vxWGkJSNVGAX1ER/hsn51RIGplGcrP+uMcpo2bi6MNvnJD2mLkHHEgR
 8clsKrCJZxMT4jVWbu6xbs6CscRp5Au/JbAWJaRyXtU3TEtArZiZ73AKT1ZNK+j/RO
 V63ZTctD7W/aFd++uKa0UVh/ayjz3RgVf/tB3Gy7SF5/1Sa/aCFPNkyD7E76pc1I+s
 ekyPXbjJ/i5EhTB2fRF30gO1CuBSYDZ/XD8/99H7u4mvOSJ6nluFmkUSKJwbvucNHd
 YwNv0ma8mW80HsgZvjHMbBNU4+/7km2udRpsonA2y4u03FXP8gLfxhZv7MeymAhQYn
 C+khbKGWk7BnA==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 HJ2ejSB+TZaA4jmogRu50l903DAP22G+GZu0m7ugrfILdnlIxzxjSuFsYZUf52cvAfWjlS4IPfX
 Ye6J+EtMFa0+njoErTbf2ZsYeJOJra5pSOQoXIobygBuliXGahLhk9D7x0f5qL59Sx4a3iU1Ejm
 G3//Pav/tKfksYdlzcYcyXH2nKI9WxndnNBLmvTgIZ+NYDIaPNx3frxMK4lJSIRPn/9KWlM640d
 KSEGhcuctTR3K/QAq3j249HRId3JJFbARNlU7eLE2epQDzh346JnOjL5DSYKd0/Ij+1U2F+hacd
 XxzJ30TMwJmuWAwbgnpK50gkiG92FPIMbkW3cZJRYjMiR/dpi5HcKNpqK9Xj63H0SqTRZFMecHZ
 w2Q6mYJCiaY78PUZu9EkKJdmSINcE8n4/jp1lm/X9khJSTccr506/5MLqSN3xM5XkR3+OIOJUuc
 Qnakhd95AqUq3n444oVfWAC2KjherJjUreeRDELv0jWt7qGGownLr3j37pCSCDWr2dM+s0c27yj
 u9+VozusnrG3HTPyzKnUWvjZFT0XdLDkkYf7tq52eYmfCqOxHyaPymfQyHrYD5PdJly9gjIP1zd
 OVpdCvmCtiP6FF7N5QVcN4JrUzzmCA4LJ8Y+Dvl/RtuiDraYPZF1OJaVqCk2HQu9HwHCKWIdUuF
 G75eAHQgLIAaMvPsCguR5
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5931CA4C4F87;
 Sun, 27 Sep 2026 12:44:00 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLj-0000000007a-1f4n;
 Sun, 27 Sep 2026 10:43:15 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:53 +0200
Message-ID: <20260927104301.1801638-76-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v6 75/82] package/thrift: Fix build with
 LibreSSL and OpenSSL 4.x
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

Buildroot commit cf2471a9d958b0eaa2db3508e96b465eaa481f3e bumped the
package from 0.14.1 to 0.22.0 which includes upstream commit
https://github.com/apache/thrift/commit/98be76fc033f1d66bcfd09d4a22b86e8061e89c2

This commit added OPENSSL_thread_stop() which is not provided by
LibreSSL causing a build error.

To fix the problem we add an upstream patch which is a merged version
of LibreSSL fixes[1] and fixes for the upcoming OpenSSL bump to 4.0.0.

Fixes:
https://autobuild.buildroot.net/results/242/242ea99f1c1c29fcc364d59a6a7efc8f11bcf76e/

[1] https://github.com/apache/thrift/pull/3736

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...sport-Make-it-compatible-with-OpenSS.patch | 193 ++++++++++++++++++
 1 file changed, 193 insertions(+)
 create mode 100644 package/thrift/0002-THRIFT-6170-transport-Make-it-compatible-with-OpenSS.patch

diff --git a/package/thrift/0002-THRIFT-6170-transport-Make-it-compatible-with-OpenSS.patch b/package/thrift/0002-THRIFT-6170-transport-Make-it-compatible-with-OpenSS.patch
new file mode 100644
index 0000000000..7a5cfc5ce1
--- /dev/null
+++ b/package/thrift/0002-THRIFT-6170-transport-Make-it-compatible-with-OpenSS.patch
@@ -0,0 +1,193 @@
+From e460f4277fabede007c751969ab8fc161eadaa16 Mon Sep 17 00:00:00 2001
+From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
+Date: Sun, 30 Aug 2026 10:19:00 +0200
+Subject: [PATCH] THRIFT-6170: transport: Make it compatible with OpenSSL 4.0
+
+Make it compatible with OpenSSL 4.0:
+- Don't use ERR_remove_state(). It has been an empty stub since OpenSSL
+  1.1.0 and got finally removed in 4.0-
+
+- SSLv3_method(), TLSv1_method(), TLSv1_1_method() and TLSv1_2_method()
+  have been removed. The recommendation is to use TLS_method() instead.
+  LATEST points to TLSv1_2_method which is not going to work.
+  Make SSLTLS and LATEST point to TLS_method() for newer OpenSSL which
+  uses the highest supported protocol version.
+  Adjust the testsuite to only test those two.
+
+- The return value of a few functions such as X509_get_subject_name()
+  has been made const. Use the const pointer only for newer OpenSSL.
+
+- While at it, pull the libressl related change from #3736
+
+Client: cpp,c_glib.
+
+Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
+
+Upstream: https://github.com/apache/thrift/pull/3761
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ .../c_glib/transport/thrift_ssl_socket.c      | 11 ++++++++++
+ lib/cpp/src/thrift/transport/TSSLSocket.cpp   | 20 +++++++++++++++----
+ lib/cpp/test/SecurityFromBufferTest.cpp       | 10 ++++++++++
+ lib/cpp/test/SecurityTest.cpp                 | 10 ++++++++++
+ 4 files changed, 47 insertions(+), 4 deletions(-)
+
+diff --git a/lib/c_glib/src/thrift/c_glib/transport/thrift_ssl_socket.c b/lib/c_glib/src/thrift/c_glib/transport/thrift_ssl_socket.c
+index d6c7bb2ba..0681831cb 100644
+--- a/lib/c_glib/src/thrift/c_glib/transport/thrift_ssl_socket.c
++++ b/lib/c_glib/src/thrift/c_glib/transport/thrift_ssl_socket.c
+@@ -285,7 +285,9 @@ thrift_ssl_socket_close (ThriftTransport *transport, GError **error)
+       SSL_shutdown(ssl_socket->ssl);
+       SSL_free(ssl_socket->ssl);
+       ssl_socket->ssl = NULL;
++#if OPENSSL_VERSION_NUMBER < 0x40000000L
+       ERR_remove_state(0);
++#endif
+   }
+   return thrift_socket_close(transport, error);
+ }
+@@ -710,7 +712,9 @@ void thrift_ssl_socket_finalize_openssl(void)
+   ERR_free_strings();
+   EVP_cleanup();
+   CRYPTO_cleanup_all_ex_data();
++#if OPENSSL_VERSION_NUMBER < 0x40000000L
+   ERR_remove_state(0);
++#endif
+ }
+ 
+ 
+@@ -832,6 +836,12 @@ thrift_ssl_socket_context_initialize(ThriftSSLSocketProtocol ssl_protocol, GErro
+ {
+   SSL_CTX* context = NULL;
+   switch(ssl_protocol){
++#if OPENSSL_VERSION_NUMBER >= 0x40000000L
++    case SSLTLS:
++    case LATEST:
++      context = SSL_CTX_new(TLS_method());
++      break;
++#else
+     case SSLTLS:
+       context = SSL_CTX_new(SSLv23_method());
+       break;
+@@ -849,6 +859,7 @@ thrift_ssl_socket_context_initialize(ThriftSSLSocketProtocol ssl_protocol, GErro
+     case TLSv1_2:
+       context = SSL_CTX_new(TLSv1_2_method());
+       break;
++#endif
+     default:
+       g_set_error (error, THRIFT_TRANSPORT_ERROR,
+ 		   THRIFT_SSL_SOCKET_ERROR_CIPHER_NOT_AVAILABLE,
+diff --git a/lib/cpp/src/thrift/transport/TSSLSocket.cpp b/lib/cpp/src/thrift/transport/TSSLSocket.cpp
+index 48b96ebf7..e8d69a329 100644
+--- a/lib/cpp/src/thrift/transport/TSSLSocket.cpp
++++ b/lib/cpp/src/thrift/transport/TSSLSocket.cpp
+@@ -157,7 +157,7 @@ void cleanupOpenSSL() {
+ #endif
+   EVP_cleanup();
+   CRYPTO_cleanup_all_ex_data();
+-#if OPENSSL_VERSION_NUMBER >= 0x10100000
++#if OPENSSL_VERSION_NUMBER >= 0x10100000 && !defined(LIBRESSL_VERSION_NUMBER)
+   // Do nothing unless an openssl derivative is detected
+ #  if !defined(OPENSSL_IS_BORINGSSL) && !defined(OPENSSL_IS_AWSLC)
+   // https://www.openssl.org/docs/man1.1.1/man3/OPENSSL_thread_stop.html
+@@ -180,6 +180,10 @@ static char uppercase(char c);
+ 
+ // SSLContext implementation
+ SSLContext::SSLContext(const SSLProtocol& protocol) {
++#if OPENSSL_VERSION_NUMBER >= 0x40000000L
++  if (protocol == SSLTLS || protocol == LATEST) {
++    ctx_ = SSL_CTX_new(TLS_method());
++#else
+   if (protocol == SSLTLS) {
+     ctx_ = SSL_CTX_new(SSLv23_method());
+ #ifndef OPENSSL_NO_SSL3
+@@ -192,6 +196,7 @@ SSLContext::SSLContext(const SSLProtocol& protocol) {
+     ctx_ = SSL_CTX_new(TLSv1_1_method());
+   } else if (protocol == TLSv1_2) {
+     ctx_ = SSL_CTX_new(TLSv1_2_method());
++#endif
+   } else {
+     /// UNKNOWN PROTOCOL!
+     throw TSSLException("SSL_CTX_new: Unknown protocol");
+@@ -405,7 +410,7 @@ void TSSLSocket::close() {
+     SSL_free(ssl_);
+     ssl_ = nullptr;
+     handshakeCompleted_ = false;
+-#if OPENSSL_VERSION_NUMBER >= 0x10100000
++#if OPENSSL_VERSION_NUMBER >= 0x10100000 && !defined(LIBRESSL_VERSION_NUMBER)
+     // Do nothing unless an openssl derivative is detected
+ #  if !defined(OPENSSL_IS_BORINGSSL) && !defined(OPENSSL_IS_AWSLC)
+     // https://www.openssl.org/docs/man1.1.1/man3/OPENSSL_thread_stop.html
+@@ -800,9 +805,16 @@ void TSSLSocket::authorize() {
+   }
+ 
+   // extract commonName
++#if OPENSSL_VERSION_NUMBER >= 0x40000000L
++  const X509_NAME* name = X509_get_subject_name(cert);
++  const X509_NAME_ENTRY* entry;
++  const ASN1_STRING* common;
++#else
+   X509_NAME* name = X509_get_subject_name(cert);
++  X509_NAME_ENTRY* entry;
++  ASN1_STRING* common;
++#endif
+   if (name != nullptr) {
+-    X509_NAME_ENTRY* entry;
+     unsigned char* utf8;
+     int last = -1;
+     while (decision == AccessManager::SKIP) {
+@@ -812,7 +824,7 @@ void TSSLSocket::authorize() {
+       entry = X509_NAME_get_entry(name, last);
+       if (entry == nullptr)
+         continue;
+-      ASN1_STRING* common = X509_NAME_ENTRY_get_data(entry);
++      common = X509_NAME_ENTRY_get_data(entry);
+       int size = ASN1_STRING_to_UTF8(&utf8, common);
+       if (host.empty()) {
+         host = (server() ? getPeerHost() : getHost());
+diff --git a/lib/cpp/test/SecurityFromBufferTest.cpp b/lib/cpp/test/SecurityFromBufferTest.cpp
+index 08f76b3f2..1ff64087a 100644
+--- a/lib/cpp/test/SecurityFromBufferTest.cpp
++++ b/lib/cpp/test/SecurityFromBufferTest.cpp
+@@ -235,6 +235,16 @@ BOOST_AUTO_TEST_CASE(ssl_security_matrix) {
+           continue;
+         }
+ #endif
++#if OPENSSL_VERSION_NUMBER >= 0x40000000L
++	if (!(si == apache::thrift::transport::SSLTLS ||
++	      si == apache::thrift::transport::LATEST) ||
++	    !(ci == apache::thrift::transport::SSLTLS ||
++	      ci == apache::thrift::transport::LATEST))
++	{
++		// Only SSLTLS / LATEST is supported.
++		continue;
++	}
++#endif
+ 
+         boost::mutex::scoped_lock lock(mMutex);
+ 
+diff --git a/lib/cpp/test/SecurityTest.cpp b/lib/cpp/test/SecurityTest.cpp
+index 86640bd68..44815dfc7 100644
+--- a/lib/cpp/test/SecurityTest.cpp
++++ b/lib/cpp/test/SecurityTest.cpp
+@@ -364,6 +364,16 @@ BOOST_AUTO_TEST_CASE(ssl_security_matrix)
+                     continue;
+                 }
+ #endif
++#if OPENSSL_VERSION_NUMBER >= 0x40000000L
++		if (!(si == apache::thrift::transport::SSLTLS ||
++		     si == apache::thrift::transport::LATEST) ||
++		    !(ci == apache::thrift::transport::SSLTLS ||
++		      ci == apache::thrift::transport::LATEST))
++                {
++                    // Only SSLTLS / LATEST is supported.
++                    continue;
++                }
++#endif
+ 
+                 boost::mutex::scoped_lock lock(mMutex);
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
