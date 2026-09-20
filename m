Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E44C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94856605E3;
	Sun, 20 Sep 2026 14:53:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TYbgiWE0q8bm; Sun, 20 Sep 2026 14:53:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 32ACA6073D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789916016;
	b=KErZcjDrRS0mmfy0+D0eaJadc9PWD/D6zpfZcKcvrPHJqhgyM/NBayfEPcURZ9mebqYR
	 iLkaVVj2ZRU82n6cl82DdpLPOq6HdXZDkajmgH4dUBrS+zZEG1Z+KwGxaYHVlEJqSlDFr
	 nUt94oJchBmmpd/7ZvgAMyLsG4eJjwp54lX1/JbZlxazcilIBB1ycLCEECD7VeWUXYnPC
	 HbukEdPbR3PgBCB2cPYzrl4Mb+/2xTQKd7DBUKvjOXs7AkPzcF6LRwpWd6nuTDuaQYH6f
	 lAyF4IaTg0dje+h3HiCpTfJ2bLkR7Qgds7w7xSkVxiDmUXqZsdnor1Dywcs/h7kyf6A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789916016;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=11Qsww6xNFOB4hvQCLl5DslALqkKTQvo+GbHqTwTHvk=;
	b=gZPNUIFI4jOKBML9MkKZYCDgagp6rDVsuUrTnkpwJBY3HMGTot5iXH34+ISYK5uIZWw5
	 Qt8FgggJKYQaWnVogfSHQUng/q/kL0lAyeYBIZp2WaNcXKT1cFhzzFU1A8oDARWxnbKgm
	 Qpu1LJmOwiOZQ5YO/DkPvOcwPA3Fg8mU49bgi+iy9QRg8EYtBXgDSSGm2V1KwGUrJnC0N
	 qOoqF/FAsnObZlRoW/ejgK32gHzR2H+MTgHxJfRbUCUh2/mCiBAmmXZ9yz+6MX/MvecWJ
	 3GwWb3KxlqAG10ba/9lOVl3qsnssHKl+erCkyY0x6drjFj7pDRQ2CvErvLNaIy/p/bw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=bwitpfC5;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789916016;
	bh=11Qsww6xNFOB4hvQCLl5DslALqkKTQvo+GbHqTwTHvk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KYiYFyQ1xSnqBPFAK+667RAnPXgjYmGCDvbKz/+Vr+qxCHKS87kj7c77w6V5cJVZI
	 kuk96JGcjqYiTcvNIb4Hu85Dj3Nro6hNs2YLtSZX0w79w1YNIvd2NV90jOXn7Bg4X8
	 h8gohFl0vnBUGfZyKBiAvKfgZxV8XjVpViVYT8nVw91XpHBEhiZ6iLN80eWLkmRO/Q
	 ZN+2Lz7TryGd9MHemrRR4Mg02rDlYe/olBvvoFQID37TH889AHzKT/RZvKjA9G1SmJ
	 cwVZFrheilLprveOPyNBGiuNGIaBONPD40302jtP2Y+/fXXpBojokohcYVFleJam3w
	 LkfeAndUbllxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32ACA6073D;
	Sun, 20 Sep 2026 14:53:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 84BF724D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 829106073D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:53:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZccGGQ0Lb2W3 for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:53:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0198D605E3
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789916013;
 b=sq1iE8S+ixjKovy0f0W9ol4QO/zENXPXscujrJGhXseIUbzOEJ8bvGHzjuf16FV1zf0J
 zIgMbVuT5e7duQO21kmvb4uyuZY0xarVxvcVv3kEcQ5iOkopYJRgaZlBxthjYffKaP4Hq
 zoEdQmu4tfJo2c3QfhXNUgI5lTGWxjfzzzyUdIKcRIqvRD+SQ2iiH9bdqGP6Qgg7Up8ds
 pSxXFH3XjPoYLSe8TiInpbWpGejIgh4NXX++lqEJdLE38rxqZ7mZV2tIP+S1lzwOSDDkq
 sS1wYGOdYq3mHqq3BeDi7b2Or+LKgQsNc2SgNOyM2ZAxCFQv7F7/0qxCDfIoBvsP6Pw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789916013;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=KBXLPMLh6ffxxa3uv7bBcT2CXD/KL8pG7XR6lg5k81c=;
 b=QOJaBoCC6lZ5EnJjfTWOp+PCs7QnCkc4Ura1WHZUWaso/drRBRpvJECE8Yusw1KhBM1a
 oNqrXoQk2Ttr3W+GScEk5oRMpFZANVK3Bo4WjMNrKbppp1xKoE8oA+JN2DbpIcKXWJfKX
 nuhtjTjfHnAar/iFZ1JjeFANpYWUuChTvGSq0dxKJB6bPwm6pVyZkV2Kku1QGfa+NbRov
 8y8UYhUtYMttRvsn7zvG3eZcfGGTb0qJpT8N0D7Y3ePSlhLQzb97xhSje85FJa6W0IuhH
 qihoBsl1lojO5Ozq2N+42hzXYSMuxUZbyiBVJ/Fpw5DyjjAR5v2yvx9D+uLdP+inLXw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=bwitpfC5; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=bwitpfC5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0198D605E3
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915504;
 bh=KBXLPMLh6ffxxa3uv7bBcT2CXD/KL8pG7XR6lg5k81c=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=bwitpfC5/LaJOJovCF1Y6dqr20gkn5UAYBa/olkJB9IikqIwQMHwPSlJftM61G+18
 XYp1zFt3zNdJarjtQqXeYIzz99EBcHo4tobVdtnIpYYoqw9XZHUfBSYk4j6P5hSTSo
 gdZOiVH3F1BZ27V2yFO8Xgrf+0Ea4cA7OZj8pIoPBN7f4MN7ieqkPtE97AsNAnljbo
 +Rqq6fJbY803NFNvmjadivLvdSUBKiwT1afFQvH/KzzP17t4ktQ8reEoR14DAT/+J4
 ZUwxQCkR6YAfGtMYGrasJKNgA5JEBmDxkRrK+x8Dez5ntxNgAXN+ha77ZFvdym7MUc
 8uDda/Fo2lQwA==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:SlJa0/T8QqSZjkrhenU8KKCJgwQtKBwPHOYJmyz4QbEPKTAIdpmj6Ugy48niD2rdHAsGavBDg0Hwx9vXGuAJKR66/Eaw5WDDt0K0OjlHRjBlFDquAaG9zCcOPiOKFMTQuOtmb8Sp7mNIOu/GNJ6PpIC/F1KMv81GNjDgkobgMWOmPkvpOIp2959WGjEauSKi8VSc3x65frG7qm9KOFgeemg9BPNyjriKuWZGYyLWYUGVCHXrlm9yh7cnUdnB8tJWxDdkM9jdvkzSTIPpPY1Kif9CgpwuMILSMXUJ/E5d5mC4T5DJuuZ/JghRhANZv9yzxUbnHVgGM2KJ1XYkolHwDWHNlF6VqsCIU2/TwsySdEdq2IljN593v8JkM+2pxr64GpKxND/TiNddDc9RCnxa/4ZcZJFqmjlQMPsqfXyG0lPb9Xx16p4LejhW2rQ88VY0aEoFCloDwOt+tnJ384vw9BQr3K3dR3rwlSIPZ+2xoIDfu0I3OrgneZmthtzUNgj9PNwXN5Zv+Xd9dfgnfDJrP7LR+0leXawLVVVU5iimYwzGOSkYB88a0YMTMOf7AP/IZjdq7ShBuJLTqWFdKLDDC5+wb3xYeJo=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 66EA3A4C489E
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:45:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8Imk-000000000hB-1c8d
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:44:06 +0200
Message-ID: <20260920144428.3009612-46-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v4 45/66] package/opensc: Add support for
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-Changes-for-OpenSSL-4.0.0.patch      | 333 ++++++++++++++++++
 1 file changed, 333 insertions(+)
 create mode 100644 package/opensc/0001-Changes-for-OpenSSL-4.0.0.patch

diff --git a/package/opensc/0001-Changes-for-OpenSSL-4.0.0.patch b/package/opensc/0001-Changes-for-OpenSSL-4.0.0.patch
new file mode 100644
index 0000000000..6039cc3fc0
--- /dev/null
+++ b/package/opensc/0001-Changes-for-OpenSSL-4.0.0.patch
@@ -0,0 +1,333 @@
+From 8ad96adc5fea0cef923a2a679600f3a5c4c5bfce Mon Sep 17 00:00:00 2001
+From: Doug Engert <deengert@gmail.com>
+Date: Wed, 15 Apr 2026 15:10:42 -0500
+Subject: [PATCH] Changes for OpenSSL-4.0.0
+
+Changes to get OpenSC to compile  with OpenSSl-4.0.0
+
+OpenSSL says:
+"Opaque Structures: ASN1_STRING has been made opaque, and further work has been
+done to make X509 structures more memory-efficient and const-correct."
+
+ASN1_STRING was made opaque thus requiring the use of ASN1_STRING_get0_data,
+and ASN1_STRING_length. These routines have been in OpenSSL since 1.1.1
+and are also in libressl.
+
+ASN1_STRING_get0_data returns a const pointer, so the data can not be changed.
+There  are a number of reverse() functions one of which was reversing the
+bytes in a EC pubkey.
+
+Changes not addressed:
+"Global Cleanup: libcrypto no longer uses atexit() for cleanup;
+OPENSSL_cleanup() now runs in a global destructor."
+
+ On branch OpenSSL-4.0.0
+ Changes to be committed:
+	modified:   src/libopensc/cwa-dnie.c
+	modified:   src/pkcs11/openssl.c
+	modified:   src/pkcs15init/pkcs15-oberthur-awp.c
+	modified:   src/tests/p11test/p11test_case_common.c
+	modified:   src/tools/netkey-tool.c
+	modified:   src/tools/pkcs11-tool.c
+	modified:   src/tools/pkcs15-init.c
+
+Upstream: https://github.com/OpenSC/OpenSC/commit/8ad96adc5fea0cef923a2a679600f3a5c4c5bfce
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/libopensc/cwa-dnie.c                |  2 +-
+ src/pkcs11/openssl.c                    | 14 ++++++----
+ src/pkcs15init/pkcs15-oberthur-awp.c    | 16 +++++------
+ src/tests/p11test/p11test_case_common.c | 24 ++++++++--------
+ src/tools/netkey-tool.c                 | 37 +++++++++++++++++--------
+ src/tools/pkcs11-tool.c                 | 22 +++++++--------
+ src/tools/pkcs15-init.c                 |  4 +--
+ 7 files changed, 68 insertions(+), 51 deletions(-)
+
+diff --git a/src/libopensc/cwa-dnie.c b/src/libopensc/cwa-dnie.c
+index 47f3792dad..6020921dbc 100644
+--- a/src/libopensc/cwa-dnie.c
++++ b/src/libopensc/cwa-dnie.c
+@@ -646,7 +646,7 @@ static int dnie_set_channel_data(sc_card_t * card, X509 * icc_intermediate_ca_ce
+ 	dnie_private_data_t *priv_data = GET_DNIE_PRIV_DATA(card);
+ 	LOG_FUNC_CALLED(card->ctx);
+ 
+-	X509_NAME *issuer = X509_get_issuer_name(icc_intermediate_ca_cert);
++	const X509_NAME *issuer = X509_get_issuer_name(icc_intermediate_ca_cert);
+ 	if (issuer) {
+ 		buf = X509_NAME_oneline(issuer, buf, 0);
+ 		if (!buf) {
+diff --git a/src/pkcs11/openssl.c b/src/pkcs11/openssl.c
+index 0a5d4394a2..a4027339b2 100644
+--- a/src/pkcs11/openssl.c
++++ b/src/pkcs11/openssl.c
+@@ -463,6 +463,7 @@ static CK_RV gostr3410_verify_data(const CK_BYTE_PTR pubkey, CK_ULONG pubkey_len
+ 	EC_POINT *P;
+ 	BIGNUM *X, *Y;
+ 	ASN1_OCTET_STRING *octet = NULL;
++	unsigned char *octet_rev = NULL;
+ 	char paramset[2] = "A";
+ 	int r = -1, ret_vrf = 0;
+ #if OPENSSL_VERSION_NUMBER < 0x30000000L
+@@ -516,13 +517,16 @@ static CK_RV gostr3410_verify_data(const CK_BYTE_PTR pubkey, CK_ULONG pubkey_len
+ 		if (group && pubkey_len <= LONG_MAX) {
+ 			const unsigned char *p = pubkey;
+ 			octet = d2i_ASN1_OCTET_STRING(NULL, &p, (long)pubkey_len);
++			if (octet)
++				octet_rev = malloc(ASN1_STRING_length(octet));
+ 		}
+-		if (group && octet) {
+-			reverse(octet->data, octet->length);
+-			Y = BN_bin2bn(octet->data, octet->length / 2, NULL);
+-			X = BN_bin2bn((const unsigned char*)octet->data +
+-					octet->length / 2, octet->length / 2, NULL);
++		if (group && octet && octet_rev) {
++			memcpy(octet_rev, ASN1_STRING_get0_data(octet), ASN1_STRING_length(octet));
++			reverse(octet_rev, ASN1_STRING_length(octet));
++			Y = BN_bin2bn(octet_rev, ASN1_STRING_length(octet) / 2, NULL);
++			X = BN_bin2bn(octet_rev + ASN1_STRING_length(octet) / 2, ASN1_STRING_length(octet) / 2, NULL);
+ 			ASN1_OCTET_STRING_free(octet);
++			free(octet_rev);
+ 			P = EC_POINT_new(group);
+ 			if (P && X && Y)
+ 				r = EC_POINT_set_affine_coordinates(group, P, X, Y, NULL);
+diff --git a/src/pkcs15init/pkcs15-oberthur-awp.c b/src/pkcs15init/pkcs15-oberthur-awp.c
+index 22c943127b..fdb06ab6b4 100644
+--- a/src/pkcs15init/pkcs15-oberthur-awp.c
++++ b/src/pkcs15init/pkcs15-oberthur-awp.c
+@@ -51,21 +51,21 @@ awp_get_commonName(X509 *x)
+    	r = X509_NAME_get_index_by_NID(X509_get_subject_name(x),
+ 		   NID_commonName, -1);
+ 	if (r >= 0)   {
+-		X509_NAME_ENTRY *ne;
+-		ASN1_STRING *a_str;
++		const X509_NAME_ENTRY *ne;
++		const ASN1_STRING *a_str;
+ 
+ 		if (!(ne = X509_NAME_get_entry(X509_get_subject_name(x), r)))
+ 			;
+ 		else if (!(a_str = X509_NAME_ENTRY_get_data(ne)))
+ 			;
+-		else if (a_str->type == 0x0C)   {
+-			ret = malloc(a_str->length + 1);
++		else if (ASN1_STRING_type(a_str) == V_ASN1_UTF8STRING) {
++			ret = malloc(ASN1_STRING_length(a_str) + 1);
+ 			if (ret)   {
+-				memcpy(ret, a_str->data, a_str->length);
+-				*(ret + a_str->length) = '\0';
++				memcpy(ret, ASN1_STRING_get0_data(a_str), ASN1_STRING_length(a_str));
++
++				*(ret + ASN1_STRING_length(a_str)) = '\0';
+ 			}
+-		}
+-		else    {
++		} else {
+ 			unsigned char *tmp = NULL;
+ 
+ 			r = ASN1_STRING_to_UTF8(&tmp, a_str);
+diff --git a/src/tests/p11test/p11test_case_common.c b/src/tests/p11test/p11test_case_common.c
+index 1dd6eaba67..f571cd1598 100644
+--- a/src/tests/p11test/p11test_case_common.c
++++ b/src/tests/p11test/p11test_case_common.c
+@@ -776,34 +776,34 @@ int callback_public_keys(test_certs_t *objects,
+ 			switch (o->key_type) {
+ #ifdef EVP_PKEY_ED25519
+ 			case CKK_EC_EDWARDS:
+-				if (strcmp((char *)curve->data, "edwards25519") == 0) {
++				if (strcmp((char *)ASN1_STRING_get0_data(curve), "edwards25519") == 0) {
+ 					evp_type = EVP_PKEY_ED25519;
+ 					break;
+ #ifdef EVP_PKEY_ED448
+-				} else if (strcmp((char *)curve->data, "edwards448") == 0) {
++				} else if (strcmp((char *)ASN1_STRING_get0_data(curve), "edwards448") == 0) {
+ 					evp_type = EVP_PKEY_ED448;
+ 					break;
+ #endif /* EVP_PKEY_ED448 */
+ 				}
+ 				debug_print(" [WARN %s ] Unknown curve name. "
+ 					    " expected edwards25519 or edwards448, got %s",
+-						o->id_str, curve->data);
++						o->id_str, ASN1_STRING_get0_data(curve));
+ 				break;
+ #endif
+ #ifdef EVP_PKEY_X25519
+ 			case CKK_EC_MONTGOMERY:
+-				if (strcmp((char *)curve->data, "curve25519") == 0) {
++				if (strcmp((char *)ASN1_STRING_get0_data(curve), "curve25519") == 0) {
+ 					evp_type = EVP_PKEY_X25519;
+ 					break;
+ #ifdef EVP_PKEY_X448
+-				} else if (strcmp((char *)curve->data, "curve448") == 0) {
++				} else if (strcmp((char *)ASN1_STRING_get0_data(curve), "curve448") == 0) {
+ 					evp_type = EVP_PKEY_X448;
+ 					break;
+ #endif /* EVP_PKEY_X448 */
+ 				}
+ 				debug_print(" [WARN %s ] Unknown curve name. "
+ 					    " expected curve25519 or curve448, got %s",
+-						o->id_str, curve->data);
++						o->id_str, ASN1_STRING_get0_data(curve));
+ 				break;
+ #endif
+ 			default:
+@@ -893,14 +893,14 @@ int callback_public_keys(test_certs_t *objects,
+ 			break;
+ #endif
+ 		}
+-		if (os->length != exp_length) {
++		if (ASN1_STRING_length(os) != exp_length) {
+ 			debug_print(" [WARN %s ] Invalid length of EC_POINT value. Got %d, expected %d",
+-					o->id_str, os->length, exp_length);
++					o->id_str, ASN1_STRING_length(os), exp_length);
+ 			return -1;
+ 		}
+ 		key = EVP_PKEY_new_raw_public_key(evp_type, NULL,
+-			(const uint8_t *)os->data,
+-			os->length);
++				(const uint8_t *)ASN1_STRING_get0_data(os),
++				ASN1_STRING_length(os));
+ 		if (key == NULL) {
+ 			debug_print(" [WARN %s ] Out of memory", o->id_str);
+ 			ASN1_STRING_free(os);
+@@ -925,8 +925,8 @@ int callback_public_keys(test_certs_t *objects,
+ 			}
+ 
+ 			if (EVP_PKEY_get_raw_public_key(o->key, pub, &publen) != 1 ||
+-				publen != (size_t)os->length ||
+-				memcmp(pub, os->data, publen) != 0) {
++					publen != (size_t)ASN1_STRING_length(os) ||
++					memcmp(pub, ASN1_STRING_get0_data(os), publen) != 0) {
+ 				debug_print(" [WARN %s ] Got different public"
+ 					"key then from the certificate",
+ 					o->id_str);
+diff --git a/src/tools/netkey-tool.c b/src/tools/netkey-tool.c
+index 23bab2a8ec..683ac182bd 100644
+--- a/src/tools/netkey-tool.c
++++ b/src/tools/netkey-tool.c
+@@ -144,25 +144,38 @@ static void show_certs(sc_card_t *card)
+ 			if(q[4]==6 && q[5]<10 && q[q[5]+6]==0x30 && q[q[5]+7]==0x82) q+=q[5]+6;
+ 			printf(", Len=%d\n", (q[2]<<8)|q[3]);
+ 			if((c=d2i_X509(NULL,&q,f->size))){
+-				char buf2[2000];
+-				if (X509_NAME_get_text_by_NID(X509_get_subject_name(c), NID_commonName, buf2, sizeof(buf2)) < 0) {
++				int idx;
++				const X509_NAME_ENTRY *ne = NULL; /* no free */
++				const ASN1_STRING *a_str = NULL;  /* no free */
++				int out_len = 0;
++				unsigned char *tmp = NULL;
++
++				idx = X509_NAME_get_index_by_NID(X509_get_subject_name(c), NID_commonName, -1);
++				if (idx >= 0 &&
++						((ne = X509_NAME_get_entry(X509_get_subject_name(c), idx)) != NULL) &&
++						((a_str = X509_NAME_ENTRY_get_data(ne)) != NULL) &&
++						((out_len = ASN1_STRING_to_UTF8(&tmp, a_str)) > 0)) {
++					printf("  Subject-CN: %s\n", tmp);
++					OPENSSL_free(tmp);
++					tmp = NULL;
++				} else {
+ 					sc_log_openssl(card->ctx);
+ 					printf("  Invalid Subject-CN\n");
+-					X509_free(c);
+-					continue;
+ 				}
+-				printf("  Subject-CN: %s\n", buf2);
+-				if (X509_NAME_get_text_by_NID(X509_get_issuer_name(c), NID_commonName, buf2, sizeof(buf2)) < 0) {
++
++				idx = X509_NAME_get_index_by_NID(X509_get_issuer_name(c), NID_commonName, -1);
++				if (idx >= 0 &&
++						((ne = X509_NAME_get_entry(X509_get_issuer_name(c), idx)) != NULL) &&
++						((a_str = X509_NAME_ENTRY_get_data(ne)) != NULL) &&
++						((out_len = ASN1_STRING_to_UTF8(&tmp, a_str)) > 0)) {
++					printf("  Issuer-CN:  %s\n", tmp);
++					OPENSSL_free(tmp);
++					tmp = NULL;
++				} else {
+ 					sc_log_openssl(card->ctx);
+ 					printf("  Invalid Issuer-CN\n");
+-					X509_free(c);
+-					continue;
+ 				}
+-				printf("  Issuer-CN:  %s\n", buf2);
+ 				X509_free(c);
+-			} else {
+-				sc_log_openssl(card->ctx);
+-				printf("  Invalid Certificate-Data\n");
+ 			}
+ 		} else printf(", empty\n");
+ 	}
+diff --git a/src/tools/pkcs11-tool.c b/src/tools/pkcs11-tool.c
+index 452ac49617..cfc7486faa 100644
+--- a/src/tools/pkcs11-tool.c
++++ b/src/tools/pkcs11-tool.c
+@@ -7389,8 +7389,8 @@ static int read_object(CK_SESSION_HANDLE session)
+ #endif
+ 				point = EC_POINT_new(group);
+ 				if (os) {
+-					a = os->data;
+-					a_len = os->length;
++					a = ASN1_STRING_get0_data(os);
++					a_len = ASN1_STRING_length(os);
+ 					success = EC_POINT_oct2point(group, point, a, a_len, NULL);
+ 				}
+ 				if (!success) { /* Workaround for broken PKCS#11 modules */
+@@ -7464,9 +7464,9 @@ static int read_object(CK_SESSION_HANDLE session)
+ 
+ 					a = params;
+ 					if (d2i_ASN1_PRINTABLESTRING(&curve, &a, (long)len) != NULL) {
+-						if (strcmp((char *)curve->data, "edwards25519") &&
+-								strcmp((char *)curve->data, "curve25519")) {
+-							util_fatal("Unknown curve name \"%si\"", curve->data);
++						if (strcmp((char *)ASN1_STRING_get0_data(curve), "edwards25519") &&
++								strcmp((char *)ASN1_STRING_get0_data(curve), "curve25519")) {
++							util_fatal("Unknown curve name \"%si\"", (char *)ASN1_STRING_get0_data(curve));
+ 						}
+ 						ASN1_PRINTABLESTRING_free(curve);
+ 					} else if (d2i_ASN1_OBJECT(&obj, &a, (long)len) != NULL) {
+@@ -7526,26 +7526,26 @@ static int read_object(CK_SESSION_HANDLE session)
+ 					}
+ 				}
+ 
+-				if (type == CKK_EC_EDWARDS && os->length == BYTES4BITS(256)) /* note extra bit */
++				if (type == CKK_EC_EDWARDS && len == BYTES4BITS(256)) /* note extra bit */
+ 					raw_pk = EVP_PKEY_ED25519;
+ #ifdef EVP_PKEY_ED448
+-				else if (type == CKK_EC_EDWARDS && os->length == ED448_KEY_SIZE_BYTES)
++				else if (type == CKK_EC_EDWARDS && len == ED448_KEY_SIZE_BYTES)
+ 					raw_pk = EVP_PKEY_ED448;
+ #endif /* EVP_PKEY_ED448 */
+ #ifdef EVP_PKEY_X25519
+-				else if (type == CKK_EC_MONTGOMERY && os->length == BYTES4BITS(256)) /* note extra bit */
++				else if (type == CKK_EC_MONTGOMERY && len == BYTES4BITS(256)) /* note extra bit */
+ 					raw_pk = EVP_PKEY_X25519;
+ #endif /*EVP_PKEY_X25519 */
+ #ifdef EVP_PKEY_X448
+-				else if (type == CKK_EC_MONTGOMERY && os->length == BYTES4BITS(448))
++				else if (type == CKK_EC_MONTGOMERY && len == BYTES4BITS(448))
+ 					raw_pk = EVP_PKEY_X448;
+ #endif /* EVP_PKEY_X448 */
+ 				else
+ 					util_fatal("Invalid or not supported CKK_EC_EDWARDS or CKK_EC_MONTGOMERY public key");
+ 
+ 				key = EVP_PKEY_new_raw_public_key(raw_pk, NULL,
+-						(const uint8_t *)os->data,
+-						os->length);
++						(const uint8_t *)ASN1_STRING_get0_data(os),
++						ASN1_STRING_length(os));
+ 				ASN1_STRING_free(os);
+ 				if (key == NULL) {
+ 					util_fatal("out of memory");
+diff --git a/src/tools/pkcs15-init.c b/src/tools/pkcs15-init.c
+index e011232987..b978e0677a 100644
+--- a/src/tools/pkcs15-init.c
++++ b/src/tools/pkcs15-init.c
+@@ -2593,8 +2593,8 @@ do_read_data_object(const char *name, u8 **out, size_t *outlen, size_t expected)
+ static char *
+ cert_common_name(X509 *x509)
+ {
+-	X509_NAME_ENTRY *ne = NULL;
+-	ASN1_STRING *a_str = NULL;
++	const X509_NAME_ENTRY *ne = NULL;
++	const ASN1_STRING *a_str = NULL;
+ 	char *out = NULL;
+ 	unsigned char *tmp = NULL;
+ 	int idx, out_len = 0;
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
