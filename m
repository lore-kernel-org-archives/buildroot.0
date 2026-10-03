Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73541CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 411BF60DA2;
	Sat,  3 Oct 2026 07:17:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YCRfY9NCHtK1; Sat,  3 Oct 2026 07:17:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 521F560677
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011876;
	b=GZPfqlqvcswcUa5h7nAmjkkC+94w3M0uoocmOcPpyEPJONdbbeZorcdjwVLGmHHu74H2
	 5OCHW27l3hVY0M2t7J8BVDxRUUzB41MyC1bTRNedRtNm8nkSw8d6fVe0SGhSbIjQWAvbc
	 4FV7O6tYFVb7bhPa+NQ/Q5KPOI7daqLwUqOqKDrMNzpQnlZ7KOWtbOZAa/n8ETSALnyQX
	 ILozlBRV9PU0wD6BlsOY8MsUcCIkoi2+bZHZvLmd6led96y95iEntNoQ+U0tQMy8618/c
	 EtJAClV0VIi4bxWxWmwVcrO5B+VPPlH+e1pt8uRVOrSVHE7FBnxPuw2xFMP1bqNb8Qg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011876;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=kC06zOml9DDHi2EE1Dvk3ayX89n6wuGsYmBpAQ8duV0=;
	b=huX6nFClH3Eu41A3c/jIh51kBlY9CRFUguZsqAHKcIiD0229JMvAfZJ9ovOWnoKtA6f+
	 2lEdToLgRem6u6z6b5SqVGHujiIUl7f/+leCYmDsmWpXBK3umRK4Ela7Av2J8x6R61y3I
	 1nr49W8QXH7Axrp4lAcyYZ02ENwDqA4VJq/t6Hvu50mRaN4vvIa6o44d+BkwTB3hoZFcj
	 mMs7ZIeLJz/rOSynzstmprr7RQBSxfoOa91hm1RZ/Xzjw1kg1m35+cdozmjQXXuDsaP2A
	 qV59BwCXuXhjzuGFzRVvMBc8b3/19lisi3CajfJsj1IYJlMVr/3OBJvOsnQz2KTb9hg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011876;
	bh=kC06zOml9DDHi2EE1Dvk3ayX89n6wuGsYmBpAQ8duV0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=PHSbtLIs3agCA1xyMcMR0eLNhiPCzRNhVNimAWS5JLmr7wlvSG/KP0XgdGUf7rf1i
	 ojAv5ev9kapJcmIjXzNB4QUkR11pUKw4YsgB0k7gFl35kvm7/T41o2MhwTiTjsVlGr
	 xmE/0H8ZmVW+O2ZCpFEkCs2zR5GQQYmaOu+jqp9rwDR12GFel0HvAztvw5qEspgHv8
	 nCFsD769EhZaucb88nB8j7rsyqURdZ9waqx/bu/Eq5rrDyOvtWS35uXuZ1TXFm4xHU
	 ES0GTxF7FM0a6xVV5H0pKsTwVQJ+AGauEf7/y8TNzEK0ev1JnWg/fH3Yko+saEzcGR
	 /Fxyexw2yjotA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 521F560677;
	Sat,  3 Oct 2026 07:17:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BA74C1D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A111A40059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:17:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mEy51N6u7gAY for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:17:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org ADA2040050
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011873;
 b=RUIOV38E0cvv0lNy3wAy6f7/Lx9xA/LiwXe6/G4IOuWO+Gw4fQaX7aezbMJ419/zjLOz
 lRRoyPk/5PNq+RlbfiF0C2qFpXLPgUZnFnfCHn6KgTiS0V7aDriGbSNn07F/M2I6B4pPm
 zYxoW48PIRY7NmKz/zF2ArNcOE4WhvtLU1KcA6el2ILyjRadCaXTS5HpeJiH0dPXP4h+s
 aDXlv1IgjYP17vTKRD/8is18ja7ZNQnqJGr8jdz3XgXTUG5lS14weVEbaH1Q89KKHVmpq
 A3pyZuAbPy8K9lXRXjyzC+XJEnwhjUflNR775n56ZW1n9ej/sHVoUHLsly5mQLdolrQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011873;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=ZOKoifnYO6RMEamnvxF7dtGaoizajXplKpzeHT9DyVw=;
 b=qvzwzbEg2zGhQK0yOHHBOs4UTBWvTm7POL2bkGWVXYmmFo6WMmsfjD/lnLic4pl+SSdU
 3r7LT9kVb7OmjME53GBVC0TyiAtzLlPBe9h1fme0sSFQmjgush3n+BY5y557kYn775aLU
 5J0k8RG1n8m1qWrwSGXFYSULszRnv2xZj1hY/xL/HJmwG/KWQeK6hl7rLLvBCe7neA+5d
 CU/j98voMepLYagjql5w0Wn5vW0aed82RgeRhaF/ahGVC4ntiBTQ4bi3FBq4UpBDp+0Mu
 YlnHwkxtxO5toSO/cCNf9Fsaf6ZnlpYWLbcxY3XhTmaBTIwjq50O+waCUgQ6TD5nYAw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=foLnwnna; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=foLnwnna
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ADA2040050
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010936;
 bh=ZOKoifnYO6RMEamnvxF7dtGaoizajXplKpzeHT9DyVw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=foLnwnnaCeapigJvUBN7C6ownFq4bJi6T0c3LA9xOJkDahyM2VTewyWc6Dk9HgdW0
 suU2dfquVlX0Qv14lWXVtZyRMneAmlseJGDxeejjs6evCPBqMxp2LRqMHdxYwshyFk
 +MSnDlXT8RqCFWlSMR81qZNvv36j19ZphBVHdkasMEcLmq4sQnyJMLxfmL7egQmzuK
 EvsSx+ZkHyxzALjK5mipvn64rIJAfHUCXBsIuhQacdKmzBJ9C9ZGmY88T0FUhfx9M5
 G5ZnZGCkbA/fw9Um0evMx0FdnYCz+JfaaenUY9glzJn2ZJj8D0djYTFlru+dFpis6N
 KiwYUjhxWMiLQ==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 j4bD/SgGqsex57f8hdMRL0KqpWHycDq26Nf9s4EF0uolermoyBxr762gID3T5jY3xAzUOklnLG3
 qoidiPW1em9Cru/xODOg24/fXQq7/GtUirx1vZAb8Oh+L9Zmh137kg6XauYITN3Tt/oac9necKE
 y3mKIXl2Tue5KwBgtvlHDHGkvUKrIfbzthckMoeCw1VKHkLbtPmVaWFiV+z5YmePN1oC076vJyc
 XBMyrnFgeZH1ycTqMeM/x6QiPnTHbBJPEUyTBwZSvoRjsFMgUgKKcGKc3qQShM3dP/fe3KH2m9y
 4vseqLc+b+WEKkMeGK8ndJy3Uzt6m+V0LQ6OLSPxKqEE5BUaaa3DCeMux1+nlkAak/VRlFGRavu
 oR2d33/+9mtbyr6SnOsOD5i2gOLu30U8XfoTYaHIIysGynU44fT1XZk/K015cdUsXpeFqVtFW/D
 7Gr709eybsBlPYV6SEC7VBrS2G+qu7+fc3kNsgwiYcl7nvpOnVVAOzcDLEaVvhNun+ShIhpkxgm
 YDcYaBq+p9VzQUKgB0W7IMeGbxjQpr+BYjQ9/ICkFBIs8fDYg+XaueOMGQ5QFECRcRQGfAyJT+X
 F4OGdABHK6QSJnrtt97glc7dS/aMZI5VRvROFH3QNADmx4g7JBDq37qbJXcRXKVk
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C62E0A4C5474;
 Sat,  3 Oct 2026 09:02:16 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkc-000000007Zo-1SP5;
 Sat, 03 Oct 2026 07:01:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 08:59:49 +0200
Message-ID: <20261003070128.1295458-17-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 017/114] package/python-decorator: bump version
 to 5.3.1
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/micheles/decorator/blob/5.3.1/CHANGES.md

Updated license hash due to copyright year bump:
https://github.com/micheles/decorator/commit/91f90ce11a11141e4bb808c2114bf20d1c434298

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-decorator/python-decorator.hash | 6 +++---
 package/python-decorator/python-decorator.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-decorator/python-decorator.hash b/package/python-decorator/python-decorator.hash
index 5980427454..381bb25461 100644
--- a/package/python-decorator/python-decorator.hash
+++ b/package/python-decorator/python-decorator.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/decorator/json
-md5  984649ae1fd174f9a82369e7c9cc56e6  decorator-5.2.1.tar.gz
-sha256  65f266143752f734b0a7cc83c46f4618af75b8c5911b00ccb61d0ac9b6da0360  decorator-5.2.1.tar.gz
+md5  4819314052ad95cfe8869f7d029200f0  decorator-5.3.1.tar.gz
+sha256  4cbcdd55a6efadb9dbea26b858f4fb3264567b52d69ca0d25b721b553f60ea82  decorator-5.3.1.tar.gz
 # Locally computed sha256 checksums
-sha256  914ee6ed78a5efc173bda698f2708444ca9d140fcc4080c60d0503d40db39da6  LICENSE.txt
+sha256  bd12cc51405c10872497c10ca21601f1d4abc50496595cc89e89ab5dad24fb62  LICENSE.txt
diff --git a/package/python-decorator/python-decorator.mk b/package/python-decorator/python-decorator.mk
index d08696e773..ec6a1fef9c 100644
--- a/package/python-decorator/python-decorator.mk
+++ b/package/python-decorator/python-decorator.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DECORATOR_VERSION = 5.2.1
+PYTHON_DECORATOR_VERSION = 5.3.1
 PYTHON_DECORATOR_SOURCE = decorator-$(PYTHON_DECORATOR_VERSION).tar.gz
-PYTHON_DECORATOR_SITE = https://files.pythonhosted.org/packages/43/fa/6d96a0978d19e17b68d634497769987b16c8f4cd0a7a05048bec693caa6b
+PYTHON_DECORATOR_SITE = https://files.pythonhosted.org/packages/60/8b/32f9823da46cde7df2087faa08cd98d01b908f8dcab982cdba9c84e85355
 PYTHON_DECORATOR_LICENSE = BSD-2-Clause
 PYTHON_DECORATOR_LICENSE_FILES = LICENSE.txt
 PYTHON_DECORATOR_CPE_ID_VENDOR = python
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
