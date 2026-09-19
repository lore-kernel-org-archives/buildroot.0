Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59AB4C982D8
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 206C9606D6;
	Sat, 19 Sep 2026 16:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TIya9cqW9pqq; Sat, 19 Sep 2026 16:08:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 45CAE606CA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789834110;
	b=c1JazBKHwJKfBT3OvWKiH7lPdUt4ob8EPOs8cysmGI0qaMQvicPinYSXfNbCrBXQonep
	 Yz6Wt5hGNy4y4msmpndgP29j3TL+edle7Y5k79vOB7i9DN2g+nRNMTDqFmDLytBED5b/P
	 wRDPjvOCA5cD+n06Zn2/3ZuMhBdjWvPzmXToJ2fskNjf0nPJjhYqG+XDSnwCE251ycp6n
	 rrUUoF4UtnzlgppFqgXUGOPUw9ysl5epI51AaBWne4CmY79cimjhZHU54p5N6rwDKUZyr
	 0jocneEoAPIGh2havITp3guhO2wyoTXhJW6uwQP1ZLVLQIOxPfkFCWjUB4C/d7FBjVg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789834110;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=g8tVQiuMwG52nIjyxnR4EmoabN4tRkWOFX/HJd4kkgU=;
	b=DuFtYjawwcSj66CZpwS1SnSiJNk4UtL/I4FVnaNIVZMeEG755Ywv2+e/hex1PKwWdKa9
	 aVn4D4w4ybgy4EpAo2WztcUHN6GC3jFBLDl6T2vfMhIj0QrSRpa2CkVAwaYvdEsFjm+C+
	 u+GBpq2fJE/gmuF0K4YCppmKVN6/gahO7w58QQMACSkdaJTwW01QHObdaSzUrqK7Tb9ru
	 f3vwDRBfNAAlZWW2yS0Ri0Tt8doCsUufpdRCz8hOVh2t9h3c1/ROOGt5WX+mAkAELEkaw
	 89au7KSk7uv0O96PvYOXnpH9IgCx0zFQzDxUT8ZRrHHl2TX4k9rS90kgjGBPWyezdBg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789834110;
	bh=g8tVQiuMwG52nIjyxnR4EmoabN4tRkWOFX/HJd4kkgU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GQJ6lNYb+k/0pG/hkOsTQODBJBebDYoWbbR/6Sq62qn7DG78HJRGNz89QmOs8+98R
	 dD8qWwLRxoJbpFKCgoE2UvDDR1QxfkDOMC4XjHDwG/QZCzfNST9qp+4neIrGPmqYG9
	 gGToMIFUccUMq0ApRw2sVmodAa4Wo3EHYcX7NCvSNElp2Hw479VM7t22wx5xQqDjbg
	 momUzntLVXlwfNHO3lrezuP+hMMrTMB7jA7sKE97ayXQks1tFQC9uh8P035DWNrLR4
	 zETLuEGMLtCxoef/POKyn4mbZq6hXdpaIwjcvqYGWlXbHBTcwQzLjZMZQdr/uJQ9tz
	 T6U54vkleiE1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45CAE606CA;
	Sat, 19 Sep 2026 16:08:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DB35824D
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C165740B96
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:08:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Osg0BlmBDwv3 for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:08:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BD4EA40B02
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789834108;
 b=lpLph+azjbZqle3fx5UDxPXGj+7wbJvmMX86JjyQuwRJiPnTyqz16gGRp+2i1IzolOWz
 c0fon+M3C0W7/bupoEFF85eBfILucNdFoNf3d3DyR6LUAn06QAPyVs94FyV2oBa7LCTGi
 FmNGP+iq/fLCzqst36TaqulgyatXXxISsNlTEnYezy/bvYtks9XoqJkQKT0WlV32pEFoi
 I1oajf+LVqc9po/3ImnVm3ei+ClLMWeT48PqgbKUMR0cjE0v80RM6vjT9MVsKrxg4P4Yp
 f1YBp2s8SnH3mBSIuKpB8oVmHw6CmFXexnLNfluIktqvSCsWIEybYEDAW71wxxr0Oww==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789834108;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=bM6cLKun4UwhERBhTrpF8m29RT/h4Gu82Jk0sYFAuTU=;
 b=AcewbtZ421UIQGa0kXYC27ZpzM+0V8BsMo4shZ+YqkF1ZZwlnpzAx//KnvKokL/SVlX1
 geO8gr2+KyW218TZjl9C7LKOqmhl4nVHaBpDg3CCNWNt3rPRNydf+JJqnVuLFSJnwHL28
 L11B8AJOrLZJ93iJE0nu6ibPlUb+B09QKww0XzsnTKztPD4eGByI+j09juUGfyZYrHm83
 +ZX2R+TDbHAQQoYLMHsPE+HVrjWjZl1Dim1s4g/ALe/9MdA13ezIZXRYHP5T0g/DJpsd6
 VD7pjr7aomWQcDfCpIoGmjV7XQu1fmQ24u2kbO5o4pOhtKKb0iDTN0nDjcDy+8oC9UA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=SjutVeii; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=SjutVeii
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD4EA40B02
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833551;
 bh=bM6cLKun4UwhERBhTrpF8m29RT/h4Gu82Jk0sYFAuTU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=SjutVeiiR8vQPuG+muS+tJHBhXkJ8iOwOaSuQk/j1SCB82r7Pjyy8vPxplh8sDJyF
 l+L1zq5tQtRx17skPHEihwVztSYlJz45Ql4/XHjQofCm1WsXINnnts14xrYAucS25X
 5L7zD/D2MHBbMGUazmVGbkMp/VDz9bR8UDDYrkOR9xQ7FTbCo77L1FWq65QgyuIOo8
 hcxy1TMaTkx3PvwFRV/A7kjGFbUgn5XSwsxIVvq7vVI6V9rRjKnnbmhqo7aCeCND58
 iAL+9KYLhxRvUN2/NVwJgWv6gTcYfBB9wwSJbUNO/bQ6a9ERqCzZL+XlBIYIm226jn
 gUS8fNXgRVzaQ==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:gPHiHbNlqO7IkKP9HopgF7Hwp1hriunksyhHcOaXOXAbAPUciicJLMKqhgJ3rW5V6RsemKrESc1FIV1oqrNi7djFdejhCZgXt1sU/DciKGN68+dxTjjRNz2SVOtoSxlXGpsnSVeYM5vMWL9igXRk14jty5aT+lSVcSGoOzADiae7UnTSaaLJbfoy0GjbT1rSNzxRUPfuM7WD+D9cZZS561V3jk48sTzj4pyq+QHKYSr0Ua2YxV/B/Xn1Id7tB8l976ja/rYlZTiWGxmiZxjTH251NJxwCuQzdgPzeRT7YEbnadALfgdM0Yb4ioyAkSksTKDTRFUdm6VTtgA/0769AtWTOgegWIcNt8IITrm0ut72EgT3ZQskx1RzQ9k2SKgCW2/8FPQVeg+I7lOf0/S2hXxnNEN2paKS9KT0BRJifIQUghmiByMvHhu/KW1Tn9/hRruFi873OD3paod9RwSXVCN25VSYK7wBP0us8ZOO49uEjeFvCSwb3rhsn+orEfmIQGtQE7JJPLrgT+xAm4ulJTzztLVJwmvknmellk+ohAQt9+OmjZdYX28XE+xY6mDcbBX+s9e5EKXXfTAeTcn1KmgyBmQ74K9BMrsawUyrJDNsGq
 DZCtxiIu7vQ7aZYXRxcHF+cW+YK9sUQzDo5OJEUjaiU6PTja8msLOjjapQC4HXJzOmzh5H
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 42887A4C47CF;
 Sat, 19 Sep 2026 17:59:11 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSq-000000005Jx-2obj;
 Sat, 19 Sep 2026 15:58:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:58:08 +0200
Message-ID: <20260919155845.5776-44-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v2 43/77] package/ibrdtnd: Fix build with
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
 ...ateManager.cpp-fix-build-with-OpenSS.patch | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/ibrdtnd/0003-SecurityCertificateManager.cpp-fix-build-with-OpenSS.patch

diff --git a/package/ibrdtnd/0003-SecurityCertificateManager.cpp-fix-build-with-OpenSS.patch b/package/ibrdtnd/0003-SecurityCertificateManager.cpp-fix-build-with-OpenSS.patch
new file mode 100644
index 0000000000..4755409747
--- /dev/null
+++ b/package/ibrdtnd/0003-SecurityCertificateManager.cpp-fix-build-with-OpenSS.patch
@@ -0,0 +1,41 @@
+From 7dce31ed85b2e2299e63e7704ae2ffa7ce08d1c5 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Tue, 1 Sep 2026 22:44:06 +0200
+Subject: [PATCH] SecurityCertificateManager.cpp: fix build with OpenSSL 4.0.0
+
+https://github.com/openssl/openssl/issues/29117
+
+Upstream: https://github.com/ibrdtn/ibrdtn/pull/287
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/security/SecurityCertificateManager.cpp | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/security/SecurityCertificateManager.cpp b/src/security/SecurityCertificateManager.cpp
+index f2bbb017..0093d418 100644
+--- a/src/security/SecurityCertificateManager.cpp
++++ b/src/security/SecurityCertificateManager.cpp
+@@ -146,8 +146,8 @@ namespace dtn
+ 				throw SecurityCertificateException("certificate or common-name is empty");
+ 			}
+ 
+-			X509_NAME *cert_name;
+-			X509_NAME_ENTRY *name_entry;
++			const X509_NAME *cert_name;
++			const X509_NAME_ENTRY *name_entry;
+ 			ASN1_STRING *eid_string;
+ 			int lastpos = -1;
+ 			unsigned char *utf8_eid;
+@@ -188,7 +188,7 @@ namespace dtn
+ 				}
+ 
+ 				/* retrieve the string */
+-				ASN1_STRING *asn1 = X509_NAME_ENTRY_get_data(name_entry);
++				const ASN1_STRING *asn1 = X509_NAME_ENTRY_get_data(name_entry);
+ 				if(!asn1){
+ 					IBRCOMMON_LOGGER_TAG(SecurityCertificateManager::TAG, error) << "X509_NAME_ENTRY_get_data returned NULL unexpectedly." << IBRCOMMON_LOGGER_ENDL;
+ 					continue;
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
