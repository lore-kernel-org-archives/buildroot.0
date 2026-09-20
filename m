Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF78C982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 554BE40E60;
	Sun, 20 Sep 2026 14:56:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CXUocS3YPDmZ; Sun, 20 Sep 2026 14:56:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 256B640E6D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789916181;
	b=HwwCmYODQV4Y4WLnNcDcfb2ex2rj+smP039zdNs7sUNfHkD2rVii9KJ+XncNIqQVNkR2
	 N1N8wE2KfZZ1GvXdCZ6sLbs3bsFndpIxVRmycAJBO/pauj/CSuIfgc9u/tC5FsZwc7QNV
	 dfpIFC+llxWnyOziT/PwD5bmDhZa/CdzY4qocqf778cSbcoJkcSHrxWWynKpMADSVwqiG
	 Z4zM8gd7HN5kU3oefSrJYxZior8LaulKcXcT/8oGiqIME0hGVZmZ0XVphpiCDdn2+bAO5
	 MKG2c7E+ngKW9sET0E4wX4ICnN9J1k5S5qzT120kYSEBTaP6grj5K10/X/1cKj9D7RQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789916181;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=LkCRmXzEA14VekCqJmC8pfyK8xjF+wrdKE3bdo/HKPI=;
	b=tQHVVtFLal3cy/6mG6ggTc5RBf3ZH5iiMslimJZ7hEnyK9NujN+k+viWP3E8nPz8d46p
	 SIA6pH4ehftwN2BZ+mZeSy6iQXUKwYQk8I9HlHU9EmzkWBSBd/YJkuUXDw0AeSIXcJtw0
	 oqQ8RAHuzyJMghQZg49y7ZShmPxBRZtXHn6O7quw8ic/1qxCIvjy43kCangbMNdwlZFdj
	 BL82/qFmwC1XH68ITAep8bfb/mnmVqRS85LdOZ7U8g9ZrBNSM1tBgKJQEAufFU/IdDKdE
	 RzHFqBeLecmoi36aRwozi+jzo6JJHYUbduAAc16ILEn6l/xC8enkItCENNMp92slnVw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789916181;
	bh=LkCRmXzEA14VekCqJmC8pfyK8xjF+wrdKE3bdo/HKPI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qZ4KSTYvRtQZQS5iiy22CkB+lhRWO7cIqboyX/j3IMgt1SRYxbWPqb7Rq+BV74lyh
	 iMwYLMsYDmdtrstd82jeHM4iJnDsuSRmyReSC77qxDTmr+Zr9QCUvuL5xfTS4b5R+s
	 EKE5+j6bVjeUw/dAOstjfJsXeHwefuG0o2scWyPX1eeRNZa8u4Nx0y/DGhlWpZGfgv
	 X0b0TvsY6lfBHQtPK61MrxwCoeqCIVTtpN8I56YXp9v6JOM8YnTY/EsA7hCm4xVhcz
	 Mn4bx5bPUyWjcCYYDnyYBZbfvTEOfmEy/ew0D76lVUhLE0E9nqt4IFA4sWcXE3H5sM
	 MNXoP5PjRXuxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 256B640E6D;
	Sun, 20 Sep 2026 14:56:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 328F124D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24F454002B
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:56:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wPA8iSoeQ9uz for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:56:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org D596B40022
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789916178;
 b=iDLr6Yk4y1Nt/YBgRkF1JBO7y5lWlbdRuIuY/aLopfrLLtPwDj9k4oURlH2m+O0Iwa/r
 eFp6STDOTk4QS14coJjfg+szIHTnf0clezFM7WCrSnFJP4pvafK/vRTTH6pFtLlAYFJ26
 SfqJg7ro1J0vKK5j870rl91qtCQA3qYdIy2OBH080wrcGQAplLxbeij+J9awODMZ8EJBj
 7rONoG09mpq1PwAQFUwt+iuc4TVBKshHe/Xl72aqa6hoe0QGHyB+A0RUbPoDEbw/iBUQh
 Tv91PIQNORrM+LUoRO4DxqKq4dAUjWXuW2weQtNAPMs8qFBi/se5upwIkhbMODqZaIQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789916178;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=El5Eb0+i8zpcTDiZtpWOe9Z2uNOQ4hE8n0T93bTQeys=;
 b=XpcYXnTy+7167fQzWBSlzc2v/Mporrqj4fHOQnpTOUUuLs0l8DPBtQo8jM7F6A5VSby9
 2jMuj9CBTmcvH+cLU4hzXpPoVyYcE9YwkAg2k4MXcAnXLYGXJnMKvNIDca/sRjxR36/3h
 h1EOca5DceBciFqVKCI9LslyBoW23MdjookYGmbdR2Gb1E3d6eHHF/ahlQ6ze3DOk/x8O
 5SuY4qa5N3BFXT+4Y+Z1/Y5uO1bmInzPtIEVzz8hGuGKSRjijbv+aQ4X8ykNYhTglyyAZ
 KyKutlIkpnL4zyQh2xuqw2PP9tmR2JIfvTufUulGwliRUP668nqNJ/BxGvhxIJvlbCw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=gNqwaTUt; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=gNqwaTUt
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D596B40022
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915505;
 bh=El5Eb0+i8zpcTDiZtpWOe9Z2uNOQ4hE8n0T93bTQeys=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=gNqwaTUtsJUZmB6aZ1HdNZKMqAIfYBx7eqBlkHZEB+65CtPUKOx5ggcYMDS1EjLmi
 /Isd5e+EeSRuSf8RlOqDrnsORklcdhWYWcYLyF7FxXQWCPsGN4PVxvdtUEpVZZxDYG
 y9D2oYElhYnQugwZweKFW1AinkijWedqMxYdGFXBojU26sWKvS7D6hj8Onx4onNV2p
 LF8tHLP8BdV1+byikwIWxTzbD+jAfFJszju/WPApFMB0roQ8cF+2FzF88fivWjS6cu
 LSmGotchAgCFaIU193ReZr+lpVzwAWfdxBdcJOHl6x/EJgGt2MuZiNlg6kvGM8CAi6
 MNr/ewkgZ+L0A==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:64XPeBnVY6B0wGy4edt7hZ16v/JIY4IWWkx54pav4GUzWjVPc+UaLXf9GB2QFEkD/jx85Y6vHuGjq2L1x9FaIF5vBGkL0/CyL8WVqJH+BQGqQOb7nkeIkeb6D25e0AIMRpHimAuKkxA6Ji+WZEuVdKWVmZ0W8Ll/Odta79u0X/TeOXMGrF1wXNUztTtzwUPqtEMEdzhMiCWoBNd0luFzwzdtilPPX09M4AzkImVpUrlJ/PVOyBLAd/umdhiivsUUgAkzL/oZPnxaTrD0p8EgCMo87YUua28U0ny6zoREcKB7ptwRnDrvAJl4e8LkI98Eb0dShABjli6PYFVkR36Ecfbydz5CKU0yb8UHvy3xPKHuWkzYo8jgfK8/ufGwLi38Mgq41NBfCX9+P7Mv+kQ2A89LDyRqJt0PX1kws+bYsAvocPDmdHldwWAvsZEHJADyEyfjgRvm91EFdnTJ0/n5b2d2A0wo4HumnimNoFtOeh6Cjsr+RYEBeRSxZMhrNKVw61UtZ7y934UOEP+cqvKEhTcV9CitWJDcp6Unx7BzwVG6WZgY6mU4TJrdYwdLaJGXYLoK7cWfA85yP49P4WmvXp2tJcg6Mw==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C7DACA4C48AE
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:45:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8Imn-000000000hB-1ig8
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:44:20 +0200
Message-ID: <20260920144428.3009612-60-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v4 59/66] package/thrift: Fix build with
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
