Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00E3CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 692626065A;
	Sat,  3 Oct 2026 07:16:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DtQCCJB6fZc3; Sat,  3 Oct 2026 07:16:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 81EFA60643
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011788;
	b=lTzBzW6bvhjpRTvPIHb9JaZIr2rLCArv+eL9GMVDJHEH17zvza4Wdx0eE/HdDhTbtOAR
	 NQnfNWkD3xPALxk86dMUF4yJA3TEiDL/at9/EhGmowMVsIKgwc3lQRVJMiPGegrdBPgj4
	 RK49OLQx9nI4czdYAtCDRLp9HlwIWXKrVGJx5fPHVS54coabBBkmSOtwTYbV1CkoiU/QH
	 W3mas/Ew/psoZ4WOZL22/6jEX5quA30NIWoW2C6LG1DXgQ7giu0/HYT6eZcwsHKJ2E9yt
	 MX+bTkVGKiOK8zBKDg7tTSwC4qFNnuJ4OCvvj6sNSJYo2GlqzdSfaIs0+AJSoyEUJvA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011788;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=8wV4mBP1KEHK2/QQUQjtHv/4yd8CBenXcjTtzMCzesA=;
	b=CL1tol6DpzzvFCdwYivQPic/0Xhe8RM718F89v2H4hevvLiCkTkfP1W3Q4hBxn9Oq9oK
	 rcwRHSVnYug1FTspFmISqg/OYnyMwLRDjzTJ+gE//5gimpRrUMWBE85LMp4VQeSrpCqto
	 JLlX3E3kAsGzG6fnitCSrJ3semOhlXmGT3t7EamGV24iebg2f89cFTssuNYazPfWc75jX
	 v2XHtOHOvyD/Fab68caejbsZVQfTzoZJkpy/iKsfJNBez0IWv4M5TdT8T6Y2x8idLU/9e
	 P65Xt+KjbuYwlUubE/If1nV9UerwoKABNAhjekqklv6UPKxFuwYdTrlZRlzFdXuoYTg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011788;
	bh=8wV4mBP1KEHK2/QQUQjtHv/4yd8CBenXcjTtzMCzesA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=i4QZ+9nA0PH1C9SATi0zY2BSVGUzGR57b9IfKcKszRwHAD15apYqXAYZPtnDV8HYm
	 Gd0Gj4GeaFjRSa4+zSfK4JjiHEA+s9sxC6TPdqJhDFwB+uCRoogTD63EkKaFl53AJI
	 i7VZLX1jMF1/YXM0N4n8EXPlQh/6+TsbKG8eWsIyeMaim3Q588O0Td19c0UHRn2bhw
	 haRaBD4BsHWLOGQGQOLLYbHtd0YdhTv30HvMel+4qFpCFEo7MGCs6PnDgOxV6NWrcc
	 GAEH8rx/Rtu04PJI1aPWnYmZrZc3zGx+TBP6+e/6U6reVQL7eAHe3vhy86qDBw3AKb
	 7s3rbSzvGm3qA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81EFA60643;
	Sat,  3 Oct 2026 07:16:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5560234E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A86881178
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:16:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ESoiKPLHjskp for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:16:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 519C581096
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011786;
 b=I4Tk21+FK6JqodEZFQQl49+twNE02jOLZRMqU0XNRKGtFTSz9uG78DyH+mssIrNDulR1
 zAYA7xphceKSlfYQIGFZohzmSBgmTs3lPfDoiDvg2z6xPHBVo0UPealx6FJowzRSjK7v5
 OWhycZH84jRKtdfLUgQ6uOQkEFWziELIr91XeVgLcpTFWeTeSoYO6q+/E9oCK+1lW3oyl
 cxClkywwNYjlNLJ8zx40imU4VBndhREG+U7doOweNmmt7p/+70hyPN3XrXetPtxYwU/Dj
 0DWClJNByT44IaXJEEYOSHTVrxuh2nB3xi/viZ2tci7f8A1kt3C5bDU1KSZXKsnxnGg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011786;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=W2M54mwnIqeuoCjx97yeuOvxULofnIezs9jfwXlmWFY=;
 b=EA+GpTIsAO+CaMbdvAURFRGYdl8cpdrTJmoMuK7gXiZMxopQMN5l5D8A6fyy3zhEWCER
 7WhpZSxv0pl9pt78u4tqbmrv+s82zPUgyKFHBjBpNj0xo4b8sctB8hhop6hh41asqE3d1
 NFuK+whrQ4lHOQV6iA/uIcdIlQ3PP/8COgTPAeNK1OFCprdudi5Ohgmk9oZxTCrfVGzQN
 fimzMScjQHgBsdPlGI4vYzcXFc42QRExXice415nwCRXF08ewCwuYDaTT/8d4lP0Df/DM
 MFOLSQJdGvORQq9yL2RrTR1hET+eUMK4HQXJvyKlQ03HM7/kdndPc/ZJio1xQTforMQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=QTe4H3Qz; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=QTe4H3Qz
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 519C581096
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010935;
 bh=W2M54mwnIqeuoCjx97yeuOvxULofnIezs9jfwXlmWFY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=QTe4H3QzAXw/9n1mYZzIgwe3U8nYL3YnplV4UIOZcBjmujVBzl6hkc78Y/fsOY7mg
 y+oDCrNi+ctRComszB4Ychp0qPRp2NPXNEYajxSTPHSs3OWY7o4mimUlMP0c8mMJXd
 mxlDgi0icP5an8cnk+EsyPA93gXRIIphlF41rDESyHP0lVNsbOWP2J6Hk2drYs2NuU
 5zhr/Efr1IugwKBqC58QEAv7xcYSF8a+GXKYgnUg+QOVU2myQTY70jiM9KvrhlOdAL
 FVlpwGfoT+TrYXW2Ssc8klUs6wVsM9VItWMA4Xldym4wkx3aGk7k/gds53/PnQyCM7
 71IXYuYIL2ihg==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 H+KELYjbG9QXF9V37viw2qA9ThtX/xBvBJ5RRmy7JwpKfAde4MSw5kHixQ4fPlizKOXwAJv56rp
 El0WVbTUcdXkKTCF+ERdqU3qcgo0kyubO1O1CO4G3iOWZv/sY87qAQjy3uPvetnR3tA1oWNXM5/
 XhMXV3XwO4XzS1TSh4W4Vk0BELQ6KWRuux4gysgIt9snbbJ/yAwN0AT/mH05JRZrKBVjYWJieKu
 IK94IbC6UCG3yRZ/c1VmRiitsZeNLlqhukvAod7K7iXYpJDFWzh8LkLHlrb9Xd0GU5OBa8txRnu
 1cRE/jMuWqDNYDJceGlIFJ4xIye4CMYAs8+ccnG8mKPO8pdrmJxhLSVCQxZ72WnptZ0+Y85A1PN
 00zwTgU+CefH7FrziyfZ9ddsTjuGBgfOLaCs9jDuMy+ZHRGtvrk/vT2Tu8++x2ceOPJXUVCEC5P
 uZgTJ67oNFmjF+k9zeaQFAj8Qk+VcfMM0ttWqcUg/+w4m7n73EWPNOxrIjthvz1UwsbP6N9WVkj
 BTOTn7TB6B3a2lVfv/98erPQAmVsvdqyI9z4bz7pfzWa6Vjsc4xoXovZBUmWJbtWOcsl4DAbvRe
 2XlHbr3sPEOipMREv6Cg0HLbA2BRlceBA32eJldFZO21t/xTrS+5kCOTDWoJUfiOQBXHPcd2obO
 sNBChKth32csOgej+3AM=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5A793A4C5450;
 Sat,  3 Oct 2026 09:02:15 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkc-000000007Zo-0BCd;
 Sat, 03 Oct 2026 07:01:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 08:59:45 +0200
Message-ID: <20261003070128.1295458-13-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 013/114] package/python-crc: bump version to
 8.0.0
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
 Manuel Diener <manuel.diener@oss.othermo.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/Nicoretti/crc/releases/tag/8.0.0

Upstream switched from poetry to hatch:
https://github.com/Nicoretti/crc/commit/4be738e67b9842591a0d4ae46c10dd6344f7bf49

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Manuel Diener <manuel.diener@oss.othermo.de>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-crc/python-crc.hash | 4 ++--
 package/python-crc/python-crc.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-crc/python-crc.hash b/package/python-crc/python-crc.hash
index f54044af5b..d459305540 100644
--- a/package/python-crc/python-crc.hash
+++ b/package/python-crc/python-crc.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/crc/json
-md5  cca626fb7bc30b4c468216ca67ee21c2  crc-7.1.0.tar.gz
-sha256  99dd540909a37ae4f62c65441df8ecb4e7f9af014fecaf4f331052a41d66c07d  crc-7.1.0.tar.gz
+md5  fc406fc84867b2f2549eb6dc45be8a2b  crc-8.0.0.tar.gz
+sha256  e1ef893b042c26c9f47fd32f3c17507b7d1bd81169acebaef908774856fdaa3e  crc-8.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  803152006c87fdfd8b30b087734fd590e7a8d871df1a6de40a8fbdd27673907f  LICENSE.txt
diff --git a/package/python-crc/python-crc.mk b/package/python-crc/python-crc.mk
index afee463092..dcce1c58f6 100644
--- a/package/python-crc/python-crc.mk
+++ b/package/python-crc/python-crc.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_CRC_VERSION = 7.1.0
+PYTHON_CRC_VERSION = 8.0.0
 PYTHON_CRC_SOURCE = crc-$(PYTHON_CRC_VERSION).tar.gz
-PYTHON_CRC_SITE = https://files.pythonhosted.org/packages/7e/e6/c3488c35ecae290751466252e5ea01ef50fc67bfc1a9aba43983329b7025
-PYTHON_CRC_SETUP_TYPE = poetry
+PYTHON_CRC_SITE = https://files.pythonhosted.org/packages/48/b8/79b2c41836b5f8503342956ef31218059159a3f556c31e76ef5c14233d4b
+PYTHON_CRC_SETUP_TYPE = hatch
 PYTHON_CRC_LICENSE = BSD-2-Clause
 PYTHON_CRC_LICENSE_FILES = LICENSE.txt
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
