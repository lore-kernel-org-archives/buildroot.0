Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F276CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D864040B9A;
	Sat,  3 Oct 2026 07:08:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 397kRiEOByWu; Sat,  3 Oct 2026 07:08:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E849D40E26
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011306;
	b=e3fRM14nTy34EhT0E5JflUmtUnW9zhBSgG5lmMn0btkaJzlcvuBSK3g7gSnFYK5cAbtV
	 WztEBnLvwhCxY06KgigDOtTWv6ibZuvgIKHY+KH/fSrUQMaFvLGvv6wMBKSQYYMP5251R
	 J0ujQWhWKl4l+KQ9ZEAiFF4kPat5rEPuBGwcET7kkjkdt234GJWQzstljUQgDhmBnXO3T
	 2HWM7laSdU1AhOh1LRyVWjUj66Vryo+HIhJEVfZkcoltNB7fq+o3+5j9lVDhTmL4iBJqT
	 lx7ZMAHiNzp0tite4AmrFCmXBN+cMBASEHUCMRb1zQ8IAryP8BVhf9P5uD14AfEIzzQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011306;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7kksR36rpXCclPIshOu5zYXKP9+6CI5kHrvTvd7OOjU=;
	b=aVLmHtaCs6TGXi7JeXpq4l7UzkkiytapwJqyh463J9eFHQXX8Ng8ZYZrHe8vkcsfcUdM
	 TPpCRUklTCX5vfuznOm2snh7mp+1AyLcc8XSDBZ/UqSgOwAEZHkUAQXwCtUaCPQ46baUJ
	 m8CTAH48FzOyaNajgi63RjSg3H69y0AlaksHS4LyYIVRcB5zmqMQ3oxSJNb3vwtGGW5wC
	 oZJuG56U3IRN1y3rNWK6TuGvhUQoiVS7LcxoA7CoMdpljZp2LoLayhcOuiP1IbsHyKDJa
	 +xI0N9iRiyYgYlj8FWJAjNNBVeqGR4pqWJNT4z/cS8xONPOzpG1G7cHsvgCR2XJuPsQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011306;
	bh=7kksR36rpXCclPIshOu5zYXKP9+6CI5kHrvTvd7OOjU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=nMIGgvyfOvWrzwi2W6CzR0AuXExrCRLEQhCaIEKZXFMNEPKrf+sB+1+1quH1A4T3p
	 YgibJEDxy+PwgUCGXCtAyrFssGtM6CDQzAMNlgYwzLU0jpVLYit5BoIDra2XW/sUgN
	 kA//Evl+0XuS6dFL3lkuLtvKki9AWaqwo6zg+2JI9LdIKmK9Z2n3qNTgYPT6S/2KV6
	 tw567D5eBK7Mcr0Ra7astydPoZLk9Y0DOQ4KXlTSS9ps7ta0I/9G1bn7hD2cGMO7mK
	 bi6G71RglUau/vp26z87dvHDwDD2WMMcDyXsuHkuT4uALnintLpVNXt1y7luTSiR1b
	 yxrhgPoQE3vBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E849D40E26;
	Sat,  3 Oct 2026 07:08:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A3CB234E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89C6840059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:08:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oUG2CduqRvfO for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:08:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 68DD940050
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011303;
 b=Qm33NeT6efOO/aV5Z2JrbQMeGFL3V+CmaMKSj7PTcGEwURACrCVc5gy7yL0e1dud9h6b
 lw6wDMlOIL+ANzrFb1I8DaqEkpgfo2AtC/LswdOOw2H7d/ipTi3RQ86aorINpGdizPZUd
 TDI4sk7gJ4c/OXx7UJI3HeeYwH/VmAKCceL/BA/m73nbwy4jpewBho5EuPBSr0ki2rwXT
 QbA4Vr8CUoJZZcnKSAc2nCm6XwDvd7sPYg4vId03YYJPRecJ+lfOTWL44mf8OOsVJaMwN
 GahAg1rP8ywG8KGjm+3CUtKinN1S2RyLhzVjg65J7q1APDuQNUIBp9h/F2VJUjK2D3Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011303;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=Btz1vFPQRm8JxFvJkqit1cXevhnI1HV8wPPijVmRAq0=;
 b=QWKBwxwAXMFbF2MEpSYPDp6SY/Q37PRtiK18tjaBjEq/WVtMVoKaj0DjoZVfdaTKFdRm
 CgUQGMnot1nzH6c2JOzFsod2tiKNZnlmG9gys//twbJ3nCLsOMlAiGoUOJQ+vIuvNHSXt
 3eBARTKcFqTqD+vk9rzsbEa/uaN7wjjiraaN+1m0pR9fEjo5RoDF9tx5e3xuxJOpLOadB
 1QOJfUSI2YeKISu6DDL+OkHPFhBbsLBSXVjLDteEeqfPgFAFGF9RBrevNd8y+xdgrW+k7
 TXAYqfhPXWIyEE7g3IFLR5GMjvdpjyFRv/8ZwQO3W5eEvv9j0NnjkBFkTcQUJUrzrgA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="Lwa3L/Zp"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Lwa3L/Zp
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 68DD940050
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010927;
 bh=Btz1vFPQRm8JxFvJkqit1cXevhnI1HV8wPPijVmRAq0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Lwa3L/Zps4qzLhchoIs+7AUJ/Oll62GZZXONCXcVM6efTHqe7A/Gy2d0yRu2r8rh2
 +03PGYMzCbDAmRQFRojOGew/Fu8FDOtnftW2hE2Az1NZ8mKIVTp0c4ZM+0APF7v8fB
 v8Zhh6vA36RPbZTOY0B3QGadrDZbC9mHTtaZWqAqdUxZGWGB4jzZfyyhmiIA7hBhmR
 KsdqmiWmzntnQluOvXxs0s0WGVnxoiCuDzy3pPUr6LSvFdkwdjscow/kncgcS+hI+c
 uEjPXq7RLrVVBuf4bvWjJIs3zQ5xCqDlEo3CvN6VqpY/1cE1sLGwyis23smtklBpwH
 QZ9YAsTH3Xydg==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 1wHVquNQT3Mr0lCNSEClwdAn06WrcSRTDeEum1gkqmnhXR5yphHQzGLslOTDHRu+nG/m6bhpvSQ
 Pl2JEzypu2O7T2BdKXPiBUx31VJ9utYO3P8sNWazt8Pw41KIEqb62cqy2ibsCeRRTfF0JhO/g1x
 yZPlwnub570gFWkEBPBxSj0clM3cq0e09KLwKFL5s97sh1tAP1MZQU+YDq4ijHrpVCY4i3xUqB/
 Cfpfs+aqKQEZuAuoLahDWF0etZkwBjuC5zGrQSF/d1kWIZMzPyLHZohvm3XeQoHq3lNV09b0jxU
 2g7yFgFR7n+Cf4oSCeGNmMF8NGI/uZqky7/dC+8AjGXfkpcF8qkbGNQbbUNwVwC5a61eUZ+2IwD
 +GNPwbzXZfyu3zYzFFAeVqLnR0GhHZUA1cvATDj+o+TeVOeebUM0fsy0cp/w9lWICmPorIGOxNY
 qaJqEE8aJQHWF3ueeDeUmeX9bNbYfkY7oa8dMimyNuzUOi+Gm3n09RlPczFM77aG3xe1VIPA/LT
 85195QPU7nt+9D74qyTK8y+g/SxfHM2YPJul01aG4ipzyZEi/AGOrmxlQC2/FPppGnBYzWqnCTt
 U736pM9EiYlgEcNO8V2aVuoIcz9j7PyFaftCMm3CfTDfwYYcSu0tKyqzQq9qRaMh2UcpxIqFNSx
 RfwNdrGBSv8DpeWQqSF0=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DC2ACA4C5428;
 Sat,  3 Oct 2026 09:02:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkg-000000007Zo-2cek;
 Sat, 03 Oct 2026 07:01:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:43 +0200
Message-ID: <20261003070128.1295458-71-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 071/114] package/python-pytest-asyncio: bump
 version to 1.4.0
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
 Marcin Niestroj <m.niestroj@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-pytest-asyncio/python-pytest-asyncio.hash | 4 ++--
 package/python-pytest-asyncio/python-pytest-asyncio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.hash b/package/python-pytest-asyncio/python-pytest-asyncio.hash
index fbd141d76c..3df3a36190 100644
--- a/package/python-pytest-asyncio/python-pytest-asyncio.hash
+++ b/package/python-pytest-asyncio/python-pytest-asyncio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytest-asyncio/json
-md5  f9bf0eed023c7b6bb1d68ebea82d0398  pytest_asyncio-1.3.0.tar.gz
-sha256  d7f52f36d231b80ee124cd216ffb19369aa168fc10095013c6b014a34d3ee9e5  pytest_asyncio-1.3.0.tar.gz
+md5  2495e68fa8e724cb6c69460d35a8f177  pytest_asyncio-1.4.0.tar.gz
+sha256  c6c0d2259945122819f171a32ecea2c349ead889ee28176caaf492143424be42  pytest_asyncio-1.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a8ad31b1c3f40dca5a84119351b8fa8ddc868edd77fad8a8ebf6d8f2d16fa4ae  LICENSE
diff --git a/package/python-pytest-asyncio/python-pytest-asyncio.mk b/package/python-pytest-asyncio/python-pytest-asyncio.mk
index da0bbfeb81..54f719f21a 100644
--- a/package/python-pytest-asyncio/python-pytest-asyncio.mk
+++ b/package/python-pytest-asyncio/python-pytest-asyncio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTEST_ASYNCIO_VERSION = 1.3.0
+PYTHON_PYTEST_ASYNCIO_VERSION = 1.4.0
 PYTHON_PYTEST_ASYNCIO_SOURCE = pytest_asyncio-$(PYTHON_PYTEST_ASYNCIO_VERSION).tar.gz
-PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/90/2c/8af215c0f776415f3590cac4f9086ccefd6fd463befeae41cd4d3f193e5a
+PYTHON_PYTEST_ASYNCIO_SITE = https://files.pythonhosted.org/packages/43/7c/d36d04db312ecf4298932ef77e6e4a9e8ad017906e24e34f0b0c361a2473
 PYTHON_PYTEST_ASYNCIO_SETUP_TYPE = setuptools
 PYTHON_PYTEST_ASYNCIO_LICENSE = Apache-2.0
 PYTHON_PYTEST_ASYNCIO_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
