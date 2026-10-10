Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C69CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 10:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6C5160650;
	Sat, 10 Oct 2026 10:00:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JYq5BLwogkSY; Sat, 10 Oct 2026 10:00:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E666F60663
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791626446;
	b=oQTblJMawIR0+7iYlskBLMQZyJEkDmDm7FapP8me73NsKN9M4G3beWjjXsy2ft3P2OfX
	 vNGsVQUpRbeHAU0j4m6+409oOUpc2Noc8tocALxuAk5gjgcvXuDcEwATZks9CUs/KaRdb
	 ICaGYdMDI0BjKfJ/Bu6tgNSnFn94rlu5w84Y4333NEljme0i8yXd/5oaA3YwPfEm8OWPr
	 E2PL3yIZGd2IENzcCXMrE9GeBF6/8YtTSXvLQ81T/zENqUMR7iG9aZvSvSDEt+QpwUGLF
	 BFup7tjjkfjN84Bo9thAHcUtVM3EAmz8efAR13iQjT2UXQzqgW0YAi+cn/LN7bHFndg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791626446;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=6nNyV4U+tEVumX7VWy4hQtBGF0imMi+pqav9pFowSAk=;
	b=jgynGKmZTiqn1e4zKu5uUx6OVP0SmB2qTOSuul6K7nqK4oH7ZkEFSWTz//nghTHiUih1
	 JOuCt7aFVULLsSMwZBLi6fulTYrcLSuTsJnyvtV6K7V/WHbOKuKAhvQeTj87mFz29s5Q4
	 9aSD3KcU6vTCN6jNa6FGqyexntc+V63ZcGqBKxzmqJ/k+c8rE68yc2Mcgi37xCBSStjm1
	 jgD6wc/B16ftBUEbXpfnVkbtdpgprA+mSSIEtE+fb59yBrCzho3N+rGvS6Wa+TAOPi+It
	 gYCx/yqZU9Qo66Qk7guI+3xRqGBTTBfX12FGQSdHHisoGpgrZtL/JX3sZMQJbvMr2QA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791626446;
	bh=6nNyV4U+tEVumX7VWy4hQtBGF0imMi+pqav9pFowSAk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GAK2TNVx6Tyuat71R3RNjve+cIqGfepmgfbvqgt1jl9XTNmTGI4hSPYuwL6qulWGG
	 mwlVOTSAy5CFZiC/VpfD0dELlsJRNzHQF4iG6O0r3kx1wBPqMz7j9kEu8LMSBVzwwX
	 rTC/sb3aAwC68Il8wB6j42e9DbCPaBQP2ISh6aNqefsWld8rxNjG5I4XF6LJ+V3WGE
	 vF84I4t/c7l7sxuSorwvi8Nei5ZPCK1XtqU853ek0Bj0H7BCo1Y0aKX2tRqHhF7jEf
	 BOqKMOarhmTlPUb7bmf6ci/rM5mbei3yD1DPmtWeUR8dVfN5BQVUoljbeMnN/1fffu
	 uGb6DbjAsiXPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E666F60663;
	Sat, 10 Oct 2026 10:00:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 57A571DE
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 10:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4909160663
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 10:00:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AIdyaDqfak5f for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 10:00:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6C94A60650
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791626444;
 b=SgBTns0WY7YJOzYivCjbZVDLMv7t+jewgCZA2alI31qVs0gDFhmen51wSjh5oomwslQ+
 QgLgzJ87fhKvGomzyMX9XOhm9X1gdnU2ZrRc6izQ8Y7O4fbsJT9oe4FFv7y1m0knVCc6a
 B4lhHNrYp6hDbQMHXUC9EycY43gpEosUgBQw5L3bJp0/77JQnNLvP17fh/RfFExe6WR6I
 qJtMbnAq6tdlGhU6XoTjgE6yv9cZARkfLbDuUM1qHOUowlNF6N9gfEOTseCsu9dY8pRu1
 J/8o8mwWD9tSZ1x9e2B7LgX/efNWVsPMdMOi/1Dbec6Y4Qg2Yf6avxDmcqkkhYP/QoA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791626444;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=0KJYg3tI86yXHxy3PosM47ELNIJtItThEm2JPxREgks=;
 b=g1rmNGgPtd9CZgQIXHGJjjFKtcnSt0sOsuSozu4D/mRyIDX3HuYzKgXVUwL9d+95scms
 HYxCyTOps0SYM5+nT5ny2VZ8oh4GpzNRS82P838jTADNeGMjfWK/IQ/YhjNiNebJaq9SR
 xcO61YIdpj5gQqNJ+k/dxFjAPAGMhSsTnP45XMPznmyToxe5AYadN2DaAuloG4s7dL8KT
 s4lE94doaX2i4kjg8SjHMbQAd+4vfflyBS2Y+Bbx1K/s7kvNh8FCBK/PT3rL3sswxwlaw
 kiblkZzlXEs6uQoGT321OWVEdFB/qAqjiLuHAGlqbKdyvnw8Gt+Df41jglRZExHz81Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C94A60650
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 10:00:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 459F08FF7D; Sat, 10 Oct 2026 09:59:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 12:00:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 08ac0bfaaabed1ad89554c135ce609453d311c7c
X-Git-Newrev: 74437ca52b90408e93b26f00d262641a6145cfd6
X-Patchwork-Hint: ignore
Message-Id: <20261010095926.459F08FF7D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/softhsm2: fix build with OpenSSL
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/74437ca52b90408e93b26f00d262641a6145cfd6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...he-memory-leak-in-OSSL-byteString2oid-863.patch | 49 +++++++++++
 ...leak-in-EdDSA-PrintableString-handling-85.patch | 98 ++++++++++++++++++++++
 2 files changed, 147 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
