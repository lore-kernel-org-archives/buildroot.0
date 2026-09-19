Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE504C982D7
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB7144066E;
	Sat, 19 Sep 2026 16:07:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eAv-uHk9F-h0; Sat, 19 Sep 2026 16:07:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AFF8240652
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789834044;
	b=CMIlZjVh5eDWjRnHif8HWFzqEibgQTqK18l5pEpO6542J6ucax/hq8tCuo2yifR+09iz
	 CfpT4PGWBGCxHUwXBzn/qN6o/AZlneMKOhyg2AoZArkuF4tExHHXUx+uyUUooLzJ8wxiW
	 m7VzeqcjEZtxG+NZkEem5GGxhks1ahLiXDOjJLc/XUjy+9rNS220cmPjs9Gz6Zvew9yhv
	 OM5Dic1raTR/+KkqPI4GjY4yxZEYjz4pMwkTJZfGwfO+WO9ysePiceeSnKYvHXuSRG8bX
	 n5aIL2qd33fkq6wd4DB6vdFQGjJVweLrGCjCGXcboZirSfORpXIEJGLgpoWz0DhaHVQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789834044;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=NcxsRlwWCYvb7xteMn2khrwCrV7Bihw2mpS0rhO2gwc=;
	b=Cd/GftH7NSabN/EEsByteyo4gn6LZI3EsxP/JS0c/LifwXotzEWP3x+kz+V14Ll4ozxx
	 jRK73SSXASasHoiUs38QUlu+skdlPA/11OzdRhgGlWRC3k9eT44hWr3rETBh8rV9ozAXI
	 BkomwQjUMyhhr5LHLEXTB7u/sN0AihqOOyoVQ2N5MhQn/PRrVLvUOZEDoYwS1KP4K+LPp
	 fEU3iTHSWTxJC2GBC/mu+9e+LI0rOEUxoAdfgK8qbN7U9LMKjjErEyCIddc4T5NOAZmmR
	 /QeaZHlh8+FwUQ7HyA04SFomzpaXCYlpeXYGLU1tQvRIjsgQ2AcCL/h7i848QRSZcyA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=D9EVBI9s;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789834044;
	bh=NcxsRlwWCYvb7xteMn2khrwCrV7Bihw2mpS0rhO2gwc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=mf/iLU6XS0Svyc2KDgytMfvW+2TdPwvWhILWvk0amHoFpks13fMcUb9uHTaqhg9aG
	 shk34P6W5rxXc3gF/shMu4WVfr5AZb63zFOI3AC0VHNcKMdX5RoNVCgOY1u8NQQfRI
	 LhQRY6N3oGcN1LLB7NUxRPoLDfqwlOIxgoE4WXwaEL+h+6FYwkuMKwHQT+1UJTuKz2
	 9R0MFMTulIvdk1c/dY9Fj/AtytUxK44mwgiUKdt/p22HOmyLvavkeV+rFi87Skt9HT
	 hCZNE57VpTxyUWXeMrukMYmupX7atitPLfMaMmCppyQW0gF+Rt+F1EVq2yJ9SCVr64
	 Ziagbzp8oP0iA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFF8240652;
	Sat, 19 Sep 2026 16:07:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C2DA024D
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8DB6405D8
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:07:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LbXAMhkt0l1u for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:07:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 88E6340640
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789834041;
 b=ZagaJSCJ8eClR1sXtoWyV8V94xG4OYusaW0WdX6uJKBq4mGILfgZ7HEt7AugOmHu+6Ed
 lvkv9iAxwyCs15SgbFdpyqKz72h+rIMvZFgFzlfcovY+k51hGuFEHBS8R6VNTvp6ZXKQi
 CSA64/zGbWjpEyq962qQvxOdLA+HUFoq0FdQKhgochUpIDFI6niI3Jq+yM+mQsUG0LYVn
 TGmhrmOj4BSBOKhhOzQGR1H1rs03uEsm4ftmEqwWD8nhg2AndKcswz3BYx0LDj0wc+RCN
 qVeOHWHpuGfBzpGrOxXPRcwc/Vpc7zVek4zcpKlxyFxhkK94/WFo+xEiutEigYRwCnA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789834041;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=r3IoEcGxEfcg5hjjS5LWJSwV1POQDZviW0KB4bOxsAI=;
 b=flDnTgxh/HE/CjQoH8qTItQv1Zn1XUaCgyNBuaWWFgQtYtoNj5ETCIEuLUHhfdCdKUUv
 ypetpJIDaM7AySzfLsfKvTzdlPROPvmy36QwSgGfZLtZ8bBeI3vY8SpdWUNJYz/tTxVx3
 TRovv4Mxf1avM0/odUqJVnzusV/x16YvdtLxWWKWNPhWhrzsE1ROyZLMi3sQngo5LKAPk
 5m1BbGcZF/2L3OxnmyuNSnWHWfQNPd6cspHYhiSA5RRGOePsJVrVCss7jWy8snwjcguvw
 3VqMdzHo8OHZkX5JbW5jW6f/kff1bFFFu3YpIqXETH5PCIeIBgmMjI3vFPL4UMyVQRA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=D9EVBI9s; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=D9EVBI9s
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 88E6340640
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833549;
 bh=r3IoEcGxEfcg5hjjS5LWJSwV1POQDZviW0KB4bOxsAI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=D9EVBI9sjdECBA2uDWN5l3NBQolIQTK+ChxHDY3P1sROq+prSirB6xiyq0sY53igC
 4TowD/MjizWmEBJXdDILI8gnHrw8KbiflnAD+m2tE6CPU3GudWtcFGJj9Z1xSJThqB
 ux3vItTSJsUWfJyIQlKxCCCjqWMUESBr/cjq3cHINjPrAOo4K1K/KY8VcWQrIs6ku4
 0ygz6ZbdMzF2x/+RtEx/0B+9NXlaB2IVLkmBqWELZzGHDTaChpoBPEMZBO673zt1xo
 ZxaUB6jlX4e1E/ke4EC89/U/PEw1mmNPzmca59b1IxSsCcENUc8gyoJWkNAgtmrBKa
 +gnLURX5SC/nA==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:0CfLi4dmD8WhSVpMxHgGbfmtCfpE+dbu7lMbaYJkiN+dww9F0uRwqvw+ucFypjW9H1A44p2K+4TRP1NSo2UZiHN2wsp9U8lagd7uOsDvcCWwKzUxevvyLSiS7TVjsEdQ/ZyX41wrPePEMjf22yXo618YMVmIeLCkKHc/fYtQXNBbaSpJZzDN+/ZtlDFHgI4iH+K2PxdjYOLMd0Qa/k5YBAwDUbwGmY05ClG/yASB579g4XbUcYMdva84uPncnnyAh5hms4LsgY/OJERDmRXb/Ncm/RDnk14uJ3ZaPxXB1xRAckRXfYRpqFwWwJjLnkqTyjCP33Q1Z8SqKqm5NICbMa35w07Om17iYo/sfWerwixLk3z6I/Y/bnn98NxyUr24OzmmKw05npkNIK6vexqtIV43+DDLCthGDoHtqmiAi9E8Itz2xzlNlt/qpz8u7HmYvWSTyRvFhYSfR4wqbMRrcW7dQ03cMBAt46+RwvLThe33EZ4onZv/WYm9fgvePjPJ5tnK9xzgUpZzAXC/P3gDb7kMmWGJRAynwOikSzQpmNwj2dse6kaaGAHJJOE5Ctbg8xvIP6h1WUYoDMjV/Od4pEO+LThI4GC3QLdByWg1VWglFh
 ofsOq/5wG+UTixNjdd7BS1Up1PsPdnL6KrNQl1nP+pW0pal8cuhRXzksL3SB9QpI1qMyuF
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F1A17A4C47C5;
 Sat, 19 Sep 2026 17:59:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSp-000000005Jx-2yow;
 Sat, 19 Sep 2026 15:58:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:58:01 +0200
Message-ID: <20260919155845.5776-37-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v2 36/77] package/capnproto: Fix build with
 OpenSSL 4.0.0
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
