Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F26D9C98324
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBA7D407F4;
	Sun, 27 Sep 2026 10:45:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RSVO2Nfie1t7; Sun, 27 Sep 2026 10:45:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B8CCE407FE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790505923;
	b=RtWPgD+GwPydh4GnMIvs7m2IhI/U6meWoO0i5NBEWZYbEBpiLRQko24Aa6GF/Ag2+yhJ
	 Nctc1HkymiyMoL8Fo3r93NRsrNgwoLZvhAzTg43Wt8T5uKdYY4QAcvSrN5dK4NGHbCMNR
	 uAQDCl3hRtqLJpTSRILNyC0/119A130yeT9JSXnuX7QA2sxdTGnGtkKBFb+0w7weioYD8
	 Aw2YbOXXX1Ff3yWOJcazeHmdgbpn+dOZdym8xyV+uUEw5Ui1riEYLCsHrpf9IOgoGSpAp
	 B3FYsiIxNpleX8tV3rhjtEsjUM4OzAHsMmoqHgYLKd8KeugLi/2sWcA32EOf8mLcw/A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790505923;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nehb65UQB9a0Pa86OkDX+DfFEKYk4+U4utnGSbX/JX4=;
	b=WyxdMmkbP2kPFzCxh5o024wAlhx1i/6UyalY1ei5R29eGaMma01ag79Cy//VpqTo/mjG
	 +i14qOiB4LT6V/UnUXQBAs0a4MJNCJz/bhS98JI+drlkJZIZdlfEoGpwngYiHTIhaj9Bh
	 Xc2AXiiQdoyh9bMX/AaidecCWWBhN10d2v/lBQ6RuL73BM7/oPG5ga3A0NmiXbR0+Esrl
	 MtD/LU2i5irfn8nDyH0yo/n15iabyQbDIdHuQqeEVgvLdOET+/zZTbpzXvFUudXNx0uv9
	 oYZ+vAD1xo2ZvuKb0lB8ugS6vUqzKcvJHeavqK+eWvyzvwbfGGAf+q8KfBAPGp/hFOA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790505923;
	bh=nehb65UQB9a0Pa86OkDX+DfFEKYk4+U4utnGSbX/JX4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=iE52ndXEYkMoh7EoSy7E8BRlYDaftnAT5F4rlbtvovIze1g/6grIgLebD2se1vmgM
	 exhukJj17nAiconaBgTuEIRkpytF/JwxFr2cLmrYukO724tEGjV0vDIF+U7OHha4cv
	 GYBYL8VLsI1um22vdk9ANX1XbCKXyCHF0irz/62vNFKa4/hJpTWscY9VHG7WWGzlKh
	 AbJMdX9fC1sVQvnpjUsC4yP/o6Dz1RsJZAhLiZCyQlJq9H+fhiyKjDZoMIVJsN4kRr
	 Vf6WDJaqjwtJxqd51zVaMncIbQwJBZzHvvOFUg9ptGYARDvTuNQy6FqiAvShfgr8wb
	 NR3KYQKrOacLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8CCE407FE;
	Sun, 27 Sep 2026 10:45:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D876334
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 732E06062C
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:45:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g_xLDLgeZB2p for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:45:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 695F36061D
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790505921;
 b=mYpxZGpQJI7lwOmtOYk0Zrcw8zItJSANCr1KXhJSeK3JIN1DWmRnWuuGwovDDVUKV/el
 6iZK2MONOUW+lxm84C+Bmk7olqppxOAQmXbq2+SxLvroZ3/EZivQs8bqi9cy72oZlAry+
 AnxgseR11Qnln3tGjzfD3r53t1iHcYPkqIyjjt6qGFVL5we/UnXsBOur1kCcm3ObpN1CV
 FlvCy6Rux+YvvB8AORio8+Fa5jZ2Xvtqp0nRL65lP7CWGxQApoBLkt+zpp7/kXgUCZ4cV
 5/huCJhJeyvwm9fOZ4JwVHQje6DstA0yfdF3TCWaUTkaipyLrdHE922i42zL1c+fWmw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790505921;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=4s/yt/lfeoEq6l2Qv2Jxw94RpYOuFafLtjTUhG6qtc4=;
 b=KFURVzQmEar1W6IpJe6B0IW48RLRlZqOTVmaaxp547gsV+an2ZZFnNhfDOOju5J7/kWy
 M93znRm4IyttrMTwl3Wvee/h2b+E5DRNT8FTEcOyj0TlYDWCRPmJUtxV85/GOzVAbYPiF
 G5oR2ctorjYhVNSdF8VPTAvo+YfATW0b9H/jONJ+RDIPQEYkzj9HVVuPiYx2f6M5vBUi+
 Wfr+RmVBbKf0f45MHzbbrz3MR1B87OFohac8wkNYVclSAEiKjFlLyvO4IUNDWfR1Mf5kG
 aup6t0k0prRly1Nte5ilBtn0MCmsXjF5phYunduSphWfKBgjGLC8EskHoQg+RqYn2Bw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=jg0ogUwI; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=jg0ogUwI
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 695F36061D
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505821;
 bh=4s/yt/lfeoEq6l2Qv2Jxw94RpYOuFafLtjTUhG6qtc4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=jg0ogUwIy6AByHHXbfem441aBAbx+qyodzAXCYNHqw2biYJHRX/Jk6WTYLZJc2WZk
 /TSFLpxNzQfXtP5fab3a2UNXSaXU/xBJFfeoZUhFWwS/4bcaLawPu5OkHjJzCNGNi1
 24zWd0g4iAdtKmQYxJHlyikjzx5qjrbobTWAgpISoqeXLXPuxTkGLCTLX3QQ7s7QUB
 FFjf8i2tLrqqWXv//NK+vkKaqBeqYDCgUE+c9pjg6Hvy23ACpn537pqxBl5zq6gR/E
 alOjNrti0OgHqIvvnryXgBqOpsKmOPhuboxxmB5zjpWNUUN7pLauqwQ+DYCX0L0KkL
 NThe0HEqA6Xug==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 3g6hzG+DGgi3uoHaTca2TdKWMkcht6BlsBZCPMfuVf4Cz0UhRcqPk7Q939pSvxFUZf9rFPIWy4X
 4NDNR5ReXQCdDsnFE43LkiAUxGLL0HB3RrdfsBPGF0fgo/zKdLrVtTJHWSvIPEulhcs8G87iCCx
 2tI8iD6Ao2hnm7lRleGqjgtX4CJf5zROJ2+F/3qMqXicBkg46J2Eez3HrO7VdbQuKvi+5oOml53
 nLnh0MEsf+/xGkzb1pto/53xttqTDfwybZD1yhyrM1faR8wfr4FrtFeMDl3GjH9A859PNPzb+69
 wKzGIYzoddfiKiBVOdIKJlTNkZlcNNmM/oxVHGAX0SHYgv7Bd89q/yT//l4GwipF+PjAtwP72Va
 EiyQikVn///u1KAeXhz2rixFBgsQUX+F//RHDOHtMx7r/c9dKz+CPmXTK/P3GnKZd/DzkML99DY
 JpzKqRkN+H8AE37ukOxz08Qy84zHyTqO4clkDZM66YViA/yIyRUWbQyV42DAmScGPeFmj3xWquG
 R1eRk/Aj2u2eQjIHSmuzA/1Kquk2QLwJ/JKJDwA7xsZ7bpLVOHK66/8BxnzbIoBX1c0K9AbUFRi
 sql48gY1MrwHkBxgAX7PbHM7vXrd6qGM49E2lakpfcRTXCXKM/sWqUJq1NMwiwhOoWT8C8QPH3T
 0hA+D71dw3KbLzqulFRz/
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7A327A4C4E04;
 Sun, 27 Sep 2026 12:43:41 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLf-0000000007a-3FfV;
 Sun, 27 Sep 2026 10:43:12 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:37 +0200
Message-ID: <20260927104301.1801638-60-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v6 59/82] package/ntp: Add support for OpenSSL
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
Cc: Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
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
