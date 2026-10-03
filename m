Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60BFCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A44A410FC;
	Sat,  3 Oct 2026 07:20:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Il5MhHGVhJcC; Sat,  3 Oct 2026 07:20:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A5AD4410F9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791012050;
	b=oBkOv+pEeagG2tOaEgvUp68PsyTwARtEvjRRLqrYlUDCfXdKqkekaGQVsNOhwNORVsn9
	 GQZ8q9qSUHNBeXzcNvJhj93LVnRiWL1SU7QhgDU2rlsVgqdEqwFQRi9XV0QPZubD2E0Qc
	 DpQqHS3a95/PdGtb5xcmdMdCB5eBaNQoXFo2A7nWqfkNs8QgO+8uuikGwJkV7zifr8idN
	 RQTI1hPDU50Fs/XYQs76p/sCT7LkI/SDwHZAQhPEnU/FhlUiXaWj+JUEnrmFIGysPsg4W
	 7qlFyRFscMhM7cc3tr2Vd0+bZ0r2LWEw4quVx+hOEoeXsgF6QOYB0lVxcoOqafvTHCQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791012050;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=a8SXKrPG/fd9i7jPKpxm81EWVQZz1xXwOMP9C/nGI84=;
	b=ZnTC2p5xRL3GWF48IleBaqMi7Z34+4FVavWjdZW3Jw5PzdhecaPW9Fq+rDJRHGiiHsvW
	 u3AmWeMp/lki4C0xmTvYn/XOg93lpjRFrwC8aatSBZU1IIKHIXXBCpPtAiUZCVhJlOend
	 RVx4mOlXAAaBy0L53/pL1F1OOEOc2WvAumScByVWM4V6tlWYbyAeNj9IEKrD6AiokzDnS
	 eCi8EqU8C+0QKdXOD0ljsgFU7IABJH5s3PZL6LCWRW1e5HTAUvKXv2YZ+ZjAvDNlu8Q7H
	 exxdcV1IKQP2N6Ale/ZSs00BtuGS05Jy5PHSGqo10WJ80YniqbTDneT+Uvtz8qREseQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=aeaQRoEy;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791012050;
	bh=a8SXKrPG/fd9i7jPKpxm81EWVQZz1xXwOMP9C/nGI84=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=XPJ+rKZqa/cuPAHxxCx0aB/n5iwSYXZYSpMDX4n542T/xaAw6euTELRff81SDDeyL
	 +BufJ5h8XgMgWXRpHX78HqxTz2oSjv0e7MHSvYAC78X/KZDuTR3mpwSgiFRuFQZwqs
	 cnZC1RDFASGiTPnBVcpsKTSE3SGDcMbN80GGSC150eVtIrgAsC2VCnw9X0X48ZqmP7
	 iplB9YXUAeVLXfH4e9lvftxW3Gmvc1cMoJZrswNrxzEjyhzK0khAn8/xcaBbdHBIY7
	 68BlzS4spQDpAx4+rIO4IkiB+RREvyKtZWAREPZeFzc6fF3qCeWqFhDQsr4B+VIQzv
	 R2Elnxt2oMAZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5AD4410F9;
	Sat,  3 Oct 2026 07:20:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 20D8234E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05EF3410EC
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:20:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DXbdlhoxiPPd for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:20:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DE590410EB
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791012048;
 b=e85iRH+qLp/YpsSxbnUeXg7KEK6RpZ5nvg4lblRmFBUzY1i0wQx0gpmMGKPEQAoxAEAS
 7qwpjv5Vq3e2rsObCHAbayl8WXnY2WFKIx+O2O/zGc4KsLhkjNp/GEimztTnzcokHkOdB
 lkgkfrG3B6d0qrcwvkZVRTcI7sc43XxJcFTBAyWdu4qBXIeslIhU7v8E3afkJ3mBuUCOA
 l+XOUUXH52ykWe/yCcX5fZ4416CVYCZ9RQU7s7jmLJCY29UIRIxldGB/8uJGMeFLc7W1N
 MMXwJR4WTamWesUOmc4LOEcOcch9p9d1YhdV6P8KtTpA1GK9fqx3dxmoGgmlSh2vdWQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791012048;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=szX11kA4TQW91eqtCQjKnGr9INm4MCw7lHU3sjMurxA=;
 b=EsVD3HgI93GfCEbgEv+1+g6ifBKiXHdD+9pIeI/r7NdGQ10hgRGYjyONWhK1SrgdC8c8
 KOSA3FQceB0HJRtvXycXY02G3bImgu+2YefvNETpkKK189LDTUthXJdUWt3eDcqZSxJrR
 jCJzqugU17kn7LgRwi7UNzbv8O5wOm3AS8IbO/byKo34gBzmwnnpOB1QcQdGglcq0hDfa
 mWV6n1mTk5Hz6+zIEY2W+6ZiBbiUayuWQoHD69trhjKjlt+nlWVzEVpQ0oqZ+V4jQeTYO
 T+9XIm6hNvVlVrihaHRIDWX3jCIw0ktCEZRwglMm5OV2fChhRJ+k1CUb4WkEP4JSabQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=aeaQRoEy; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=aeaQRoEy
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DE590410EB
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010939;
 bh=szX11kA4TQW91eqtCQjKnGr9INm4MCw7lHU3sjMurxA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=aeaQRoEyAdEwOVhJTR76QdgAzs9a1upsoU2hFEWN3nv5BLC55a2KCRsD80fyjkF0o
 iwZmvD5JjFsg/3gWDavpVhzF83ckybva2QODdi377Huouc8ZL7PkiL+plj/V/LY1A2
 +XGPL2VMYYmFHQQFLsbYMgKvl21Fg5dvnIvVXtY/jcNHYQKDPUAEKSQJzwNbmJFDms
 nyygKXb726GoBitYROtTrUuKR1riB7ZgLvqpx5mwBnJzVwxh5vtHJt+MYKLa160qSd
 u6MgeDww/3Bcuo8KmnHy+ZJw164bjg/koQ6gEfs6NLW8yFg7olxfqdpGvCm0Rq56V1
 0gAxGMM8SOc7Q==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 OKRugRJ5czc4l3NAwMS5ewmJO4qtpw+ncQwZkjHHZRg6aTD5zCUv+mnOXWA1VaLy/2CMfU8mXXJ
 6nutYnnUVIRJPn/Sw8gWK5MEqNWf6HdzLpoqkyq7L9OXyimQn3qpD/Z1QnD4FshvUBaQExhbgRP
 jb3PTHLeRHREQUo6xPSsUdXMbEXmXXDJwETPIU0IYWG7w6LusAUbCLhnI9VPOsbW2vkzgCzZ/3q
 KICXEMPJZCDj6Ln+bjovRGE51Av+uMbL3LKG9jvYbsIbjxbxA4frMbxBGU52Ms6sHNVXQVfc1oS
 C1nRUzNx6FB14ZSMIkKyDdUtGtExe6d6bExqmsQb1tjkPm/q3buQzh5Yk4tlSxkGHikmXvEFTOO
 pXbVo/rULGeuXl1GjVrNxVhTKkRqIXjogi+PyO5WuO6ifeSzBs2hu6IJZ0vVOneyS3cDtc2znvy
 3nc3i/Ft8OrZny4EnYZcMPPkF7W1SugarvfWQ9Ms59jKUOekSErC2p75V0FpwnzJElJIvDi/Dvu
 qWpngvZ5TgQFkaLql5syyprJxlwx+HLYf0mRKw3AAhlRjqvIm00qCcn2oMUtrS6GC09Wjfe1qzA
 hYd33ZM/6hFGSH6mFXGe3Ljf6uU0uXJOM6Fr4TuRuSRBgRGq77T3RtaRGXIdhgHdrQI9EMR/aO3
 y98+XoFSAzSUvCZ6qT2w=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BF3D0A4C549B;
 Sat,  3 Oct 2026 09:02:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkd-000000007Zo-1pXK;
 Sat, 03 Oct 2026 07:01:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:03 +0200
Message-ID: <20261003070128.1295458-31-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 031/114] package/python-hiredis: bump version to
 3.4.2
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
 Grzegorz Blach <grzegorz@blach.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Grzegorz Blach <grzegorz@blach.pl>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-hiredis/python-hiredis.hash | 4 ++--
 package/python-hiredis/python-hiredis.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-hiredis/python-hiredis.hash b/package/python-hiredis/python-hiredis.hash
index 8804a47b8a..786c9d206a 100644
--- a/package/python-hiredis/python-hiredis.hash
+++ b/package/python-hiredis/python-hiredis.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/hiredis/json
-md5  ac8a2fa2182ff57c5fb5650d71e85b59  hiredis-3.3.1.tar.gz
-sha256  da6f0302360e99d32bc2869772692797ebadd536e1b826d0103c72ba49d38698  hiredis-3.3.1.tar.gz
+md5  af5fa7a3efd797b3cf705a347eb54a20  hiredis-3.4.2.tar.gz
+sha256  9a566dc70e9dd84be3550babc56a8e109bb65cafcac635aea027fa425196a7d7  hiredis-3.4.2.tar.gz
 # Locally computed sha256 checksums
 sha256  3256b5b77e98aa34ff31a4d2c2c10f7f177b0f3058753a6044430a168987353b  LICENSE
 sha256  dca05ce8fc87a8261783b4aed0deef8becc9350b6aa770bc714d0c1833b896eb  vendor/hiredis/COPYING
diff --git a/package/python-hiredis/python-hiredis.mk b/package/python-hiredis/python-hiredis.mk
index a722f2eab9..bf6d8edcf7 100644
--- a/package/python-hiredis/python-hiredis.mk
+++ b/package/python-hiredis/python-hiredis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HIREDIS_VERSION = 3.3.1
+PYTHON_HIREDIS_VERSION = 3.4.2
 PYTHON_HIREDIS_SOURCE = hiredis-$(PYTHON_HIREDIS_VERSION).tar.gz
-PYTHON_HIREDIS_SITE = https://files.pythonhosted.org/packages/97/d6/9bef6dc3052c168c93fbf7e6c0f2b12c45f0f741a2d30fd919096774343a
+PYTHON_HIREDIS_SITE = https://files.pythonhosted.org/packages/38/da/41b341ebed1eb6f1074112936af98bb52880724737887ae9bade9d7ce107
 PYTHON_HIREDIS_SETUP_TYPE = setuptools
 PYTHON_HIREDIS_LICENSE = MIT, BSD-3-Clause
 PYTHON_HIREDIS_LICENSE_FILES = LICENSE vendor/hiredis/COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
