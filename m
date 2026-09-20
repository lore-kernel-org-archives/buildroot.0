Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBEDBC982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AACE340E00;
	Sun, 20 Sep 2026 14:15:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SZ-fhiHoL1mb; Sun, 20 Sep 2026 14:15:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BE97340DF0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913736;
	b=c+caPCAt7w3H0OWwCbbMIXghTr0fsTK7Zv2FiCoCS5X+QduewkqHKOWG1YP7QbQbVH34
	 /HlthIRUd3F+GtNYNYDelUP1ecKH65BZmKm2QpDKVTuNppRFCWOG3N8TCXpDOdY7AZ1v9
	 t9KVOqitPga23faOTIhYdzrIoM9qItmzTclGxM5T3eQGmFQiPpgu7ndVnCayanIajS4Bl
	 EngJCmefNMtVaOyYCtyAxN7YnvDBDLUWGEieedBH2Rj/9iIhKxp7tkQzKU5Jbj8XLGNAe
	 HrbsKymomZ1Y/3dmgOwqqFnFgd/0YPA7W2s10EN2XN+2zFa0LrsYUjXbBHJnva87vGg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913736;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qiQKStrA40G4SArxLaN/JzI51Ew3tfCx7j06ahMPDKM=;
	b=iCZ9rXrDANYTYs7xe9Oy/com7LlfpFTY0GxlSxbDIbBDNEgEgobd036yXWfRYpan2fID
	 VvLYuKl+s2AGf6TnO5EphPWI6pTqqZDe0Chlgf3Dzeyr5PPIDAWheAX5Gou8HWUTiVF4U
	 8UTEFnn7Lbn8Jjx6f6txb8KZCGtdKHE8BhGbsIGDVKmqurAgxrJeB3UHz/p6QbTq6OHWK
	 NSrfzP7Sf0qe9C9fH+H/975JxcBqmDr+UwFhEXdOPKFzmW2Hq/i1BYIQhNrQENN45ivgU
	 Hb4evIvX1fzJSA49/ulzqrwVkd+DcSVR02IQOqAmKPjrHnFtxEjLJIVBu5a2tmqeZjw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913736;
	bh=qiQKStrA40G4SArxLaN/JzI51Ew3tfCx7j06ahMPDKM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Lx5rvlp1AGPJCe0C8934BaWHC8C6fAPeHPyybamRXq3X+O0GyeSAOPp0onQb+tMir
	 U0B1BiAW1C8U6BYATm1MvHGJGVr4oDVOpBPbz/nG2mbZi9hjsWYrVL81i/e3bp6uaa
	 Ek4aQiMJaZHWSDGbbQBBFL/rn7RQX0Qc8wbwc1mHz8zpPAQKNa6fuchlDQBTEaulYt
	 Yw1rCLvVOoWLLnKIgI1DZED1gA/dDq9aHj9GBDDJ6n5gisPpwAu4Fe37rvApKHscyZ
	 lYmQXilfjJddCarTK7dXaxma72ZCX5LHwwJU76wDXFQoQaISvc1lLkiKn73x/uPGjU
	 WJcEj6KtDXB5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE97340DF0;
	Sun, 20 Sep 2026 14:15:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 86D7F371
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 789C6606D7
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:15:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8YQaW1RUEaWC for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:15:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9A6EB60693
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913734;
 b=Zj9iGCmTX3Kng75jK9j+UpGggyT1BOeUX9TwXJMkD6zg0tRLgdlxAAGLKx80cPM+hMf0
 MfY1LhmqanSWVnYoWct9rep3f4langdweGHdQ0nJ+SiNiWATlH3XPmidOKx9Ma0ywr9nB
 XS29ESChZOvwyPBPIFyibtM8YA6XP2xCsPVvUq/YCZEfYgCfu/VG8g3PGBAzKkLRtyTg0
 xA7mfOH8rqC7ccUVHFc4zZ947/FvpkS9wlz/jPPtEAUHts4bx7h5RhO/PFQUO1weMjJpW
 dthl+6aJvbsG/tV+3txuFDXJ0ZLb3MZ5QgwNwe7GJdOXTKzxNb5PEonc9dNH8D0vydQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913734;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=UZryQBhtYyydy4yNnfN5L/lXDnvcBV14QpvNULqux90=;
 b=Cr3hEOnZ10wmZC584T6/+wBTptu5iZPfLkilxhjrbCOglxujecXa5D/Pl1Q+p//thqR6
 eVP34b81s+f1gyNmJT676hD1q4k7e/s+6MbmC/351u+6QBrWZWTV8jk1pLUBzPeriwysN
 SYkY916tcjO0Y1ug+0/Xp+P/n3AusjpBeErq9J34UoW+JzGf/6VRpDuAS+gj5KvIT2uA5
 e7i9ye0Lt/BsF6J876NZQ1C+3+/8qHfVzlcjpFWE9xpm/tJEnGZSoPdUZBiKY9mFkQR7P
 IneucIqQFw/jtZ2Izknel2eOp109ZbrGl+ntCmLmgpZeZf2bEOJpihUL/iwMw54ww3g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="D8/fl+V6"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=D8/fl+V6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9A6EB60693
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913239;
 bh=UZryQBhtYyydy4yNnfN5L/lXDnvcBV14QpvNULqux90=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=D8/fl+V6nnilbb2pQDNnUTExGOQQMUWBspv2k96xL+yRwAS0EqM0NZ2SwTdPbWjtb
 qpxrasFB4xcXehudZ5XU6A71pXrOkMq//T6Im4QN6XgF+0Ho/RmzPn9k9J/Ym6N1jr
 oo0YvK4mzRhfE/sYcptkeUud0VnNIObstBNVqkq0SbVdOz3OpEtakmEIYrkN+eDq6S
 EFlPyUoVd7ZgMQW1dAEy9JaNIgNYdi64vV9Atjb1LLHI48hj2iv7sfqZYG9+gKeHoh
 wJGg5dj4Oyr6SwJFhCI7Q2+Qlyhcnh2PvJcv1cEcg4K5FWHy2qW5IS0Q1ylD6KVGfC
 dKnC1oxSgGtqw==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:SVktMLaDhB7LglTvhLajMptTvJp7ME17CkK8POGonNACWllwL49kwdIULZ09iqXEH0CB/81K+v+i1kFAjj6j9QMOfTG91yn6dXQ2C392NsecLrIb4ggpgRPlyeKbHYGpFy8hm0EmGwzYfYEjAWU1JfAktg5j0kwhT8+QucUUB/Gpk4Wr6O6YMSTGJJFP7LljJGk1Ty5GwP9pxPmXc7oflFj0MTk7sV8aeSzGdxPr+fOtgACryA7uoQjhn24wKfA7U7ztg6DAS9gESvGp9B7VyuuH1XWR3lMifpVE4kJo40dyHRCde0c7hk9mQmSdtAHhvG+GZwIbWxKXQaFOhNcHGfbk9lh4BYkoM8A2R6MMyGYfYflF7I9g4zmyRh8Br6BP3UBKW+AEPXpZo6SD5lNvlS1sxST4BXfNKbaHCxSI3RiyheOsZGJ3rRo9GuPn+IRCMGz5uBgwCQFtgKXiI3gSCZmiMFcfzIbZH9W8ThwZhHLmxe9ZlcKST5HL5cgTlGgkFw8GLNjAO4FgeDB0ZPXWa5xkCBsbi5XOqMEpIt/V9ilU1lxeLQNETvUnYGx4ZbZuZsdVq1HU04IAp7IpiGTTajCEUMKUlHmzrHXC80QtcT1ObO
 NI4ja1cb9gXG1QHx/Q1GKnFM62x6AACynENGt/XZzGxhQ4zQzFO5wudXA0MgiOvNC0Ng+dJxPw
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4E0CFA4C487A;
 Sun, 20 Sep 2026 16:07:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBL-000000002J9-42UP;
 Sun, 20 Sep 2026 14:06:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:05:45 +0200
Message-ID: <20260920140605.3005461-48-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v3 47/66] package/pkcs11-helper: Add support for
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
 ...1-crypto-openssl-use-ASN1_TIME_to_tm.patch | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/pkcs11-helper/0001-crypto-openssl-use-ASN1_TIME_to_tm.patch

diff --git a/package/pkcs11-helper/0001-crypto-openssl-use-ASN1_TIME_to_tm.patch b/package/pkcs11-helper/0001-crypto-openssl-use-ASN1_TIME_to_tm.patch
new file mode 100644
index 0000000000..d8149330e1
--- /dev/null
+++ b/package/pkcs11-helper/0001-crypto-openssl-use-ASN1_TIME_to_tm.patch
@@ -0,0 +1,48 @@
+From 59cc22b8d65669da599f1c435fdfe35d4e07db0e Mon Sep 17 00:00:00 2001
+From: Ravi Kant Sharma <ravi.kant.sharma@canonical.com>
+Date: Thu, 4 Jun 2026 12:49:44 +0200
+Subject: [PATCH] crypto-openssl: use ASN1_TIME_to_tm
+
+Introduced in openssl-1.1.1 and is required for openssl-4.
+
+Upstream: https://github.com/OpenSC/pkcs11-helper/commit/59cc22b8d65669da599f1c435fdfe35d4e07db0e
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ lib/_pkcs11h-crypto-openssl.c | 16 +++++-----------
+ 1 files change, 5 insertions(+), 11 deletions(-)
+
+diff --git a/lib/_pkcs11h-crypto-openssl.c b/lib/_pkcs11h-crypto-openssl.c
+index 05af65e..aa58722 100644
+--- a/lib/_pkcs11h-crypto-openssl.c
++++ b/lib/_pkcs11h-crypto-openssl.c
+@@ -148,21 +148,15 @@ __pkcs11h_crypto_openssl_certificate_get_expiration (
+ 		notBefore != NULL &&
+ 		notAfter != NULL &&
+ 		X509_cmp_current_time (notBefore) <= 0 &&
+-		X509_cmp_current_time (notAfter) >= 0 &&
+-		notAfter->length >= 12
++		X509_cmp_current_time (notAfter) >= 0
+ 	) {
+ 		struct tm tm1;
+ 
+ 		memset (&tm1, 0, sizeof (tm1));
+-		tm1.tm_year = (notAfter->data[ 0] - '0') * 10 + (notAfter->data[ 1] - '0') + 100;
+-		tm1.tm_mon  = (notAfter->data[ 2] - '0') * 10 + (notAfter->data[ 3] - '0') - 1;
+-		tm1.tm_mday = (notAfter->data[ 4] - '0') * 10 + (notAfter->data[ 5] - '0');
+-		tm1.tm_hour = (notAfter->data[ 6] - '0') * 10 + (notAfter->data[ 7] - '0');
+-		tm1.tm_min  = (notAfter->data[ 8] - '0') * 10 + (notAfter->data[ 9] - '0');
+-		tm1.tm_sec  = (notAfter->data[10] - '0') * 10 + (notAfter->data[11] - '0');
+-
+-		*expiration = mktime (&tm1);
+-		*expiration += (int)(mktime (localtime (expiration)) - mktime (gmtime (expiration)));
++		if (ASN1_TIME_to_tm (notAfter, &tm1)) {
++			*expiration = mktime (&tm1);
++			*expiration += (int)(mktime (localtime (expiration)) - mktime (gmtime (expiration)));
++		}
+ 	}
+ 
+ cleanup:
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
