Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8EE8CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2E3E6065A;
	Sat,  3 Oct 2026 07:19:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wo9Ezjf6Qawg; Sat,  3 Oct 2026 07:19:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org AE6B360DB7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011998;
	b=HNW/tR1tLnGv/eFomJQ56T0lXwDVDPKR78F86ZEc4DCQrT6E2Ee6HrMU47G5UCUb0yfj
	 PhjMgeeO8GFKDKSigan4lEfgh2ZY0pWUOfLyHjuF8KPL5vH5o4TT62NVzbosAjDptWWYu
	 VSJVBDlHkWgAwGPZsiehZbcvzrYV6hZz/HirZKjRXQI5VC4BFSJbA9haBo5YpzEuP2VAT
	 tHvYgCsFb5eOcB3+MrJ7eNo6la3/hhuiXxjBWFgDg+SQBnV6jfTqH1r9R22g36OeZDxEh
	 y7MYD3JdGka1K//fsYMrN058nfNo48thPFsmsfDLmXUFpEBDskCYSGIklJs+dL+NqjA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011998;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9q/LWad2X07BTvnFL66AhwlLROr8+AWSftY6yej9f+Q=;
	b=Y5O0QWTNaEv54+AKxMWRZTnXj3ixFFFyUWOu+LSA4Ufus3y4YIuC4UU2BDbOaQc337ZS
	 oJhFj1ngXz0kY+phiXcwQtXO/Gp8GQOWHwnQEPl9T6AQshPyD6bgW2nGMtJ6ii1Tqc+FS
	 f+m/uo7XPO7Qed5+fAdbKz3KyhdCn0fs3zRP2jcCkIZLMdvbOgX8HzD3Mxr+WjCPPEfKD
	 i0LHe6WPmYRfcGwYkYNsrQPmRd5clLFLcPMTCtopaVxj6SWKeI6TfhVtwNNrxbKvnaPGK
	 C3Q0XHrgsi453t0qGZuK6mu024dezYaewJB015yHjKrGdFY5txwTnEcc6nSrYt1ZFqA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011998;
	bh=9q/LWad2X07BTvnFL66AhwlLROr8+AWSftY6yej9f+Q=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=eHWQEFZd6eNZFStvHVXN2Eji2HjUU2zmbDcIyOcUx7XecmwRoGFeWGSQ/kd+R1u4v
	 i11Up3KsqWOHUmKWiLs2PxH9YirfjLHcXiR/sUDrDpY5AeAL87J06v+271/9LQhSkR
	 3dER7QyEpAnM28qOEIgU2RXAskhYf57kwTI8pl+W68LDpgyPlI1aESksOuesB1aDWT
	 9Q2ZkEuDnaoIqPnBBmPbfyBL1q/uVfJkMBWUsVA0j5a283jkY/hwQXwQNlrACRTSm6
	 Vl1FKmEVrRDRiOprpOaAnySIcs1Ui5ZTZ6tIxCMzXXwB9JN++YCmwtz1xy3KAIOxxZ
	 4eJDxaSWuKOhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE6B360DB7;
	Sat,  3 Oct 2026 07:19:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AD73D179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9422240059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:19:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vA6OTbEVfged for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:19:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org B87FE40050
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011997;
 b=dOeBqiZjtlUclDuJj/qLBA9DVPsJTBTNKc6swkubKxgwSeZdhL73rfjXxExi+r6MAcQw
 M0oL1BwbUNzpKzqENHaIrs2qXJc0ggE700tFeQZZG5iWdsrN5wMZ0ryBuaiUTyg3F9K/K
 Its+M2VEVpBWwoOg2lJ5SYamW3Tt/MjQWb9Fi0bK3vYVvHHLyRC5FO+1OBOPl0EP+3ivH
 UR7sWKTEfWqhfJBrU5e6TllYBC3+wQy1KvTRXBp72ahq9kx3FzCQhgyUElFdS1n34ctoX
 xS9jM6+6jMKzlurMnp3EAsZ+bgWXbTbvBK7rWncUpRE8OjIfKHxHldzLfhcbHg4utig==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011997;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=AIk/an824yHmPViXiPudqYdpPXY1nwIA9wKYughOhTw=;
 b=QyaT+yeK0ci7do2oyBOnPGgyF2p4DgLxn7W5XLsJBuEh0lALRau8oDqOczUfR+6X+T0Y
 0hzYEFJvxF4QTyIxlOeffVHq8ckegnmx0DEfGlcW/ag2IC2HwY0491gbjtdEFTm/PrcAC
 tEZq894SsYk4i5PpmL0werAJjVrXqXGQlj/cw6tBY+E/tEmKyL/5vfXmm6Rr1MrMjTHM0
 3VOoigqFEUn8I6/iY4/bd0ptOuBcFnu60ywHkG3tYD2u6X1t9B0Chn2c3uVZtDS/UIhWI
 lkmgOgR5yRT7JjnC1RKRyOB5nrnZ/u3m8If5srseNZTDFWqHr+5sQCeCyKgBbi1xEXg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=g5g16+zZ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=g5g16+zZ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B87FE40050
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010938;
 bh=AIk/an824yHmPViXiPudqYdpPXY1nwIA9wKYughOhTw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=g5g16+zZ5E9QFx7Oidd9Lk1nzm0uOLGG7cNvDbHhb0Gu9UItQsColum4nAWbDUHpI
 I8oCgVsxU1Nb50/Ymn/ND8PGNaOq+457XGHfZB1J9PJ9KCcGNPp/2QYW8dipRuNQa5
 ARmcqqWCF892+o/q5ImlvgJ4Y7Dq8cmXTNQu0KFQ+DyZl4XeEaTwhwCiuWqDoH4Y0s
 K9kKA0UQS/TC1n5PvAxLiVZ/9S0zzesMRBMk72D3nmIzDEbcjB5nm75UpWbo/6wRDa
 QwqreIlR6m+kBtjU4ZWnahiyox37CzIlcXbyY4QyTSBZ9EJRZjI+XgxUf+18AWsamp
 iZ0Pb5+4fiQQw==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 A3KWijNjqYKu/EA2C9e+u2hSKD2M86p8QVvUVJ1CamaPp2qRDwBJ5+fvGcsZfCfZhAG5LlBRozg
 wNJrf5XXm3IhWyenE+3+H894cbBuzbCLNyVR5tC2dvohIfz6VXCol0EwaHEZfxAt0Aal9kb7XBd
 8Vnu7Ukpk4bw1IsXrsbXOmwGhTGCzZWNbb3PyJVW1PcKPa4sxHo4OCw8odVEfbt6kHjJRBHD3/+
 Ct59Nca6VFsvQskdWioOIeUuBmD96LvIFoStnqHi0MfOtKEJwdYGg4ivrEHtV5LkT31Tcidu60t
 xVL2etUUE9CX2QmLPD+ryNcIVH/S6fzkKw50mfGfWEX2UInfS9EnK2GWkrFW0OyBBPBvAwkDcOV
 DHPH7Su/EfkYVsuYYNFnYnIUfQwM/kCSdneYGn9/D9k1C8uVyazsPNXrAWYPXr9czmyVDT+WV20
 uMF2j93Fz36iPLbK/tuhOINMPKdd2edsP9h3N/7p4BBH+OmJcxR524LUZ6yVNkaC2nstdYvOyNi
 2rjw016jKrXAumySRgE4K0h0UE8o8zTHexF5JKmlWxAmRsw2L7RzVhWx/9tIvdf/4iwBs2WheF8
 zesrPOMd17ksRJspx23LDYzNymxxLy5cVMXmb3BDfEeX6EDhy6D7RxAsNs2CtP3q
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CFDA3A4C548A;
 Sat,  3 Oct 2026 09:02:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkd-000000007Zo-0Rzn;
 Sat, 03 Oct 2026 07:01:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 08:59:59 +0200
Message-ID: <20261003070128.1295458-27-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 027/114] package/python-google-api-core: bump
 version to 2.39.0
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
 package/python-google-api-core/python-google-api-core.hash | 4 ++--
 package/python-google-api-core/python-google-api-core.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-google-api-core/python-google-api-core.hash b/package/python-google-api-core/python-google-api-core.hash
index 5e4050fef8..c080165c33 100644
--- a/package/python-google-api-core/python-google-api-core.hash
+++ b/package/python-google-api-core/python-google-api-core.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-api-core/json
-md5  e76b31eab2af8b172449ce786f37333d  google_api_core-2.30.3.tar.gz
-sha256  e601a37f148585319b26db36e219df68c5d07b6382cff2d580e83404e44d641b  google_api_core-2.30.3.tar.gz
+md5  0b8a8deefc55775475642b4a6799e912  google_api_core-2.39.0.tar.gz
+sha256  824ee414a10adefefae33fc5e2ba28dc6f0f7089d011c9cc98ea9178e61299e9  google_api_core-2.39.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-google-api-core/python-google-api-core.mk b/package/python-google-api-core/python-google-api-core.mk
index f77548efd4..3aed7f06b6 100644
--- a/package/python-google-api-core/python-google-api-core.mk
+++ b/package/python-google-api-core/python-google-api-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_API_CORE_VERSION = 2.30.3
+PYTHON_GOOGLE_API_CORE_VERSION = 2.39.0
 PYTHON_GOOGLE_API_CORE_SOURCE = google_api_core-$(PYTHON_GOOGLE_API_CORE_VERSION).tar.gz
-PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/16/ce/502a57fb0ec752026d24df1280b162294b22a0afb98a326084f9a979138b
+PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/44/8d/cbdc715cdfb7acd7ccf1ce2869b103734c6a3cf124afd021f56c10c17522
 PYTHON_GOOGLE_API_CORE_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_API_CORE_LICENSE = Apache-2.0
 PYTHON_GOOGLE_API_CORE_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
