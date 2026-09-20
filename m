Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9FEFC982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78B9F80FF3;
	Sun, 20 Sep 2026 14:53:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 79Gq2hvRHfIA; Sun, 20 Sep 2026 14:53:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8AB4180E22
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789915990;
	b=gCY/C7mlxvvYOUPOjQPuzvns8bqruSJzDyo37WEoytVYDOhGsmH3K4I2LHT93q0kk7UY
	 k1kOy/ZIbT1UpmgnDOfKf6BdISj29StEcCKlKbE/R9jtCLKJn4yqzvmMeKK6DSh6LC+H7
	 Y0traQ45DIvH1ob5SYSE+JUuJyKMhJf2RcRPCO5m/cNRyko9oM+aDjlefM4Q5S+C5IGxZ
	 Do8qgMI6u0CIXcH/I4KR5d7DsxfLWveiGCwOKQTuRVjwlMmyEf6c0wcw8wrGdnJX4v/dD
	 PuDHrVp3gEfEfnGYvjBG22+QKXRr937HzAad6YU489/pV4ZJYrcTTeH+DAaA1ZvZWwQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789915990;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nehb65UQB9a0Pa86OkDX+DfFEKYk4+U4utnGSbX/JX4=;
	b=VQL2Ie3xkF/3yN+7TMG39LCFMF0DH7WhXKReaN9CG/E73r1krcKBUBwjgr/o/y6syii1
	 sXH55aC88ui4EMWWgCuNYP282/zKbwyv6hbr2OKHGOEPMQyPuzhN28ofs4u7vn13YxvPA
	 2ynpzuGU5kSZ1GILCAYOPz8Dmi+WmywqFV0hy9vfkO1Ci8ycYyZu0s9cZDs4qwp4RQEbW
	 TM4RcZ+RruiB/KF7+geEboFrcgVwcaElpuCcP1Z0TonHGC39i0KaBsNXQtUE5bDI4aZZh
	 EkJAj47ALwAmkVIUUvXCECcAIFgdwQS3S6oJ9LTc/EZ2iuM2bXze2JWy43BkT6gECAQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789915990;
	bh=nehb65UQB9a0Pa86OkDX+DfFEKYk4+U4utnGSbX/JX4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JE9f4O0GdpIloDzD1wBYHnSUY2mMwVvgWZa30Q5X6tRmzw0wIZqGz3gwaaoNYkf57
	 CM1E4BlNH7Eq6ToE7NKmdDXUZPgQrerqbMjNkJcdoiPNILZSANqkYIn9IuS5NM+6Yy
	 gJWaJfLfHp9CppAkqsiQn61BdQ1NAE3k8SyFb3WkOTTh9cOQGExuD7QEtHcGmZ/WeS
	 TL8RKUEVh+P/VZ8o9sSrh5re9AFaaidLG4NishnKvaCYmh0W3r/OqjNgG17qLPeJpR
	 AllQS1HJNnKG3oMarrlCRkQdr2VqInJgNVUmUQ3P2B4i4Bl+moey+ZMIr5FrSk3hbE
	 i5qUT6ZSWWYag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AB4180E22;
	Sun, 20 Sep 2026 14:53:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EA4A24D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00B6E40E05
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:53:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6_TGoJAITf2D for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:53:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1C38F40D15
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789915988;
 b=LWlFegLjp6uJtt65k5vxG2PWV/u6A6UZGbl9k5DpVViEG3z5LjO1dFddNU3NFzw0xISm
 6zClvk9GFoVDvKY6mV15vzZSO5Ce95pfwNb0PmjG+Oi4TwLASyqzsvcBKO4pTIReuVJIQ
 +0r6htefwMJMMePwnWL0jNDP7Li9NR8bAUIYRSCl4JHSJ1X08R5H2ETAS/eNNF83I4/FX
 J6Y3MvauwOVuhit/N+0Yx7bFpyafgFh4gpGcCfMU4EKg/Uaszqy0de+p00L+JQi/D2Vw/
 5zgmicwA8RlzyS69SMSMZ9fBlojc9USpCFU5tz90Z0Rcc5zNJ+zjiNSdnUFAQFtscXA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789915988;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=4s/yt/lfeoEq6l2Qv2Jxw94RpYOuFafLtjTUhG6qtc4=;
 b=iDpbC+o8/S5BFsfyrXm/meJDr1o4yvk42b3iLG1+rgzj/voSMvcagXXklGZlSZP3T/K4
 UIiC1LapImkDQKzAuFb1SgC0ALy+3x3s9L8Kx441vGnNp6g1VYhKSdhox95RasSAjGP7T
 YrpT9nJBP6HAcb+N9TLAGfItlFKDbCLcSpRlgmIB07Hgi2VlpU0FgMLuPpIScFP7M+b33
 2rLvvC2+CsvknfjMRREH80kigGO2vfY+6HdGOqUAuYgwaT6eutJiFU2lYbOSS5froGiO/
 dEp4PNJc5FHbPOcsiokTVEtzXuOUoGFYeWLoaXTrjo0Ye7hGNju/OcShDpX+U+8BVIg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=IWhZ2QgW; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=IWhZ2QgW
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1C38F40D15
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915504;
 bh=4s/yt/lfeoEq6l2Qv2Jxw94RpYOuFafLtjTUhG6qtc4=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=IWhZ2QgWzY7B+OMfVo8ee9NHGMsUInc12jgrJEej4e+BCApDnYGpGOHm6Y+NZfuIE
 PW6v5zBVj9UlQ2lUdc+hMQexatMNnVyDMYTxqOpBme901DWpZ3xjjjaIPOPcRIsCPL
 G9t0IB00iHIp8UM7kad/2XAyv1G7Riw1n1m73AOs7QEz0kQ7LqPhfeDJlpqQEBdYWm
 RRP7hBK2Zo8q5BeWadtw1Mnyy05mwL2gDij67iyFV/hTAgpPhXRL25jtiw7GH0PDPc
 2zQg7UAfy4qCITRFOIZ1SlRWe8DdumKZXQ4NaBQmvm0JCGhp8Qf2kTrKxxeouAWrUo
 XpoasaQ5Fbk7A==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:ed9SDO5pMHdSc6phzBE+AdKsQKhXEnOfajXsfCGHI5g3hf+m5+ZXNfOi0f6bZGCqF4ZumQqZZPWY6B2VRYUd3DtUXUKyJOoz8UyjwlfEiDALewJ8WasbYFjtCy/qaacBS4eon+0ZBkykDffS1Cvs7cM+PfsKHL4Gl7gH8XFfyoz1Ow85obtQMoHQ7Kg3Mz5cAu1SO9srWbyP3PObwe3H+llWd+oKYqeflt4O3oqFJuhRGiv+RZQUJRz80haXuyqlbuCiUdBnlYi2puQ30WV3yVKSB/B/Ju2B+elmPbpsJl6OkMb3JEASEM57QfxFLCuYXKaKx4B47b+n85vk5WhkIqZFFC1a6By1GqGvO9ZLWKpSFiujcwyKdgnXcSj6iZkIA2f3+x/Tn6MWN673p2MBe3oEAdehNGJhSAFHQJKhptyHZ6xuh8dWG7Z9m/u0wFTZ9o+NGr5+y2Hcoqz1O4oG294T2KOqiXmQoKnfDQqcY5Ah8vEEEzwD/8YvII4bz6720Yc5W1SWFUyBOIYUzmy3x1PPGXp55yVxSWVEaDko4L7/K8DsrbAatyVyut16nb8HzqDr/sGfrr0jCQqFFHhSuJ7KxARtIBY=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3623AA4C489C
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:45:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8Imk-000000000hB-0q6h
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:44:04 +0200
Message-ID: <20260920144428.3009612-44-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v4 43/66] package/ntp: Add support for OpenSSL
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
