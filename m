Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302B9CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2F4D41126;
	Sat,  3 Oct 2026 07:21:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HW5zrnCEG4MP; Sat,  3 Oct 2026 07:21:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0F8BA410B9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791012113;
	b=rtJUQk0YAKR7jYv+loeTeMltJABitsci5EfGin5y1QbxR9Ixl8C+XBRnBCrgSyN57Im3
	 OoTdxSDuqbTgNQu4fO9j3mU9etW5Ps8WVQHOk0f0X8k1JgrijAM45IZrVLxC0FcHLPQVu
	 irW5MKxWrXr3OrzyZof0zvuhLFtkGplQrl6VTBEKbbjcE76+fHbrwA8imk56egc2UKHy8
	 W1TyxvsUvlC2a83bOmb0Nnc6nOA8YqDtsbq5jKvFoCBCGS0Sz3SI1Lbzj8PUxWP/MkSA5
	 FU7UyPCR+E7vvRrPcn4Iq/LfBAq8MmlB7RuwcjXHoreEPQQ62NOb+kFLGJVI7RVTjRA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791012113;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=1TUAcOol07jR3JDfjIORrCPgID6wRNMpybylyWMUTxs=;
	b=iRahptuvnqfKFq01TtTDc/hC0Ah24YW45I54/fyCcJrgNAgk0KqYhhZz9jv8sM2tq6JI
	 zvg1HmWMqRC59sjIJ7t4eDxe1Ypcwud8PZzbMsluvuzWwzsY6B2w5pJNP0nSC/uW9B2hq
	 u3Dao5bvoX4bb5TUA6Chk2rbNfsVXuXr4ulbYiEwbpEu7Ynoh3NG7QBNVxQwTpT+GJ5Sy
	 I+av+SRzCRyfLkiWgioiZHW67r+KRDpAt0Pv1+92qqCQXihKaXwMqw1RDcFIhwJKgFup0
	 dcajp5RW0rwiuMHfLkKkfJRd1BKCzzLnhHFxcbJxEMmuxRTJWGfXRsV3lux2jB4+Jvg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791012113;
	bh=1TUAcOol07jR3JDfjIORrCPgID6wRNMpybylyWMUTxs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=p0k4GnkIvFyHPGGhT5JCttzd8YmX8p3UwP8agFC9koDioNQQZ2aPoW8hw9fQnjeFV
	 ZKH3nfvy4GRay68/cAF2otlnvTaKkk2xfndi0BJbd87oYAikETYRPCNj9+jORMnPC5
	 xIBogL0FbOFuiKkKzbFWWlGuVtGgeTz766ez75s7UEliVJLkzLMNH2E4Ygl3h90w24
	 h1TDH8BVadQOY4RnIlKJEJKWkste7kKGOmH0UILbI39+SU6Wkhjw3HJExBnvISOxrO
	 6Rp/y6VXlz4HqVXJH67gCtlIJdB+ANTXsaL+usjE0csCjtQNMQJC4SGa28cYOoGeqB
	 CWTWRPlDzGWSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F8BA410B9;
	Sat,  3 Oct 2026 07:21:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3787C34E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E2A340059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:21:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R2hPQo0cSDUe for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:21:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 2D29E40050
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791012111;
 b=KO/BqS0IjQfNisCjhxmRNyZapv7QJzkM0FCukc3CRE9frHIrcVdXuhWh1DXomEvxkjUj
 bk17zn4zvtmrlBr/GCPhrqzUvyKUSJoshWyU6SQbukJ1tOGuBqHKdrHyHVJqFE9svLaJl
 iabRza0yPQioc2Okz5t3Bm7KvkYBawRSznSZKPi1cf1eJMpn8v/t1El2SykGD4g5XLMDW
 XW1eAQ25TpzvcoA7pTpYVbxLeacIO7qJ4rXIM72BOwAgAH2ILnZEiEE9Tgyq89byP3xnZ
 jaYLaqodfd06OIRQFLvv7UhAtX4Q3AYw1rKLSy6egnMx/Y2aYz56arqznfKz/FvMf+A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791012111;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=zYlhdxvO4kXVFG6v1HZrzF1/8dFuKoUmSxXQxzhPWek=;
 b=au5H6MnwR4rIH+9UOId80YkrEST5nBLK3Un3zLOzjao5zewtqiPdJprVI6NBaT49kZ1/
 ei9DrGwmMudt0qPd5rqoyhPt4+ISLWbjoIFbO3p3CfwtvDATFOrnoUGaWd5JrKeGeNLvk
 C+fkIe16MNizodgM5HixuUBZjpYoJqNN3k0ZKXjr/M0CODcDJAtEGCn7QqcUeZ32/XTlG
 CfsAoXFmh8Pgme6aQw0mUDsp0ikAlOcaZfPmT2cdKBztkQIjLeLL0CfTzsS3z8CKNhIvc
 5Z2omhCwiVA4AlhNQL1Rk69AhBq/Ehh6iDVoOgXVlqPjyKA+Ck5uj1lB07KM8p2JiXw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=WpELsRbg; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=WpELsRbg
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D29E40050
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010940;
 bh=zYlhdxvO4kXVFG6v1HZrzF1/8dFuKoUmSxXQxzhPWek=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=WpELsRbgn13JNWZVVgzns8lzWPRpLgHAMVBk0VnMlI6uggkmW1z1j+jKLV1M5+i3S
 PCqhVZ3dn18tDEmNIzrDjdSDGQ8HVWhLXN4SK/jJMooJJcXigVGg46jUU6opv9TtXk
 6eTFVDAkQgejXtHGihm+7ftP9zYwTOIc+Km9qmDjzXI23tvCUtt//Z7+PxhzhZjHuH
 gqpkEyWhuFrsIpVV3VD1j3r2pRBBKhJCjO8SMTVbESDPb9WM30+04scgfUhiWuSjfS
 O88Frrg68f4fk6Qah8q8qt0XXRCLwwTqJr7D5jbwkSZCTraLk/6TF8d+kbw9IZPNmm
 n6aTuIn8mH2Ig==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 FiWIJlpVItoP7d5nEkyvnYs8NAjGp65L7NFoQtkzuB7dBWu8ddzM3id8la12hlemReTc10QtAjU
 dkXF9dX0OJ/gRTrC9WBIJCrCiKDFv9Ne/k1v5rRnDOY2t+XhGw2JPVM3jcW51wgLXTk9sjOn/13
 0dJIHAcv1jFpip51fRPAvv10L49p+lBsVZeMxKV+7jRUJewPuW4tixv6ViQ9mo2cEIxspWfDjFi
 +CLun1ssGcXJ2Bc30lM/wvIXeg4NjNuufQQEoTq6EehVQRvMm/9HDZ546krnvJAIrAasrf/UOi4
 OvL0NpnFQIm7yVz2lGyneJ10XrymmgSrBVUERMgU0c0F26TOTPqyl6vP9Nacck/JF7eI/goCKJX
 WmrNuGrrTrGUIiFWK9yymz2xLl16fo137f5J6191TGkOiEwmcVPzvneUsxDL7CW0wsLy2IQDAuS
 W5McaAoB0zHyF/4W7MXuZgWEAhc7XOkREjCC1uSMwqqsaliQP1QIVEg7ztbUIsGRsVdWCBIqQJo
 dOLqdJ6oLzb8Hi+60aws12L8y8/E5rhzuogT1KzAeFrKJyNy5uj4/il99x8aBzTpM5GemxCEumb
 6/VQL23liiTHXdNKlrlFhbRaNswtDArtOkx5y2T8kBTLB6BIw2UlzZbZCE4mfpi4RWtNk136FYw
 MGTo9ZBOVgNQDVQBBxA==
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B5277A4C5517;
 Sat,  3 Oct 2026 09:02:20 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkd-000000007Zo-3e9X;
 Sat, 03 Oct 2026 07:01:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:08 +0200
Message-ID: <20261003070128.1295458-36-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 036/114] package/python-jc: bump version to
 1.26.0
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
 Manuel Diener <manuel.diener@oss.othermo.de>, Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Manuel Diener <manuel.diener@oss.othermo.de>
Cc: Marcus Hoffmann <bubu@bubu1.eu>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-jc/python-jc.hash | 4 ++--
 package/python-jc/python-jc.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jc/python-jc.hash b/package/python-jc/python-jc.hash
index 49372996e8..9d317ae5f2 100644
--- a/package/python-jc/python-jc.hash
+++ b/package/python-jc/python-jc.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jc/json
-md5  9cf85817e3a9553b19d413f9d1ce3687  jc-1.25.7.tar.gz
-sha256  63481e34d92715781e1b094eca7d76d122a14489463d45b7f3e8180f44ea3a10  jc-1.25.7.tar.gz
+md5  7d418aa0fce75da0e5623acd5833165c  jc-1.26.0.tar.gz
+sha256  576b5615b5677c7bf4aacf97dcc6c6b4bf437bbc420c7db77b43ae1785372c9e  jc-1.26.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6493f2db400f4166ca0956cf192a41aa092bd1396ff463e7fdaf51f257c10497  LICENSE.md
diff --git a/package/python-jc/python-jc.mk b/package/python-jc/python-jc.mk
index e07fe671a2..2e82109fdc 100644
--- a/package/python-jc/python-jc.mk
+++ b/package/python-jc/python-jc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JC_VERSION = 1.25.7
+PYTHON_JC_VERSION = 1.26.0
 PYTHON_JC_SOURCE = jc-$(PYTHON_JC_VERSION).tar.gz
-PYTHON_JC_SITE = https://files.pythonhosted.org/packages/a9/da/7827d3389d87fa645556d595a2a437576de83f7a7d4a5fceda9c32208c0b
+PYTHON_JC_SITE = https://files.pythonhosted.org/packages/95/5f/9e6e8dc65cb15662fcfc090a52ed4fc4334ab7703b42107bc992777d19a1
 PYTHON_JC_SETUP_TYPE = setuptools
 PYTHON_JC_LICENSE = MIT, BSD-3-Clause (bundled pbPlist)
 PYTHON_JC_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
