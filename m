Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5D3C982D8
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58C9F40AB0;
	Sat, 19 Sep 2026 16:12:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P7nO_nnnTzuE; Sat, 19 Sep 2026 16:12:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 68C6640ABD
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789834364;
	b=ZvVAhezwEtk50SKb2LBM8ocDAEY5RWoiz4y2xbkTVNiJPXDMfT6T5ioAMzHwbKOnQfRe
	 VAyIexMpb1U5061xIwE1bYviAJrsjDZvjZSpeQQLviesuckZDqw5iPaUqYv7Jhwbtvwf1
	 SW6M/+DblVsydWwiABJjYkaYmz6cC47LXE9qAM9/HYeP+999HMuECE9HWU1HtIm6bO1pu
	 xO68uNe56cWisdwvJfmqYB8fj2aI/WHvIIALFNS8foB3Om5MNaHtsjLac07ZmbuEH47Yi
	 xwV59P62T2QdMtdafEbfmpetYQbjNWtymvhjTMfraADM89R0xe7NFV/FkkZB3Rnc9Ug==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789834364;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nehb65UQB9a0Pa86OkDX+DfFEKYk4+U4utnGSbX/JX4=;
	b=o4p1gDHFAyxt6KCUJWgFgD2Wmjo+KNnS8cY1SMYNAIMr0yoFhksjYcADILw+qNOakuNg
	 m60E7dLTBHt6BeMqmaoC2Ly/xH7WPLgJkSFZhg0lqUpRDodI0JqK98K3CGxU72ySQB6hR
	 HIdxv5LmY1vsAQn+mEq0EUhtaW0l9RYd8kR09a8dcT28inrFlvh/WQSV46BLWpS8E38/y
	 8Bjvqe9iQtaeGdG2sgCXBnG+vuzUqU1gB/QU8eeh+mxsbegm/a+LWnuxlC0z7z0C/KM1v
	 TI0fBKpl2/NC46/0VZECbGPUgej6GnQJZStAos/L45TlfWsOSXum8xk7ez6B88rEwRw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789834364;
	bh=nehb65UQB9a0Pa86OkDX+DfFEKYk4+U4utnGSbX/JX4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=QsnDgHJ0VyX2w/PxaBW9TQMZMR/u9sfwR6xn6BFopHlmupawBbCKdvfn9KHW+vUWR
	 tc4Ou6SxBzgP0TbFmGx4hRwrycuVcQv06t64ZnS2uC1LfOwBiuGVdusjsMUnvHFeo7
	 Pcarx/4SWrki2GTIwdy9HbF676FSqz+SRgKlDRZB1Toq/16PB3C3t25vfGau52YDyu
	 QhUBNg3Uo463HAd3ayHNQ7Nkc1hLFK5Gw/aP4P50MKXdRnpBS2aFsTgd9IfrFHhn9A
	 fFFStG5rdhzHPZIKsLT4B84msQTNphfAEIestEsh4H3fsStmnQVY1VOJmWUjMyycdq
	 iQo7ACd/Qi7Pw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68C6640ABD;
	Sat, 19 Sep 2026 16:12:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 81C6624D
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7368D606CC
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:12:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JHJTUYTgzsni for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:12:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2434D6060E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789834360;
 b=ojkTyzwvQJIgzEbFS+Wb05hKd5lHopzwd8pkSD8ocLxqyXZZHhHRCJ3oY5D3vGeSNH6U
 WQItRonjsRyQLqLwHi7B8wvFix+PSCwu1E0os5jVVBBY0pt577JNXayJLLACY7xcidvky
 Vbr0DL0n21+4XEsXgfVIh5u4s0sAOza0pjeDc/nMropwL7CR7VLXpElgJNsM1AWgRRaH+
 +ZYHp4BBFc4j0Xy1Yn6IquqzSTjAmMF3UKgYsVU+tohcErbQd80jwCkk2bav5dFjgx2Tm
 vELeR+2Aqz1jzxssDZfCwnbRiPu5j86O3HloeBA8yUoKdXTx/E0qTfAa37bbIKhofcg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789834360;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=4s/yt/lfeoEq6l2Qv2Jxw94RpYOuFafLtjTUhG6qtc4=;
 b=D8sJxGjztm4nksDJaiuOZmxbRUC1lWV0RZhaZf2iPMNYNRqawyBbGQf7EG1JCoaRZMJZ
 ophgO6sPtKUYNB4QlrCnI/zavQhFORn5KSBdIgu1lFovkgrFGqAITPPNPz2MxNixK619r
 mxbHvVvuRtDXQHqQxlCxDVaLARwWHYr5my7msp5nmBz1IiU9RK+9AnoVVrhdLDlGmEVx4
 vDeD1iFNJGXFcHvgV3oFg1WSg0mkmS+x3WBJKPKo+sDUYvBJKD1FaS5S6zsZMcogfhBFZ
 dryfITyH0owyrZTXiGPL3wzW+qk9SoL2bGMNItDFeNPG03veejDybArzHhL95K+jUPQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=N+JJqLSO; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=N+JJqLSO
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2434D6060E
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833554;
 bh=4s/yt/lfeoEq6l2Qv2Jxw94RpYOuFafLtjTUhG6qtc4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=N+JJqLSOi5tjNb9+egx/FnP4JQuXYiim1kBqvFIwh77yINQOYWeENH0mFD4iGShcE
 EG0odNWlRyQ4do0z4YcqiDf6Z7860e6Q4AXv6/aEwkBpjfsUJ74lQqMCmjh17VqUXN
 IQWCpI4JcaHwuKWNjCWViY4L8xVPVi6lloayQxp6FswBE4z80CV9xkvJJE3QPKCJak
 OsJNgLnEzSx4XvCq/cm6bJ5suc1kuEwjqklEBVkeNCAZqKFfS8E+JW9aFC/UMBHSOF
 rQmER4ODtqiWZCxSHhPHI3UnVzESdra7qk+mzpYE8lc7gBoytbp24HpAooAD2aanyS
 vDp1ENIvjRtgg==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:UDnKRgNCf1Zph18s7uI/ESF1tQmSUqtXK5k29/pTOnbyY9Bkmxq+YcpW1r1/3ASc6S7aYRWGjY0g4kusI70Q6Kt+2Lb8lAxBDT4DbkkqHEMs37hidUZhsbiuARxFgmCiBKP6amYVQW65M0jVUWn9LN8u0qqXo0Bi9lJlNgJ7deAR12OCm6ECde3QqevUswFoD/y3dgDKwHTCkpRW7EQi/h2Ss17Dt8/RDYlQx5xejMWksUU5qiHfcHBFDEnN1fbcPDHYOmDYDEZ2Nskhfj4ELlXKO+BGd5PBtSin2ZCdOPCCfJNCC6PlNd3pHtwBQeUKhYNItg4K41RyIytn3/Wg1PYovdcLcWaAENe0AfpRH35qj9Mm5f8O/tDpaUtUQ363nOgtxH3S5dhK/iQYF3LJqGPfdgyigMl2yFdPO+ydnIzpINBvJzsObwLKvGX2b8DX/vxs1d6YQnevUQm2IIajg0XH1Fh0+1oyeoM3DipfLBZnoFPuckv7kXGw4Hqo6wOCG91aj/mwUMpwZ6RzZr5AVZwUxl5mD/4z74f1sjgHNulOPCKWQrcxKTzqdUXk+1T48iwlk06sflQUHel1oDT+0w9TrkgQFKUH30AUmHkoHIV8ou
 4ChsENaptLVJnVMhI+n8LcO08u6hVelxnB03dyP8JrgyT2zbrchXoPJWuQ7Iok/HQ8Hpgx
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 05803A4C484C;
 Sat, 19 Sep 2026 17:59:14 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSs-000000005Jx-2rQo;
 Sat, 19 Sep 2026 15:58:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:58:18 +0200
Message-ID: <20260919155845.5776-54-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v2 53/77] package/ntp: Add support for OpenSSL
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
