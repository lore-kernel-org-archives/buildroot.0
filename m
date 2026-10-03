Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D902CCA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92DE740F0B;
	Sat,  3 Oct 2026 07:12:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PlcTwPlTxJ3W; Sat,  3 Oct 2026 07:12:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2025C40EFF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011533;
	b=ZxGOY01vGbQoVDdDUJgQQQiMkpMX20CMoAZZ9szuXH/P7xMWUZqDmKA3Dk0SA6yb3ubg
	 Ov0ydt4AYc69ZZrixo3KI+d7Vh9+0pBI4/Ko96APXFKastZRLUgcMrw5UBZI1pLYQTuf0
	 6M+6TdqydldCx8QsaV8NDLTIsmQR7Q2a1Nrq9I4QjyZDeB7A/jW48sCZB25+Ag/3Ba695
	 VY2545Pv2hlc8OkBBHRQxK3mx8FFQW5B5SzfaRyF80UoTq6vj/3LMiA3vgSnwfPXI7A66
	 Cfs8swhWL7PT7wGqq7uXNkbbsFOd6lUDanfv++4Bq1AXXjXs+00W9uXVXBIW7bFLf8A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011533;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=EiDBJKBgZbFs06SUaTcUP52Cr/7ScGSvUfR/HwiPaQ4=;
	b=T9L2+fjVigoo7NjvbKiyiOBXV/lBdPG6FdXk3y/YTRTg5d/BJcqbj84ME1GFKp8+r4La
	 Ey6qAdNs2qupdEakKVbgVklDP9/B68wzRlUjrDW3UBrkI6nPHAc7b+HRoFm2xjNoQpao2
	 xHMPzudcWlczcQxBNXBo9/c3KFofkHEerlI2NYWml5KpPwPnidu5KlKoxqkPAyleT0cNV
	 W4UarkjkCrYY3ZR4u2H4wmZyXh8esvah6yVQCXSd6sKwaDIisy1Ns8QhmPX12I1XVnu3B
	 YTYH4Irsc/mzqPvgK8abSKWv06pyaD42Zttg809hFXSNn7fDgyvhi3s1fhmLby1+OYQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=J3mMegKg;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011533;
	bh=EiDBJKBgZbFs06SUaTcUP52Cr/7ScGSvUfR/HwiPaQ4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=TXYd0a2DsNJhcf+TnhpPT/wRKa9UV5xgJ0wbjLnjovLn8CNHzqLcS1o/01FJ+Wbr1
	 AggvJ8f5Z1Kc1CEY1oTg7kbxVTjJgMfJqc6wp0/+60kdg+kqXFhRQ/5mSao1BC4Pn5
	 dqhYbkCUw0GIFepqmSD9noUFqvAR77JTLxp/i+PkIksWzS65w7SaUxY3YlIHIIGMv4
	 d+WgVForkMX04zI4ZscImNdbuQvVJ6J47S1f2TwBQ8EEecWxiUKW9RLwrrE+TcNXud
	 aS05z+KqrkFgQVsjqRdeWk6TsPmRNF5ah8bXrpOEZQEH69ap50pg9LAgOxJ9qWRzsz
	 YJ2XyKHENhIqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2025C40EFF;
	Sat,  3 Oct 2026 07:12:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 76182263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C0AC40EFF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:12:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D659jZyj0oSg for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:12:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7441240EFB
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011530;
 b=gw/hK1y3VSBMpcEywMoq/T4XSGN4w53PKO0t0cNOfbgGCZi3WcizTCk7+YP9u4bP8/TI
 GWlaHshb59dAKhtFh6Ckbm7pSNhf9fViJ2AWH7IPUzMvsoqKcwqzKKnUITcaZZ/01Ktyx
 EF2QLpYGDkYcWNRQa8igWCNInDze1EXVU6hKvZXKlVFItWRzHG2JAbxEHPoX8kaXGScXy
 /2KugBARRPumitncd+MjosQQiAIwiyDwDLAa+XHvu/kEJGa/lXIUKKUvJrMk9nb3xQf4c
 dTb2KxyT4ObbZxomtkAOSE6FN3kV11A/sSoINnMrUW3QAfgUvWZ2ZMwr+ioxsC45oBw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011530;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=57MAeepg46YSmJI+pndAgeSmTQMCIdfWqEFtQciYMaY=;
 b=D4zRvqWcuidGO1EsUbfnOfSwJdBstSwPAMfOWXO1cVumygds3WVTsoSKBW4HO0SlHpWz
 BateCNnaRXKN5+kn3nMNs1MnoQM78YedFPDQ5ZambVpG3mWJFqgM35aRlrLt6M7Le+AR+
 CaezgpJyi4Teu95mDf/RYrJvlAAVc0eU7InJTGxx1ndZjgLQ7c0hlBEuNgsBTzEoZO5rz
 MPlioPbJjm/yi1AIOagGqeanamlscouqkOiSCaIEcMjrVDgyyJrumbs+Iv6kE+1rhMa+Y
 WkJVXEIvQDE7sG75nxmLgIjaq5GvgVDM93sEXoZvSptpAJnTE0cR6h7FsOFp/3MMl+w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=J3mMegKg; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=J3mMegKg
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7441240EFB
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010931;
 bh=57MAeepg46YSmJI+pndAgeSmTQMCIdfWqEFtQciYMaY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=J3mMegKgsxuqbKG4Y3/m91LV6E9yNC8cq3kgX6KZkb0uVDTQoEkzA6Z5ZoVJknf1x
 QraVZ2CJLE4olZ2jIdPPm0n5q6greHJKIEfdx90W2sUJfNNcJ13w8GrL+sOjQH4WdB
 LXQN7GuAPtVnV3qZwdWZT+VAx1Gi0ATR1I0JpSZ8cGOgzCgUU64dJS/qwya5x0VvRj
 +MPWoMhb6KGe4nHz3b30O9pfMN4JW3HvteGBbbFgBgh3kMUfh4QBa5QONcz+b+fRGg
 p6glk9Vv4wCgZa4pO36jOEkvbeljDW0vO4T6ldk1OCbbOIJX+R/a7ydIXpsj9fPElH
 nR3HycRv9sJXg==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 rZUcUlV9dnwgXi2S8VNN/WXqshvyUr5nf6ue/55ujDM7osaa5lDSLRH8CrS7P24lZQsyz3Dk8iX
 a0sy9qoOM2rXFRrRp/cXaG/vx21ODcV1zz7WGsJe2neH72qyoaKjyhkYujU3tnmxA6uPw3bvIMO
 JV7wbt7DXWfdH1F1SJblg46wsdqvb+4uZ35UAtFAEpv2++HY47wt3Y/hcu2i0GaFA8VjlMuzmVK
 Ctn7BWKWfMGpyQ2W9mym1Fp4OTMpbBDeEDhhxSHpLFNaNSzGa7xz7Usa47tmymO1gPGsdR4xJB+
 bRagElnyQRMhWHz4DHGYdu7+mtg5DWUNEAhYNz1ANLp3cnrQ6bF1QUSop6m1bDiVleomwedNLXj
 qX1cuAWrQm7ROYW4ADKBJfDkAdFLf5KDKnmrhLOQgKIefM3fhs9tQ7G3Ash6MioF5eCW6T0szEu
 YVvwu7KiVb8jC+ace8YutsuRd1vm26WMijTVeQXFx/hRCezbHSHS8aM8YOdVoQiCwHldKIPpD2C
 absRxS4b9qrjLcNY0YHp+I5AP7jL0tR4a3aV4xyIOdkRcZ2npTHIPAfR7jLDYhFcI3tqFmCZuC9
 07dFgRoh9qDqK4dfJjb49mC/l5vXJOzu+KZ9Y3J+IhmgUIJCBqJtQOs879hWTWQOwG/eD/uQTFi
 rHR4TcjoDbVvuVaDoABY=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 74925A4C543C;
 Sat,  3 Oct 2026 09:02:11 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtki-000000007Zo-07QV;
 Sat, 03 Oct 2026 07:01:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:01:01 +0200
Message-ID: <20261003070128.1295458-89-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 089/114] package/python-textual: bump version to
 8.2.8
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Fiona Klute <fiona.klute@gmx.de>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-textual/python-textual.hash | 4 ++--
 package/python-textual/python-textual.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-textual/python-textual.hash b/package/python-textual/python-textual.hash
index a7a60f631f..1b7e9ade46 100644
--- a/package/python-textual/python-textual.hash
+++ b/package/python-textual/python-textual.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/textual/json
-md5  c1831151f5fd52aa6f09c834e32df3b7  textual-8.2.5.tar.gz
-sha256  6c894e65a879dadb4f6cf46ddcfedb0173ff7e0cb1fe605ff7b357a597bdbc90  textual-8.2.5.tar.gz
+md5  dd6388bfad60ec1afa91d79b5b7dca84  textual-8.2.8.tar.gz
+sha256  3f106a9fbc73e39dd266c9712432087de78a6d644084c7c241d6a25c3169115b  textual-8.2.8.tar.gz
 # Locally computed sha256 checksums
 sha256  94f290a762376dfdb7768e42070618b0abfd2a2799eab1b1c097816c3a39eb57  LICENSE
diff --git a/package/python-textual/python-textual.mk b/package/python-textual/python-textual.mk
index d7ada90102..7164f3597c 100644
--- a/package/python-textual/python-textual.mk
+++ b/package/python-textual/python-textual.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TEXTUAL_VERSION = 8.2.5
+PYTHON_TEXTUAL_VERSION = 8.2.8
 PYTHON_TEXTUAL_SOURCE = textual-$(PYTHON_TEXTUAL_VERSION).tar.gz
-PYTHON_TEXTUAL_SITE = https://files.pythonhosted.org/packages/62/1e/1eedc5bac184d00aaa5f9a99095f7e266af3ec46fa926c1051be5d358da1
+PYTHON_TEXTUAL_SITE = https://files.pythonhosted.org/packages/00/21/39a76b01bd5eea82a04baaca7580e105d8c59450df03998345bb2cfb307b
 PYTHON_TEXTUAL_SETUP_TYPE = poetry
 PYTHON_TEXTUAL_LICENSE = MIT
 PYTHON_TEXTUAL_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
