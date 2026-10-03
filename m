Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D8BCA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA66241182;
	Sat,  3 Oct 2026 07:24:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ukAOR1nVgvr; Sat,  3 Oct 2026 07:24:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D8E684113A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791012260;
	b=Y+RM7AITT5vYDOxFlhUXWZ5zHPttHOPGoQH3SFqzYTBlzN/Cmp0isYbCOsdbP0yDoLGn
	 Vdc75MzWXlF4mMvOt9fM54+vcf1YqJ4rUvL8pCfHmypSTfr17OZHWk2+n0DuOpZIU8gOA
	 dnHpw76yV+KDVmSobtAKNk2hl6kxh40LkLBCQhxwMOPwy4eDKqou42hVv12lEztGj6vPb
	 1l2DOcIX2JuIGVix4SdSrOosRZLox8Yqxahn0zuRjYZnukkWXaOGKI8jNFONATYxzYaYP
	 gfT6CbT7dWimziGkj8nlkfZPo/bxhGJWOjfAxTWH/4khsTcEppiG3pF3wYzx7s09Nlg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791012260;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7xmY01CHIdRpdan1C8NntlPGtHUlZRdCbiN/Hh8lcPg=;
	b=bC5RzJJcn30o+DnuSkMJj+FoNnqfXxshUBX/pg8UKeY2vYZbn/I6M0E+OLIqTomG7bGx
	 83lBkbEwknW+iCgZUpU9ldWpiz9zmQU2qteq56TJoom88slNy2NhJBLkcG77u+qV6zZ4i
	 YXwhVYfHQau2PHZS7d/e9RccD2IisVOWpwrNX8jkIXugIC/kzQ5i2k3nGhiYAMF7OkS4e
	 /L/N37+6u0DYXcRIxtm4JPaQSOvUuZg7M9ake18p6V3RpWtQfvF8NLCyMB9bqkjgFPHqX
	 /gfxxgq7r5mU2o9LKWnxpAYs/6uYPoc2AF9+0ORi4pjhSJAnFs4dtQB0kLfxVy3KayA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791012259;
	bh=7xmY01CHIdRpdan1C8NntlPGtHUlZRdCbiN/Hh8lcPg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=iHSOgq8RBWThynpnzQJCUQtOqKJDmDIUWgq2JneD+JJPU492rcbbcIPLsHVMSw4xd
	 1ElGoHevynkG7JgGuSo5ltD1r8eCEGiat4rlZ1XhvbKv6sE6w7mRYanNnVepsewZHy
	 MSITiq15FiNCCacupxhsi66EyQ3qateWZdgvjvnANAiE2g5DtmT2Z4yW6sDcnD7zGM
	 phlgZ7xjU43cX10WyXPSVk699BN+kp1EMFSjiso/RwzpnfLXHUTq4E6F516H0a6kwX
	 +Bl1W+AgGTB3D2mSm0VQvtuyLLCWGkmHRJiY6O7OiMKk+mFMxqbAZprW7AM50pBzkS
	 RtEtBRPZ7e0hQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8E684113A;
	Sat,  3 Oct 2026 07:24:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9238D34E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7885540064
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:24:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ce8mRQO-okl9 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:24:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 8079540059
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791012257;
 b=jQZHDAlrB8kD13YrVrQIhExZn6x9qfk7UnBPGaCjOE84XeB/XAw4TQoeXhrNPsoJtKx3
 nCc00JhDCiHTUDQ6lBGtAxTxXBjv6qMdFpE2KIui8kXoQ8G4oo9X7wS/l5BlXHjY6WaKK
 Y9JVpn/t0/cbuFFNUogjJvuruiPtE8i2tOBz+7Is1M1VMgygi1IBi5b1DHHDb9K8ZQoJv
 7lsVS9z0RvFlvk+ef50v6wYmAqNwihtE3LK55kH2gdH8jQBWu8keO5iAl/w3e9YA9eb65
 GQHFfBlhE4X3Y2BausBS+g5b8B+cfwEBCpgBwUQgCvsWufaZsvViKmVjEgxrQnbPA2g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791012257;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=YfvlIGbz7NQv4GKpWZgbYWkovgA13MORRVB2rlRY/JY=;
 b=IP2HUppQ55fGfzF6fOxECxnPrbXE8iMN/Q1gicejpWX+5Yh6KI5N6lqVQ3Prz//qExRN
 sRs8WA+N+GNzhgGhmAvxiSiFCMUNHP5oyg4x6NsHFdAmUN+fd1lAAe6eSZcJkvuCIysj6
 QT4S3Tv2XqlKTl7BwdWEVhwJgvNH5LYYk2VvxokXIbyjYQRPm+eqdn4l28D4t8ovEYm9b
 KhEBhWWS989YWb1eKKMOS6t/uvkxruOFYW3U0WlNI7NA5doCQKDub0TWWesW/SxEK11yY
 spih/RPcY07IdnZnYadWlN2n4Uo2M34EsQpjZRuGCj00mTkBuMoge3MzbwuPd2bcZuw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=VBXDZBCr; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=VBXDZBCr
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8079540059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010942;
 bh=YfvlIGbz7NQv4GKpWZgbYWkovgA13MORRVB2rlRY/JY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=VBXDZBCrdfrliyB2LUoPgauwvjqsn1JeMzzkf0IvXUSCb38YYgdmtQBXpsnalJnY9
 dqnXSqm5XN5kbLcWC2gVzR72KpQ3Ye7hCve2RPK8+P1IZ0e4neVMZq6t41b2L1tkGz
 F5GYWAhXnE4SKqe2410Fcrr8grZNRY/vkwErmjwXK5+8h/kQwKGfCpKBbuo9s2B+/Z
 +H8kRLHV2Z0Uf7gKu128Br8Fr70XlO5qo5QviuJs4DnGf2+q8Q2xlIHER/75UA38qX
 CW3ymKKNJ/dmECVYEeW7wAu3clbAgIhv/GRMg4BEODMFZCorpW+CpVBomoSqr/7ljN
 GHuKXEtWYK+cQ==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 JPmj4MtCf7a2PHYnKl+zKwEOXLNAXgHfYy7HgM2ePpLwa/fKr8c00z+CuOFOhygksqdypDychF9
 2DSbCKZZAdOEB62NGNThMhGbpR5gRTh0rLKHwiC3ZCHsw7VRin6d1/Ja/QYY2/JISrzxqZ/AnYu
 FbrMGXaN2hvmSmCPh3r7MUhB6afI4k3OTjDtiD9Veo6nqtlwsbQ2z8X6WKAMESflC+vC+XuORNm
 uOBcfCHBgUFADXD2aRFxqXYLybyH1YGgjawW5lZJ2AZXhQsa1paOE7W0nZ60dXdR6rI9sGNMRDX
 W89H1S2e7r6EnVucZkryTols5mQPuY86sXUV1Q3tDOFKv5RUMj2cDlrYD5MDfvl5k1EHRGItt09
 MB/q6vdPLfCgnDIp/4VgdQGiSYHRlUjxRNZtFbi4NqnJeHFnyvLJOc3oeuFsMfMbHfUfTnZXQTt
 LgISUKUev98MrMxbK7lb/fYnGFHeJDUQ3jH1DvN/XqHO6LJlZQcLG1mB0OPN/lDxKyh11oIuLWT
 x16FRRZQRTRBkF6i/lwUtoye5kmWihQFylD8ColfGJ7AwoO2kD7bjYc3eMvWHdPf5GnYEV2InHQ
 alW92zhWdEb+Ix2rBu9KQSnSsby2yTFVPUsuMMDN69XmB5+FVsO6qY+NDaY9Bxe0
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DB8E9A4C5523;
 Sat,  3 Oct 2026 09:02:22 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtke-000000007Zo-3Uh1;
 Sat, 03 Oct 2026 07:01:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:20 +0200
Message-ID: <20261003070128.1295458-48-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 048/114] package/python-msgpack: bump version to
 1.2.2
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
Cc: "Wojciech M. Zabolotny" <wzab01@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Wojciech M. Zabolotny <wzab01@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-msgpack/python-msgpack.hash | 4 ++--
 package/python-msgpack/python-msgpack.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-msgpack/python-msgpack.hash b/package/python-msgpack/python-msgpack.hash
index d17cd026b1..2b34d6a7c4 100644
--- a/package/python-msgpack/python-msgpack.hash
+++ b/package/python-msgpack/python-msgpack.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/msgpack/json
-md5  b69973fa3325abdced4051f5ef3847d3  msgpack-1.1.2.tar.gz
-sha256  3b60763c1373dd60f398488069bcdc703cd08a711477b5d480eecc9f9626f47e  msgpack-1.1.2.tar.gz
+md5  92fa9532cda14ebc2bc41266481e905b  msgpack-1.2.2.tar.gz
+sha256  9eb0b0e602064527a045ea28c4f174ed69383587e29cebe28947e3b84106eb2a  msgpack-1.2.2.tar.gz
 # Locally computed sha256 checksums
 sha256  492dedba85da5872f78e6091bcd1fea474d660d35acb4dee964b8aab3f007427  COPYING
diff --git a/package/python-msgpack/python-msgpack.mk b/package/python-msgpack/python-msgpack.mk
index 76606268ae..231d4f564c 100644
--- a/package/python-msgpack/python-msgpack.mk
+++ b/package/python-msgpack/python-msgpack.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MSGPACK_VERSION = 1.1.2
+PYTHON_MSGPACK_VERSION = 1.2.2
 PYTHON_MSGPACK_SOURCE = msgpack-$(PYTHON_MSGPACK_VERSION).tar.gz
-PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/4d/f2/bfb55a6236ed8725a96b0aa3acbd0ec17588e6a2c3b62a93eb513ed8783f
+PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/6d/44/ea2100ec54d30c46ee9dba10a3bfb79b655e96c6df237238a3234c75869b
 PYTHON_MSGPACK_LICENSE = Apache-2.0
 PYTHON_MSGPACK_LICENSE_FILES = COPYING
 PYTHON_MSGPACK_SETUP_TYPE = setuptools
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
