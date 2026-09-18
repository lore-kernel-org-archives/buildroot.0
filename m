Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A851C982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A76E40CCA;
	Fri, 18 Sep 2026 18:51:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZE-AdFEA_spD; Fri, 18 Sep 2026 18:51:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2EF0540CC9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757509;
	b=iLpidyqMM+yg9xZ0h5ez9nEo/1MPKFC3QQK5JwXwHuvZ8ef+8xbWiipMRt8qqcvep2/v
	 TtEOGyo+JLOEk4T+nst2UVp+yDP17afE6HtZs8DBgyN6TpTNTNe7ALEVWMfw3Gf+UCNcH
	 OqQu1LelyQNgm8OchZxN+6JnS0zh8GIrLBPMthxjLkvN0CW5PeNBIp5u2NWM4l9HnuKbS
	 w/2KBCUXzCAnLyM19dKkeBH50WCK33YMj4+qPaXQQ5vVhq7+Wex/GO2ElOcaBw6IMDhbh
	 GWHaXsHmEZgB8QueJ84FkePT3/2+h16bWv1QURH58NHIZ0bGx3iXH81IQ/AmoVav7dQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757509;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=NcxsRlwWCYvb7xteMn2khrwCrV7Bihw2mpS0rhO2gwc=;
	b=N1lh8oj/azJv+/vcqqN9HyoNVb5veUhfQ69uWNCqKQSSWY2aB+5xOQoJzcS4vceYDZw6
	 nOhN3G79nMhFZcZ+g/4miGUR6MWx6t3JnR0J54bND7IWlV576jlWc7t7f779DgtIebdhR
	 eVgg9rh7UDkr4Yxj5nVr+ZWS9qPTfD/VmlJstBamWGooEfO+hqln/TcDgZkvRO8bHJl4v
	 mkjOPeYYuYaD+0lpZF2EJ8kzf7pO2plIoOcFoWbCcK+Y+odYoGJpFCh8gBaZaHzZaNvwt
	 di5PR6EH8K2fuLFcGBKVPFpQ1rJuo0KmJhqbvC0uohpW3n89l9DyNEUR8aczOo/M8yg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757509;
	bh=NcxsRlwWCYvb7xteMn2khrwCrV7Bihw2mpS0rhO2gwc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Kp8wr0TdQp/UDSmnQdZ+qYkZLb1bai67DtLJXEhJuCSo5ahiNWN8JILdE+NKj5Ia0
	 hr33G9CwePWJWJsnIQvj0GknYCqApo0OgfTrFmYeNI0/YBIESMLPeILLGuTLGsEh3Q
	 BvdK7zNTgNEi/X1UVqjgd1R8MRELbRr346YY/uPTyre0H6PTMsZsXHGAvXU8UWpldF
	 0HsOD6WiErcvgUvnkQuDRlT/UI6RPiYn14xVru3juVfP8lEXITrIx4b7Ssdbljcts2
	 LayHeWQPGQl6t55LAgHco0VH5hTVFBnJjo+TcPXrfl+S1YUXzmJLjzPTeiZGJqcqbK
	 YxmxnS3ErPzmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EF0540CC9;
	Fri, 18 Sep 2026 18:51:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 830973B9
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8103F60E48
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:51:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nHs61bQ5jjOv for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:51:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 817EB60E36
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757506;
 b=WcLnHRgr44YYpSEK44Ec4Nm00XvkpMSWB7fick2kTiiWaAHpiYmOnoo2iEppokn+SN3V
 dOHsUN3+Yyu5fot4WdnWSH8//t/bF0VXpNCdo1CKTwVkkGbQ5oNoIEqzxojashnLxq9/n
 m4VD6QrJa01TS+B2xRt6h+DFv04l2oUKEyNULnRVCjKvZp+2CdMmnL9TV4nBh8NgTxfTE
 T3yn5UOFsjpPgHnJbZU/vuZq4Wsg4aescPi/NaLL+3gawgRr3PNvqjI7VV0xzLTu1oSnp
 oE+gJpRg2284G8AMh2AJ/NaJZ1yXxUg46sKAEFNah08lOd81Vz3uOAa68Nf5MJTAkZw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757506;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=r3IoEcGxEfcg5hjjS5LWJSwV1POQDZviW0KB4bOxsAI=;
 b=bqPf1kQCPN4DTexYtf2pjXGNsSioZGmAbTVq+k0fh4vJ7GtnKLO8nU7uBEvdeDyPpwFO
 D6ebw61WDk/kbxd125MhCQlTv+j4kKFw2i/SfDhFwF7oPB33Gp7sdz0/AxzW5O491+5Tk
 EObhRVACRlV62Ww9u2VTjhNg2nMFP+uOKaCCp9tEvryp2caM39eAhTqpCq8uqTnGS4I1l
 8XQrzIqvOdoRrGhiP4LyQxL9iAoy/cCN7BNaPnlXHuFqYeDEfOwlBjGa/d/gz2xhYa0tZ
 3CvkaULZSxKrsFb4wMwEWrJIY9lxB9jObQ5e3w9qy4UmzDPcpeLpZLE94+lxaVnGr7A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=pRvkJR6F; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=pRvkJR6F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 817EB60E36
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756937;
 bh=r3IoEcGxEfcg5hjjS5LWJSwV1POQDZviW0KB4bOxsAI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=pRvkJR6F/DcUXCoZlmQgPYomS3QYE8Um3BXEnFpA3cBoVL9CTYVZOGr1U02ZDINqF
 OezCnENMuZ1LP69tfg22wqIwiL3+fGwgzHZlSQvwmBKo9kqu09F29Q8HvOW3bMQlzM
 vXy5UMhctW+YI+GTCdTmlPjKADmN819AeTGEku63YkNhOUwHR4GnqmuQVc45qZ4OZy
 6EBVD4kasAj7fa4Sqy5EiLKYkuDjA8nE3lYEf734zqDynwIPAdS/irfbef8fd8HrYP
 acBojP0vB45uRobIVTpEVQAMCjkrOc9c0uXQNizgbWfIcJT/Lo26XLBS+F+Q4r55m6
 BieXiSYgQHhWA==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:v8ON/HMYEKMeD5WfJqB6X+KRZETBOM2CUPX0oo+Fhfz/fglU7l+1yKbJcaaBfJAzO/AsdxbkJuYPHsfjfnq/uE3TK53PfrgHgr/yjQCXdQXm4OhFCfFsqFbTn1ODJlPN7jLAJ7F4v+nPgtcevsEXkN5/bBkd2aH9LTdF583UM3nYyzClbpxyZ5OoPWw3blsrWQA3Q+FoZ8x1gReGhIiQgY9wcVBClqcFd2kktSczeUBdi3pOKJcYoCfY5ywOX8kloVRUUPb7dPa4qJDwTX+nzk/koIB+/Ydb8q3LICcn3hH7KzwSq0RAKG9QB8jKPuQHUmTIC8iLjJH9buV+w5SP02Z4cbX58ZfZtWFWigcgHIw4bUQcRzDPuz3QtngE913zcCieZBkO8tfOZUIQv5tgBxKdWuvRtQMPs+Nrko9bE0xIOSY6Ru+dLNhxv+AOunMp2b+TAp3Wkq/5oFdGFsvik3/XmEqaaBkgmZGqx7D8YGEdL7zWcwAg5ZiOz1QzyIJtOnHms9Pon3bpN0E/f2l1k9svgWeO5EOwzPkwG6dlX1jCC8HAynfWarNBS8Vu9TdR1Brro5X2S0yyQS6DgS2x95xtMjyoXn94rY8RY+0YavW8gs
 D1sh8icT+MngrUcCTLntHjkb818bJY6hErQznBPUynmXJmfjCkiCEzDgBiWrTQDp7L2Souau9u
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 67C68A4C4734;
 Fri, 18 Sep 2026 20:42:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dWv-000000007cB-1gm9;
 Fri, 18 Sep 2026 18:41:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:40:58 +0200
Message-ID: <20260918184140.3631274-37-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 36/77] package/capnproto: Fix build with OpenSSL
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...-errors-when-building-against-OpenSS.patch | 38 +++++++++++++++++++
 ...tibility-with-older-OpenSSL-versions.patch | 29 ++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 package/capnproto/0002-Address-compiler-errors-when-building-against-OpenSS.patch
 create mode 100644 package/capnproto/0003-Maintain-compatibility-with-older-OpenSSL-versions.patch

diff --git a/package/capnproto/0002-Address-compiler-errors-when-building-against-OpenSS.patch b/package/capnproto/0002-Address-compiler-errors-when-building-against-OpenSS.patch
new file mode 100644
index 0000000000..ced6164827
--- /dev/null
+++ b/package/capnproto/0002-Address-compiler-errors-when-building-against-OpenSS.patch
@@ -0,0 +1,38 @@
+From 33960e1a762667f890701775e184cbd06ee1bb66 Mon Sep 17 00:00:00 2001
+From: tony mancill <tmancill@debian.org>
+Date: Wed, 27 May 2026 06:13:20 -0700
+Subject: [PATCH] Address compiler errors when building against OpenSSL 4.0
+
+See https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1137594
+
+Upstream: https://github.com/capnproto/capnproto/commit/33960e1a762667f890701775e184cbd06ee1bb66
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ c++/src/kj/compat/tls.c++ | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/c++/src/kj/compat/tls.c++ b/c++/src/kj/compat/tls.c++
+index 6affeb1f..87e308aa 100644
+--- a/c++/src/kj/compat/tls.c++
++++ b/c++/src/kj/compat/tls.c++
+@@ -1125,13 +1125,13 @@ kj::String TlsPeerIdentity::getCommonName() {
+     KJ_FAIL_REQUIRE("client did not provide a certificate") { return nullptr; }
+   }
+ 
+-  X509_NAME* subj = X509_get_subject_name(reinterpret_cast<X509*>(cert));
++  const X509_NAME* subj = X509_get_subject_name(reinterpret_cast<X509*>(cert));
+ 
+   int index = X509_NAME_get_index_by_NID(subj, NID_commonName, -1);
+   KJ_ASSERT(index != -1, "certificate has no common name?");
+-  X509_NAME_ENTRY* entry = X509_NAME_get_entry(subj, index);
++  const X509_NAME_ENTRY* entry = X509_NAME_get_entry(subj, index);
+   KJ_ASSERT(entry != nullptr);
+-  ASN1_STRING* data = X509_NAME_ENTRY_get_data(entry);
++  const ASN1_STRING* data = X509_NAME_ENTRY_get_data(entry);
+   KJ_ASSERT(data != nullptr);
+ 
+   unsigned char* out = nullptr;
+-- 
+2.47.3
+
diff --git a/package/capnproto/0003-Maintain-compatibility-with-older-OpenSSL-versions.patch b/package/capnproto/0003-Maintain-compatibility-with-older-OpenSSL-versions.patch
new file mode 100644
index 0000000000..2f9cdab245
--- /dev/null
+++ b/package/capnproto/0003-Maintain-compatibility-with-older-OpenSSL-versions.patch
@@ -0,0 +1,29 @@
+From 84dbf3c307dd98b5b7461d314a3b7e42318e374b Mon Sep 17 00:00:00 2001
+From: tony mancill <tmancill@debian.org>
+Date: Thu, 28 May 2026 21:32:58 -0700
+Subject: [PATCH] Maintain compatibility with older OpenSSL versions
+
+Upstream: https://github.com/capnproto/capnproto/commit/84dbf3c307dd98b5b7461d314a3b7e42318e374b
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ c++/src/kj/compat/tls.c++ | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/c++/src/kj/compat/tls.c++ b/c++/src/kj/compat/tls.c++
+index 87e308aa..f7026d98 100644
+--- a/c++/src/kj/compat/tls.c++
++++ b/c++/src/kj/compat/tls.c++
+@@ -1127,7 +1127,8 @@ kj::String TlsPeerIdentity::getCommonName() {
+ 
+   const X509_NAME* subj = X509_get_subject_name(reinterpret_cast<X509*>(cert));
+ 
+-  int index = X509_NAME_get_index_by_NID(subj, NID_commonName, -1);
++  // Cast away const for compatibility with older OpenSSL versions
++  int index = X509_NAME_get_index_by_NID(const_cast<X509_NAME*>(subj), NID_commonName, -1);
+   KJ_ASSERT(index != -1, "certificate has no common name?");
+   const X509_NAME_ENTRY* entry = X509_NAME_get_entry(subj, index);
+   KJ_ASSERT(entry != nullptr);
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
