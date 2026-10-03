Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E649ECA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4B5D4117B;
	Sat,  3 Oct 2026 07:23:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V8qBhE8G33Wh; Sat,  3 Oct 2026 07:23:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D2A8D41166
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791012224;
	b=JDWZysr73CrlFAN5yTPcYaFlqQTq6WJSALkf7rmAwZ1kADUObgYTmaIZ63cnyVv/6YY+
	 XHvB5S8UbyU5VtYTfCc1TkLM3Ly/e2r/Qk4CzVxetr/YTDAoJsI1Bf9USHH9NLKSDOLT0
	 xARVpXo6SQVwl8dU9+A3hqMlWwm43eXjuiY6jsxkg0B3I6K19Hia834a7iB68EONktbhN
	 3NuyB4Sm15NA1Glh+IOWKUODUgqpXxWHkWFDsAjVIAvGw42Aa6DdsvjJyo2expk+Iputu
	 x6t2BLX7r8R60qESUGW3WDmwORNYgvj3AJtFdY4u4Cyohn3T1qUh1M88pj0NGFb50KA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791012224;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=97bTpvkZANjOEQNmW68oN0r7VM4dNlrfzUGfaUsULOc=;
	b=rf4AbmcNGxRuCfUSIHfuJsopgn+xx9hqhYEnMNHNj9cBrSOZnFu8+HaP/HBkHfCOT3MK
	 6NntNPzM8VEA/bTybbhVHsmtWk+2FSz9OdLHOFCucPBcmW1YQhqrKDW0lE2BNr4Piyv2T
	 4nc3ANNOU8AlYaUgAGvbGqticxy94FuzdyengcJkJKrO5j4p5/RvJiH1Lb05m27NGNiCT
	 r0esvoIrcQeXX0UzL5+5RsSJcexmldr6t4aZ4EafaBQ80WFHwxnzmRqTx+WxhWgmj9tUH
	 seOF2ZgeanTk3svkJvpNlPSAT1aXruLIWkAuRbaZqUn5mAHrNWO2mQo9Cd8MCZQmJtQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791012223;
	bh=97bTpvkZANjOEQNmW68oN0r7VM4dNlrfzUGfaUsULOc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Q1oWB0CLke0YoEqoCwriDZwt/ffGqYMYPa3T5EUKbsjHKdcRTE0DVulJtx5Oe3Czh
	 MfG0MLIv7br9Ssb/IJNbJ88H23jmhElXKNJ+gozIRCQuF1epNNeEIYVs3BsWC5+GmY
	 dvG0eEMIeiPyuZuEQbcIawFWodG/4nlm++wDTNjTzRo3obQwa6HVH1C/otn6eg9kG0
	 dn5tW19BKqJfAfzGZB3zcf0MbnM4DwIyK5LKQ8NLudeI2GXJBfg9hURqOpZ8EneL1B
	 LetodU+Dqi/hIKrVn2t5jBmtc+pO1TZ7jbuW/RqBQpufcIsHRs3SlXDrCQWlwM5e3I
	 WSeKL5j1a1eQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2A8D41166;
	Sat,  3 Oct 2026 07:23:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 173F934E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0960F40064
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:23:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Lhk-Z8DhjDX for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:23:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 0E62040059
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791012221;
 b=k+Ap0O+uZA+nh9Af7ZnvSdB/u68zT5LK+0Ou0sRmhf6ThpvntwFitA4sMyQYzZsXuYXh
 ZrvjmPpgine6fRZNtq3kQlNf4xsBt+HGM+pID6fe4EUPmUHmoxJqBj+0Jm+7QK8J6RmfU
 JKtcJnswdkOruzre5OYS5LCDseTjNpTcTvC7W4CWCbmERY8FmSsQVXaBXsW3fjSLmp8ah
 f47njpOYkkBaSrYkVQEWvSqToek818+O2FdkUte2lRTQTtGl4i5I+tPv1YsZIkOMs2+BT
 hJaQSUc0IclK2GeDSlYtgyRaqIodLItxsaTpcpgc38A+0s/GygHULeKaR526gVj4fgw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791012221;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=j4adhOYSC7wT9U0q6RZkHFbK6P8fuv/qEUHps+kciag=;
 b=ReBdrRldFMS2ow1WbZSe0vLm4tifkRiSvpPyeuiqdLOhmmfzbYwPoBByWI/zeMNr6/8J
 34ArjeinN7k9BRnAIighDkrBSC+mC2ZDBdi1S+IoXXOXpHStOrJqDRdM/8KxGfM/om66P
 QSdNWljQXX/6PItVPlggsBDImUZc9EqoW1OgMAKg4hZGV8y+K4Bovs0QdYMJ64x9mtcne
 5Lx3zPAYYe4UxB3/gcoSjBqyjWoQ1/qAiwGO5HJ+jx1JmL969dE31+Qy0jK4lEBBzHzxA
 Zy+usNtC3xUp01vpU2Rx0ia4esW9Sdw8nphnG/78lwzziZYdhFr7eV4q5FL25lGRtSw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=j8NWLhi7; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=j8NWLhi7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E62040059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010942;
 bh=j4adhOYSC7wT9U0q6RZkHFbK6P8fuv/qEUHps+kciag=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=j8NWLhi7lUgClPv85Ts8I5dvVjAcsWzs68dYjNl9YwVNjTveCOMXxr1194FF7rnxJ
 3m3Ol8R0JaBQN73P21Yyb+NRd8X0XJ9NV4VhPribsKRF8oWacq1NByc489qexFV5ol
 NSfkp22XVNyoXSYRlncXlTpgxAKKKFLtADZ4/4/ck1tMY0rphmsIOnQ+5kzVcgujx4
 nfDX+CLoYnwpBievkDdktHlKqXgVTWC5uDVEZduXnaSR82Q9Xhpfld6NJgBu2nXaP9
 ir1t1r2OOZgkf2lLPAjpnx2kDW3RnNcgyKOP/d07H53/pykCsdroHJ2Hr7W+zd9XND
 gbUrB/P7j6pbA==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 nmb5uoik8Lsdo5yr/8+SRX2Ipwbaitgxe59PObbRnFpc1VcnC/eZ+WjqEf6xHQGEZ/fBr3LyOK6
 HTcyhiJsB6vszTxouQiL395gsjjeHd0Rtz61j2DSv52gSnj5k0dEj58hnqU82FdwX/l/7KOP+Q3
 1MJ1aIVPek6JqJphXd2bB/QBrGPWyH+eY50NbkE7QyNeHoY+FEQKdqFl2LCaJ6UVgI/VGopPoIn
 TVnv8Dd5hwq6+r9D2eDWXL8xdy7rSzXeyHib1DExNEpbl9adcL8K1fPu7CWJUdL82uj0hR/6/jg
 XwuN1Skg7VOrDsqo2IZoPpzgcSelMY6MFviywq6r18V5uVPiRvDGvR4CdgVs/IhGoQQsWT1HfJx
 AodsP3G8J49zj+59PWwEG5g+DndXYS4NfRRheM3LR918Qcu7RPA4ojC4Iagzx+a/EeB71ak2D9n
 fkp2btRLQBmZFctHHkZ4vcMzbbhovR7+1GKazbQ/0kGSiM42OXWo3qNCvBCPJsmXSkRXb7EfLDt
 zynhSJEjtJ0RIRYgTNKPFL+Dk5GdMy0jXSu+BL6jBsl9TvV70FAN5VcrmtVvnHdhuSsccGWwA6i
 zFyv+OVRsaSnS5fbt21J21MwgO8CP4Q538eJtkAb31cd/dvMTuWD5/eQOWfEFkRl
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 58CA2A4C5520;
 Sat,  3 Oct 2026 09:02:22 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtke-000000007Zo-2V5j;
 Sat, 03 Oct 2026 07:01:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:17 +0200
Message-ID: <20261003070128.1295458-45-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 045/114] package/python-meson-python: bump
 version to 0.22.0
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
 package/python-meson-python/python-meson-python.hash | 4 ++--
 package/python-meson-python/python-meson-python.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-meson-python/python-meson-python.hash b/package/python-meson-python/python-meson-python.hash
index 1bab8285eb..2f84b61808 100644
--- a/package/python-meson-python/python-meson-python.hash
+++ b/package/python-meson-python/python-meson-python.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/meson-python/json
-md5  36c0a47464398008ea3939bbef334f31  meson_python-0.19.0.tar.gz
-sha256  9959d198aa69b57fcfd354a34518c6f795b781a73ed0656f4d01660160cc2553  meson_python-0.19.0.tar.gz
+md5  eb572c5384b20e0c3bfad88fb66ae0b3  meson_python-0.22.0.tar.gz
+sha256  9c819d0d4efa746edadfaae4663c0e9c75659186ef7e5bab12330bfe22964dfc  meson_python-0.22.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8f82ea9ef9a55b47f4170536d02e48b5bc33fc5135e5b4a1b5f8d6404833ec9b  LICENSE
diff --git a/package/python-meson-python/python-meson-python.mk b/package/python-meson-python/python-meson-python.mk
index af8f26f9a8..be9b1fefb0 100644
--- a/package/python-meson-python/python-meson-python.mk
+++ b/package/python-meson-python/python-meson-python.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MESON_PYTHON_VERSION = 0.19.0
+PYTHON_MESON_PYTHON_VERSION = 0.22.0
 PYTHON_MESON_PYTHON_SOURCE = meson_python-$(PYTHON_MESON_PYTHON_VERSION).tar.gz
-PYTHON_MESON_PYTHON_SITE = https://files.pythonhosted.org/packages/32/98/7fe5d1bf741c03c6eea04b6245737dbd79657d4f9200e82fcbb4cc12637b
+PYTHON_MESON_PYTHON_SITE = https://files.pythonhosted.org/packages/82/14/1bafca9db7691ff05767570686cd775bddec57c7358e78504cbfd35ec996
 PYTHON_MESON_PYTHON_SETUP_TYPE = pep517
 PYTHON_MESON_PYTHON_LICENSE = MIT
 PYTHON_MESON_PYTHON_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
