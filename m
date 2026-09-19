Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDF8C982D7
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6851340676;
	Sat, 19 Sep 2026 16:00:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GX7fHZDNlJ5j; Sat, 19 Sep 2026 16:00:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 584B140ABD
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789833602;
	b=CNzySzPUN7yCQkEi1byyIYUbYZt0Hw+BtrR7ZU9EfZGj0j45AnAYUcGAvlJ/gN4woCnz
	 0g7ZZveFHhtVyTuh7Na/OYoqtSm8e2y8cf8Ygs5AH0nVon4utc3V1LFSkuCpXhySWyFAt
	 CBjG+FbzGaZA4Z1OS6wwpzIg9byzK0+D7+2ELwLOcGXNSvZF9o24yURMjCzQsBtr4TSZB
	 eDXCY3cr3XRRhsCP8AzwBPov17BWzTWELl1uFiZ3dnQm0STqv0HbafFXltUH3X24P05we
	 qAwIl/+uJzKEaKgkiqC2AZbkzMkMQrrSZM05z12a4wLhx4lWD3OXx4o29Cax1/PmXKg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789833602;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=GOit60ObTpWCEK5qkThzxX8PZoHjUTsm6hb0MInjVMc=;
	b=kzE/y3YzeiBteG5Me/al7wd1HjPD92wdp5+KF4K9QdRKyBKyd0aqvutm3n8ccVGn5TKu
	 ZnZS9f9RWP3s86J6FnYUxo82R0IwVWOGQVoxu8PA7Klaeul947Is0PKgBQc5pZsDJQUen
	 Ff2NDPQ2Ltg/In81Z7EZ7qBSbhmNJNj4K1HQ4H4hdMn44a6fB4/IAkzfkkDk10booH3MJ
	 kOlBiH2wFnjFPm+lrPAaJvTnQSQFfnX9viTxLv+Z9JPfo3e0E5Hpnq33IY3PTcGg+d0cZ
	 lTKSDNz2IlC8dKg2azmNb4BMT52hC/xTfOsVdLKUmOJjLgUTJ6JPXfsBvOE310rC1xQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789833602;
	bh=GOit60ObTpWCEK5qkThzxX8PZoHjUTsm6hb0MInjVMc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=opYgfa4n3ZBQZ9LBSq2+D1N3ye0yupWAFE9XK1e1d+Q8h6YcHVFMK8D2ySv1mQy6w
	 rHWfVATyLhHXgkn7aG1gwstn6A6SzQHoPf79gWR431ggIAJZYJeHfdT2I6zl53I5UC
	 yocz6AKjptHTdB9azj7Ecvpty0u1wT+ZTxCjl8uzQHTrumn8I9hilA8inbwd3SmHS5
	 um3wm2Xrz8hX++nv1m1G7w+SA2qEQyb9USUhVJnSe+ryWLV8pwHYGB3HhMQt1l9ZkD
	 SFNtEO5Yz6AfgPNsoTfr8ymsb5CqS+n4/a3HkDROhPmAhWT2v7DqaA6qwn3TLrB1TK
	 FAHoQmzVbQ7rg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 584B140ABD;
	Sat, 19 Sep 2026 16:00:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0843324D
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05A2E60664
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:00:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xd2srAtd7NZa for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 15:59:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org DDDFD60662
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789833599;
 b=QA4J4hsvZPfxrVjX4Az0AE33BSERnN34NqkJGiayVZv/e/5lkMzNKTU1LFHrjF15LC8g
 dCAh2RANHIJ05JJeUUJd9r82Z2751rhF3svpoCGn3y2iU68uGA4PaQsfrvpJHv1rRcL9V
 MvTxwl3Y4YHB9QJucT86UvBQQs/t5g4WuK5YxnskjYZAKET2EGhIKI5SvikJQACV6D5Wn
 isnU7WLzQNhrnAsLwGC17XBm/9edd+44aEhEZQnQyVK7EXV9YEGsivh7NdJfLNKtiXW0o
 Q4PbC6VhKvGntz6ehXh+XLsRLkEIxpMkn06Nsgl6fhkuXW7rol4PrxMjVANYed6RA6g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789833599;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=nEcV8Zlf3YS1pTfNb+fYxXBwOluGekw2Tz3l87wjRZY=;
 b=NcUgGsmzDnVLuVmVogrkGcrLxPR8ENDvK3B3ZA6ARnynKiTanByN/VANiqqB2aRew9oQ
 0YZEXVENZTqyt99uEzye/gviRIk/yJwtMa5wYqc5a8AspI2RTum3kWtgR6Tv8bWRH+IO2
 fBdIoG6Uuly+Tk9nZxp/F5Bcev4DD8P+PB3E0TW1Zppzu2qTh2+KZ8NTMQuxsSu0keH8o
 KlZiGi7fHNcunVbou0yez7VifstknMjnAb30oAgIN0fSdPqfIwiQ1/K3hwFlE1XiLNHB1
 Xwc0SW7YQeucCfN/2s2kLcSo+RClFuuZOG3ir3CDrqw4S9jhvP3Gl8MKJpUjUWN17Qw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=QJ174I8n; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=QJ174I8n
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DDDFD60662
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 15:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833530;
 bh=nEcV8Zlf3YS1pTfNb+fYxXBwOluGekw2Tz3l87wjRZY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=QJ174I8nocCEN7/RHg96sPrI/qT5B/8o6ZQpQLaj8LjdJeePGh9WueWNQr3sTWHuc
 YBLkexrmgImtkpznqQ6OkiFooEh+IGVBgEmUc66MkmfgLN1lOJsGwN4k6Ta24GYhgt
 F1u/KsYZERFms+YeIQznJrEpZ338delrc4pQ/Qer2L2dUyvXG0D41/uNxcNlluFWfo
 nEQgr18DYW2ZtYUpNavSTylOkTTQk8aBeTqkRi6aiPIXkx4Q37sTg2I/zBczp9sjdW
 Jx5Mk5NSekzEz1q59URlb60fmj+A9OXVB1mR3mS883pTPC9/+LFjG3djNKlfb946oU
 /iCSJMkHALwRw==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:pCNcN0s5uPtiSi7hYKQFsD+6idnvuB+jV0e5ty2j6sGqf33KLVW7K1yIbFMVFIsCaNnTokTCbJPpwYslCvqhcfflBMYqcpJxxVaHHveg7baMQTy/JKAm0ktKfwvhrccnd+CAAbIqL0r9ba+rBaGSigpS1AaGdLX4b9QVUHl5VVylg0VmcrDfXVzKhPPgvjafGHr3J+SOXLak1dwHMyJfeFsOEh30R02Edp1scUuyKywIkPc47lcL1xkB8ojlyJJ3WeZmEfvVg2eBIJQYwyDlKlgVgcDM1r0EcaaA9jBFQWyXN9exu27Jd1w93iHGY9VuPgDwcMzv98Q0I2sx6O4NZJ5hKwAg++a7kYb4q7Ij/ATTyAbXcbkfKdiITxDuYmJHt+shXEhWJeixdllAbV7UBq1sG6veAEU/RKYCCFVDF/sH5vsyXdklYJ7J5i/pztHTnbrN7jxbnfkceKk97tmRPfgPPAsTObnTQdJrFNPTjFNRvenHHCLJR3G8XXmSZRTS5gxcj2vdf+kIx8ItTgifP0a/oQQsqC4YEYYmTblGooNxuadjkSaHytkrpXDgoAW23T7BNssHktzMyUC5hng/eMXi5jVpY2bccmEh//mzJ29lh1
 5/taT1rIp7BY55jpdQHZmHFwShN1oEAfwevBLSeQvZMS+PFqPML46VxVxNMgkGHxEWPA==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4964CA4C47A4;
 Sat, 19 Sep 2026 17:58:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSj-000000005Jx-27kF;
 Sat, 19 Sep 2026 15:58:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:57:30 +0200
Message-ID: <20260919155845.5776-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v2 05/77] package/resiprocate: remove package
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
