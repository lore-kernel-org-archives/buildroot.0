Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE142C982D7
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5BF7405A2;
	Sat, 19 Sep 2026 16:03:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WjKCJJiMOm2I; Sat, 19 Sep 2026 16:03:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A6439405BD
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789833818;
	b=q6Wz3ZXzf+rcdMlrz/BOZlP9thnuK69NFYWG6xGIa4Z9cv4Ygz0nIaZ75rGLywIbcp9+
	 2iyidNijCh1l9TrsW1nAFcsp3XewgYEyQcLuTbCZRBjkcMqTKJye08EWnNLXkcPGu1RZr
	 Qdy+Uo1r3XBV1q8UI5/JA3wOhUWSasXzwZzXoaCmVI+L6sNoOV7ktPZZFtCU9yuHVAENn
	 idT/7N4HBfSXOl9WW55KTwUca/MoUuh3ZrxOVDe0sejRhNXuxzvS7EwDfNDesq5ngXgnb
	 RFpMQypEX0ya3Qhq4fRccN2fE6uDAGAcphpwlTcfNXWh5pPAtoiRMZXgsDMA7lm4k/A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789833818;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9hjy+p8U0hlDKo3iLgbga+U4tKr8QhzFlTZcwP3lcWU=;
	b=RF1l8bI76T5nQPfZiR9ZXGyc6B+txbsaKR+WAWf0rKlJMCMv0jS/NnfFGzxAPoqm8qV4
	 /Fz4sCC/8RYKmUU8mBw3v7ksKY5uhe0azIkx2Ojz+rWKL/3zsZn9leVQVrlZ8SB1Om75G
	 kPibsRpM5gkjfLR/06dUXHuMppv4K73oeIqJdsmLUUiDXaAYOHElBBFEHdqF6u2NzbUc/
	 Z2mmzD+Vt4D1oW0zhissfPiKT87rQYVG1HCLrfpH0D9djW0ELjJL0ZnoBaTJ+0i755PnA
	 L2uXHXp0Igg2H3Kgl8rdVWvzGJIaSFtuy5wFqYK2g1WaUM0ACp5DvNZIXgQYlHzcaNw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789833818;
	bh=9hjy+p8U0hlDKo3iLgbga+U4tKr8QhzFlTZcwP3lcWU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=QIf9u5FS9Kv6Y+uwahlEtPv78BveNQ3rnQxoajscRiRLmzO0kkoTCCQdlwGdH9Sfg
	 lAWpXQgPa7qPf9xcYUgTwy5XmLmTZL1uiZGZxMo/Gjhu3VYOHhpxzDMmFABQrc3Pe1
	 j8JqCjVOrgd0EI+Obfu3FIQC384dVrZw1u2Hdn/90Jb9obw9UzMAEfNCVfZ3jcV0Wc
	 AowC6o+nkzXrnMxWKyd10kU0PwKyvV1mafSVOHiOqp+O4EAD4KHXLZmv16rHtVqFwq
	 4zjYKXW6XR7Bb+2zer13Q4Y4gJl5OUwwoU2d15xeDoHoP6PmEMQ5Vo2g5Jc8+2BNRf
	 Gzp8fQCUPPc1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6439405BD;
	Sat, 19 Sep 2026 16:03:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 698A837A
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5AFD7810F2
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:03:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sd-kB-2vSI-f for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:03:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 350CC810E9
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789833816;
 b=YwtEvYTm3yKmjNf4JTFTFo7ssToFlQ3sLUQhLhQnpN1FUrUiwY+z9B+KXtBzeAYTtuZD
 x/DXPRkpxAALJvqoGPvwN5zb8G/6x4cevqYUkhcG3+nbt/7+Nr8A6fYSFYUb7uEf6Lm6F
 ZfT80kijx26yR78m5XnmMV35BHpYvtV9uhk7qoKjeXuz5J7DqnPEbbtBKaQRUOnbXh8e5
 8tfWBf8VNtYpWynzKQVz/8xztLBEy0UO1crPuMIbN4/TI64BzIJSsFBZztNZ1Y5i93UuP
 pHswdTqm8uKBAVdCRYu4caQbqaxNZKXknPnnUc6t+BH+EKv8SArSI9yogLLBoJLhC5g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789833816;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=Ci4+qhLuaJZBZSAe0ZUDK3prlEwSXUALeXMzD6T+wDA=;
 b=r1ZXRVxhLJtP/jYBLuUopZ/Wst0Xir64xKNQucMvwjPFIqAqsiFq3eBlXDxMFLL8hTDB
 dbM177LGWklgydPRd1IhPgrlVXAvdS74+56dtOo5+28ZGa7k6gXTXZQOF98BnOBpCzUwA
 oJGVhDUqCLsoFwEGfdYy870gZXCS9nVdmP6xc//Hnc9UMXTiqyFXU0QxTzbEqMNsDtjEX
 VpV4voExDjnc54fhbUNvaQfq4d6lihS6HpVBPIHMSdKTBYbpbRAUWuHJzGBujBYP5Hfcr
 pG4BXVN8MSmCQjGdCvBLoRmpQ8/T81RVoP2v+GXZGA43TAA+AMVZVLfIH6tJY5yzAMw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=CwycAPG+; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=CwycAPG+
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 350CC810E9
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833544;
 bh=Ci4+qhLuaJZBZSAe0ZUDK3prlEwSXUALeXMzD6T+wDA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=CwycAPG+s6DGMPmf//Q0KMvzIbqkv9su11BxhI3Jd6dg/wWvqZUjbs8c8C6bxOryh
 Z+E67iiNGbooBf4B1JJ0Kt0lK/rgw4KODIKkwDoHvv688MSUnQN7+HxffGnRDZT6Sb
 X5eejg3Cn3YmTCTI3IiH4kebTlzO3yn3DtW8wcXQyxcyloAozBtbseYntl1qR3q3x6
 rGXfAsi2LE5FI96TLaBu/5DHKXGqsiyGi6H7coN/mlIvZeAZAdpKXvj1cRJ6NBl2fc
 cd5D7RBKFnA6fkFuPRNzOARYRUoOKQh7jFRojsa2dH68zAhT0gb0DnY2Ll+mhs0n2E
 93ivHSuybWu2Q==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:8l6HbOhLTyg0zVr8hBoWQIUW3JhBx4IhijaphCmu20bXaqrYknDV/qrXyzkFA1HVLDGY8axf0/OV62poJ2n0DvB++x90EXJ50tsl72Eb2oGQ5ip0/H01tH8UzI2QDoTznwrRfMEC6CGlYotmD1lwiDPxiBlWTgyVVnLIjY9QkZ0oHgfuRe4dm/RgfNeoOrpboNL6tEHmzUyxySwuACnMPe8nmqBn/GEMPfbi1hhpYZZDQ6Pzqul27JLBydlhVMorfmK64AVMptPungzDK9iXvw79YuMDgbwbLXR5sMHLkMO5UmnlEVM/7NVIIgQRv/iNFBFqAAHTF7Jd8CggVejI++HktYewPYXwgoMEdse2qp7A1Ubf+EdWN1X/WaJJz6SMolquBTfBlfMX+PLhMqfyiNokDvcL6PqvAvuY/xRcd14JxVb6wUVaHqNaISe5dJ+0B5jmj8B7d2MXQWfj8gXSDSuKDrBHx4qntWevJYcOx+omLTAcYEVsSVtFexkvji0WrjU9bhNfLIBtcql3WPf5uHRuechcR/LWhRYqGesdcXkzzDS+szLVsyT0oEFei9zi6KPfhbIYjG4OhnG3YCN7x1HpelzKxVynq9hwp2X7Hr4H9j
 pXu/FuddpGxnSjj36N3bgCxyEp2IkyrmKwddJVn4UZbZbVWX3w8v72XSTbwLBBprn/LQ4=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F2DE3A4C47B0;
 Sat, 19 Sep 2026 17:59:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSm-000000005Jx-3hkq;
 Sat, 19 Sep 2026 15:58:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:57:46 +0200
Message-ID: <20260919155845.5776-22-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v2 21/77] package/nmap: bump version to 7.991
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

Added patch to fix build error introduced by upstream commit
https://github.com/nmap/nmap/commit/a24082eee41fcabf7fa180020e1771af3226b358
which was first added to this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...if-compiling-without-Lua-support.-Cl.patch | 29 +++++++++++++++++++
 package/nmap/nmap.hash                        |  6 ++--
 package/nmap/nmap.mk                          |  2 +-
 3 files changed, 33 insertions(+), 4 deletions(-)
 create mode 100644 package/nmap/0002-Do-not-call-NSE-if-compiling-without-Lua-support.-Cl.patch

diff --git a/package/nmap/0002-Do-not-call-NSE-if-compiling-without-Lua-support.-Cl.patch b/package/nmap/0002-Do-not-call-NSE-if-compiling-without-Lua-support.-Cl.patch
new file mode 100644
index 0000000000..54cafdafbc
--- /dev/null
+++ b/package/nmap/0002-Do-not-call-NSE-if-compiling-without-Lua-support.-Cl.patch
@@ -0,0 +1,29 @@
+From 4c36cf12f246b52a8d510bdde8becd5c5b3bf8b5 Mon Sep 17 00:00:00 2001
+From: nnposter <nnposter@e0a8ed71-7df4-0310-8962-fdc924857419>
+Date: Wed, 12 Aug 2026 19:29:05 +0000
+Subject: [PATCH] Do not call NSE if compiling without Lua support. Close #3434
+
+Upstream: https://github.com/nmap/nmap/commit/4c36cf12f246b52a8d510bdde8becd5c5b3bf8b5
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ nmap.cc | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/nmap.cc b/nmap.cc
+index b94c71223..70206daed 100644
+--- a/nmap.cc
++++ b/nmap.cc
+@@ -1858,7 +1858,9 @@ void nmap_free_mem() {
+   AllProbes::service_scan_free();
+   traceroute_hop_cache_clear();
+   nsock_set_default_engine(NULL);
++#ifndef NOLUA
+   close_nse();
++#endif
+ }
+ 
+ int nmap_main(int argc, char *argv[]) {
+-- 
+2.47.3
+
diff --git a/package/nmap/nmap.hash b/package/nmap/nmap.hash
index 17f9eb7f5e..bbdb81ec4f 100644
--- a/package/nmap/nmap.hash
+++ b/package/nmap/nmap.hash
@@ -1,6 +1,6 @@
-# From https://nmap.org/dist/sigs/nmap-7.99.tar.bz2.digest.txt (lowercase)
-sha256  df512492ffd108e53a27a06f26d8635bbe89e0e569455dc8ffef058c035d51b2  nmap-7.99.tar.bz2
-sha512  9ff69659b76573eb10b6e472a0217032fd5fed20f0ac971b3736a4222fb6251c5fbf381ebea7ede313b8ff2feac90a848f645000c61200772d01b843594f4ba4  nmap-7.99.tar.bz2
+# From https://nmap.org/dist/sigs/nmap-7.991.tar.bz2.digest.txt (lowercase)
+sha256  a5d507f29437bef3bedd4771ff9aaa8fc1c2a109ddba1f5b1cf12027456929be  nmap-7.991.tar.bz2
+sha512  d87836eedd453f4f5e55075b50640a6ad61cb5dbc1f887dbaf725fa8c32b6a472d838d174c68a2efa749b3b028512d2f0467aea0ff0b5f5752df714db62f8320  nmap-7.991.tar.bz2
 
 # Locally calculated
 sha256  9d9a9a763c0e6145172cfe7d8483e23b38ce60b6c79a82e4894242917bdae6d3  LICENSE
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index b04d8b080d..0dd96d2b95 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NMAP_VERSION = 7.99
+NMAP_VERSION = 7.991
 NMAP_SITE = https://nmap.org/dist
 NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
 NMAP_DEPENDENCIES = liblinear libpcap
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
