Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663CFC982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C9BC40D90;
	Sun, 20 Sep 2026 17:20:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kM6_72Zt-gOj; Sun, 20 Sep 2026 17:20:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 378AD40FBC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924800;
	b=LLd5UHJZFw63eQA8KfTpn02shFsNK1MraIwQVkVCgFfJgLvZET7o2g7kv9Wfq0yJ6/eC
	 huoxSctGYNjVdeS6GaHbSeMBV5sBG/zkwpDREZEFMuJcIauwRwePZPxMaT4rYMOlsJ+bn
	 oClc72FwS6EbtHjdhfesubxDg8SdhJoGjB58QAm561AwPwGZ7I+4dUzE2vu7NxEaIkhBl
	 j99DfZK5fyK6TP43BjlhWx3IdgB+vtN2Q+bVax5x7FwKaNGmo1eTA3eq0s4+DWOvbqO9J
	 u1I7v2W0VMLtaFbiY8wpLiop0TqLo4RLhuz5ZHxrZxdVBu/pl1Rgcgu5keR9qGhwYQA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924800;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nehb65UQB9a0Pa86OkDX+DfFEKYk4+U4utnGSbX/JX4=;
	b=P0GWe/RX1+o/WCZR7jXoVUb1nwMNiKLYqKHjQnxzY2d+L9PpjE9rfb0F8ZB75BfKO4tw
	 O3Dt3h2WrNHtsOY6RprzfIXUyuZYaK9/ICkKH12RyhNhRVyyP+r97nVkSckiV1AGEf9rs
	 OxvdvP86b1adKwFD5T9sV0UCA+8q/xA+rwuwsCvHZ8fmYhwHkiNi+iWC0Q2FGg6kwX88k
	 f5kSGGjqqh+Mt/JJZFIIk0/mRkP52HHp0s/QqpNgI0LsbH2bfGy+KQcCSEFcLKOiqe9G5
	 JEsi5Thn9CdmHRLsoGwmCDW3GVnZjfDg5+I9wJ8SFiiCfl4t1hv9MJx+X0Nl5qitbsQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924800;
	bh=nehb65UQB9a0Pa86OkDX+DfFEKYk4+U4utnGSbX/JX4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=CSPjDnCK46oAf3g7VTE1UxEaPpyj2Hy+LK5xXY0eUoJeUwC6ixxFN+iehCys1+JYg
	 ybn7yygspJNk3vAXtESTe5u74Fwkp3Akb3k/6fupa4+Z3389X2svxeByqA73lNpIcX
	 AQFSOy9PGTiwZBfC5qU31BvSHk3jfzk2HcU1NXSG7UDLq43ClBbl+ZnPHYQp468a/s
	 cB7xgrlZ3JIUcYy3ueUDvPY3stseYrV7jPX8fbxx4Zr8ujo4unVPmUfCwZiCcWDe7M
	 Osrjynr7FZSa+1RUeBDqw30lR/mzfuPYF0xO1n4tSl/1mmdeL2hbsRok1DdBQGA6Yn
	 yHnBu4Le5GgSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 378AD40FBC;
	Sun, 20 Sep 2026 17:20:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F15525B
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0171D4007E
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:19:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6EeqIXzGrR9h for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:19:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 07E9840022
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924798;
 b=DWhC47WS7I5wfJ6w5TUdLC4K5vLhKXYjdevaCOO+i0Wfk1n+7Mxd70jogTYF8pxfSPfs
 fVj4bmwuzuKt6QHE/xqYYrWmgXFrSuoRHpCisQaTWuw7gwn6IDKK6E2ETGUlyjf/STm9o
 6iTPbyZs06CxCXjb1rKGLpMJ2JqMfNPszxkLadg77tTZkBDTU/cEHHUbDWOvBxO6PYxFy
 t5YktfKxUxCuazKaLAdlG/KUGZdb0727QWHHa8yE+Mfde0RpAGtZn8Tt1KTzOnw1cJXuE
 0RAD1DMhHo9Cic+m5MTXd8ZbKMvynftNgfJ+A2kinGRd2IzzbpEJnMzjudunmsyiGBw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924798;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=4s/yt/lfeoEq6l2Qv2Jxw94RpYOuFafLtjTUhG6qtc4=;
 b=hHgTs/Bs5RNryqWV+weAUhPhY+S+UaYOuMzWPEM0zxPOMjthH4oeMSsf3FQO52CHKzg7
 5JoADqL4MiTIbo6sj1sK5wCpr4w6MN7h4UKvGws4U4WXQ/KXRCHmNMkDzTtOV7kHZ1/ar
 m1qEvYH2N6kAnNLUMT4GVoscEUjfR361AyAJuj+MPFLBu/g6QLLzaJNbN3QeFrk72DK2M
 vRWtlwvC0X1UMgd9wRUntQol6LI2JPUNtU4QDzLqn/655M1bVatrqQCZ+jZlsAkZ0EVGq
 lLLsnjQ6eOcD5NROjsndTrVtLSHski/OUJP+LnrOAv2bxOZGKN52QJ6GUyM39OuK3pA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Rt3NE9r4; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Rt3NE9r4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 07E9840022
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924163;
 bh=4s/yt/lfeoEq6l2Qv2Jxw94RpYOuFafLtjTUhG6qtc4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Rt3NE9r4LELs11wI41iv+aCrtKP3up3ag+WGo49Qt3kBdCE9QuDDJ0pWo7B52W7bJ
 VLCtZ9ANBYXvp+a78E2aWCRD3qmSSJGs9FIY0+CB4lOY7k8HGxK9vt6hioacKUCe4q
 YUDf25ewpE65vj55jn7UGRPkneQl0DzEj6R3Lh0Fxr5U16EIlqUj4zxYTMbT5LZUPe
 wpA+KpFfBgyv9FyHFyUIdaQ9Q8nG3kkkUljJu8uedwYSGUevTU0fmEtuuyzuP2vNxt
 boreCcb56VSO+6BzETlJSXYh0JPrlL1NQJpNKkx2QXPOED5Q0Id3EOyubAR7krMK+F
 uMp0gC9uUPvCQ==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:J7/o89s5STpYARtqlcWjEvMj9DvsNnRcoSDcO5YZJagyvfTAOQD0GoL0hmZM8MjAGaIO2SGs0t8kRAYKy6R52ZpvDVso7nIioQUCDjdgzcGXkARi/OvOvzkH/tvyGNJT/TM8922T7q5iXLqa3FF3cbnh72SMFIweG0GfoHZzrrwlIKabRhBgcLZfx5ImXNVBaCg7Oslgn6uOsWc9fZa8WTaMPaXboPBGawpueWzhWbJPJwJkc071JAsrmapKPVyFinWQ5gLrhxm4sVD2xXZZevHOuqcGLiycI70g/zqDHdOwknp7g2kmx1Nai0CBR+PutMEoFooGB0U64U394hOhVPDnUsiCJnEfPoHk8OkLnobWBtVNylpjjhFpMFLdJs9mU97130n/tPv+ZJ1IlS5ZWgIUQ48vorX35N0L1ftd7hbSbjobWI9ufB2Fj9lDvX0UqvBzx2IACA1V+eVYoXhKDEZk3cPmRaHyYVVd9JoMbfxPiXUq/KcBQnsXe955BGH1+M3qtqELVuJnaDFOFV923FiPXWhBkkxJ3Q6hXtSPAtCINB0iBWgazHCE4ipwgv5DO+WfDaxd1J01gzegTMmVGi9+pMXzulHGhu3tnxPYAjXaVP
 jCQh42P04RxlZ0TSLi6GTCin7duHkteBvyVneq13eZvBXPrjZFkWruQADhAFkuA5hL/wbWKb8=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C1D1AA4C489C;
 Sun, 20 Sep 2026 19:09:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1c-000000000o7-3Rn7;
 Sun, 20 Sep 2026 17:08:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:07:51 +0200
Message-ID: <20260920170815.240247-45-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v5 44/67] package/ntp: Add support for OpenSSL
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
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
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
