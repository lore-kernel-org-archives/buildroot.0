Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D8B1CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06D2B60609;
	Sat,  3 Oct 2026 07:03:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tol0fu9SkcsE; Sat,  3 Oct 2026 07:03:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0DAFC6061C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791010998;
	b=Vemep86g3cQe1j51QBE9HIvoey3QmYVXflZgfDNpbjiY3zmtnMeVnG5Yxk7DL4nRZSPd
	 o2R2r9IddBrTd35ReKBAzJRdD4/w6XOLE5HolhtyF/FplhmOPbHrSRNWKpQXG7Z7OUGg3
	 HzS+YOoLtqBgDt9HXS+kanTqhpg8yVzOAGSDE77xbIJ5SjEhvXeeu+1LZifmXUu9iXhoV
	 sKYXultBYgcL0OeHaUlRrfiKaWh4gV0OttMpCLxywxbsb9P4mtBa+X0KrW3HTVBHQL7WM
	 bayaKf8Rx6kt0F45tFZCT4kmtPSoRsFBUxZhJ7eSxtYQd0LaCa716uLlh6ijAfd0DBQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791010998;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Nb+vd96W2tpj1ecnz2slii4G8nRHhQryfJ97+L/6l+Y=;
	b=lKnLwgCJszoX1epIzoLXKBFDczD0yKMks597yE4N2eQAaKSDr8QAQyh7maEcgyc9JLa3
	 xLRkLJ7a5Wjmqn9wojwh5UigX6FjCQaM6Ly7ZnxaerCvdf4DF681ZP+I8vbjwe2EcOXe8
	 X20mDvdCh6K2UZHUD4WSZjN7jV0l3OJ4sPhl/2l4fzx74SvrDYtlhZHnCjDCSXijWuBo3
	 Fud2HHLuzcvOnJUDN1eJCM9cnd8LtKF6E0X/CHn5CXXUseLDqA44c0+yG/myDLCFVYQmk
	 0kigiHX5Ln0xW4e3sEatTt1wAfsi9bIMbtCWsKO89Jkcx0VJJcxCpNAiPKoCWEeu64g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791010998;
	bh=Nb+vd96W2tpj1ecnz2slii4G8nRHhQryfJ97+L/6l+Y=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=R65uH55zsMjbcBKeXkLZtYE/KQKELH6NB99ZZmi2RC9+vI/jGhCPcNVIvMxC5WHWn
	 5oNujviBt+FcVaBpDbUGg0rUMweLBoD/frrnuW7oVEJnCJlAQ8QdQkeKBexCy4622m
	 b3HA3f1ZxTUdS0yQTFiq64L9T668dArq45PvmnNBncsCOyDIFTf1PYXiaQi+PQtRW+
	 GCp+rC050PiSnv/eV8nFjuRWxhrYCfSMmAV/FGg2bwaNGhvf1i7F37RiVQXltMVoVe
	 pCQ0VraogU4ETG++rRDnWM4n4xD8KJ6LI4/XENj0ZOW0gV+H4BV5g/kwsZiH++l26D
	 gI5wmtYHcG2Pg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DAFC6061C;
	Sat,  3 Oct 2026 07:03:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E94C5263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF55E40064
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:03:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id go3rnMcFl5LS for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:03:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org E1C2840050
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791010995;
 b=gdw3p/mx5+YhJwUgzczD32vQASyP68u7PuWZH62JfzFIkpdeyh4R3168x6UM2aKTw3WF
 Ok7UfqtkLqm20TNQnYXkE+ZE+p5j1SZdmX1yZi9CrN6jGsCV/V+xxzg+eITDtO03DJN+t
 NzgpMDnZ6bxwMp0RSgjQVupF6GhsD5XR/LoK4C9+NVrFN5qePjyGYej3VxWjlQrf7WtSo
 NHQNjAxyAQx6EfsZEt/AV3zqiA+LfHhn+O3kjE19p/D39kPDLNaGvF5T3GSjBDQlXWO89
 LR5EZe54gXL3/5lNxcvjlW6wswlzq9QS1k4lS+1smcxH9CxBVeAy5A8Z1AicBJb2hUg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791010995;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=XChYDEI7PQw2UDGOB7kitbo/U5P57R05QpWUHI8q4QI=;
 b=aAXM6yeVmOnJav3lNVemwVALshjnCV7mLIalasWNk2jYY7/HPJccUp+9hbJMHKyee18l
 wXhGtaMXePoyxgM2C7Qd+84DoBt9Q5+dVr+9N5GHaPGntVHImkfYLYfMwdQwCiilF8RUx
 IVJY6ssRj8sET/NhXuhV2gBBegZRAgHvz+eg1F4cxhmpaD1GafzK+ZyC3oEQCcAOw+02d
 /ABO9BI6kNm9F7oFu1HX3q02Yt7KXTDMz5gj4lXVGzzePEkMl2jyvSeHg48DPAdoWOBtA
 RRh8wMd1GXk9JDDTj53WSscZqYBKEDJuJwLryTyaqaRoJpHZKMeMOQ+x41KkcBg4aLg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=NpUJVNNB; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=NpUJVNNB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E1C2840050
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010922;
 bh=XChYDEI7PQw2UDGOB7kitbo/U5P57R05QpWUHI8q4QI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=NpUJVNNBrzRaaMnUXAc28oRC6J+j/nzurqESLTq/fu+lNGsMexPMYsktRKQ11HcR9
 toeNeR4i4GAYI8wAHLv2zv39I6Ojgjg3etZngB06Cw3aL1iirEhzv9MuEmr7HNu/eb
 c6kOA5MYSTL9oa5WJJ3PH33G/XCTyOpERISz+RYbc+H8K1AQ5WTIsrIyQ/Hgq1pSUj
 tL9rqob1ezb+xOo3gBjZ1EHgHetzXWaYJ1QTV3BUY1ZH8J5dNwZgdCO7iXjOp4cPuJ
 sFK63tQkMPtf76/YMFfbM7asdh6nkmq8dfSodV8lOl3GWAIxP4l9JPe4SCaC9tqnH9
 Nk05gkAGdoRBw==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 KLObUy36VtQeBNQex0SqeCQO7qsXI0wIBFy56w+4fPo+Ee8VdSgIeOQVOvXmhxvj/V/6CJSD7VY
 LDdA8ajUkkKBMJXmvA8pFrys8jZU8MU/LTG6xJV65rQ3QFNBi7DfMWwua/TCyn9aTEzg+92Q8r2
 xfcDCA4SD2QukK8uBM9whDya+YYDJxbzXGZPlIy04CqFJAFXDcj2+5K+rZ8YbLl/+S0rx2nBU/6
 zEP9cPWzPM0ZxFjI0uldtlAnSTRQWpTuImh9aRW4PmiZ0GeF2eZ+DRvDSZaWZ8pLNrytGo/TSGk
 a0fuHpIXzXEyex6Ek6WJsI4tGy+L4Mw4XW6e0RNnwWRIiQQS3eB9iTjS3Hfrxtvkr3IuacVnGp6
 QbKt8XGdara8PpFznh5B8fjrMNPNIMCaPgWssmEGtLHacFwcvLZv9YD4pLe/TRDQvC0wAZFKcZE
 AZxA6bRW8kPgdR1G6xwATnldYrJIK3Jf7CEoJiv9psykOC8Vach9Q/3Ay1Q6VZ2LtXV2/SQQFlS
 u38Y+OcNd+EwRj83pvKefRwGvHEdzMiUFbeD7plRa7zHIcRxkLH856JyDUhQWJFhv7xLGxz812/
 OV+rDpJNleZSxwE5noayk6ZsN5Z2f0UVtjPl0pdEdu+e1QceuW7QRVO5MNdOuC26mtV8sw36CiB
 Xbevm2autyr0JYZZg2HD3
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 431F1A4C540F;
 Sat,  3 Oct 2026 09:02:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkj-000000007Zo-1aEj;
 Sat, 03 Oct 2026 07:01:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:01:19 +0200
Message-ID: <20261003070128.1295458-107-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 107/114] package/python-websocket-client: bump
 version to 1.9.2
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

https://github.com/websocket-client/websocket-client/blob/v1.9.2/ChangeLog

Updated license hash due to copyright year bump:
https://github.com/websocket-client/websocket-client/commit/b5435d66b152230777c0530b7af81c3549fae5d8

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 .../python-websocket-client/python-websocket-client.hash    | 6 +++---
 package/python-websocket-client/python-websocket-client.mk  | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-websocket-client/python-websocket-client.hash b/package/python-websocket-client/python-websocket-client.hash
index a966a7e441..4e77d129f5 100644
--- a/package/python-websocket-client/python-websocket-client.hash
+++ b/package/python-websocket-client/python-websocket-client.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/websocket-client/json
-md5  3e6fd932858e9123d6ef5161e9ce7c46  websocket_client-1.9.0.tar.gz
-sha256  9e813624b6eb619999a97dc7958469217c3176312b3a16a4bd1bc7e08a46ec98  websocket_client-1.9.0.tar.gz
+md5  57a05031bf5050ade819166416448b77  websocket_client-1.9.2.tar.gz
+sha256  0fcb57545848be86992e128218fd96dd87a6769ffdb1a968dff79632b85604d0  websocket_client-1.9.2.tar.gz
 # Locally computed sha256 checksums
-sha256  d7ad8d0966aa363d45c7b16b0838cadcd51676acdf215ad967307d581b47872c  LICENSE
+sha256  14214b7bbb6952ada76afea206b6c393f2563d4e7678be0232e1a1d216716679  LICENSE
diff --git a/package/python-websocket-client/python-websocket-client.mk b/package/python-websocket-client/python-websocket-client.mk
index f735782cf8..d94d95daf5 100644
--- a/package/python-websocket-client/python-websocket-client.mk
+++ b/package/python-websocket-client/python-websocket-client.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEBSOCKET_CLIENT_VERSION = 1.9.0
+PYTHON_WEBSOCKET_CLIENT_VERSION = 1.9.2
 PYTHON_WEBSOCKET_CLIENT_SOURCE = websocket_client-$(PYTHON_WEBSOCKET_CLIENT_VERSION).tar.gz
-PYTHON_WEBSOCKET_CLIENT_SITE = https://files.pythonhosted.org/packages/2c/41/aa4bf9664e4cda14c3b39865b12251e8e7d239f4cd0e3cc1b6c2ccde25c1
+PYTHON_WEBSOCKET_CLIENT_SITE = https://files.pythonhosted.org/packages/d8/cb/a5abcc2891249f393827c650c6296660ce40374ac22d99ab9aea41f9d2a2
 PYTHON_WEBSOCKET_CLIENT_SETUP_TYPE = setuptools
 PYTHON_WEBSOCKET_CLIENT_LICENSE = Apache-2.0
 PYTHON_WEBSOCKET_CLIENT_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
