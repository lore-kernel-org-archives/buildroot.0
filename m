Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA25C982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C16B60B9B;
	Fri, 18 Sep 2026 18:43:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mwUVg2YG-Gg6; Fri, 18 Sep 2026 18:43:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 329A860D62
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789756984;
	b=OYvPWv93QVIfrTE4yq+i+NyOi8KywLERwlbl0n5zLDLThE0ZL153BAfbNmtvuGUX3MTe
	 l9o4Rn3tG4IDV2jYEuO8zIx1Muskp2L68QaRClUqRHf0PZW+bbDxqAZovm5uPN8ovmzzL
	 kWDPEdbMLz19vOcByttfD9BXn123zUYaPo+/md92KoKW6POtvI871xEKbLro0JDYa8mG3
	 ZjbR+/5nbq0ClQGKTFphOkNO326iXCwWuFGCTQ9qf68VgINlhWplbp6ZlTFTCTIMjKeA4
	 oe8/1Iw6zdM3tn7Ph1n68kA8XyiC0ElX8TkLit+loy8hp/rg/KI/PSEMBFjDd7TJLkw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789756984;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=GOit60ObTpWCEK5qkThzxX8PZoHjUTsm6hb0MInjVMc=;
	b=dBQOSj4mq1pDXJMD9AvtjXafBwB+6OmV22aeUlipDoRU0yWP9fg3tQZBXYBEDKQz6fe3
	 pPDlQjuS/WTP8HfMazat4E8fPzWK8pnbudfJaFiy+FmorDv8OaNxagFVzigO5XpFxE51i
	 EvFsKMu738SjJUdGNsemSatQVA7ji6YLXTx02Ca+6YBJuVlSZVqdBUjQOQiqST6ttTAaX
	 nK0xukyJAukHL0kmhLfYhmy/2lq/zLuk0zRnxp1u8E3HKqcbfPnXh4QZpIphB2LahqHB3
	 yWIZhz6s4jlRzCXfHqQB4kLwmC8N6m0r7jaiLmjVUi/kyjCLSjLeCqlpTsBjQtLcOgg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789756984;
	bh=GOit60ObTpWCEK5qkThzxX8PZoHjUTsm6hb0MInjVMc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=RXJtW3t9Y+M/UaFU5zYqsraXQ/zoSjERBCMNf0TfZnhVXKCXLvQfk9lqa9dydb9KS
	 KWkHOVLHdr1JdUE8Cg2nPCIeEzQSP3tDAwJCM8LM5xtBxSEJwF2L1t+43XPM8rSULY
	 bLtSLw78wKqaasOn6nQs9FRzYQ4gi4FLqrxGjZ6M54G7CR1jJTCHNcj/ygJgb33Nd+
	 kGIdo5P1VLoQlyQ/xxFP+YZY3JWAfhCFTgxbXKB962sbJQcCVFo3bP1cCXTOapZRHb
	 XR2oJ3hHEqR5PTH8yX3qaZ2s/lChOkObYWLV+mwVpzCw61RZVVfMoypdOWMLH7jh8B
	 ctNpDmkvTqEYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 329A860D62;
	Fri, 18 Sep 2026 18:43:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B5C9B237
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BB4540B95
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:43:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TcRNU7WrfD5k for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:43:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4A2EF40B94
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789756981;
 b=WU8BhKfP7b4ksTKW85/kM/t9DE6Scz42CEsZip9VIXUGHe0e99uKplD+q6Ah7Xln3VO0
 BYG9HVS5fVavEijwH6njQDtYwYY+QV8Re8qhtCY0jZRk8gsMH82BfWRkPK+3KhJwSVx48
 TlD5hm2e29za8BDgmRWvHUiP3qVarqEeklw+hy1iMZPp01lAJSwNTWvp43yLDGoR3Ezuw
 MOIIfkuWE/uFE/a8Q91rcPfDXCx9CrbGlcpyNSGngGj6EWxOEUvdpqnB7GAhdui6X4WyE
 xq2PyR1u3p3i2R3gw3M4Ep/SE6hhOZiAUUW3QTLCZQ5CuY/y7J3CQfvZG33SG3Q9x+g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789756981;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=nEcV8Zlf3YS1pTfNb+fYxXBwOluGekw2Tz3l87wjRZY=;
 b=aufaxl0DrY6cjyd5WssaQbnm/LEi0a7vf9nTwmwazpVVLbsX98DaIjvUn7gAJ5AHEdyg
 9rD9xsqSBJZe+/cVWkK8jUchBi7XjW6DTQ/nM4wDckQloAN+8bKA058wbgWPpAei0XN+S
 TFov6X/wunihc+lsG5CCwxMEkhsCW8t3D48t0Zddwgjq25L0AQgJN6c2eUpmrpi88RTer
 okccOjIUslXYgc3Kpsrjrbv+AJF4k0JfuPbsGvkci6CVO9sq9Tz89w44Tq6YCK59wCYxU
 n4J0X8JdFR3VqVjQMcNpwJ2Lg67wRImhbA8nrOHvqMuwjjghtgboSmR3EZbTFXhZ2kg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=DeZd27nT; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=DeZd27nT
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4A2EF40B94
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756904;
 bh=nEcV8Zlf3YS1pTfNb+fYxXBwOluGekw2Tz3l87wjRZY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=DeZd27nTvx5BTKdZAyJtPTw280yszlJ88I2FcBH2UQvuZ4d/t1VBeDbC+SSb9Ft1J
 dm2ve+hshEVFDhB/PDGYVI9ST3FST3SP6t9Q9QZiF8sAXpd2sT/bX3M2KRL55aPBzs
 WtpFQgxKJR6WJ6osmzS9HvK2H5PC5hxNRCM/pE/LSFLlrnpKIMq+PZyPlOmhVKySRR
 EB5bL9N7BfgpfFVHZcvFLsGOvcJB+P0wh6LDfvRvsGlET1QmaUuWhdaGel7PiTmO8Y
 JwQF3g1JKi1dNvu765gjkOKq+0XiSnQleE1ZhCAX2md7Vfg/yIMuxAHJ4g+WkS6ecO
 S3SNTzt64mc7g==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:iiGDR8e9yi5R7GGRCZfA73JSBkh20VvtDHvwg44ze2mJlwgBbb1e9oteQM4hUt6PrgBeDO3LPqeREOBTaHH+XgG6kCviLV/qwhPgv6JSOaY2aKnqGJhSD5hQQDJZe5knkYxmfZzStBUvi6MD0ElUhPdmCcyyWMC0nMHLhBnkajIQMI3JzjXjIKTBsVciy+c//ojQfh1ZL8mLnb787CyQyZsQwwJf2RxorkAWstIU5KPlkCNJCTPsymLoe+OAPXRuKXG3gCW9kWTqHpTrXAx7hTWGn3EDgJvgG5lQbwnEg1IJHJ2fau3jCGsZEyM+N2z45Vr/srxGSmLfZ9NVfX5DC4U+rFDB23QjU3RC2qygtS8ot1LmB41XEr3rVeMjClJzODospFaQhzg+GvAN+XvCLGYQcWLFkmZlJFL451kyQNL0V8XtFusHwZ6kN5107DmgK0iXYmeO0g652Rm/9ns6BY+Vs7hirA3iedKtFf7fH9N0KY6pdhR0R0mToN0DbfqBIfgNYUER2puUuxo7sit+4E/yyxMx+HSv84ZswQoF5CHfHT9V6BVEwt7vRoS04jL08lGOv4nPRnMffxKtT5CEjLFjFOm2jPesxhcdQv4LCBiDPs
 GnJC9udsLd24sI7ZEVF7poxJyLREkAMiygLWfHjLyupEMM1mpZ025B+cUPdWkCl4K1HrXZBw==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6B6EAA4C46F2;
 Fri, 18 Sep 2026 20:41:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dWp-000000007cB-3IIG;
 Fri, 18 Sep 2026 18:41:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:40:28 +0200
Message-ID: <20260918184140.3631274-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 06/77] package/resiprocate: remove package
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
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
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
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Build is broken with the upcoming bump of OpenSSL to 4.0.2:

ssl/Security.cxx:2360:29: error: invalid use of incomplete type 'ASN1_IA5STRING' {aka 'struct asn1_string_st'}
 2360 |                Data name(uri->data, uri->length);

ssl/Security.cxx: In static member function 'static void resip::BaseSecurity::getCertNames(X509*, std::__cxx11::list<PeerName>&, bool)':
ssl/Security.cxx:2556:46: error: invalid conversion from 'const X509_NAME*' {aka 'const X509_name_st*'} to 'X509_NAME*' {aka 'X509_name_st*'} [-fpermissive]
 2556 |    X509_NAME* subject = X509_get_subject_name(cert);

ssl/Security.cxx:2572:51: error: invalid conversion from 'const X509_NAME_ENTRY*' {aka 'const X509_name_entry_st*'} to 'X509_NAME_ENTRY*' {aka 'X509_name_entry_st*'} [-fpermissive]
 2572 |       X509_NAME_ENTRY* entry = X509_NAME_get_entry(subject,i);

ssl/Security.cxx:2575:53: error: invalid conversion from 'const ASN1_STRING*' {aka 'const asn1_string_st*'} to 'ASN1_STRING*' {aka 'asn1_string_st*'} [-fpermissive]
 2575 |       ASN1_STRING*      s = X509_NAME_ENTRY_get_data(entry);

Disabling OpenSSL support via configure option -DWITH_SSL=OFF still
produces a broken build:

SipStack.cxx:450:29: error: expected type-specifier before 'DtlsTransport'
  450 |             transport = new DtlsTransport(stateMacFifo,

Bug report sent upstream:
https://github.com/resiprocate/resiprocate/issues/489

No other package depends on resiprocate, no developer registered in
DEVELOPERS. To not block the bump of OpenSSL we remove this package.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy                     |  7 ++++
 package/Config.in                    |  1 -
 package/resiprocate/Config.in        | 43 --------------------
 package/resiprocate/resiprocate.hash |  3 --
 package/resiprocate/resiprocate.mk   | 60 ----------------------------
 5 files changed, 7 insertions(+), 107 deletions(-)
 delete mode 100644 package/resiprocate/Config.in
 delete mode 100644 package/resiprocate/resiprocate.hash
 delete mode 100644 package/resiprocate/resiprocate.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index e6c4361bb9..f1b995b486 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_RESIPROCATE
+	bool "resiprocate has been removed"
+	select BR2_LEGACY
+	help
+	  The resiprocate package has been removed because it is
+	  incompatible with OpenSSL >= 4.x
+
 config BR2_PACKAGE_QT5KNX
 	bool "qt5knx has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index d556128ce7..d2c2c210d9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2116,7 +2116,6 @@ menu "Networking"
 	source "package/qdecoder/Config.in"
 	source "package/qpid-proton/Config.in"
 	source "package/rabbitmq-c/Config.in"
-	source "package/resiprocate/Config.in"
 	source "package/restclient-cpp/Config.in"
 	source "package/rtmpdump/Config.in"
 	source "package/siproxd/Config.in"
diff --git a/package/resiprocate/Config.in b/package/resiprocate/Config.in
deleted file mode 100644
index ba68ad8e59..0000000000
--- a/package/resiprocate/Config.in
+++ /dev/null
@@ -1,43 +0,0 @@
-comment "resiprocate needs a toolchain w/ C++, threads, wchar"
-	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
-
-config BR2_PACKAGE_RESIPROCATE
-	bool "resiprocate"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_USE_WCHAR
-	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_C_ARES
-	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
-	help
-	  reSIProcate is a framework that aims to fully implement the
-	  SIP protocol in first class C++. It is intended for use in
-	  other applications, such as the repro SIP proxy.
-
-	  By default this package provides the core libraries: librutil
-	  (utilities), libresip (SIP stack/RFC compliant message
-	  parsing) and libdum (SIP Dialog Usage Manager, a state
-	  machine for SIP dialogs).
-
-	  https://github.com/resiprocate/resiprocate
-
-if BR2_PACKAGE_RESIPROCATE
-
-config BR2_PACKAGE_RESIPROCATE_DTLS_SUPPORT
-	bool "DTLS support"
-	select BR2_PACKAGE_OPENSSL
-	help
-	  Enable DTLS support (requires OpenSSL)
-
-config BR2_PACKAGE_RESIPROCATE_REND
-	bool "resiprocate-rend"
-	select BR2_PACKAGE_BOOST
-	select BR2_PACKAGE_BOOST_SYSTEM
-	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_POPT
-	help
-	  Rend is tool that is was created specifically to load test
-	  gtSIP based presence servers.
-
-endif # BR2_PACKAGE_RESIPROCATE
diff --git a/package/resiprocate/resiprocate.hash b/package/resiprocate/resiprocate.hash
deleted file mode 100644
index 93a7131141..0000000000
--- a/package/resiprocate/resiprocate.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally Computed
-sha256  059fda8f63c456fd61130d468a67655cfeafb5ba8ff5c1d0a55dc383f83e4fba  resiprocate-1.13.2.tar.gz
-sha256  8c93f7d6085486e9d24b7c6f9c662d92e0b65571003ad15d0827bb99fd924261  LICENSE.md
diff --git a/package/resiprocate/resiprocate.mk b/package/resiprocate/resiprocate.mk
deleted file mode 100644
index ab8299302a..0000000000
--- a/package/resiprocate/resiprocate.mk
+++ /dev/null
@@ -1,60 +0,0 @@
-################################################################################
-#
-# resiprocate
-#
-################################################################################
-
-RESIPROCATE_VERSION = 1.13.2
-RESIPROCATE_SITE = $(call github,resiprocate,resiprocate,resiprocate-$(RESIPROCATE_VERSION))
-RESIPROCATE_LICENSE = VSL-1.0, BSD-3-Clause
-RESIPROCATE_LICENSE_FILES = LICENSE.md
-RESIPROCATE_CPE_ID_VENDOR = resiprocate
-RESIPROCATE_INSTALL_STAGING = YES
-
-RESIPROCATE_CONF_OPTS = -DWITH_C_ARES=ON
-RESIPROCATE_DEPENDENCIES = c-ares
-
-RESIPROCATE_CONF_OPTS += \
-	-DBUILD_QPID_PROTON=OFF \
-	-DBUILD_RECON=OFF \
-	-DBUILD_REFLOW=OFF \
-	-DBUILD_REPRO=OFF \
-	-DBUILD_RETURN=OFF \
-	-DBUILD_TFM=OFF \
-	-DHAVE_CLOCK_GETTIME_MONOTONIC_EXITCODE=0
-
-ifeq ($(BR2_PACKAGE_GEOIP),y)
-RESIPROCATE_CONF_OPTS += -DUSE_MAXMIND_GEOIP=ON
-RESIPROCATE_DEPENDENCIES += geoip
-else
-RESIPROCATE_CONF_OPTS += -DUSE_MAXMIND_GEOIP=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-RESIPROCATE_CONF_OPTS += -DWITH_SSL=ON
-RESIPROCATE_DEPENDENCIES += openssl host-pkgconf
-else
-RESIPROCATE_CONF_OPTS += -DWITH_SSL=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_POPT),y)
-RESIPROCATE_CONF_OPTS += -DUSE_POPT=ON
-RESIPROCATE_DEPENDENCIES += popt
-else
-RESIPROCATE_CONF_OPTS += -DUSE_POPT=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_RESIPROCATE_DTLS_SUPPORT),y)
-RESIPROCATE_CONF_OPTS += -DUSE_DTLS=ON
-else
-RESIPROCATE_CONF_OPTS += -DUSE_DTLS=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_RESIPROCATE_REND),y)
-RESIPROCATE_CONF_OPTS += -DBUILD_REND=ON
-RESIPROCATE_DEPENDENCIES += boost
-else
-RESIPROCATE_CONF_OPTS += -DBUILD_REND=OFF
-endif
-
-$(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
