Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D7BC982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B830160707;
	Sun, 20 Sep 2026 14:19:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SZcJ87DPdRDM; Sun, 20 Sep 2026 14:19:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D47F8606D7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913950;
	b=MK5wPlWbvnMf11Nd95LFH5AHudOKNQMccIV1PvzY0DhZNL+6nvThg5DGKNUDcEos8aQ1
	 +l7YVEQQ7GWIFxZJl6/KO+MjwmtxO9suPVq5s9ojYntVfjDX+KYPxHQJHZ9tYmZlSn313
	 1RJS9XEKhFwp8wdX4OEwJDOIDgaKIdoKFbVyb6PZn5xgM6H/SaRh4t03LrAIzq0nJ7FeS
	 E+amnrk784QAwix3eXmDncdAMH5D4NoiVwMovjsBxn4+iULErp/+jXk9JUIfLHfH6S6ru
	 rV2/ZczLVrulHKHDwhmsgTIey8kZackpo7yLZFsh3PL5k3CiOJpTNz4bmFSt+j/OZjw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913950;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+ad4XvIk8KRN3crymuuUiV/3f/jcXmWAX8WkfdtfKG0=;
	b=X//cvoCtRlvyWoQUZb03+gRrz7KX9U6xTAMjE9+TCzxLXRW5S1nmdQM4uH2hEnXZQ7h8
	 dEdVBkoGJY2kzUQWxGmLpsV9SUe8myaO6E6Fp00LOepq7yXrcqzyXLV66nIJIc8PqGbZY
	 7kL2tPmh9ENO9Sk1KPyMITuF/NPoVLucUXo8bOMTXVGiiV/F1/v1lkpJuSvWjg/RxAE3q
	 8be6khKOZoCiU3I+CJ+uGcD5R/vXRpPIvfz8/GgIFBv/XiIvWC++3IuvQExV7LfI7L1UZ
	 +uKwWnJ4fz/aLpvuu0Zj3AQBWwTttryL0voX6X1vahysSVkn6dwkAtuSOrbjlmA1Aog==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=nXPr1mct;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913949;
	bh=+ad4XvIk8KRN3crymuuUiV/3f/jcXmWAX8WkfdtfKG0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=CY8UTOv7e1wI5SbJ/4f1uhM6mk3XvBJ/SbwOeyHAmMZJKwFasrT3ULzma5d/KWrkj
	 3gT/0yX2SMgUVvfg5EqvX2iWW9GC/+dP1afOqttoAJ0y6RIA4N7zcNeydx51dyaEmq
	 C1igaQFzUblalyRiM8ObUIvPr8nKni4u77N2l3J3ZBUUjPgofPPoWWLaIlv0vB5K05
	 Ql8lv7hWra4xjDgYAdcfIKpbVSHyZAlHNjZjdrqoqdN1vuH7tnLvls2/Lp6UQkJZGX
	 E8Dk7EEsroMR7gkapiV4uMXVwq5t4yoist49iTclB/Wbin8k43ZDqWrc1ty3PKTwHO
	 i41RNfgG2kUAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D47F8606D7;
	Sun, 20 Sep 2026 14:19:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C0792224
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6A81606D7
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:19:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VxHCNix1ddQE for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:19:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BA76E60680
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913948;
 b=PA+ikFA1Aofv/1ZELB9qbDwdhgib8xZCMemYWyrXU6l857iNyKp4/2TF+HgghdoTHT4E
 DeWWhSO6RQXO4mXSKkGXPymccidcQ6Ip+wzRnTibDZZvzJI5aYLo8n7EMcU7IlstusEDP
 KIxQ8GsZaLjJH7wHXzu8Y1tFPqACq1PAcd233OphnsNxz5vt9Sfvo6dIReCjXQ1jJiLDb
 frjVGNIpNPeOF98522RCp0p94uz88eeEh1Km+GXU4bbdpq69mc93cTC+xxS1Eah58Er9T
 GWy7E0VTSxnoAotZ72vfRGUhz8jcjb1vjFxUEG0tS97tSspSn3uT5t7byUhQGL9Ldbg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913948;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=5gDvCJ+UXhkxW77CQFBghKeHwlvChzvv2/WWLjOyl5E=;
 b=TOw6vnrJx1ui7lVTZ1sV+hNP8diDunF1LJXfYreojLE/h4gxZbIrItTjdf3LTmkFYa2n
 klZoP/eELky1mywLJwwyr3b6FCZwZf7k8d2LSpJy/sq/8TbPW8BTrfqGNcnDsvE/hzsGd
 X/e6PfftCkGdGfaStDEL6v/7yL7SYi1RNI9e7ojYZ0mgUhVcaPNdXpiW084BR+yaeHvNZ
 TdxO851Zot5M2uFAlNXtPIJLXSnEezwovbVkNKS7lsa1/1BEeEmemBj/j9PvQOtZ518Zh
 Iv8MqQY7RfM8/TE2mTy7DumoYJcgNHfBX99vFWJJByoIACoXLkyoKeJExbQElWXkqnA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=nXPr1mct; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=nXPr1mct
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BA76E60680
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913243;
 bh=5gDvCJ+UXhkxW77CQFBghKeHwlvChzvv2/WWLjOyl5E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=nXPr1mctC3UCKZhHUdPPICoifEp83But/E+o/Wb3ut08Wvx3HjNjWTeq746JQFnX7
 mq4vHHxbSwORTzajSWlK3bFcNROZQVVVKfE5Z1ZSZtoFJ6VqOVN3c1wcpR7O0Q72/x
 E5YlcAMSsmoUAYyXC83e4w6co41pldJwissOq9JKJIEHMnk0wEExOTU5TMhiU0stNx
 s/UoYnXFh34B277yeqfhpViEWGYRQNOLvsJb+MmNn+//Gpaz3rX11gmXlVvhuSLf34
 U5HTyaNcafEfaUij5XN0ftAONY4yOtO97ax9DIY4YjXL5/KemHKqfMnh30Pngs1Bpm
 7kqds3Fe2opcg==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:Ug17eP1ukvXICjanVM7wgY8lYmQASK/FGsv+l747Dxqpu+KBWPjilT6aKYucNLRLTNAy42XcPP2WEqvOhA84wRqi+nJN/Ly7nYcIrS9bY1x0MEUL/ACcdT52RrF7lQ34S6eVegC+rb8+sm31tzSF641a1FLRD3WaDrQCiPM7ojnE+yyJ01q1pwBwqiRE67lNbCGqS+j9/TMkGJXfFikZHaFCCSC3i5cRID4NcVCyBJUYvqZxTO/iTC+j2ni42lZBeEEcF+O19EO620WM/4P/fXVH46/4PJ6wRM3OPXag4hMEayQ21FR8lKoja3VzCKkOpkyBDIaDiDA9g7eEkILrpn0bIYCCZfoa1k6b8AxyHtmbfU+q2k8tILuSdufDN/3Wypq2uLU+iFBQH9qVt9kyvljq0VJfa0HkJS4Or7DvFyIyzr1mB40hl2dVkzsA3icphfTDTu5dMh5f0sGmC4/EWVOQOOGmCdv4YeN95rM+Q85fKyL02SeVoAjpL/ev+vuqPhqnM5AirZXca87479AcXmpaeufPev5D6Tj8QD0C1dbBCSJBcaw1tC5KrHoEZQZw1BT3fFI1ftATRoQW2KSrh2AdVfIUrQEAXvb9336Kw2NX/5
 R4X+RC6hkwoVXA+Rb21V+JuI4VgzrDFUVLDSw2G+1AyxmfShgPxT9SgBhsEQEFB/yPw3FJwcO8
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B52D6A4C488C;
 Sun, 20 Sep 2026 16:07:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBN-000000002J9-25ye;
 Sun, 20 Sep 2026 14:06:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:05:50 +0200
Message-ID: <20260920140605.3005461-53-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v3 52/66] package/redis: Fix build with OpenSSL
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
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

tls.c:676:5: error: 'X509_NAME_get_text_by_NID' is deprecated: Since OpenSSL 4.0 [-Werror=deprecated-declarations]
  676 |     int len = X509_NAME_get_text_by_NID(subject, nid, buf, sizeof(buf));
      |     ^~~
In file included from ../../../per-package/redis/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/openssl/ssl.h:34,
                 from tls.c:22:
../../../per-package/redis/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/openssl/x509.h:1041:27: note: declared here
 1041 | OSSL_DEPRECATEDIN_4_0 int X509_NAME_get_text_by_NID(const X509_NAME *name,
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors

Upstream PR exists to fix the build problem:
https://github.com/redis/redis/pull/15227

Added buildroot-specific patch to remove -Werror=deprecated-declarations
from CFLAGS to not block the bump of OpenSSL to 4.0.2.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...emove-Werror-deprecated-declarations.patch | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/redis/0004-Remove-Werror-deprecated-declarations.patch

diff --git a/package/redis/0004-Remove-Werror-deprecated-declarations.patch b/package/redis/0004-Remove-Werror-deprecated-declarations.patch
new file mode 100644
index 0000000000..3c33456d52
--- /dev/null
+++ b/package/redis/0004-Remove-Werror-deprecated-declarations.patch
@@ -0,0 +1,28 @@
+From b42c0326b542b0e5d29cbfef2ab08d0d36430803 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Thu, 17 Sep 2026 23:58:19 +0200
+Subject: [PATCH] Remove -Werror=deprecated-declarations
+
+Upstream: not applicable
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 205508596..4f31a3af0 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -52,7 +52,7 @@ ifneq (,$(findstring FreeBSD,$(uname_S)))
+   STD+=-Wno-c11-extensions
+ endif
+ endif
+-WARN=-Wall -W -Wno-missing-field-initializers -Werror=deprecated-declarations -Wstrict-prototypes
++WARN=-Wall -W -Wno-missing-field-initializers -Wstrict-prototypes
+ OPT=$(OPTIMIZATION)
+ 
+ SKIP_VEC_SETS?=no
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
