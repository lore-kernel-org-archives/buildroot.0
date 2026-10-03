Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1BA7CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCDE640E4C;
	Sat,  3 Oct 2026 07:09:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HppK_JvGkTNQ; Sat,  3 Oct 2026 07:09:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E525F40E4E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011345;
	b=Zk+VtU4KKhws4JpFZavRlANL0TsHXM6FqLxPR/XE6i2Pa7J3dQWAIDoJCVNeS/Uj/dli
	 vKYmcPZyIeEX5jppT0WMwWx9GfYFr8uSE960Y7AtGJSEo6p/Sfdxx3QbCOnitmaNm2MPW
	 BWHLArCfjjVqXLpFqGRzGkn3GH5syuEZQXova+Q2l9touTY4DF7xHLQfTWXlfntp45/rd
	 vYixGi+CPMXsovxg4BM7nOYJB2R197/MAhjbFRN1nRqHKCoM0vx03jipU70v8ss8uhnnh
	 z9Vn0vgxBUwc7k4tLaPJohZRoBJuOpmrE6DyOJlkXtjOiDS6kxW3y0PdvLY/WXo5pVg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011345;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=pUejgu+nwKsuyg6dBTsIaDeVw4wKPxDq9LjhpgL27t0=;
	b=BEeCp6APvODFn+Q2+QJpR2XdLZtvLQI2PV1t8MG75Cbya7liLOx8eJcKTPl6ZarAdCU7
	 ird3NjSiIV5CRYBv9PEaxosQJULO39mmgvcOedWw8eGHLK3gwt/LjGE93g3GWTMjKSG4C
	 4P1IKO+XXFEVzHQ78q8UTL4JtZjCB0hgePf2pi+rzWGrAzQGfi65pVS4mpHy3cK1BBOAD
	 OwZDXhYVKi70sL+L8trb/VIv5IYNl4cH2EAZxEchPpNS8CNO29ZY3Icm2hYmaqOY56Qlp
	 RiqKjvJB6JbygAEAyVU6nqXDknlkqMTINWA8ZFgptEyhxxA7HFy+YpguFBkcrT76qJg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011345;
	bh=pUejgu+nwKsuyg6dBTsIaDeVw4wKPxDq9LjhpgL27t0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=lJ0Y0t4VjBz0w/01SRoxW8jwjL6/ULiFHcqUH4bVcFV2Yy9cnApCfjK+N4JFXkbIy
	 iZDzUu4WOXCol4kp6Z8ijaY4z55W3gBlRxJ+NG70YtsjgvfKoeJWfJ32nkhuA5nYd8
	 L2bavSXRfNE5/6ZjPC60D7g39K7Yp7sqfoTTpSHeyvJwrmjh8s8vF5j2ROX6JlB6wh
	 8AomZ1PdKAZc++cETpRoFySf7gYCAixZ5iVX2ytu5/OA8HBgoCbXaEtzRPdRfe+UCV
	 5pbRLQXfzLMYTKtGhfUVtSRZZSSYmFrAeaje1dqseXYkCKE+GNjBs4zTBoXDKpwBpk
	 b11JBP5M2T7Rw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E525F40E4E;
	Sat,  3 Oct 2026 07:09:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B3B99263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A53FD605F5
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:09:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qLJg83xUPvPM for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:09:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org AA116600C4
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011342;
 b=bbMiipQDC6oA+lmvvQF0XOQJN3LMqJIb/z95R28lvpfFofIGLUydH1Zj3j0V4wztbwa0
 5zY8oBkjCO4zAen2qlxNQwi7+t+BBK34iEY2cA19RdUP3niaF/fN0J/Nkr+xhga+PuRmA
 Pd6IQFiGL6+yNERlX8RsHmgJnxSblDsyTZP0KANR3J+oUdX+eYvCK7LN0gLY0GLyCE7XM
 4pgkKwWkd+sBN09gAVveZjaQJ/aprEzIj//SMQ8piW7FZaJK8ITAi29X7+0myd3hCa/PR
 YLjW8v+i/FgxPe/7BYnwZCQRauMkfTpZjQdWvmU3DWt5kisMp70mPLBIjcg0xWnAbNg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011342;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=1hYVZL1kw6KnOOq7aWpXHMlPdDVteKEQsATLLwJaOQE=;
 b=ZW+RhsX0OdkH1eTWYp1uEPDIGsj12OrGO3kFKmbtjnLlstox9Ot7NKOqx+yTE8Kh+0No
 0eder83cZJTec5+BxtnFumfp170hP0qIAjrimjUAOOxDA9xLUHXAXUSWbn6JBW7q5YA5y
 DwSgTmlePTkIEMyMvnKaV3RYJxZ7/gaugOIS1Sh/Z7eY+dPbhD//ChNn6FV6dFGpraOXk
 F6GeOf6P3A93+LUv9XvxO+h98g8PWr/BEFAWdwev85GypPGtABIHjZ7gBxbDHt+umrGsL
 6YfbF9aW/o9Bi/if8h6BeJH1Xuvz5coX72hoUNrbQ1KJlgYBzekz0xddaQt92GuuGCg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=DleJcjcG; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=DleJcjcG
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA116600C4
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010928;
 bh=1hYVZL1kw6KnOOq7aWpXHMlPdDVteKEQsATLLwJaOQE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=DleJcjcGh9mtk50Tr3YVkK7VVutqM6KxfRmJ/+chqSRgYWAQxh7rsr3pt8uIwdpL7
 u1huzl2K+hZ7wOGbwLqOexyuD+QVfEkq+zOcloLNfDwvC/7Zz/YJ3z2S7U6r4O7SxB
 LHToUD7urzXqzVpM/89Dp1RzzzFV6Apwu+bx/5ZZjtFiXfmYkkn6mwyOGWRizFZSEC
 tAZswri49x57s9b+nIP9XVGGevOEdz+emG7X7v9bt/Z6Wp6qbzSf61lLrLi5y5pOSL
 0GnuqYzHgdwpJ71qBWZvOUHr5/y5X2jQFq+3VMxaQa8SGC+uU0mBGkFgIVcOH1h0YO
 klqBQmg2MO+hQ==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 9qp9iErWaw7f+T3UZvhoOsgd2hcHnRiaHXLHinwtL1OVKX5FQoctJKsJCJRdItY7T0QLo5QYx2O
 TzariW7zNT8Hylag/d7GyDM2YDnuv0KtTljPuO13456ORaksGmpxpFhWH9arZtjkUn7amScLiLG
 EEcciV7Htj8IUAe3wD9WmWY6b1t5RWUUGVX9MZZsZjb+vL7gBVJnaUVJbGPZe03M4mQHZtN8OAW
 QEPPYlu9mbe33i4OGEGJViYQ2INCtaLHu/gavqvMfDb7ffe6t/VmKK71PvknmlILkN/qlHeobbt
 Rm15WHjdJ7LpB+yyLIOvUQFs5gh53GxK9eaukKIKvaXxlEWchmhQ6CwqZuJiXPKn1Jn4UkvZ62G
 03ukM8SCxgd7iUohate/CqmU9XuI/6i248O6R5HY6HG6OXOBmLIbZ9A2JlS96QH1dNjxaoBt5tr
 PocT/2GUVNF7aaJgiZWo4HHpMkuGuPNdfTZR3HlqyY3Ii+NhzRchQX/OVaaaIiaDlonma2Nubqt
 KoGMzX22ZVkek5n0CeuF7b31q7PxSe2gyUo+uCHpvaZXJlYzjod4Ekhg5pm1meIhvHrhgzer6n9
 qfSR6esAgkFLJ8oE9ixDxUDwD6XYwPArHgDlefVjooYqETSSnCu/EqqnDMdeqVLL
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 680E9A4C542D;
 Sat,  3 Oct 2026 09:02:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkg-000000007Zo-3b35;
 Sat, 03 Oct 2026 07:01:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:46 +0200
Message-ID: <20261003070128.1295458-74-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 074/114] package/python-pytz: bump version to
 2026.4
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
 package/python-pytz/python-pytz.hash | 4 ++--
 package/python-pytz/python-pytz.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytz/python-pytz.hash b/package/python-pytz/python-pytz.hash
index e63cf84b5b..e39ce4cdc5 100644
--- a/package/python-pytz/python-pytz.hash
+++ b/package/python-pytz/python-pytz.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytz/json
-md5  d805ceb0fe3717e324299865398d70b0  pytz-2026.1.post1.tar.gz
-sha256  3378dde6a0c3d26719182142c56e60c7f9af7e968076f31aae569d72a0358ee1  pytz-2026.1.post1.tar.gz
+md5  cdf22c8015c77214dc4bdfddff39a1b5  pytz-2026.4.tar.gz
+sha256  464303645bafafd72418898368b2429458f709cf1eb6a15372fbcc396b64da63  pytz-2026.4.tar.gz
 # Locally computed sha256 checksums
 sha256  be8b1a37ebe26c592a90f6c0eb33103a7f383ce2f4d7498c0af9a526990a07b8  LICENSE.txt
diff --git a/package/python-pytz/python-pytz.mk b/package/python-pytz/python-pytz.mk
index e095caffac..85fe1d30ec 100644
--- a/package/python-pytz/python-pytz.mk
+++ b/package/python-pytz/python-pytz.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTZ_VERSION = 2026.1.post1
+PYTHON_PYTZ_VERSION = 2026.4
 PYTHON_PYTZ_SOURCE = pytz-$(PYTHON_PYTZ_VERSION).tar.gz
-PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/56/db/b8721d71d945e6a8ac63c0fc900b2067181dbb50805958d4d4661cf7d277
+PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/b0/ed/fa23d28713004418bbf2407127f80f385bfb0bf4e677bef02c25c27b00ee
 PYTHON_PYTZ_SETUP_TYPE = setuptools
 PYTHON_PYTZ_LICENSE = MIT
 PYTHON_PYTZ_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
