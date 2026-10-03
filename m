Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99ED0CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6494F60659;
	Sat,  3 Oct 2026 07:11:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9aNL7m6hnUVX; Sat,  3 Oct 2026 07:11:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 76B7660635
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011508;
	b=mVZOsc0yrS1Rv09vjbMOYhWOpYNhXzyJ7TTFR5C3PTaujKEyxo936viQ8DXaM1XK0uSW
	 f81ZYuKLEEoc/1WfzMMcdrSS3Zas764sQX0zc7dIWgPvvF+aRv0LZ3mg+hlR/N7jUXiYv
	 yDLy99hwqEKCJp+kAn/DrWMUuCb3A0QkKLyFv0ztdM+QzMiOQVRGHQZQsFnboh3n4gkn8
	 IPsEgavSt6p+mC8Fs9PAEqADod+qWGN3ffpi9ewbG8o2kglzYkLc3HM8BXX2pjare3pA2
	 Yzb5oJpUR5B3RdboYHB0mK/RG/gzTKL7qSWB+mfOHeKTztIMBzG5X9GYIwg1a2N1ibQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011508;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+gIACMueB/gnVJmOH8ORPHKYpQHrRf4hZC7voBAGHyw=;
	b=oKZACapNIRozP0r8fLnQy2qCYeFKMdHsFzFBJMwFbtIAPhnC46Iy+G0NukgfayHnDkbx
	 hDSO09WtHdFJdzjX5FDB8htD0bT0qHBxkxfKy7JqM4WSJASlJ+1oeom7uDX/OWMUulRpP
	 H1SdrQnWrJR8u6uGOd4qkQnDZ/3xDuVYrEU6viNoVbgmBx46mXtssUECRxFONW3k0A7c1
	 hJOop0x0imwMSBL2nJJJkmEIBSByizI2mOpMKmYg8ILApl7+VHyc8PgbElPa9VcED+naJ
	 46l1H8iq9m8XOMC9KvjXCblhKb3uf0+giNI5NvccIUzb1C2UZBC7d1B4vfwoyBHqR0Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011508;
	bh=+gIACMueB/gnVJmOH8ORPHKYpQHrRf4hZC7voBAGHyw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=flSfBwUtlbpLQmeyyAaUs1ERF7E68uJCRwQXiWeXFDDxclx0jGgjGwhVc17oMR6Jh
	 AKEhHC4ALD8SbhTfT2gVqWGixHoN5Z7Za36y/4LCNV6Z42sL59QJC9PL01/y3zANN0
	 ti6xOIV6q00tw0/jeWO30N7xQROD3SRuXQ7ibFIFYmPq3M1N77TPT2bFLI6JRb3L9f
	 6cP/MHpT9TttOIUJ7t5/P69ZabkE+v78LEuTgAb17q1khYqn3w2UgrVengpeLSusog
	 zekrF+XxE0vXuc+GgWCmDM1kbeFzPFfvBlHW8X1gdJs5yqGogbblRgczo3+HTUZBSm
	 as5pSHR16CtJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76B7660635;
	Sat,  3 Oct 2026 07:11:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C193B263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B39E940EF2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:11:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PENnD9IOIAaE for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:11:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B54CF40EED
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011505;
 b=Bzkdok1wh/jB0naw1dv8J+8lDRrDIPh9tNlQxvzgVSF+zRIMEdc7PFFbaGG748ClbckA
 ecA5oHfNmrt8SOFwmxylqi7tmwY76v4WMeyAKx5SFAVKu06bFgBk+OTv72QJ5adJje+dH
 99SO0UCIjfYxuMpFHbSMAOe4qmfp26DKv27gRTioX/qZh5YKY508aLllevq3rZgQE+3rp
 q5DGb4Ev0fjep3fHO77tcZ480mL0TfmdFxQaO98smr6MikbpqrcAdU7RbXb7tnPhmfqLI
 9W2XCbsRtXqocZWvYyX1P5tcwqX4INK0r5TSJ67wqKymP7nyyGfcLYvnDBD3rVmAI4w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011505;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=vN8ZjxcptCFIUksxZnpQlr8O8pcMgnTgnf6gA69zyx4=;
 b=PhDIF0JwzD6V8FFYQdsErh/C2YSWc70amps0i02/jbEd7QbC8wa3Y9qTDuyIna9Ek/CF
 G6nfc7DTXpTvkM/RN86n5DUy5bo673X9pC1zzzXfWrymA3isrAp9pGE4fR+pYZkfXnpdY
 BDZs3XOFsVRn3WxOWrB7A7MZk3Y45K70spiF7b/65BX42o3zlMmlpa9XDIaCUzpVgnUqe
 fXa84m1/53KZnd+R7hSYO8La6+kws8PLhnkm7eHIJa6ETzEx9Qxje2tWDDsfhjXqqqEnU
 qXo4ZKOsf4uAl/gkJ2p7Y5udj4blVfqG2pQemEmcuzhfUFrySFRKL/dfpZ1lsBFflkw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=kEbqNMYD; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=kEbqNMYD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B54CF40EED
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010931;
 bh=vN8ZjxcptCFIUksxZnpQlr8O8pcMgnTgnf6gA69zyx4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=kEbqNMYDqnP2nfSiouWdy1WEy6lttgeuGunaT3IiJF2aXqjJzz5tpP9lFL1f5s223
 sA1Ee5950m5uaobpksHhXn0w8YEOQPRGzMPgd24sOkm2jfgOs/vxFv6Lznpt89LpSr
 UVs+hMPrIYQw1FwUAiYHao0Ew7g/h1be3voMq2VPZhtiY/cVVLUQD5uEG6c0uS2KaQ
 TiBDOKDt67xj+DWtAxpsmsjZhXjmaNFQbIVD1KORZYjJah2CsmGNSPaf7vTUHFPWMy
 7ksFdD0l2eOX4eoGSYlyURN1NnJLYfO8pRfvBe4UxKi5mqH00uk7ZgA3Zow0lqMXM6
 5D28GI4g9FN0g==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 6c554fE5EujxipbTEiNt+I9LTSmoBDXVzdiJxwJ+cKMDUxiio/DcY6fgDpE2qC+ybYm8aBc+HLt
 Kjbgf2EG8BaAMh/zg3NccPTrvXwZz1CTbtcOz8t8So9TdH9qaSEdylkBiUXpaHVUuOpUEWRYpds
 VPNvN3/PEQ3OgEtslnhvRXlnOU0Wn3nOgFVI6gf4Xmb3jxn0MoIx7BnlRl6nmj697o5yFXwnfxl
 YWM1mFBRw4pC5JI8WbKyzLJ2yTQz9NfyfqbxpH5w0LsnYzmxkCmzhhSi72x6ReZFT7DBddNZNpv
 oHlTN/PFgNzh8qAzL9m4tGC6Lmr0Bpd4jGSU4aqNaXOutRFqJgEbzJtIzvk8HVepB1oMFhgl4LX
 JtxDf3KjGSBl+D8KZ42RE+puyTx1n/1Nr5ffb8LHht/wJZAP2i4obukI1MIVVm05VW+KdMzy2xb
 XLpDbCGw6/U+dmhvKZ+0o19gf2CgOomopHf4wnibrTWMZx7MheF90dFV4/eSazkJqIF3Zs0/hdH
 glEtdbAPMjAI0lK2Ok3GS0vCBznp8spBg4QYKnZFPROqCPuyzIx7efUBpYEcvZJtmYYlmI2XYlM
 428rvMUttxIxjIZ6BRhwyL8S5XhFUFjKhfW0IGa30lfim9/rX6PPKoEaaHWieJra
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 01218A4C543A;
 Sat,  3 Oct 2026 09:02:11 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkh-000000007Zo-3f8l;
 Sat, 03 Oct 2026 07:01:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:59 +0200
Message-ID: <20261003070128.1295458-87-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 087/114] package/python-tabledata: bump version
 to 1.3.5
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

https://github.com/thombashi/tabledata/releases/tag/v1.3.5

License hash changed due to year update:
https://github.com/thombashi/tabledata/commit/10cf6635129960103edd9c4018dd656ff919b274

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-tabledata/python-tabledata.hash | 6 +++---
 package/python-tabledata/python-tabledata.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-tabledata/python-tabledata.hash b/package/python-tabledata/python-tabledata.hash
index fb3471af95..58086e8930 100644
--- a/package/python-tabledata/python-tabledata.hash
+++ b/package/python-tabledata/python-tabledata.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tabledata/json
-md5  c0efbc178462c94920c02c52da56bf18  tabledata-1.3.4.tar.gz
-sha256  e9649cab129d718f3bff4150083b77f8a78c30f6634a30caf692b10fdc60cb97  tabledata-1.3.4.tar.gz
+md5  453c912bd7bbf49cf90490e42e9a94bd  tabledata-1.3.5.tar.gz
+sha256  98c64d0ad6b520846b41000fb3f5b2f42fa7ca2675c2c669e5ccab6b93082a36  tabledata-1.3.5.tar.gz
 # Locally computed sha256 checksums
-sha256  4434f353a12dd0236a99e5d3fd07fe3b3a453f9164fe10c57a11d6ca86b50c08  LICENSE
+sha256  df528c57bf4606fc7ac4022b3a65ded8a4915e04085ed75c3f810df562b3701b  LICENSE
diff --git a/package/python-tabledata/python-tabledata.mk b/package/python-tabledata/python-tabledata.mk
index bf845b7a7b..cfc3abc6fc 100644
--- a/package/python-tabledata/python-tabledata.mk
+++ b/package/python-tabledata/python-tabledata.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TABLEDATA_VERSION = 1.3.4
+PYTHON_TABLEDATA_VERSION = 1.3.5
 PYTHON_TABLEDATA_SOURCE = tabledata-$(PYTHON_TABLEDATA_VERSION).tar.gz
-PYTHON_TABLEDATA_SITE = https://files.pythonhosted.org/packages/b2/35/171c8977162f1163368406deddde4c59673b62bd0cb2f34948a02effb075
+PYTHON_TABLEDATA_SITE = https://files.pythonhosted.org/packages/75/65/2f54f0dedd775dde48e300023d20e13ad329a51e33dcadb6d47b4dc95768
 PYTHON_TABLEDATA_SETUP_TYPE = setuptools
 PYTHON_TABLEDATA_LICENSE = MIT
 PYTHON_TABLEDATA_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
