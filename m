Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D6A5CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B04C605D9;
	Sat,  3 Oct 2026 07:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t5UE02B9K2eN; Sat,  3 Oct 2026 07:17:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7573B6064F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011826;
	b=boiP21gTtXSQXNysy1nsFaS1hvrF8kI755MX9mnRjV+qj5XENLjfPbR0Gr299SLFFXSl
	 jsjOEJDYBCu1yx90SLGGAcq1o5c4ivIU0AvuaDacVblHtCEvgRzZoHPckkXuX5d2VG7Gn
	 Xl9HL+MDHCXZsH64Rb49aLZL8vEkq7+x5MbgX38tGqHUYqysrfJhXyy4H61Baj9+nZ2kP
	 2GrppbW91zexsif0qhJPaBlmv7elyBUe/KMf/RXyKGaj04UfuEzOqHHxVDrczR8Bta2ek
	 UvHxmqhyRb/0kuJvQiCFQFpaCNCSBkoDui6z1wzUkJ/rrPI9gKbTL9/fDL1y1hy3nSA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011826;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ulsBqWAADfSwxwKtvTap1b9MCaN8Bm7XrXlMXyDpsjE=;
	b=TJARjYhSVXNpHyM0sR8a3RrQyguxsTM30EsitGOj6OPC8st/WLEvKc6bBy9fWgOiCLau
	 QcC72ECRqz+Bkpuh/x+imrAcqZNaGyj2yOM7zL3ZY9FDAaECbjR07sBS1/3qZgnfrLEY+
	 b17UsOasb3G/e+m1Hk1Au4cGYSv7dNERv19ms6D4gxhL4iMhKVtyh0tNaSONWlbkiAnkf
	 XYRjATbYhI9pepTgUNCqKU77lQn03ixebh07CbDZpCKVHlglxNS160AQY2hbciRMlMGW5
	 lAm/mVOLjBLdFyPDHoFNQTObmvBIEBH5ZvcMRtsdOJericNb2xHiXCIrJob8SMNfDGw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=liqH87co;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011826;
	bh=ulsBqWAADfSwxwKtvTap1b9MCaN8Bm7XrXlMXyDpsjE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=CFFodOWazBjQaRKykEqHgXh/ufSwgDNe8uiPseSEZFAmxEJrWUBn9I/aG4F5FA9A+
	 p2nJecVN957SM0kqC1qpNBXjMQD9shXaYtlbnunvGGEgJWmOB3P+TTN67c/cwV5LTs
	 Y44j3XHf7hPdv8kkq3Nerwt0aN++LS3tQvaEDKflDax4n0n15QdaJP1RhttBwH3ngx
	 dAhUCzdL2/Bko9yfnVDfV6CBmO0QE2D7h+i1JKotxUebmcVADKDaEqtjQb6pOCdEGW
	 rZ/UACs7BySWqWnVuhWV5pRpzNnuPZCQTRcWSYSUNwXfl7cwPb5BcowDovfKhU4xu9
	 M5e+Y1D/4i/mw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7573B6064F;
	Sat,  3 Oct 2026 07:17:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F66D34E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 055B76064F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:17:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0LgwT-zqBzXv for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:17:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 08737605D9
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011824;
 b=NoFA+0sWQbEcnS5ipa4JrUX8TsYL5jzUhNtdEWGdm1V2RHqo3nSyCD0NVz7R2STeBZKB
 cilaBeS0ELASmKB/ujmqiOQyzHh77+E0yYDwJ8MkiosM4LfQvyoc25gTmlJH7g8tKYzHi
 t8dzvM/38Wh4CJn2eZ0xoEnY0/0bbbpHQuW3znvoVyhnhjV12QlZvFI0ECU00+0PQ7ukm
 vM2anELECEmqrsU7WxZPxUzVHkd3d34Dot0cp204fN1fe1OBro2zXYZKG1O+zkAChQVUC
 SjeajBdjDCGJVQRYYcowXj7boxW/LOfsDenMG2RKP4sUQxBM05DiuOliyN4s3nqWkrw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011824;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=QikmD9lpduULVGp1Y0bJT4GXeMvgGV4VVwcErI7MX/w=;
 b=HW/HQcKQboWe3KHHKF/Utq4bwLpEtL3Iu4cPTOxjYT9hJ7L4/n+ggN2GEUbCT3RgOh3j
 xePngO5rf+NP5lIE2B4KHoaR4yn+qKgqopHiawnjSbHTSf3ynEPc/UyFOptGVvrZ0gGeh
 09xc6HTMKyOdv8vlshQClvEPgAqRL5lIR8yyW/7D3KCA5IAKv5YcK3+dXQOEXZaumwo9e
 NiPiLFuHBhuDC22NhWUqJXrumZ6zgJcUvSalLvvUdyFMK1hEHUCC4NUPIwxOIDMjjrrlY
 h/N8QUzYiChgg+b+05pShRMOpenaSMNWcePD93DPLzOVTKaZu2MUBgLdj41msHPJi1g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=liqH87co; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=liqH87co
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 08737605D9
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010935;
 bh=QikmD9lpduULVGp1Y0bJT4GXeMvgGV4VVwcErI7MX/w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=liqH87coAMXvm2lsV8AzpYOpsstj3BREKwotSL3F0Gy9pTgd7Gwda3jS7Q7JUPzPs
 GNXDdmnRKXp4CXXUxeNYlnAHWhCxkKtF+/i1ePWg0PGcnxYvZQ6iAJHenbWuenicbT
 QG1GsO0j+DxAdZfmlA9irfZcL121OGOaNcKRsBJEiKfOlVjmsyfgx+FqWZBz8mGjdX
 vjHKpwkMgkd62r03/AC9wLTuMrNjc/nVBgclj07ZBZUYuE2d6msGoPOct5EKCaAkQb
 j1gr2QmL+TyqlNp+pveeez/xDIsOdF+UT3XCgBPkDHw12RTSQ3HBVC2XEUgCIdrMcM
 K81G/xs5OfMKg==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 61iABehV64m+qrt5uD7atUjunjbuhoPcnLJYT2vxoDAZBZXJoXzlAB7u0b3lK4TOG68kuvGJgpb
 HWQ+OHkTf8qLV/ISvq258IVOKWOcHOkWHfmk6WA1AVo+oR36sTHNb1wLQ/i5cIDjk6r8Awg7Oic
 FhFsWTO1B5zFQeQMPyHnTgANN+X5Wm6riTFw7WhEyJTlKKufe55k5aPVyd4xzcz2IKwE8XNQKe/
 U3QxF6205ZmhiA6uOeWD5prnFEu5i/IoyZa5jG3K4QtGSY15JKOvJiQD8k4TCNDFQxyZZsVD2Ss
 mZHZCGvv/wzVliEYINddJwdmn5cGS9NT5rfp3wCu62RAN1JNYRVolSA5yGjvVCD6G1MG6u0wgFz
 p/OW1ErYyqWG1OidWcp1oifEce0mOlGO0KpfIKIu86iwP0lPccCtm3uY/cDdRilnjdnZYn3Myq+
 fkIFlpcCATjXiapTvJrkjUFm9LTCGU9EI7tiAi6oFBo3Ct6nKr2emFQDuxQdDZtfw5O9F2ttME3
 jPa4PnX2Jidji/A7RS1O31Ekq4jhmCHfucAhc1Q6OAc4ObWZvg9znXZJ+owkSRxAli2DoYtTCAC
 z1NA/s6Ut3HUUijrsESePO/uyz79G3ZMIIYCQVQ/gIkanczhZ9MObfzyMavbRCjH
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E5B1BA4C5469;
 Sat,  3 Oct 2026 09:02:15 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkc-000000007Zo-17fi;
 Sat, 03 Oct 2026 07:01:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 08:59:48 +0200
Message-ID: <20261003070128.1295458-16-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 016/114] package/python-dataproperty: bump
 version to 1.1.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/thombashi/DataProperty/releases/tag/v1.1.1

License hash changed due to year update:
https://github.com/thombashi/DataProperty/commit/da381f606e06572d990cd22f69fb02ae6a7c1892

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-dataproperty/python-dataproperty.hash | 6 +++---
 package/python-dataproperty/python-dataproperty.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-dataproperty/python-dataproperty.hash b/package/python-dataproperty/python-dataproperty.hash
index 49ce188898..bf5127e816 100644
--- a/package/python-dataproperty/python-dataproperty.hash
+++ b/package/python-dataproperty/python-dataproperty.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dataproperty/json
-md5  b10a82d8c35a1e69f58b921aa7d7f063  dataproperty-1.1.0.tar.gz
-sha256  b038437a4097d1a1c497695c3586ea34bea67fdd35372b9a50f30bf044d77d04  dataproperty-1.1.0.tar.gz
+md5  d5381879e224554ea0e3b8cc46f60f19  dataproperty-1.1.1.tar.gz
+sha256  a83af82a234edda5378a36fb092bc90dd554646c5e58202a310acf468ae81bc8  dataproperty-1.1.1.tar.gz
 # Locally computed sha256 checksums
-sha256  36289157e371aaae5b5d3ba4be87359ed07548cdc7a9f19ff61dc67cfc536a9c  LICENSE
+sha256  72418b897d8a5817d1c858112e42e71b77cb251948c3753be5e15b59c20dc8d6  LICENSE
diff --git a/package/python-dataproperty/python-dataproperty.mk b/package/python-dataproperty/python-dataproperty.mk
index 060de7cab5..191cf02b1c 100644
--- a/package/python-dataproperty/python-dataproperty.mk
+++ b/package/python-dataproperty/python-dataproperty.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DATAPROPERTY_VERSION = 1.1.0
+PYTHON_DATAPROPERTY_VERSION = 1.1.1
 PYTHON_DATAPROPERTY_SOURCE = dataproperty-$(PYTHON_DATAPROPERTY_VERSION).tar.gz
-PYTHON_DATAPROPERTY_SITE = https://files.pythonhosted.org/packages/0b/81/8c8b64ae873cb9014815214c07b63b12e3b18835780fb342223cfe3fe7d8
+PYTHON_DATAPROPERTY_SITE = https://files.pythonhosted.org/packages/f1/6f/a801320bb388d965be9c370ec753cc33120e6cbe0069fa05644f05821975
 PYTHON_DATAPROPERTY_SETUP_TYPE = setuptools
 PYTHON_DATAPROPERTY_LICENSE = MIT
 PYTHON_DATAPROPERTY_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
