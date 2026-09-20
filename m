Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821C3C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:20:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CFDD40E81;
	Sun, 20 Sep 2026 14:20:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0VXNFJRMw78L; Sun, 20 Sep 2026 14:20:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 58AC440E67
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789914011;
	b=jlryrphc/AarOxGaI2fIoqPuwdN8NnQev4eb83yYdvpoL/CPb42upxx0tUjHHrKgAOYA
	 2xEQRzt7GbrInFtGXBcy0mTmea5681k/Qw12lwARd0ozw998x+VNdp959SBZsLCguHOhF
	 eTlr2PpHJ5pnwgu2H3A4iGgox/ew+IEAubMaIKvFQoDBGE4AF8kFMDeVaipGeQK2Rv1iT
	 LXNCL8QGBOB7yXHv+BD3vIg6aHKns0u+CrWQatczV46r3o3tKcsHk2YQaTemNtwyX9n3e
	 wHIPR2goH4V63pvsTrlq28pMl4pX95VKqppJ1TNuMqGUrUS2ODXgGtZqbvu7A0LUtGg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789914011;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=QYrIiEComcNnDEMrSsLDlyMKtPLSS/BRf02FDmWZwS0=;
	b=sDrWAz2rr1rhZjsNRx/RjZaT6jbAlC6W0gPuFugSVlE4BOscnE9EpoIZb/VJg1HKXvjw
	 wn8xTsulC7U5QD+twEXdhM6NcemfWkn8c4w+OCIi3ZTjZJBsynlDN5LzGoHOOtCZ2ZKqX
	 SkZwvkdXnZ+kXKhRBMuEfr+d3fB1tvM+0IgyD97aJYYwjg5vCaX17f9G0Pp95W4d3xKtO
	 9ZxSKDoXWCwU3PDEmR9ZyFSHEnchpY+aCQKLVhQanVGaPiU24DxvNvuDOAR7Fx1HIBuMh
	 uJU9xrZmclBjI3zqcOcFtnoMeJ+77qpz8BgE398cfB/P8UOranwiBHChAR+j893QX0Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789914011;
	bh=QYrIiEComcNnDEMrSsLDlyMKtPLSS/BRf02FDmWZwS0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=mvvluWwBJGRIypYEXVEawMIY8wVbN/+nAcf+KrebXo77FFNGuNYTqJfpLJpaOQl+X
	 KqrZVD7IQkvYDmquTuWskkO0MmiawplZv0oT04Upik+134pHa9xy6uofEnhVp3D3me
	 2ZirfJAqivM6n2fG19VheenQibJWM3NU29PUVGaNvd5RwDYTXdXcOuLQaAsr5LSHdT
	 M2/HUOWmVzEK7F8PPdJVjjsaQUp+Q9ZsXkWCMCv6zrvYl7yaLPn9POAGAp0Yeqv/YS
	 ILa0gs3ER9CxV8qYViFwjnNrIKWeD0fQ01oH+l+B2iKRVpLrXOV+nuKkwF5MfCYVl3
	 dKTGYx+gLMqEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58AC440E67;
	Sun, 20 Sep 2026 14:20:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D104224
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23067400D1
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:20:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tEp-uVAkqyTt for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:20:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 33F0140022
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789914009;
 b=fnIvvXD+vlNL/37QJkBIj8qo3t+TDdhxq2owD7lrbh48Pk9aarT9NvozVWk2/WcDFdks
 iu1g+G3MWJYG5Dno8dRONjS/w6VpVx2luN+XCA3/b6QPeqGVzmrUO6dM7gv0sj6DgmmJ8
 cvPeT3rA0KG7AfYtcLYBUvnODIJgcva2yA6mEKOoxsvCyOuEZWOV9nC77LK3h1fbOxaMV
 czLmCarE0/juqbN/KBDpljGE7iukRoabnRp1oA7ql/cwlEJCkjdsSuZkusR5cRLjHSguO
 y2Z+bviuSQUfo6nsF8nlBAuuGiX8luX3beVeR1aXr18iENd7qJHtU7RP28T/0SEzdnw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789914009;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=oL7odfLleKQDnXJQ2Q4ROmtEalWRPRzYV2TEjxOTsVE=;
 b=KNn6deSIXpRw15WG6xIr0AlL56iYIk1Un42TAOpoOttjwwMVHoPAmwGLslcyOPVZeG+x
 +rAmImMIWWK97Ndr2JRpidDvI5+l4aJBFjdocrIZShQk84vLNnCqtUccwNPaSjfwBKvp7
 rP9yj86VADUxpEJQ5FudAZxw5NSmhgjflSY5fMGDFzk+sdYJ+rVjxTXcyGCFqpnDdXMwU
 fD04ByCFoHtGzbbikB+SWEue+3nHNJIXmeEeXHg10eo3eXKLnRSCiWem5ff4lRYrrnqkp
 SbV1V2KfzUZ2tQza/ToT2awo7VlFPvg6uiGAI2MXhU1ujqPe3QHM6p+jJHkeKgbmmlg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=WBZkh22D; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=WBZkh22D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 33F0140022
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913245;
 bh=oL7odfLleKQDnXJQ2Q4ROmtEalWRPRzYV2TEjxOTsVE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=WBZkh22DTiVOT1qvjDkXQ9QxRDYaQKGX6yJ2veLXcNPvrh8JYg7OhnDdvEOC9BPY2
 LLxvXx0TYLpyj9ci0gWx33YyWie2XkWfQNUFwKnhUAPhiiw0L6V4Bs03xL+UwlsjKn
 L8O90HZg2Utaxwx4yregCHI2B8bbVL4kqkyCWiReUdbt7Wtz9e9QFHQvR4LWy1nPor
 igGmSujY9U31bkwm4vyqVI2eXppjbGOE558hJcrrFQv+AzX4hAOWhT4SCobOEhIG4A
 WYkklhjy4jX4zE1Xp1kCOYgELYE7TgRb1bD2sr0ihhDpwMbsBE880LxX6ugOHZOa5H
 +nE3beJ47Hj4g==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:6RCz45pEGvLIOPvsHoBZ4uA9kHrz0/sqYTMGr4O50UfEgLOnK8W4XGaSVbhM1ZL+CVzihJVhn1jwwdoLp9s+KNJH5DCzFgVqlshXbtEKUQ0mdeLsS+PxBIKy1rlnT7h54N0t9kiyws9WVSYOl5n9/FAtu97xmlPmrlvYnnBChXTcS+TANqEgpZCAAR3aLmnscUOu0ZrCJ9vGQVLmZfeq0sRjbATEhw/z10G+hcBDAj6AjHVDVntuyl+RYcYh8oeSSM+lYiCeJtkosQk0C+9GAg0Mi7v0WNzbK6uirGc0LWhKxQT27zVKgB/oiNbPtqLh0zR2e0gTYYoKPCyNJeQQ4F8AKBInRLE9rNiSgd17wx/h6GOFABODy9kJrPNHTGqe3ryYbkbn8lM5x1H2YQgnu2VodzHLXth1FbxQC1DzbO4Aiqw5dkCYLIP6AjLGRtvt/nt1avYgKstk9Po8uiv4noNs6pF3/v/X7+nD4J5C/LhouqBkgXOz8WsMXchlV9sOV1b0lQYLNuTFpQDYK1fTWP2eFVcS+Kv3jCsAR5SG2d0OiKDQjqwPT/dUoQM3xHpTRZ4sqGBQlC5Om9P4iZqkySSM7wKHISE8DsvXk++MA24M4M
 mXZpFeEtghmu7LwmJM0zy0TyP2YnOv46ucIEzxaVaKjNJo+deO4RVQJZJsdD4bZRqgq05Awgqi
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2CC8AA4C4891;
 Sun, 20 Sep 2026 16:07:25 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBO-000000002J9-1L19;
 Sun, 20 Sep 2026 14:06:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:05:55 +0200
Message-ID: <20260920140605.3005461-58-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v3 57/66] package/sudo: Add support for OpenSSL
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...-for-getting-an-ASN1_STRING-s-length.patch | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/sudo/0002-Use-accessor-for-getting-an-ASN1_STRING-s-length.patch

diff --git a/package/sudo/0002-Use-accessor-for-getting-an-ASN1_STRING-s-length.patch b/package/sudo/0002-Use-accessor-for-getting-an-ASN1_STRING-s-length.patch
new file mode 100644
index 0000000000..eec375f70c
--- /dev/null
+++ b/package/sudo/0002-Use-accessor-for-getting-an-ASN1_STRING-s-length.patch
@@ -0,0 +1,46 @@
+From f97a34bc7b390f185d544e21b0ef75db1275953e Mon Sep 17 00:00:00 2001
+From: Theo Buehler <tb@openbsd.org>
+Date: Sat, 22 Nov 2025 12:28:50 +0100
+Subject: [PATCH] Use accessor for getting an ASN1_STRING's length
+
+OpensSSL 4 has plans to make ASN1_STRING opaque [1]. hostcheck.c's code
+mostly treats it as opaque, but accesses two lengths. This is API added
+in OpenSSL 0.9.0, so I'm not sure we need a configure check.
+
+WolfSSL only recently const corrected ASN1_STRING_length(), so maybe
+there will be a need to cast away const.
+
+[1]: https://github.com/openssl/openssl/issues/29117
+
+Upstream: https://github.com/sudo-project/sudo/commit/f97a34bc7b390f185d544e21b0ef75db1275953e
+
+[Bernd: backported to 1.9.17p2]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ lib/iolog/hostcheck.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/iolog/hostcheck.c b/lib/iolog/hostcheck.c
+index dbb900e71..8383d2c49 100644
+--- a/lib/iolog/hostcheck.c
++++ b/lib/iolog/hostcheck.c
+@@ -323,14 +323,14 @@ matches_subject_alternative_name(const char *hostname,
+ #endif
+ 
+             /* IPV4 address */
+-            if(current_name->d.iPAddress->length == 4) {
++            if(ASN1_STRING_length(current_name->d.iPAddress) == 4) {
+                 if (inet_ntop(AF_INET, san_ip, san_ip_str, INET_ADDRSTRLEN) == NULL) {
+                     result = MalformedCertificate;
+                     break;
+                 }
+ #if defined(HAVE_STRUCT_IN6_ADDR)
+             /* IPV6 address */
+-            } else if (current_name->d.iPAddress->length == 16) {
++            } else if (ASN1_STRING_length(current_name->d.iPAddress) == 16) {
+                 if (inet_ntop(AF_INET6, san_ip, san_ip_str, INET6_ADDRSTRLEN) == NULL) {
+                     result = MalformedCertificate;
+                     break;
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
