Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927A0CA5FA5
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EBCD811F1;
	Tue, 29 Sep 2026 18:48:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7C8epGQgl6gK; Tue, 29 Sep 2026 18:48:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4C812811DF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707703;
	b=Uh6CWWPrSNsub3/EKV+Epg8pVW9Dg7mGIAQaLPumHEY/4CZEUpN7bmDJNEL2S2gPVgid
	 SYkNbfh5/5/2/ffPNzYJLeBGiHs44CgOoitZXvkVR4vVjm4GKJKKMiKwzixImOlsx2729
	 x9X08/J9XbEHvHIWsPhpEBuddzqrwxMRDfxmoJ4Nab+U9zh+UpzwnTDQ3j+oE6cafI8RR
	 dtltgZJyibx/J7EnGMjRqVfPNXi+Vpn1ospSLb51rKTdo2bS6qkptFE94rDuEjxGawMQk
	 ohVcJWTNQnBydJg4cJNV3OEaGbcyZwIxwyAIkuapM2aVKQl+qXbc53hW1BXfUiJundA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707703;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=CGp/okkKI4sjL+7RR0M9Jj3vE/DtrlezIeGU/hU+VYw=;
	b=E/OGYgBCMIBmL7xQ1C6cEoLXP5Y97N+txzSTDtmorWzCaYRDRYJVvO38/JBtyFJ+YUAr
	 yPhQBC1YaYBL/FoJiNra1s5LZ2rGI/LooHl58pnFnYrojSsB1W6d136tvaVQEuWAzZbUT
	 RChxrLJJ1fj3dwMt5FEjOxklCxhBworcG5nFMBUGMhIWp7Nt+Rq7brqmvvU34uS74Yp3c
	 84Rp+fOtV6NdyKwDyWx/h1edC/8qTezlgHyedWTK0qsLl3z+KUMTrRG1OHPgkxEFK0u0v
	 K2Snb/Ac/cwciZreF4G4Q6JjnNl/7rjxBI+Pg3bFDN6KY4xOGhI4mtIubm/DF3pD8Rg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707703;
	bh=CGp/okkKI4sjL+7RR0M9Jj3vE/DtrlezIeGU/hU+VYw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CAc3T2kopoMEuzTlWybM0oFty39ARNC/ymEn5/5t85Bwi0OPsullqQEo0oDIiA8k/
	 Fifi4M5my39c5wTtfsQ2cq5CKomQVbfb7thWMsYFDJwTX4oexjZxVgP2JJQhsxAkb1
	 4Rf9xdz1bsPH+3iO5n60jwoOXtd0IT9FCB7zMB/IGddg3lgl8eSr9fhhRMcj5Cgg0k
	 cVplcokkfo6G75Qq7hXe+Q8D1BjiAVbbryoIIDaklfE7FJlSr4DMYrWB1HMRw5UlHR
	 4Gs60PyTKujgDPoIxe43A5rXuu2pnqGQpfLeY4Vb+q6K54ySC3uCyCR/q5hY6tQbtk
	 6iRL/IwtlIi5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C812811DF;
	Tue, 29 Sep 2026 18:48:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C64B3D8
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42624405A7
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:48:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uA55uVGGUl3q for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:48:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3BE92405A1
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707689;
 b=kp8Eq3GQoY54TdjjYx07pmJ3xqLFRg+E3AWPCpQxobgZ0xCa6M81IFJm2kMjUtyLjPVQ
 8cFujRfj8OOzrgFK/vmUovKIhgP8S3nFE7Z2el6yaNe0jRRoSBe3pJvP7yTrv0tOGsxvr
 v8KpFnqpYM2J8kurmMUN7r5uRYxzPpq5Y9FqnW+tWNmVUOeM5rl8zEtPpCJw7o2NS66KY
 1gvZM5WUiyI7Q1NDLTVqSloOrivORArZjGnTtBJdpC/E6twBciCBP4cCvyEg6sppGc1+k
 Cx6I34zEYBI5osNx94QzwmmA/uesST0hTayE7E0eCmX+CXKb61SXpRW1y+9WPuGFvDA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707689;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=VvnSkSBk/LrOs6fACWr0yBwJxYAjiavrxs0Q9b8kAfo=;
 b=juWOO687i6U9xW1VFUOvRWC8lIg5renp2s4unv0cykD3cz2/fwOfJtKXKduIhL9bcmFw
 4hYKqZnwu9sxTEMuOuqAjo83EggXp5M2CF/CA8mNfSubLSMCydLjawAtNw1zQsaid9+En
 bADW1x4XnaVfCVmlss59ed9pYSOmjsySjhR8HqOr099eMfSSFUPCwONTPyWiDS7dJJWWE
 F2anD3nSlBUMiwFXH2LJhqcTJG2Bm/8sAw0Y6YgZgHmBUvdjz38NhfkPqk9zk3Yc0NnF1
 h0yrwK1cFmlgjhVWtUJ8HcK7REhnXS9H0KA92QFbsYunc6itd3vIP7s81/fFBC5rwKg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=tTPT4NhF; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=tTPT4NhF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3BE92405A1
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707032;
 bh=VvnSkSBk/LrOs6fACWr0yBwJxYAjiavrxs0Q9b8kAfo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=tTPT4NhFZrFYRFysNn2mIcgtFOzO3EXJEYe5JMWj0IB+BO2vYkC3lUElTE77F+xKf
 kQqG8jT/Oj3K6163tguAP8cjUTY4j0qu1/nRDF5bNQL1pQ9xrM5R5xyuSoSXQALadA
 8VB5hMscTssP/q0g445lHpuEB6E3t/u/d3GaEytj5/a13gMfEq8mymkyh6KCXw9ehp
 AkBCB7TIBn/2N6/AqJowKVdGNTzwwiIMYbW5Xu/HAZRL1Elw1iHQrXiVlT/8vtoTNe
 HtSdjY+dowK0/tqr8NGD8eAcdwYEiydRk8cUBsnhdt4OhR7C6YFrmNrRpkpQQls2jM
 WgihSC3BRIrZw==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 IlWC9HyMZEVush2cCm+RC49PML/LsMK2iPDX+1VR0z253rPs6rvhbSAMK+drXkKTFXFle2XF9PL
 WN7ELAKOMHR/CLKAsqH+QYLELIL97ribcZJ3bbUtn/ZUAydwVOtxbG1JviNbRAPgubZ9pumhu7Y
 cZisKo3QoTCBuuZ5qICAvZonnuvQtE4AMEyfCGFDerJdGg93vVGxGeZmKrPPDjZTykKFA+dOwrh
 w/XubEcCj6RuwahCDFIQtHV7yTaDJxI2wQA9VPi5R+lVYMjLss0sFU/vspLzSRM0zxvsaOGNDBP
 RyjhEjodJbcpInyl9PUQSdWcp8ZmBg0kmJD6z1eX89muqmC2uJlsRgleCzko61XGvbLAFnf3EE0
 /AxKpVwCSGexmfB1ggJs4sG7blPs864tryRSwTQCiFp3+e13KgJiwKteIkdEtJpa4muz7kCT3+N
 OA0OY4XDBdVu4htjS83XTpCrrF0cLqIEf6H3rMoNg5cPQFWTwQhkDbBlHGITvyMRF6YWIi0q+L8
 PciqK2xZkvGapVmuDlOu2oz4QTYYI3hG3XOOsud1qyrYJh6r+o/PpY7F4v9rrGeEJn6wd622yqZ
 roQUlzbX5VXOhWwFY5g6PZwbKxW4kP2Ipii0B1BTXbu2iApq0Q==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 696FBA4C5187;
 Tue, 29 Sep 2026 20:37:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgl-000000006Jn-1lr7;
 Tue, 29 Sep 2026 18:36:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 29 Sep 2026 20:35:48 +0200
Message-ID: <20260929183607.1849293-50-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v7 49/66] package/qpid-proton: Fix build with
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 ...1-PROTON-2937-Add-OpenSSL-4.x-compat.patch | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 package/qpid-proton/0001-PROTON-2937-Add-OpenSSL-4.x-compat.patch

diff --git a/package/qpid-proton/0001-PROTON-2937-Add-OpenSSL-4.x-compat.patch b/package/qpid-proton/0001-PROTON-2937-Add-OpenSSL-4.x-compat.patch
new file mode 100644
index 0000000000..96ae892716
--- /dev/null
+++ b/package/qpid-proton/0001-PROTON-2937-Add-OpenSSL-4.x-compat.patch
@@ -0,0 +1,80 @@
+From 7be093d8d96104caab3fa858ab9886f23d62ee04 Mon Sep 17 00:00:00 2001
+From: Thomas Goirand <zigo@debian.org>
+Date: Wed, 17 Jun 2026 15:31:31 +0200
+Subject: [PATCH] PROTON-2937: Add OpenSSL 4.x compat
+
+Fixes this Debian bug: https://bugs.debian.org/1138394
+
+It retains compatibility with OpenSSL 3
+
+Closes #447
+
+Upstream: https://github.com/apache/qpid-proton/commit/7be093d8d96104caab3fa858ab9886f23d62ee04
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ c/src/ssl/openssl.c | 18 +++++++++---------
+ 1 file changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/c/src/ssl/openssl.c b/c/src/ssl/openssl.c
+index 62d4b40a..4c3a76c5 100644
+--- a/c/src/ssl/openssl.c
++++ b/c/src/ssl/openssl.c
+@@ -339,7 +339,7 @@ static int verify_callback(int preverify_ok, X509_STORE_CTX *ctx)
+       GENERAL_NAME *name = sk_GENERAL_NAME_value( sans, i );
+       if (name->type == GEN_DNS) {
+         ASN1_STRING *asn1 = name->d.dNSName;
+-        if (asn1 && asn1->data && asn1->length) {
++        if (asn1 && ASN1_STRING_get0_data(asn1) && ASN1_STRING_length(asn1) > 0){
+           unsigned char *str;
+           int len = ASN1_STRING_to_UTF8( &str, asn1 );
+           if (len >= 0) {
+@@ -354,11 +354,11 @@ static int verify_callback(int preverify_ok, X509_STORE_CTX *ctx)
+   }
+ 
+   /* if no general names match, try the CommonName from the subject */
+-  X509_NAME *name = X509_get_subject_name(cert);
++  const X509_NAME *name = X509_get_subject_name(cert);
+   int i = -1;
+   while (!matched && (i = X509_NAME_get_index_by_NID(name, NID_commonName, i)) >= 0) {
+-    X509_NAME_ENTRY *ne = X509_NAME_get_entry(name, i);
+-    ASN1_STRING *name_asn1 = X509_NAME_ENTRY_get_data(ne);
++    const X509_NAME_ENTRY *ne = X509_NAME_get_entry(name, i);
++    const ASN1_STRING *name_asn1 = X509_NAME_ENTRY_get_data(ne);
+     if (name_asn1) {
+       unsigned char *str;
+       int len = ASN1_STRING_to_UTF8( &str, name_asn1);
+@@ -1558,7 +1558,7 @@ const char* pn_ssl_get_remote_subject(pn_ssl_t *ssl0)
+   if (!ssl->subject) {
+     X509 *cert = get_peer_certificate(ssl);
+     if (!cert) return NULL;
+-    X509_NAME *subject = X509_get_subject_name(cert);
++    const X509_NAME *subject = X509_get_subject_name(cert);
+     if (!subject) return NULL;
+ 
+     BIO *out = BIO_new(BIO_s_mem());
+@@ -1677,17 +1677,17 @@ const char* pn_ssl_get_remote_subject_subfield(pn_ssl_t *ssl0, pn_ssl_cert_subje
+   X509 *cert = get_peer_certificate(ssl);
+   if (!cert) return NULL;
+ 
+-  X509_NAME *subject_name = X509_get_subject_name(cert);
++  const X509_NAME *subject_name = X509_get_subject_name(cert);
+ 
+   // TODO (gmurthy) - A server side cert subject field can have more than one common name like this - Subject: CN=www.domain1.com, CN=www.domain2.com, see https://bugzilla.mozilla.org/show_bug.cgi?id=380656
+   // For now, we will only return the first common name if there is more than one common name in the cert
+   int index = X509_NAME_get_index_by_NID(subject_name, openssl_field, -1);
+ 
+   if (index > -1) {
+-    X509_NAME_ENTRY *ne = X509_NAME_get_entry(subject_name, index);
++    const X509_NAME_ENTRY *ne = X509_NAME_get_entry(subject_name, index);
+     if(ne) {
+-      ASN1_STRING *name_asn1 = X509_NAME_ENTRY_get_data(ne);
+-      return (char *) name_asn1->data;
++      const ASN1_STRING *name_asn1 = X509_NAME_ENTRY_get_data(ne);
++      return (const char *)ASN1_STRING_get0_data(name_asn1);
+     }
+   }
+ 
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
