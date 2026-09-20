Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1E1C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FBE840E40;
	Sun, 20 Sep 2026 14:17:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O-BU_AMUXUNl; Sun, 20 Sep 2026 14:17:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5C3F740E22
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913834;
	b=KTe5OMTfWLQmxA/BVnn6i7dSmIHdO7jkUSDMMbZttjKGgGe8sPDAKMiJHengwM5AntR2
	 88NcVQyVSy9YvsvRsvLdIgUJwRREYYnxwcT8oHHtQDYNu19Ug39OuzACzQs0uPOHtsfqV
	 W6zFHGdYQTaWQtX7IvD4EGYynCExLRH9c16ZtpEuIMaIkHuNEflMZCVgyf3m9X3anSJ+a
	 EFlNgLkKae77nCqjtbeZPgoL/afKRRFOguVfzCN4SBZDsYvSszJ6G70Cgifpw+8Ir+OnM
	 fbge5er6StqDglApEcnj00ib7aLCZIBige3E9+ZsM/CndwkSewvcd31/nmZ4PZa+3fA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913834;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nehb65UQB9a0Pa86OkDX+DfFEKYk4+U4utnGSbX/JX4=;
	b=AG1JFhn8C7FhsD/AZT72qGNMoaTRNi16zOqQsNKyOaZBYa+8A4xQUmTbYxyKVF/fYBhd
	 GWwRvRsCjGbiTTtmR2KX2OFU0/ENs4kadbLN9Q/yQgTJK/mgfVYhhYwF7dj0bhnifar2l
	 BLn8IP71TK26lmEjUdArQDWQnXtMNw2yqbRKbTdrFAzD4GBuuL7zWsmdr5UnQRO7BqXwx
	 2kc8Ra+XunLzal5yEu8Fdi55ImIRYKcw6wZk/mdTqDy/2ErzWxYmoKdtua5oqPY1Ky4e9
	 2UkM9qdS2NK/T+ErcLxr6QU1ccmCoknb2NYiXoYX+o2jhirupR8zNi7rG8/o3J4Ix4g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913834;
	bh=nehb65UQB9a0Pa86OkDX+DfFEKYk4+U4utnGSbX/JX4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=DRWAhkhd8w+xta0BrDKxDPQ8G4WMX1USAUqK8edg0b6+28UrLYPdob8PBlHkIc3pI
	 DskkSlmHquabUHNKTG4wZPgg4uoOlyTUAyPWr2c8Gg9qErfzb0efHrQJGDF3QOo4fX
	 WqaLQCx2pQ6fKlOZMl3fykEcVkL9QSMStX8wusrhpQam6HwvLoJ3MKDcDCLeXLjLmj
	 oQcMttEnECJMHXcFe7Fjw6Kw14wBXTQr7RV7G4ja1Niie1ljUQbA43awGKYYUVjfj9
	 n4rNzSvemA+c4uM1P3vgvpJI95w7iHV5uFR0YIX0jA4rwKslKjcOilRJMc3v6DXHvY
	 yJupqu8sO1Psw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C3F740E22;
	Sun, 20 Sep 2026 14:17:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D070224
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43035400D1
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:17:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o7LXF3wMQhbd for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:17:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 087F040022
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913832;
 b=OwRXOpcbK5RDY3VXOY3zxkoCXRThhKEdS6Fr3/t+AKMLYwNVuGLS1zZqOPtaCYQifMyb
 fDGSssQpJ1eHkX7e/vSvcyrNbTU6RLmEcD5W2P/IN4vbrGZ3MSb1y/9mEvtmdsmXdzvW1
 1H9KlMglDZ7oR75E+njDHYYwKN6M0aPNbgMUCvcIZ5H350Ct/e9cWNTwMf4M+ygb6NA3X
 ustPkVL8UomKKLrK63i/PnxVvqMSFSyvxdX0wksI/XJa7EzwhxuDmGcQ/yTwm5h0cqirR
 Rs4Ow5tYqqSM49RAbe715P2Dd0TF8FxevhRnO9kyse7AP9ptpLD/2nL57gYteEbtSQg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913832;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=4s/yt/lfeoEq6l2Qv2Jxw94RpYOuFafLtjTUhG6qtc4=;
 b=YWUwgM/gCcl4YGfwoGUahf+o5rD6tUDor9XsdmCIyKrMRhJvZ9DUvkJVC/vnYDpYSQjs
 gGppOGP3h4qVyQLFJ7V5Lt85QDHZGdtKWeU9/ekbZB/xZ/HrP6raLJm4bnSQfxk/S/tyX
 ECfVVH9WzRbd6yfp6jC/lJCGixUbBFL1Yc+fbz5bOA9+3MOEUvrdpvMCvFjmBRpjB/bCG
 G0OpURVgHWFM8XvztvDxPrzbtAJqR/JcZxl3MaTZqZnjXQhY+VsPuO4ejS0xyE/A0wAwS
 0LM5d8L7F+KTTOUfzbIjRD8e8VEe+dANP0+fUfWDGCUWI/1DSHzs4sPBU/vZgkR6CvA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=rDMKs00s; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=rDMKs00s
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 087F040022
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913241;
 bh=4s/yt/lfeoEq6l2Qv2Jxw94RpYOuFafLtjTUhG6qtc4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=rDMKs00saeV08Wz4eCMRdr60eoVN49KBRMOkZ/o5z6rwtmQ0ZpT5TGnvPFPxe03rF
 CrtgDhH8i/ZZ9dCNLXc6qM1cAQiaKnxfD56HxMExAZn1SxM8rmhyEjebt3ZkHWQNH5
 hXTQiMxzlNh6p6cJVW/5cKc3G7YaYZxNVaRXKAYi4YMgiGgDhLQWajZ/OzdFu/M/NN
 G/Gu8xy6ndZRyy9EJWsl+wwAna84QmrVK14B7EYwwOKK+hVfztSm3eKSuengKmnsCZ
 MZ8AJJysmTzINgYRkGgipB0hKu/ZlncnboKJg11HTdiZiJdTCPQTzFBvrTJFuAyH7y
 m5caIb3TGeeMA==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:daHW33YIAL2zLyNKCWPzDZ2FhWL7Gpp0oGM8/YCIRY3cRRCdRxWdxz4pJNFG2GbQTX5rqBaa7RDpM3T/npC9xUQXPoI/OInhIVS58hvQXHSU+CI+AGLUzjiU2zfd9mCxsJo/AX8tAKNc6C+xj6ggoe0M9CrWH2CEBkH1AHaHhedw+OsavNl3CUa1Uwb85hJe88dartYd02LeI99WkAqwuHj6ujYeOGekkrJzWnhVqH2FMMppANE8RDq0p6bRdu4NDkRcm44J9l45pUWvNg+6qV0EMsGpjWftrJKFUrC0xyhFUR1IqysizULxG3XBFBt+ge81SspY6n40Wu/9AW2YMg7u6K1vh1zxYCoMNeS4Q13foeCYBKTUI7tTvZFkroVS2B09PpL0jJKq1za9A7gKHUP3Jhbyqcof55eJX5z76PH4LC9N2SaQbgS5n1aI6f2e8wIOYOAfZSogZMsu8MCPdlKRj/lPHUSMFKC7PkwmWbmZknLfotPHI4lGlF5AatfSFvqKgr4cpZ7+1Iowgt/aJUyZ7EedTaeU8h9YvSq9d/Wooc32hdsdn0qvMclKfwilAYjDMn9aQ0ow8aZfa5n4mhs1LXXsAM+aAGJEju0smvaM7E
 kDKJDrEUaF6JQp0PHh6KW03effGh3AHDunAm1ko3fFkB3WGl2p5psWi80kRtqSdsAMMHHBBgrh
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 853CAA4C4884;
 Sun, 20 Sep 2026 16:07:21 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBK-000000002J9-3d8I;
 Sun, 20 Sep 2026 14:06:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:05:41 +0200
Message-ID: <20260920140605.3005461-44-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v3 43/66] package/ntp: Add support for OpenSSL
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
 package/ntp/0008-openssl4.patch | 100 ++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 package/ntp/0008-openssl4.patch

diff --git a/package/ntp/0008-openssl4.patch b/package/ntp/0008-openssl4.patch
new file mode 100644
index 0000000000..8b4eb78596
--- /dev/null
+++ b/package/ntp/0008-openssl4.patch
@@ -0,0 +1,100 @@
+Enable building with OpenSSL 4.0
+
+Upstream: https://bugs.ntp.org/show_bug.cgi?id=4023
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+diff -Nru a/ntpd/ntp_crypto.c b/ntpd/ntp_crypto.c
+--- a/ntpd/ntp_crypto.c	2026-05-19 05:47:27 +0000
++++ b/ntpd/ntp_crypto.c	2026-05-19 05:47:27 +0000
+@@ -2019,6 +2019,9 @@
+ 	struct calendar *pjd	/* pointer to result */
+ 	)
+ {
++	/* OpenSSL 4 makes ASN1_TIME opaque */
++#if OPENSSL_VERSION_NUMBER < 0x40000000L
++
+ 	size_t	len;		/* length of ASN1_TIME string */
+ 	char	v[24];		/* writable copy of ASN1_TIME string */
+ 	unsigned long	temp;	/* result from strtoul */
+@@ -2064,7 +2067,24 @@
+ 	pjd->year = temp;
+ 
+ 	pjd->yearday = pjd->weekday = 0;
+-	return;
++
++#else	/* OpenSSL 4+ follows */
++
++	struct tm	t;
++	int		rc;
++
++	rc = ASN1_TIME_to_tm(asn1time, &t);
++	INSIST(0 == rc);
++
++	pjd->second	= t.tm_sec;
++	pjd->minute	= t.tm_min;
++	pjd->hour	= t.tm_hour;
++	pjd->monthday	= t.tm_mday;
++	pjd->month	= t.tm_mon;
++	pjd->year	= t.tm_year;
++	pjd->yearday	= t.tm_yday;
++	pjd->weekday	= t.tm_wday;
++#endif
+ }
+ 
+ 
+@@ -3517,6 +3537,7 @@
+ 		X509_EXTENSION *ext;
+ 		ASN1_OBJECT *obj;
+ 		int nid;
++		int datalen;
+ 		ASN1_OCTET_STRING *data;
+ 
+ 		ext = X509_get_ext(cert, i);
+@@ -3550,8 +3571,21 @@
+ 		 */
+ 		case NID_subject_key_identifier:
+ 			data = X509_EXTENSION_get_data(ext);
+-			ret->grpkey = BN_bin2bn(&data->data[2],
+-			    data->length - 2, NULL);
++#if OPENSSL_VERSION_NUMBER >= 0x40000000
++			datalen = ASN1_STRING_length(data);
++			if (datalen > 2) {
++				ret->grpkey =
++				    BN_bin2bn(ASN1_STRING_get0_data(data) + 2,
++					      datalen - 2, NULL);
++			}
++#else	/* OpenSSL 3.x or earlier follows */
++			datalen = data->length;
++			if (datalen > 2) {
++				ret->grpkey =
++				    BN_bin2bn(&data->data[2],
++					      datalen - 2, NULL);
++			}
++#endif
+ 			/* fall through */
+ 		default:
+ 			DPRINTF(1, ("cert_parse: %s\n",
+diff -Nru a/ports/winnt/ntpd/ntservice.c b/ports/winnt/ntpd/ntservice.c
+--- a/ports/winnt/ntpd/ntservice.c	2026-05-19 05:47:27 +0000
++++ b/ports/winnt/ntpd/ntservice.c	2026-05-19 05:47:27 +0000
+@@ -87,6 +87,7 @@
+ 	int	argc_after_opts;
+ 	char **	argv_after_opts;
+ 
++	init_lib();		/* ntp_strerror() below needs it */
+ 	ssl_applink();
+ 
+ 	/* Save the command line parameters */
+diff -Nru a/util/ntp-keygen.c b/util/ntp-keygen.c
+--- a/util/ntp-keygen.c	2026-05-19 05:47:27 +0000
++++ b/util/ntp-keygen.c	2026-05-19 05:47:27 +0000
+@@ -625,7 +625,7 @@
+ 
+ 	/*
+ 	 * Create new encrypted GQ server keys file if requested;
+-	 * otherwise, look for an exisiting file. If found, fetch the
++	 * otherwise, look for an existing file. If found, fetch the
+ 	 * public key for the certificate.
+ 	 */
+ 	if (gqkey)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
