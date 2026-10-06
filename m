Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB62CA5FED
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D45A80E28;
	Tue,  6 Oct 2026 16:40:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P1He3vnyLw1V; Tue,  6 Oct 2026 16:40:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3C07B80E2B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304813;
	b=LTLH1y9672ojrPBRFVPca1l9wo5eHU12cphfnW5CDaVcK77NtdGM2ZL8j1zPdOiI9Em5
	 A+B5cw7EesF4YyHVvwJBmrYTXCxzwf9D0buRUizKzuUw5l1y6F9eSiRnGOk19KSyEKFBM
	 kcgPKiHveDPyPJB7VFk45Gz93sQACXSuPyHUaOf67bVJrmiKwKNX1dv8IKKDDWwqRbMgM
	 Xx3E1UxnU0heHZ0KOS5n1iO4tQsGkUONSf0ZR3m+mE3aAkk/5TCNUgCDRuNLxyMD//3r+
	 72uJnH7XnAIPx/iPagO2y9J/RpzxlaHKe+KRsnRqC8JyySJsRZIDfW2aXGo/Ycf5ksg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304813;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=K38UEPTcjs+JlrSehlorOrOxRp9FvTYe2IN4WgIup0U=;
	b=p56Zkc2dgEbddiqjb8eR8XPVfKRGR6ri7E/hyYyjZdrUclT+Vb2OsWKwYknpSJejvb+w
	 XZZIzwi6+mwqpWD2vVjN7TqXfsrUz2P5lHYz4+k6jCmvLEtCY075uNlK192P4SbbPOWDU
	 igrDzxGeLxSa+NyfGOHnNf5eFAlVVRgbTXyHC7leblz1JZIgaYd2C3sW+MXcGuEpHEu2s
	 kgFZC9h1K/8stlZA+U2D5imvwcIE6siI6mDmtbF89OKzAUJ063q2H4AGP9PGaWepvAbEg
	 RzdpbO7zpr9ZWtcYzbJUmQjYd885R0685q9tK4kFWnMJdu1sGgcr2PJ8qJq+C3TPq8w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=hsWVYZZ1;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304813;
	bh=K38UEPTcjs+JlrSehlorOrOxRp9FvTYe2IN4WgIup0U=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BAQl+PZLs9Tvm2tZ/QkAVRbc+8hqcbcuYZUvmbyED6eTC1V5g/tXFO/e81EwI8FKg
	 PdB3bt/frDgp+ebu+GNInQwAtXDUvKM4uuWZVWm3IgFog1691U8Oc2VtvBvaufiTnx
	 D2Y9jqjTsexwilQC96cOy9gUmXBtLZ3L06woK/CBYmNI9lVyKmNfYNgITSB4hjf3Xp
	 rJXBVhOQnt6y3MKYXinRuDWlGLMfcgwnQOMzZFbVjuwVR56ymTpgZ6JXkqcP+3cEs0
	 pmY/F0ynsvOOmjZafLe3Em8/zbGONLqLhNZeMzFWHKBnR3l9WCrQiWHzTSizrf4R8r
	 HLkEunW4zzeew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C07B80E2B;
	Tue,  6 Oct 2026 16:40:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4320E34E
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32F7680EA6
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:36:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0-F7mtmx8Xw3 for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:36:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 39F88809A7
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304563;
 b=QIAFhr0+XlSVvc+WHrgzGIg3vsEgqwsqrO66b5M8sWi3FoJcnE00nmPy1DhGMgx2glkU
 zc/wU1l2vOogLCpyvXbFvaxS/62wefJmzgqB7NLsDlwZ08DpQIAIvAOQEJ6+eie54ABhE
 c0Qga3Uf/Ro4QomFEyfqg5sbBfSteKbmbmyDj/7c24ArhNDwPGY+T5VAK+rOQMH5ZU9sZ
 JGeOnes24QL75TfP48etNv6W6IZvzL3JiM0xukDm2ItApvBWIBHMztAOU6Lp9qls18xxY
 zpauJ0UaJtdrgAjueZypC9mNgBR2e6dlxNJH6x6FAyG0r9Ri55WMCALPi89kMPbKqpQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304563;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=5K82jIiPOAAxOVMXOUMEDuHnm5P3+HqOjNR0zVeDofk=;
 b=itT24G+SdT586B8FqJ7hbGsSsctpwNRkb9j9PxzNZqv+aNmHupCnMWWFKE7fGpjMet/V
 0rJrGls/cs3cAdp2EQOm0INeENSQoMgp6ozAwS+ArKzMJDbBBqZQHUbHgjS4mQLyaTiYT
 xkue8jaltsmLHTMj0fMusPVMMGB5a87U3RpyJvp01JbjrB3hQzuqNFvgKIS14NFCOalF8
 oVFrpZ+oJEQMDnC2Lli5jNYnJ3mZrybXFlrF2EaWhYMxxZRh9c+u/YIrdEwMfyIbrHV8v
 RGpjZA9f45gqriiUkOu/YK2PgLm/qYwpizhSM6az8Urd+Cm2KLpLLjanSA/AlYGlt4g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=hsWVYZZ1; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=hsWVYZZ1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 39F88809A7
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303712;
 bh=5K82jIiPOAAxOVMXOUMEDuHnm5P3+HqOjNR0zVeDofk=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=hsWVYZZ1vEj+bGcX6+1ORJISI2Foe7BVBJOAGUKxZpeVH3jJt1a2O7egSdEihgg1F
 LbmIz5maihupbnKEKOdGJcmXyYtf4kBcmUYSQ6aahhpMSaEBix1p9H3hfEd38IKkfl
 pXCfnc5kGGLHcQ6gRZhHNlO99JlzGa7u9TGVI292E/3gJFDfMM1/a+CtfJsoKlV74I
 hAMoZuOqXrLpx5zsWKMvMF9131M803DQlhF8PGK9CK4NB4aSiON6VRuzJO1wujJpOs
 OFNuUYH3J3hunrXh80Ob/g6C7Gz+E+e7dADCrTSfTS9galKx2V1W+yGLxJOS2kQDWu
 vdua0iBDC0MoQ==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 WN8egEX6/L+tcyC3zVWQRTO+kVTMtCcICQQ5Rup8UST9PzR5WipCOoj0BFhaJ81yjkguSt9H9QM
 3GxIXfC6VlEwQXnQnJ54YgLw6El4Zjy7WqnvUp2LkSxLFZqd3vn/QL4dsoO3Hb6c7KiYW+VYTHF
 ne8PL5cKuYAKt/nqWZ92X2OKjHdvXMeKyEMuJn0Gq8mAEEDfZa39iQ/JhuPZMdF2eB2VkPIvlQq
 ZJENjAJrv4rqUaKgIGRjhBnvTyfVZwYlIPQGcdKnwSnMFHKHL3QcFTCNFwixQL0cUVBL1ObhvAo
 gsHBt1kznLutztOqCB9wQuaB1LtWUF7ly942kWZjD8TRwRc7/K7gzIbIHpnZavrSTy0y0zrA7N5
 Sm2qNMVo1eaRdd9PsnF5JSmxS5Q6MbJg9nPOm46xMZBHoZbU/4UIqglJlv52u4/BLCsGy5ptVM5
 thQBCjwDH+k5sGOmr0gEKZDWsQov6QxQPoupUpMVlrCuAJlCLD0PvYOVcb7AANcHL/cve8Z1BjZ
 IVK6Y2kMcXEr6CjfTrgnIhBWMNBBDKoC6Z/5bKGt1rCu+0Il8XTOjc93cqY+Ktk5X1RF+Mk4C51
 udcD8wM=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 785B6A4C5554
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 18:21:52 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7um-000000000ir-3gRQ
 for buildroot@buildroot.org; Tue, 06 Oct 2026 16:21:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:20:29 +0200
Message-ID: <20261006162106.3439373-49-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v8 48/84] package/softhsm2: Fix build with
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
 ...mory-leak-in-OSSL-byteString2oid-863.patch | 49 ++++++++++
 ...in-EdDSA-PrintableString-handling-85.patch | 98 +++++++++++++++++++
 2 files changed, 147 insertions(+)
 create mode 100644 package/softhsm2/0001-Fix-the-memory-leak-in-OSSL-byteString2oid-863.patch
 create mode 100644 package/softhsm2/0002-Fix-memory-leak-in-EdDSA-PrintableString-handling-85.patch

diff --git a/package/softhsm2/0001-Fix-the-memory-leak-in-OSSL-byteString2oid-863.patch b/package/softhsm2/0001-Fix-the-memory-leak-in-OSSL-byteString2oid-863.patch
new file mode 100644
index 0000000000..2defeda775
--- /dev/null
+++ b/package/softhsm2/0001-Fix-the-memory-leak-in-OSSL-byteString2oid-863.patch
@@ -0,0 +1,49 @@
+From 1b72640ceccaa8fdd775f224c26a53fdaf189da6 Mon Sep 17 00:00:00 2001
+From: Shawn C <citypw@hardenedlinux.org>
+Date: Sat, 25 Apr 2026 20:05:34 +0800
+Subject: [PATCH] Fix the memory leak in OSSL::byteString2oid (#863)
+
+The function `OSSL::byteString2oid` in `SoftHSM2` (OpenSSL backend)
+leaks memory when decoding PKCS#11 attribute values as ASN.1 objects
+or strings. It calls `d2i_ASN1_OBJECT` and `d2i_ASN1_PRINTABLESTRING`
+which allocate new OpenSSL objects, but these objects are never
+freed after their NIDs are extracted.
+
+Signed-off-by: Shawn C <citypw@hardenedlinux.org>
+
+Upstream: https://github.com/softhsm/SoftHSMv2/commit/57e10cbbe75069be92c7e9720c180a05833481fc
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/lib/crypto/OSSLUtil.cpp | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/src/lib/crypto/OSSLUtil.cpp b/src/lib/crypto/OSSLUtil.cpp
+index 794f80e..d238eca 100644
+--- a/src/lib/crypto/OSSLUtil.cpp
++++ b/src/lib/crypto/OSSLUtil.cpp
+@@ -177,8 +177,10 @@ int OSSL::byteString2oid(const ByteString& byteString)
+ 		{
+ 			return NID_undef;
+ 		}
+-
+-		return OBJ_obj2nid(oid);
++		
++		int nid = OBJ_obj2nid(oid);
++		ASN1_OBJECT_free(oid);
++		return nid;
+ 	}
+ 	else if (pclass == V_ASN1_UNIVERSAL && tag == V_ASN1_PRINTABLESTRING)
+ 	{
+@@ -204,6 +206,8 @@ int OSSL::byteString2oid(const ByteString& byteString)
+ 		{
+ 			return EVP_PKEY_X448;
+ 		}
++
++		ASN1_STRING_free(curve_name);
+ 	}
+ 
+ 	return NID_undef;
+-- 
+2.47.3
+
diff --git a/package/softhsm2/0002-Fix-memory-leak-in-EdDSA-PrintableString-handling-85.patch b/package/softhsm2/0002-Fix-memory-leak-in-EdDSA-PrintableString-handling-85.patch
new file mode 100644
index 0000000000..f6b9000b13
--- /dev/null
+++ b/package/softhsm2/0002-Fix-memory-leak-in-EdDSA-PrintableString-handling-85.patch
@@ -0,0 +1,98 @@
+From c7e930156054e901e27149117494d53e9945f734 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ma=C5=82gorzata=20Olsz=C3=B3wka?=
+ <Malgorzata.Olszowka@stunnel.org>
+Date: Sun, 3 May 2026 13:00:07 +0200
+Subject: [PATCH] Fix memory leak in EdDSA PrintableString handling (#858)
+
+Upstream: https://github.com/softhsm/SoftHSMv2/commit/d23ea09d318c03c033420d065f1c64b019cc94ed
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/lib/crypto/OSSLUtil.cpp | 37 +++++++++++++++++++++++++------------
+ 1 file changed, 25 insertions(+), 12 deletions(-)
+
+diff --git a/src/lib/crypto/OSSLUtil.cpp b/src/lib/crypto/OSSLUtil.cpp
+index d238eca..7763799 100644
+--- a/src/lib/crypto/OSSLUtil.cpp
++++ b/src/lib/crypto/OSSLUtil.cpp
+@@ -160,12 +160,14 @@ ByteString OSSL::oid2ByteString(int nid)
+ // Convert a ByteString to an OpenSSL EVP_PKEY id
+ int OSSL::byteString2oid(const ByteString& byteString)
+ {
+-	ASN1_OBJECT *oid = NULL;
+-	ASN1_PRINTABLESTRING *curve_name = NULL;
++	ASN1_OBJECT *oid;
++	ASN1_PRINTABLESTRING *curve_name;
+ 	const unsigned char *p = byteString.const_byte_str();
+ 	const unsigned char *pp = p;
++	const unsigned char *data;
+ 	long length;
+-	int tag, pclass;
++	int tag, pclass, data_len;
++	int nid = NID_undef;
+ 
+ 	ASN1_get_object(&pp, &length, &tag, &pclass, byteString.size());
+ 	if (pclass == V_ASN1_UNIVERSAL && tag == V_ASN1_OBJECT)
+@@ -177,39 +179,50 @@ int OSSL::byteString2oid(const ByteString& byteString)
+ 		{
+ 			return NID_undef;
+ 		}
+-		
+-		int nid = OBJ_obj2nid(oid);
++
++		nid = OBJ_obj2nid(oid);
+ 		ASN1_OBJECT_free(oid);
+-		return nid;
+ 	}
+ 	else if (pclass == V_ASN1_UNIVERSAL && tag == V_ASN1_PRINTABLESTRING)
+ 	{
+ 		/* The final PKCS#11 3.0 expects curve name encoded as PrintableString */
+ 		curve_name = d2i_ASN1_PRINTABLESTRING(NULL, &p, byteString.size());
+ 
+-		if (strcmp((char *)curve_name->data, "edwards25519") == 0)
++		if (curve_name == NULL)
++		{
++			return NID_undef;
++		}
++
++		data = ASN1_STRING_get0_data(curve_name);
++		data_len = ASN1_STRING_length(curve_name);
++
++		if (data_len == 12 && memcmp(data, "edwards25519", data_len) == 0)
+ 		{
++			ASN1_PRINTABLESTRING_free(curve_name);
+ 			return EVP_PKEY_ED25519;
+ 		}
+ 
+-		if (strcmp((char *)curve_name->data, "curve25519") == 0)
++		if (data_len == 10 && memcmp(data, "curve25519", 10) == 0)
+ 		{
++			ASN1_PRINTABLESTRING_free(curve_name);
+ 			return EVP_PKEY_X25519;
+ 		}
+ 
+-		if (strcmp((char *)curve_name->data, "edwards448") == 0)
++		if (data_len == 10 && memcmp(data, "edwards448", 10) == 0)
+ 		{
++			ASN1_PRINTABLESTRING_free(curve_name);
+ 			return EVP_PKEY_ED448;
+ 		}
+ 
+-		if (strcmp((char *)curve_name->data, "curve448") == 0)
++		if (data_len == 8 && memcmp(data, "curve448", 8) == 0)
+ 		{
++			ASN1_PRINTABLESTRING_free(curve_name);
+ 			return EVP_PKEY_X448;
+ 		}
+ 
+-		ASN1_STRING_free(curve_name);
++		ASN1_PRINTABLESTRING_free(curve_name);
+ 	}
+ 
+-	return NID_undef;
++	return nid;
+ }
+ #endif
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
