Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B6DCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B683740DC4;
	Sat,  3 Oct 2026 07:06:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hVwVih2z4g-m; Sat,  3 Oct 2026 07:05:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C222740D9A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011159;
	b=LP61/O6LJ5U2KsxHbIQblpbhCbHjfBBYzawqS0Q2NdmUfrHqEStwn3SZMsCATcNQ+Hdd
	 b/ccqIL8Yr1AMiFatERbKU0b9aCxC5hw4t1CSeai0wyyEf387UB5MJHX42Z3AZxpoCf6E
	 BFOe1meWccdUnEfCfP0nhTbearP7S+EYppany6V3TWKkMmR7wL/5C6Dxhwy3ee3HBZ62C
	 WVttUfzI4XJE6EvO5h597N+yhrQyyZKnOu8As8XbjmiFfeGG0AghKmLeDmhBLl16tkbvH
	 kQAlWnP0gNy3zc8rKBFSqgRwuNfR4O5g6J58ANdBqJY4EE0jvHyG/F5pS8OHl4lqrMA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011159;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=KqYmUzhZ62CWTTHfzZ+w+lkSVBpRsobLFQUUALD/2rY=;
	b=MnjGZ4GrOFrqNwWIdDznLlYM8/zUniTM+62trXfMMlNq0FEatDpCYQMGeIB2ZGERnYj0
	 w86FccnlPtFYdkwu7fVWAXNpIrO6EXkaRIp3EKBiWiZ0m8BVV32yQNoMh8QL80ev6yEHu
	 cK4pen26KaetKXcNu/7kl1QuvIlfocsdLDf7OhDG5SfoX2jNk6O2hNtV4Xg1MQRQHuC6K
	 D653KHpT1OMxn+7lLI6p/zcbADLFxj48KcvlUyaKHKCHV6X3FJUAIMlmKLenSujbQEFRp
	 MYYiDw9LVgkz5ASF3yKT6gXLB5VfOVYtGITyrwTkXUIh+12afempk8RvFI2FRmxwO8g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011159;
	bh=KqYmUzhZ62CWTTHfzZ+w+lkSVBpRsobLFQUUALD/2rY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=p7zV3BUatnJpmFF05dm6ecfMlSpEt+nFxlUj4mXbWWfIKUq6DuRtA5sEV7B1gWs1O
	 1oRqEuHzVy9xhEldK6ZOzjoklmD93jyUZwgrfrKGlfutoWbubkZ0vx6TkrUGGB6lDr
	 fz5tXFbZ7mxcrG5yxlXuRfQBf/YYaKox3gMMizUKO9nMIc34dPnQQClmtVFoXrwAbd
	 NajeAqlLyij9rlhZ5VLMkmf//3IV27QjTiDa+5DG/l1DOB0KrtApCJ3Le7bnCYERfl
	 gacWotQ7dcWWOdNwbwG2LBOsO51sAvQzzM4+2kiGrFwDjIuVooSsM5mBt1qpF7T4cj
	 j2GqWCDqieCXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C222740D9A;
	Sat,  3 Oct 2026 07:05:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AF37434E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A14B960622
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:05:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XCN4ZpnzmEZV for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:05:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BBB0460609
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011158;
 b=AwyBcFLYmAoacT2QczodaZTN1wQctwJUc0ZeCYW3mzRSo1YLbnH404fSn7jOO3Uz04xO
 /u7UU1HGMc0kPacccOOyQQJKShYmK8IXf0984ATmCkxpWXMJnYN2q+s9z+R5Y3PZzW/W3
 d/kjfde1lnd2kfye2ZGduGdpqQklVlhmRKqbrf34WLJ0mYy6zuS7AnU7GiLrRklRqRLcn
 IF8/h7LN1/bg1yy6buzKU9P34+27iJQW9OZikxXvdrlmmivzt/jCFYd0PRCEfKFy+THl/
 ND9fbWZlfuRP2+5ISgj1UP0wf3fxpgtr1/YijuFkdXqBI0hS9uQn+THyaBbD5O/juZg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011158;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=m4Zd0e5XsIHOWwCdb3QqO/DKiCH03SYm9Jz+EAw/vaA=;
 b=fYPNhnrRAOe7GwYvB0nb/W5x4A3srre9NJsiCTfBkysX22FGnU9Sjz4QIqOtGbqNDIlZ
 5axFl3dK1sARvmetkNAOAWTDLqHhAce4N1RnDIRt32iINA+Afqw0StjbpXUoV1wQ9wshy
 4yHKAjmKg/iYfYLryvUAJIxqSumecoIQ35BxwPwvavuVJ8bKgK/lHD0HtTliszYuD6XJC
 BohovP40HOiUmKWtI5hAuK/KkHAuE15PciJsJK32DA4ojP6l+iwdfo9Swu2gUMs8qyZQz
 /NJ3BbaPNC1wb0FBneUaGqvKqQNVVF78hQNyraSDY0nID6c2dWXUQslYsie0COVLUgg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=JsVx6ixj; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=JsVx6ixj
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BBB0460609
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010925;
 bh=m4Zd0e5XsIHOWwCdb3QqO/DKiCH03SYm9Jz+EAw/vaA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=JsVx6ixjZEbaIHeCmoBz1//skPFbxqdiPgHT2E+c6XwMJzv4V/aCKxjCjV1ktDmz+
 EKshVF++huVVJm/dwwBhJYbY5GMwAg5H3754fNy7fwDOBWmt6bGz+SKInSDF6FaGis
 9bx2iPHDXKhyqDtNIouEXsCsez5mE4R7tQv6SV18U98yF5QhTDHBTH9Pzgfvfkx0hw
 sG0oZKZ68X6MI0w/XUi3mONFK+ym9HYK37675Cwp5hVyzjId6k3VDhG//Mvpjty+iP
 C+gKiIHk5uoEwGH4J6oHNrInyu6DbWhnLQpOe8bHlvNCmS7BQpRqgEpdJiKR3STYt3
 0C7Wm0OIJGNVA==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 AOtb+ALNdo2+0TI2EtHrA5Kz8YOMCqNgEZ32OOYU/bEl4SIq5e6Dx27+34xic9zj4Y0KX9JEw9m
 Ga/O/tyh3uPUCqka3gRoLywdfQEy/D0Zprkhz9D5JBx7cO3nCGxsBVZ1MHQt1gap/3cwqdZolbQ
 8qo9Sz+q3gYJdL0P+F9pJD56w4hL/pB497uLb3kWy6EzOGWzv9VbBK15SJCdfU4ygBewHOaQBkX
 0cQmp/ft3Fy7F6lmPuVgabfWxry0eLMSLhLslceKu/eydLIUf11Vix0tECBAHCdmNW5oslZh7Tz
 TuoiUetyJ8vZtB1o9UD0MKaaYmkr1+rZxhdeTw1VoAw1Z2f2ARjOlsl3TgYmjWnpVH0rK+cU9Ah
 OArRXiaTvDx9cMa3LKdCFhg1NWGzAd3WoKxwv2Gag+3fyvNe6dm34u8EWvgHhTURf2J9g90EcpG
 HjaZP95qHrw56JGzA+uIASswmi9wZYE3AX6+1NUPNY2K5T1s91sO1186oqPi+d74gUg6I2L78Eg
 kTJ5VhsvwPqwe9aPM7GEnMDpPE4ixJZ/LY/APLnzTJRRY+dl39rl3YrobYIfy4WDrk9CteVqjZ/
 90d8TUpJLwZbvxM8uocf/rvOfcqufaTDIoMLTTIgJ24FiTIPjACxKmcy9KQYqZtf
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B6361A4C541E;
 Sat,  3 Oct 2026 09:02:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkf-000000007Zo-2vrn;
 Sat, 03 Oct 2026 07:01:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:31 +0200
Message-ID: <20261003070128.1295458-59-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 059/114] package/python-pycrate: bump version to
 0.8.1
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
 Nasser Afshin <afshin.nasser@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Nasser Afshin <afshin.nasser@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-pycrate/python-pycrate.hash | 4 ++--
 package/python-pycrate/python-pycrate.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycrate/python-pycrate.hash b/package/python-pycrate/python-pycrate.hash
index 85ec6c6588..2b45b33c97 100644
--- a/package/python-pycrate/python-pycrate.hash
+++ b/package/python-pycrate/python-pycrate.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pycrate/json
-md5  7227ba1e2124dc84818adee804de42fe  pycrate-0.7.11.tar.gz
-sha256  23dc1c19b148a17637fea73166b801c767ae738cc4cb3d8b1f74a29e469d7c02  pycrate-0.7.11.tar.gz
+md5  094c4f8b45ce478dfa6efa2c52d42139  pycrate-0.8.1.tar.gz
+sha256  a408c942d219c646a5a81073b8036f48a81c4540dd1f25fda2f8bbde0607db98  pycrate-0.8.1.tar.gz
 # Locally computed sha256 checksums
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  license.txt
diff --git a/package/python-pycrate/python-pycrate.mk b/package/python-pycrate/python-pycrate.mk
index ac0e5e1cca..e2e964f4af 100644
--- a/package/python-pycrate/python-pycrate.mk
+++ b/package/python-pycrate/python-pycrate.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCRATE_VERSION = 0.7.11
+PYTHON_PYCRATE_VERSION = 0.8.1
 PYTHON_PYCRATE_SOURCE = pycrate-$(PYTHON_PYCRATE_VERSION).tar.gz
-PYTHON_PYCRATE_SITE = https://files.pythonhosted.org/packages/42/70/64a5b11e831dab532b4b61e684c5807a68daeb93b2bd4853975acaaf968e
+PYTHON_PYCRATE_SITE = https://files.pythonhosted.org/packages/5a/c0/5645340d67be6dce6270418986699f14e24d563865077975b0c2262ebc1a
 PYTHON_PYCRATE_SETUP_TYPE = setuptools
 PYTHON_PYCRATE_LICENSE = LGPL-2.1+
 PYTHON_PYCRATE_LICENSE_FILES = license.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
