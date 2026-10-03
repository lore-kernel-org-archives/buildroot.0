Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71B4CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C40A60609;
	Sat,  3 Oct 2026 07:06:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TfvCiLhYoKr0; Sat,  3 Oct 2026 07:06:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A26F960622
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011184;
	b=Vb/eIXNJ3HUF4A5QOopSdXs/CsRdllI4CIx5EA8Lt5XAhm7gd/PBdNA/KnXbqBtB/uKS
	 ioQb/TLiqOXB5WoTxGOOqP9Jukoe49tKdxbGBj3QcxHS1vI21GNruuKQu/UyO/knKFVMy
	 X0IvQ4IfyP0SdXPV7QQpl27impIgD15wQr5cmigfCKA9ARCUggwAfjE678vvgwbwW0WJy
	 DUu+AMID4GZsMg7XPgWN9cU3GcJ5rI/MDxChmWcag3Pfns0G4FEKCvc3hUzJdIA0scVKe
	 coetVeYfclkzEi8lCjLXZvcZYw/ydKsDUcb+nYdxo4g9u4vxN2/6oJEr58TAG02XosA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011184;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=mFnzMF079ZFdgCl/nAv//n5H8c3bGM5nqWVbTrkL+oM=;
	b=LozCSsanupjsvYMWjCwP1TRFs63SnV8PlUEvAeBasllDnKc7qVBlWnpL+htcoWMYjUIz
	 kn4cbj9wBzBRrWxdKgN7GFtXV1+wbW+qF2rEE00Y6OW1W4OL4fSBxKsYfkoO1ZVrNBF1p
	 R8gBC+c9L+BgrVDCZVeBKYTD0/x9ALVRo8P8zwVPfm9ZP94lJ6/kdTCEP6Tt/xkxiBDcs
	 Kw8TQtkwtwi7utPaVx1Bnz5E9bWdioHrcPwyteL7VJ8UH3JNpdlkOZQqHfa4t9YYstbdy
	 DjdxuFSyNLWFOfKCILCJ+4mJdDU72GdAddH4FC7PhKVD9BtKBmlnwP2yGGG3LMVxpxg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011184;
	bh=mFnzMF079ZFdgCl/nAv//n5H8c3bGM5nqWVbTrkL+oM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=aywgmnyafdSCQo+lmbvZKqDBYsVq0XwP0c9uPwqqS94wVindt1zTG9Gs/C+B2MrZY
	 oHZsYJQhSSW3bFsT6R7wekqNcV1bEPs8pUknM2U/NZQWZPSD/CqyJxAeH+1s/8tuBO
	 VSAPAd6Xw7HTo25bwwQAYeHiQudyMNBjuekOTQyMheYrI7XeBXoisAdwG+WCnYimlt
	 NzGLjuerXWULA6v8dBISnGa5P29MV9vjNRM+zByNA0rlyRSfYXivNU2R3eiTGlvEvH
	 g7Qa+SCoNGMXGpOEXG1xdncpkKpzZF6VhJB+2iIbPWVk6m313I3JNuxH0eiQ0hVIXl
	 T3t1oW2b7Xq/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A26F960622;
	Sat,  3 Oct 2026 07:06:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BBE9234E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1B7940E13
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:06:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZvKpsm1Tz2dn for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:06:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CC45F40E09
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011182;
 b=AweEa4cPCJtAFJI2vhUFAE22p6k3Gh8/KACi0VqigebkbV6mbbOhD7Sd92everHoAyVb
 iDmFUHR7MuSzFl1MCiHJEux/WL8boAyHcNm47WGg6kFVx/xZ1GTpRjik29gnQ0bwmjL1E
 +cevPs8CijpPqiEQDP6qpGEuXmvwwO5uXfOYFXeumYXFd6+NMdFDIHxwEy/AlEd0qPHQX
 jQ1Zib5EHB9VDSRNKCeZAKytbWMqcRXBuk2x2NpeK2Ec3TCrAh5EU0lI504Y01mJtPwM3
 jC7oVXd3hoHc71YhtZ/MO/8o3gM7CgIMbfyfVzmqjEv1Co7RDf6p9X8y4M0wk5O3zwg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011182;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=q49BbHIpJfUdrfytbthA6Ezl/wlr1qVf6hJTES7+zrw=;
 b=W0eQehmMruUs0DjJATpp+tOCZL3aHbPrfVJZV8RVGDb6/tClcG9WB1M2bAsSFsFDNsQ1
 WODyEkYQW0VZ0jvbY0bGyqjdCCYOIZQr4XJdVCdC9wsCnP/qCV5wFXsgOkTu8kU+B+gRZ
 qXpN9SdoTyV+tvNL3+OdiUgfVgjPR3CDogLoUmQrtvNRVmsw8gOBvgu/KqA4GJTvYxbR3
 KKrwaC+79tUjnmyDpBbwSl18cRjF4gobbhge6uJs46MTmhYlePRuT6ItjjpV+3HpCX0AH
 NXc0AFCqgCaVOYtzo06sAdmR+waTeWSoQZ99kYL3qJacfpb676R6gtU8JykkfZ4rdHg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=W8LeRFmQ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=W8LeRFmQ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC45F40E09
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010926;
 bh=q49BbHIpJfUdrfytbthA6Ezl/wlr1qVf6hJTES7+zrw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=W8LeRFmQNzZcasI+6SyC4x+c2xL5QlKD2XvRPG8mDwTnaiXPEup3f+1Kg0+gzRGgd
 xAz0MeMZK2r+6pILUFAXTY6UmZQv41NAcDrEgbH2e5uhvqaprp1AgT8EhZqS0m6I1W
 LqXGgH99AXE2qlBRRYvGUr1j5fBPNP8kEttsg2NERh8T07J1KKX5iZ2Jgoj360bJL6
 aa1vjKOps/C2DNT7lrTuW72PZOdtgTTPhqSAtQVW/1+SxZQ3tt++7896kMo2UtDVG6
 1tPk72M66kCREyukYkm2WGDEvMs1LumRCKjYyucRCnUi+MCdOYsgCAP39UjYTQSdU1
 X/DV5o96M2EYA==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 +OavCPy1uYvuYqMVbQslW5kGl1Nq1KC+CVyBGNRLW3OLPg1WWUYx6Z3lslqwy0NsFriQhPtZ8ef
 6uOuXlOsGBepBn/rr1XV0ZnnvXSKnPe3ii61egIiHrwmh90eE2ACuqUb1XKWVbtBdU7tzMeoq59
 90qJELJlPq/SPbn1zDc/z9GlBphqQTOwLIBa6c5GbE48ak0mV54TwgWeqIyru45+BBaN09zwS9h
 EkqQzg9traYX2RdGWkA6iBG6N7l11BYF3l2dyjY//Bk26n//PxMV0CoeG9OcFfvM1ePR2swgtgY
 F5+CxcinjdidYM6wW0RGc55uBYVi6zQTgS7VtcWS6wnpXUASI/zB55Ln7WX6u5YQ7yjjtpB2saP
 IUTzye4cU4i1wuqLvhwvE7oH22C1e3lmt/l8FckSWoneVUkRZCB+Z1lOxUfC3QVU5zoA4E01xfw
 L4uXZJmkBV/bJq1mxm73fVO51YujBGR8IvK9bwNyF+lC9KHr/L1Djjzowp2FxodRKzOSjOSfxDC
 YH2FtlF0eMTHEHiRKDJ4igQEtm0fiX0QAWrz4HDcrt2fz5wUgQAXxfMJiF6hKOtcfQdnXhAm8K7
 zMYgqXn4cTvrmyoSpWYlTJMmd5AB8osYADRQxJAfdmAj/G8Q8P4ADkyEOFoCJTaI
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1DE59A4C5420;
 Sat,  3 Oct 2026 09:02:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkf-000000007Zo-3bAE;
 Sat, 03 Oct 2026 07:01:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:33 +0200
Message-ID: <20261003070128.1295458-61-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 061/114] package/python-pygments: bump version
 to 2.21.0
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-pygments/python-pygments.hash | 4 ++--
 package/python-pygments/python-pygments.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pygments/python-pygments.hash b/package/python-pygments/python-pygments.hash
index 703e0f05d7..ce10f737ab 100644
--- a/package/python-pygments/python-pygments.hash
+++ b/package/python-pygments/python-pygments.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pygments/json
-md5  358297d0a1db8e4beff8eebc0620960e  pygments-2.20.0.tar.gz
-sha256  6757cd03768053ff99f3039c1a36d6c0aa0b263438fcab17520b30a303a82b5f  pygments-2.20.0.tar.gz
+md5  4d661a27d62d2924d4c7b4ab53aa6dcf  pygments-2.21.0.tar.gz
+sha256  610ca751c9bc2492b38eb9a38a7fbc93edbbb2d7182edaf34e66ae493dee5c8c  pygments-2.21.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a9d66f1d526df02e29dce73436d34e56e8632f46c275bbdffc70569e882f9f17  LICENSE
diff --git a/package/python-pygments/python-pygments.mk b/package/python-pygments/python-pygments.mk
index 1daf0db176..1b14b56d8c 100644
--- a/package/python-pygments/python-pygments.mk
+++ b/package/python-pygments/python-pygments.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYGMENTS_VERSION = 2.20.0
+PYTHON_PYGMENTS_VERSION = 2.21.0
 PYTHON_PYGMENTS_SOURCE = pygments-$(PYTHON_PYGMENTS_VERSION).tar.gz
-PYTHON_PYGMENTS_SITE = https://files.pythonhosted.org/packages/c3/b2/bc9c9196916376152d655522fdcebac55e66de6603a76a02bca1b6414f6c
+PYTHON_PYGMENTS_SITE = https://files.pythonhosted.org/packages/49/2e/ced460408999b33da6b31b0021b0f37d329e202d4169aeb164493778f25b
 PYTHON_PYGMENTS_LICENSE = BSD-2-Clause
 PYTHON_PYGMENTS_LICENSE_FILES = LICENSE
 PYTHON_PYGMENTS_CPE_ID_VENDOR = pygments
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
