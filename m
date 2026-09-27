Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F543C9830E
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30B8E605D9;
	Sun, 27 Sep 2026 10:47:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q2_KWUoAm04U; Sun, 27 Sep 2026 10:47:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 22B33605E6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506077;
	b=Trp487xM+GdZu9Iwbb4bEtRu+q2ecmuTWe1Hs9rP/CFzk6mrWy0Egu5stN8L9jKo/MUK
	 P0ekBmhXzIxvddLguEdFx7bSaxgDQi2DqBXoqD9G/Cz638/UUOuNFGs9tia+mbw7coJed
	 TsVjX6EjOS84YoM5ftYsgMRI1EG2LLG943GWcxa/Y6lxDqasb1pgX41aofqQXEZfwOiaR
	 H/AQRYf/Wda4VATBj3Ksa0DI35Jf0E1236kd3WLJ3wivdbrHR4FQ3otMbRu7stSSif0oO
	 OvDux2yCZngms6gZoYxLZofpb3usl/LpKSdRegRKbG5GnTVwuv7+2oGrX0AsG8SbejQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506077;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=K38UEPTcjs+JlrSehlorOrOxRp9FvTYe2IN4WgIup0U=;
	b=YO+Tz0Ik2DHgPk4dLMr9y4qhWVdK+oGW7fJIt/QSeqVvef0z/e8ApfPN5Vd5Iub7NkTz
	 PtrnsrHm/jcTHJAOFjOkD3vkwhYef0g9FSIE0w2uXtMQ/gDsrIjoWpELQeyUcUbc1GXbC
	 v5uGkWDGEMY0Ieb/YW27FwdcyX2nznOgar+UUFxNK0I34kXKgXHg74P1BwDhYiIisZiQq
	 fkRrKqi64jGXMruQU+QB+okSq1eSo2bZDvde9FBnArbjFqhN9a6IqXmUT7/K38dz51Utm
	 veIdBVzEXyA1zw4QC4Lxr5PVSVs0BI3qz9o26cqApKFAZmPjbkxNl7319CBmG4ekxkw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506077;
	bh=K38UEPTcjs+JlrSehlorOrOxRp9FvTYe2IN4WgIup0U=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=CF88tLR4My0DqezIvjuv6rmcQjX69yyYsq7R94GXF1SC2kEbq/0C3PbBgUFmPenSo
	 sjgxpoytiEKc5StQ08IXz6asrSKxakQLn9hTkkwH8/HGwRtpRegy16ZI5FP0FJiPeI
	 r+duY2bJHVg/wUP7Wtb5CO4ih5WEvq4bSZ8+ODpwgBFL2NJQU/TXHCIe1aGYwRh4AI
	 eRn4V2/Y77VSpEZeGqpzrgfZzYS1a2/pty+L7ot0RIxUG8h/2MYuQsbJ1neXcJgvLY
	 QVLIgZKKGOEqqCcmSCAykgIbbxJLvr8Poa60bYP4tiKzhErDHMk56ozgysZPHRa9NH
	 lF3482zwNS+Ug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22B33605E6;
	Sun, 27 Sep 2026 10:47:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 46E68335
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C5844055D
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:47:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AOBD7Txm9iPE for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:47:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 20CED404E0
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506075;
 b=iqGYh3o/C0fc82GgDRZS++daf21D8RaCsHw0vLpDdqUtOdYYKI6gShAKmy+J9VdXnZvB
 zDgrMHEy49ZNSUx/lM4vHlKuBk6+gB4RMTUDnqiDVTbjRSSHTXn9W+PP+bVTgaR6jLOV+
 LqAYPGtfXJligYpx1btKX+d/DUixYkgf+V5EVwg01WVI2q6ffRp2Ch0ehjZ5spjFrFiMj
 LUZgxfooERkvD+/N5lYSxuov+h2CHqXwo0GhAij07ZqogZeRh47vPshCUt9OfMDh/wATE
 qCLrao+eb/YL95SOQX+wIrjzurqOAtLLGP006c7wd44cAlukzIwWFovcWkBCO5bCq3g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506075;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=5K82jIiPOAAxOVMXOUMEDuHnm5P3+HqOjNR0zVeDofk=;
 b=gOusszj5K9E/j0voXpkiahuplKxdz9zgifCBCYF9nS+5TbFAk6hs51HBSl6ipAlBeFA/
 /usQu+wz0OQjjHSIDdrCe3nuS2PhVNH/yexjoG3PhUyLqTGkIGKp2Ki/T41mQxcYExq45
 C664zJhqoJvAGrHrC9ssAYGCseCUwBi3d9uvJekjaOZQeAWJoIujQZHGeNAGuP+PwBt7X
 ukY5Ws4B0ud2HNIycOP6oP5II4pXyFtCoq0Va3rVhiJ8rhApCZdE+3RYYOxyPAaUVCT5G
 uwdOmje0zvC7Kw11IwDs67zLYXfs4ae39PTga/wN1e2wjWTX+phdzSyr6JMcIZ3sjHg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="c8/GGe/V"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=c8/GGe/V
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 20CED404E0
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505835;
 bh=5K82jIiPOAAxOVMXOUMEDuHnm5P3+HqOjNR0zVeDofk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=c8/GGe/VmEQeQj8vZH/7H8SWZuGHNe8HmzRm/3PKoNUkd0vJ3LmSY5A4/ColC3ZHW
 xeOcWAxFjzRM1wLQhM7F9F4ZNZ4hJpKaCjvTZ/QindD05Iom4F/zfFg4viYLkfw8A+
 oPfLuRHgTaafPIipDtpYMSlXIaKo9W7kqgSwZv1s94hamBIGU6rk68bMjusjGfYTD0
 LVOa7lEcy8kqV9HEaQZSCv/KQU9qp4ATJf6//Bop2FgxVoNPPtlqPEhUDWHNI5ARlF
 KGIdODCigSL5AcoIIQtGn3bwhOkUJBHJZPkBgmEgTKS/IP4vMCpnuf79Mi/Wf8mpQL
 GNL7SiPKVUrsQ==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 Mwm14paTYXmBoUM1N1n77FOwAnq/MYqmhqLnF/ylzcrJ8idnHmv1p9WcUDWoXNvd+Lq41NFWDas
 CH1lR9eUhsMwG9lCIgvqhYinuK9wIJDdy1Q++xTgpPgzhbxXHp+rz70hS3mu53eNPo1wZtWgekn
 bsT1OoMX0ajwFOVMu26kuzbt0/rIQ+Q0VWGnKnmp62R1omeyGD6CcDrVZRxsNm3flk0gegfP85l
 TSTdMyO4BQ9Ud635kc/pVC8Pg1JLtmW9XojrEM0+h1GZG3BVD6giIWWwl8V9nIX+7KcfiJen1V6
 6eB32dl/1+ootsczy0ftN2RrPQj+arbw8htcSQSnQrxQlaWJwi9uG1McC55glNzZea4vreSO4WE
 CXDpwWMoafxg6XjlmrcIgrVzeeFg3mtcLMLmHy+or0DPUe4K0y1pnihseF/VczpABJnA/554xtY
 gLni8WBnDnwy6FCIiherGWnbJzNUPEy1qNRXCrr+2xXNkrvcCOap6C2O3yuwlxQs+GkQPmtCzn1
 w0fe9oHLyRt1CV4/Ya/rQvCslNDn8kFmcOer7HzaIhz5tN82LruCzISsPqaxRy2EJwQZEKOze4b
 5hIjs2EwWxNbzeA0swZOH8eIxh1kK15REbtUooWCZHBRHosusyFG7d9vXdLXwmRcZfV+VRY7SAc
 uNBE3f1Pmw1d7THtMnZKM
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9B8F6A4C4F7D;
 Sun, 27 Sep 2026 12:43:55 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLi-0000000007a-2rQt;
 Sun, 27 Sep 2026 10:43:15 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:49 +0200
Message-ID: <20260927104301.1801638-72-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v6 71/82] package/softhsm2: Fix build with
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
