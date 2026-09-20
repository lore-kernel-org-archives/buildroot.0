Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 221D5C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3C0560639;
	Sun, 20 Sep 2026 14:15:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XAMT5GmMKAjC; Sun, 20 Sep 2026 14:15:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0F472606D7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913749;
	b=FeV1na0WtMqRxckUF5V1p90TW5m3tKvCp2vDDLl7IuVeFUdVp7V4zSE50JDnyUivYnRC
	 7UNk/9f/g80noNXesU7Q7GmVFGm/J/90JWh3xcVUEb8ItfqWIbNGraRYfWxxaWdeSNK5p
	 xPF/9nyLgDf79VPXYhn0uED2vMdbyj98DKFH0HnRfbe040iiOYQPSGLmv603TYaXuAaJQ
	 7l1KXLmbEjcZ1g10qzhjY/m3Rz+whP37NWwolNxEG2khxea4tJDRTC3dqf89zAN1QXFhH
	 /qjzuaDIIZuzvzhSUbjMJMYlP9aOomfnZBV2+ALXmnFlwcpRI5jiDV7PqNpTARkBQBA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913749;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=g8tVQiuMwG52nIjyxnR4EmoabN4tRkWOFX/HJd4kkgU=;
	b=qFxfgxABMtE3zqN3QtpQyfwuTMJ3J00g3OU5fLePDrPYkhWYrIt544dzq+L5GHo3Yg7I
	 j4DQJ9eD8iGbJh4YNzP+t4VSCMBJXp9FmBPSriVgdlzx2OPmRFNvuAjkO0RAw3Z282Oy3
	 mTUybbLyk+F2KNfuXaLwib04ew9WOBamsxKHBO3v13ebjWDiYSFn2bSD82jAUzhoFlDGb
	 OdZUXUHR409K/lUQKtIUeZiV6XQhx3M+W2xWgtE/6NCpfBxQKalnykbAV9h0xAezg01zH
	 JMQdeGCnDK6v59mDqz+LzjtkIfJ2pXVtHomDBLBDp7PvixKIyWp4C51JpbsnuloqRdQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=kHUOHZE2;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913749;
	bh=g8tVQiuMwG52nIjyxnR4EmoabN4tRkWOFX/HJd4kkgU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=HtUi2lNjDT9So5hzMvgdl6ke+Y1SlTjxJ4/WAbjSWqGA066p6/4mLO4kLk2BLtz4H
	 sldAh1LE6zV+9oRVYBaK58Haead+E2BpeflLRvb3YqtEBv6IMcOs3VapSpqwdbBLaX
	 i7yugDBuz65dEH1cDrYzAtAc+IZwn/oULreOOgyqmv1xW0esCbxvrNFL4nfxS5Lg/F
	 716C8Kd+CyaKb+hNVGL5meb2rls69WDVbYJ5v5rr5wikIQRAe/Pw2DrNIR75bts7aT
	 /YY93TkxP0aEU/Z8pMhLqS+4NBWwkVr2WUmTxO1G9eIRmKy1dNpIA7Mt/bYjao62aq
	 Eg16UkHbRI6dA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F472606D7;
	Sun, 20 Sep 2026 14:15:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 26090371
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0BC07606D7
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:15:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ID68odPi0v6n for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:15:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2690560693
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913747;
 b=XvyPa+5XmdnSR/+FVvfrCK9W7OmXhMq8yepE3zj5aBgO/KTKlEwJj/rJJc80JuAyJWHc
 JyAtoVpi5kafBXYOYLlk7Id3zxY/HRaI8rMVQDHYRPxgEJF4SxwWi1P7UGHjOsSVeuOJG
 zoRbOajkTK10tOYRb9Gd9qcZ2B37ooo6ZkWZHOiFQVOxCpvI7E72G5XsGWZlv90Vvs04N
 FKwbOzjadh+hMXyMh80kS+LSyymnOLs1Zb0jk3u0E1wsnZyb6pcBJ99X280RdggvpesYB
 /gJVQRMegdvzF+oSmQZGqF6Tdf+EjXofgYmIOBblH9gEkGEfCE3TtNEcLNi/dU0gUog==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913747;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=bM6cLKun4UwhERBhTrpF8m29RT/h4Gu82Jk0sYFAuTU=;
 b=X5PwUr+Ec4CSFAozu/4Bz8WvOPtwRqCJbglm3GWS6PcIlY0iEIaunvo06JF6Bsy/Zk9j
 79y9SMMh/gl65L90L+zfUPjMhiGkUwjcK57jSZeoPe/uKZeiAKvO4THUK+uCuefaHOyCT
 DtoxYmiobOHNW1fKEhT1HnxpvzJW3qgoxjb7U3oUbK/LbJX4Cax/lUOWIIue+nifiuDHg
 mcYaIcVTVd6hLhYFAWEKZExfKv1XxQURuD2GQwzez/GrRLInuS3xuASYd1dCWFBC3JNlo
 XnwLc49BKbUyKJ0FEqS83pgGVt0t3A9klWov3x3s+ZhPp6oSWkX9W5M+hmY1SCvXjig==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=kHUOHZE2; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=kHUOHZE2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2690560693
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913239;
 bh=bM6cLKun4UwhERBhTrpF8m29RT/h4Gu82Jk0sYFAuTU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=kHUOHZE2OD15XZNAhWOMP36OX2mv2R5+EYPGMF2J3GgVOkZJ1Sr5tXnJorAoO2wg0
 9HDzaAm0puwY1ZyFrqGNObuANWDMadMOkRX80+Z/3J+PMFlcRDVoSO68tiw38hcNkJ
 r0KCx4DpUpX3QAmMmxETKKQFD4cvQWckwSiTVUn57W9U27Bv+ws2VEnfoiTF4rDJfN
 e6KPzYOBJmVRQlsiUj8mh7Fa7lwQOHgG2Ru39grY+jpftgHynOlWYyyVoCoSsovSvn
 QAUtd6AT7odf1HGzHSBUpzKg1B4bL6VMk6jKYkaio5HeVHmASdBfjLzBdWWv796h4A
 47JHUAQKWf4eg==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:uMH+4kOR7eXijmijcpWgAGkHLHyx81csKM1e9+X2p6N1dBf3K++A6b/qKkVDdX5qOAiEXR5FO+K7JbNUoxxRP41bJ1XDUun7mRfxQUVBTAKPVH8gz1TNmOc948b2R88lMz72Wt6uBRKpJ8RyludTrncPfQ/aKLnYv4Mt6bfx7szGrMdQJl6Zg1fWjZzrXdO4kDMr9Zz2jiu9z3pvAGjJ3PpZ7yYWfo8RzhLuoM8iO/QlP+JeOJWFMm2JKfOuJ44mmarDBw8hj5IkLkUXAKqh7rl8cDpk4mQdsCP2/aeI/mkN0DKLf4StKBi9un6s59BhMqtjksXtKRkxyT5zq0rpSKsQ0FsLFs3Iim6kpedCxZ9rl3I8SlrG8e8zvnEAX24ck4PHcqlAdRq1qMulDQKYO0GqH2oNRS8QYVl1vqBzecJ06MrBAE2wfPFZg4ERMFlw11Rp+vujcWgJ7MwNRNsv+uFxwSdvOWLRHYUXqWU3iPOL+Wk1cmxkAcf2Stn6SPBQIzx7mnE5jGOjoJnQtFxGDETZcdGWuydC+bZZwZru8tNlDebHma72WHfGn6olqk/HRLuv5FX2gr6MToKiLwDnSMQxIggH4YUzbAQFl4Qw0DWHCZ
 +CUXXhaQ5Itzq5/5MfVcfz1I+Uj6dt+DwJ+qvUwlNoR8SyCLVPhfle/CbGnIbfevZamO1NBpOb
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8A5B9A4C487B;
 Sun, 20 Sep 2026 16:07:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBJ-000000002J9-15V4;
 Sun, 20 Sep 2026 14:06:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:05:32 +0200
Message-ID: <20260920140605.3005461-35-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v3 34/66] package/ibrdtnd: Fix build with
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
