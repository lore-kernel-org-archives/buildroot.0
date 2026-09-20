Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 340C2C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 005A640D89;
	Sun, 20 Sep 2026 17:10:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o3nJPnmJg--X; Sun, 20 Sep 2026 17:10:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 95FFD40DEF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924243;
	b=oI7gIzAGuC/CPM+LQ/VBaU3cQnKOkJOPRiaVtrHD6Awpxz6Z1DpnjuQkLdXosqBmHsCN
	 xUt5CPH3Y1ZKrHSwoxOtSaF23byQxZO2h1vagm+5wk5jCpoPPa+kgfYNjIW9woCywhqAU
	 7e0wl7ZhuYpdzoWKUxZ7iMnxyW3wYwgFBuqYuTcwZziz+Q9n5BcYcSrHNSNo+wv0W+i1o
	 DZ3A2F20OqOFSnS/fO8HI5phBNFYcPOqt97n7vMj2k/l5NSKWtI1JIj0A6BQKR/R2sMyJ
	 4Z9nHnIUsp9Jp2b0cRxhbXW6HL8ZoPtoP2Ipu2YXgKpIYrkcLNv8SB+vK9JB839YjtA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924243;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=LkCRmXzEA14VekCqJmC8pfyK8xjF+wrdKE3bdo/HKPI=;
	b=VPgOYM5aXIpRI84NU5YDVg2Cv6BvkvTU8SMyixC23nrbR3rHtT5O9nA3BFcfIqHup4aF
	 UvUIHo3vx4NuBzqfmuI/SdvRD7LHQnKjF1L03yVSHH5Xzl7yktxsrcizv4nD1KL+wPvvM
	 eTl9WC/qELafmBrso6KDliT54sTBzyKcczp1nlxKcMgcmRo4jJ2CLybay0nCgDNq+LwW0
	 /FKqt0FYVsQHn8cEqww6b3W8toUlpDCnDP29iVIQFu5Fs58Zgv41rsPFa2xRoA61wUNLU
	 HwimW6zbpAU9x5GvvVyKIVGP2CtJwgxx47BT1DRTFvsFjXaq3lqShM9xWbueBV59nWA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924243;
	bh=LkCRmXzEA14VekCqJmC8pfyK8xjF+wrdKE3bdo/HKPI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=EAx5Q2vRR6WJiXKpz5LjsUJo6ml+pp+uc/lpQ23ataROX573AfbTvTOPf2bmJhAjB
	 n6SJexCiFc1r8Mw4WWkbJtD9fCFYg/jFUnKRBg2bsM8p0BXuLxkZE1+dHiDh5IKUJ5
	 5dAROJhAc/0ApVHJa5X/svDAYqPA8lEzogR+kBHNif8PTIClWC33RkfYwQD4zatxiR
	 1BJztR+AcMeAAzZbYhqarV4LlwuqkvRx9hKwwD2qZmnMLK4UntLcr6ZjY6yvJhYjEI
	 UjJzc7/0OQSL6BiQ5aoQm+XvARvGB/Ygh39yr+IetVjmDrV9r98TmppGinVquVgX4j
	 lG1I1U67s5jlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95FFD40DEF;
	Sun, 20 Sep 2026 17:10:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 24FA437A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16D964007E
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:10:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qt-XgxBMwFrb for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:10:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org DD4C040022
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924241;
 b=YlK56Cou/ucpuTfV9KpxU7c377k/Bc5J5GyhPqerJsDNCj74FL7IBQSAFnkGk4zXDizL
 dY8jFabCjNDcIIUHTEZb/MekZm4wpqtzjgcQlFq8oxT/QUdZbpdHJw1ZhI5yN3AtlMh0P
 Inab//1Ix+pqHSa37BYVr3oycYsGtMvaV/oJK0V6Fue/kbc2pWHlOFqi4gZ+eNRvz6400
 e5koSznTWD5Xopj4cNE+ZORCPpFBbSwwo3ZRsiY0CfEdDS6Jm4MSMv1a/kcAl7l9DjwUN
 GEnjGlH4HM298guP+RbSkEOmlWyJ6EmAonHrn7ho/Dy+5XiqFWvKxiVRUtr1g4o0luA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924241;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=El5Eb0+i8zpcTDiZtpWOe9Z2uNOQ4hE8n0T93bTQeys=;
 b=L69Bh3td32uhDrVamL1l/lPLQ//VbmN28IgxvVsysamet+/yNIlkuYSJ5Z8FULGZYM/M
 qyVpGOivQRLdt+8XV2z1Ju0D75dxGPZ+Nwg3AvLfITqA0ulmqCbveYcGlMvhZ5KRwttZz
 PhwlrqIb0SGPFq6D2woSiDkFAgg2eSzdBEorYDvTU6Mrdn/wzKzXkI5okNaFQ62tnLNcY
 oiuRxNrGrC+g1QmBmigJN10JHutuQv5m+URBFWmA4+yhq6vY0hmMO5o1uODH7fS9VBPDT
 3gxj315c4871W4wCssB5jm3OFlc3Qk4lHNPfncrvcTwvFXaLMmbrYxpbTP35RcqFeHw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=cAgsBy0I; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=cAgsBy0I
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD4C040022
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924143;
 bh=El5Eb0+i8zpcTDiZtpWOe9Z2uNOQ4hE8n0T93bTQeys=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=cAgsBy0IeOerMg4fuGg8B9OTD60ym6LAY9tdCaactxy/IdjElSwoGkFxojcUtGBXk
 sK/SnzAs7qrNyKBaEmjtr/Cjyp8o9fsT5RsmC3kDYyYnQO4QgKdARR9n7KaBxUPdoQ
 a6rJx1YkxOXN0gpbX5QmB8s7cpLKMRtXz+9GgjYVK67yy4i71YIYzF7iBaCcV4XMdH
 2FftE8GPvuRDctFpSFZnCVd6PKbuHmugrX81QL+5uNCLqTKgI5t4awhV+1MEIJDUqB
 bnM+lzfJioIPt4DcxRNX/SO4fjAl+oBVPfuK777MXLN3ZeM8+L+UjApHSdWGjjDgyX
 O16mx3IvmyOZQ==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:/4Hh7za9h7frUaX2uAOOAkJJCuUn0xjV2ze5PqJ+9fQIrUwTo/gIFEO6Qk+zAxzPC2ZCmS5QP7Qdqp+0qjAElILKYJsjt2P/AOj/Y7qwrIMnM+SKmrgD4Re5FqfzJGEmkwfKThyzac2eNu7m9Quhcx9G14n0ckh99pdHJCJwDluttk78JffS8H7XRLgVUTFCcBXeupd5QQ8oTYx5qeYLkfmmHLCkqwH8b5zjK2nONJZQ/f1rqhztlkNat0cL3aL+sfx3Cll2c/iFA6jnh+gLUc++sAQfc0quFoSiz8QfLjGx9U4ym3U52IUnDp/d2/thkhJDC34+BeaUOHbxfQANIloY9rB5a1lR5fDABNeLHMscKyJzkL9XF9xIWr1WUdleLah4UsSp4E56RjurgMubaxheI2c683LRsNpPLGWFyO9pm6xjJuIsBnzT+RNxB+83KcwGOh6+b/cO2v4h8adm9lVWBTAZhf8NabNI7a0fseftnxQ105a9YZmR+/XtGzD3ez1/793dqGuBbs8ZJTEICGepC/Q5fibu5ez+LSBUr9zcHsHf+dFbrawOSytf/6PQUEM22v666XV8NkpmNWaatH0iYbEc7Y8WWSp4PkCiqET4VG
 BaWPloD24xcPioribSN9Ag+jauTY7ffuoeqVu1lEvR5cyBBoxHmq7y8wujYEjJneargZpFQw==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A63A2A4C486E;
 Sun, 20 Sep 2026 19:09:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1g-000000000o7-1YzN;
 Sun, 20 Sep 2026 17:08:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:08:07 +0200
Message-ID: <20260920170815.240247-61-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH v5 60/67] package/thrift: Fix build with
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
