Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE23ECA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95F4D600C4;
	Sat,  3 Oct 2026 07:08:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BEJmPlMzuafK; Sat,  3 Oct 2026 07:08:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B1850605D1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011292;
	b=LHDV3cv8eGqiWgyomIw61mf21TS4RGzXZwOAbDt1XmHqmMlGfid69sUamCp2HlL9wbTy
	 CFBEFSr0ZkU9iPfAA1J2sSbEf8/BPYyIt1e4yLKk9E6krI51/8wDeHeE2w/rx0qVdugH7
	 9BLDwUHFojoAjPd0mMREig9OlwilZnpIT76+68s1HFs73eCFFJ1xOoOlM6b4AW5xuFGUe
	 KDrBpY0fnAQUURoZH74NnU6Gsxv8ZHYv9QVfGsdUxhOSWs+YChtutrvIFn/T51HIw+7eJ
	 yFtQ6Ssh2GMf9ulO4FcH8tzGXot7t9I4GSnskyICJqt96Pxmqici8hd9pBl/WBIVT7A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011292;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=A6g02OLWjFYgWKfh7ODdFQ+LwApffMpDwkU7Kkr4/e0=;
	b=CWeewCyC3rD/jo/viKRwO3upo4aYoM00gO5+/yhi6XKM6OF1zHybe2EwesFwB1rNmEnD
	 ETy2myImXt0D6hcWs/yhhZ9/ScQVfXkpWeEzL2TAlUsJ0/NEJQuxRVFZoJDRfjz0bMdWN
	 SAbw0mKuITzy12wboM+8SC1Jopa3DjHYdFW9KL8rZf1Uxmy7DjQw6BHaGoZdvMMUAbuN2
	 BWTg28LcX/EEbd1i46yA7CD2nEaKmyqt2Chu/FyJW9BMxfiKVTpDLI3ajy0w4MIVhNpQ8
	 yb/K2eRU29MK7JIcmPPXZ9N/svmuoTHp1Caat4gNNJJ8FMif6dyFckw3f5fsx5mj0aw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=MH0NY3MU;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011292;
	bh=A6g02OLWjFYgWKfh7ODdFQ+LwApffMpDwkU7Kkr4/e0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=e/c3ffFwAoXkvjFGV5V/XkiY+xGoU3tKywKWV6o605WC0I1sV6MinziH5uF2PA0ql
	 OnwcykNvvyM9u5su7u5pywaQimc1tGxq8N4fg7aYMckKh3M6XDCw6u7A2jB+RAtIFC
	 8PRM6X3itICttWdSzdKTjroHPdvrPF2bcuH9TxgAZZZVu2Ajt1lS8qP6G0fqzS66OS
	 651eFy/4rGe1160gf5u7inoVylMnictavm4zxPtPFEbEpvjXLLMb7eXX4SMN+FoKN2
	 x/m1uMi7ew0Vvv9O8PwBe6hqNkBntmq4XgCq+X5l7JSDWcg50SWoenHM58D5zQxeXv
	 DrXRy/yvHqmMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1850605D1;
	Sat,  3 Oct 2026 07:08:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1056434E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA653605D1
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:08:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J-pcPT1fUbNA for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:08:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1F848600C4
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011291;
 b=TOKosE69QBt+2V2h1VZMNjRDNWkU4hgCrhkHhehOuIMFnl/GFgXftDjw1NTMVsIIp4oh
 3HN+ZeWxqGmPjhUg9WmSpTHmpY7MuJECWyfbpbPkWC8quA9ytBOKy736vxK/rtvoouAPL
 k49ioxwGjSTpbJICmMHeM4oAt8KpoKdcybsVRVj/ZJyvPW0CoM/l4X4K/iPjxlhHajpHT
 uZh1V+q7FcWEFOjvKEfM6gw6UMpabnw/yWnpjbqhTnWY8Cv/hBuyVsghbC52z2brxf3ll
 8I/FZWrmgwO5lz97hNzNFC0FSGsqdcBPSR2ksVFrqFgMCwp9BRnOQZfE8v7NghVDnJQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011291;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=Wo7+OcamvaINMw4BT/+P1DLGn24InvWikb43WZqqmsg=;
 b=s3Tu3IhRRLxVfH+W3rkVju3exf8taTM2D5jxTZjrh7S+dQBy9AKKfY4xzGkM4BUe/P47
 saDRQImswqs60zHGl5kv4t8lYQWHxxJzvKR3bGg/sb8Z41O6JVXfHifUTnWdmkudM3fbk
 LIjeJufwZpvBlf5w898j5ymb8CjeYaIEYclg+6MCKaSNlVF8xHxeDbT378AmwB/avyxmN
 g2tkdDJCKNzTNKDP5U2J3yGSeblKADE1zLuLVf9N6MxtQdRTBeIzxVXhq4GFdZk11TwWA
 2My3q8cqGMGtT05YkGAepVq5CKZUJILNU+rdgV7Cw/Ujjc/E4C6TMqrHjsYjkliB7/g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=MH0NY3MU; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=MH0NY3MU
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F848600C4
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010927;
 bh=Wo7+OcamvaINMw4BT/+P1DLGn24InvWikb43WZqqmsg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=MH0NY3MUEsAOarP9j7x4pfIF2rg7e3Bdr+49obsnxAH2WR7pwfnMvPO9mDWCVnvYr
 fouiJw6SgsK2oX029U08I20B0liOc6hEPy2apamPNWsV4sVO05igrx+wpW7ZEXvVaM
 t6w+btERi/C+SWcYOv2Hr/3pkTD2qsm1QYu0bY7HVlzfVEae9qFP8QAvXm1KH0FUOp
 Kt7HD+v7rGn0pnOVV1Ny73yFTtoTBxnG0ScpPThJWDxY5WyPlGFsWV0qLrvLnq2jip
 a/1X81/wb2cbQN8OAbrwCPKqqBywOBrwSxB/bEX/ySNmqmHMvn7v+kOhhwSsCX2cyj
 fHQc0KCKYwY5Q==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 GSZwdXQs/NpnUzhi3QfMxuROfW3L8aFePepcxEMF3ozDemULWhpirsULzU5oNiM4dzV0H7UkJ0k
 oJCmSZLF1lgX/zArqkuw8mBBA8vY9MBXfRr/7iwZpkSCKyDwrdoHUe/dgy23s8FOvl9Kmp/I2r5
 gO/ucange+2MDzfxIW9QkfH+TGV6Q6H+ABVCEzDWADeZk6DrD3BMDpiau6qJl0bijcO9gBH0Ota
 qvx7aWgQS7fo3kp03ALOUHDwVmufocDtOAmLzc+KdfTvyyObNjeSBZK25hv4VE3rLKgt87WQhRD
 1hq7a8V9hz8LyAiYHpahyERtw7IDt56/edwOYHFdcTRqNlbNDFcIqeEP92FPlG8O+vIN8Px7Wlh
 vMKUZj/yEepChNQ4kUaXG3fL7socg88g8SgQ9c/XkMGyr0MXmksMMRjh7bjylcKi/Fe3u7Rrp2g
 aAC9m3fXvRMhl+dOgFElNJ0JaiMmSuXf4RywWMJAkc7dX4dKnJyQiTx0UQMurFXamGX5xrOCjF+
 oUSm6tDdYvXW/RBwI903S58UiMhvMg3XbN5zONkTTlWPyPXgR+qA3xRR5UnFlMBF8IvVeP6h0eL
 pzzwoXtRBXxrHX2r3Vx8fYMU9Mplj3cqyQTJn8tVkY1Rm56IUAtGpcSUzbX4FvKm
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B04A9A4C542A;
 Sat,  3 Oct 2026 09:02:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkg-000000007Zo-2JUH;
 Sat, 03 Oct 2026 07:01:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:42 +0200
Message-ID: <20261003070128.1295458-70-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 070/114] package/python-pyspnego: bump version
 to 0.12.2
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
 package/python-pyspnego/python-pyspnego.hash | 4 ++--
 package/python-pyspnego/python-pyspnego.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyspnego/python-pyspnego.hash b/package/python-pyspnego/python-pyspnego.hash
index f74e9c2aa5..4b8763a73b 100644
--- a/package/python-pyspnego/python-pyspnego.hash
+++ b/package/python-pyspnego/python-pyspnego.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyspnego/json
-md5  bdbd0013e9f7bd8d076c339af9c9a73b  pyspnego-0.12.1.tar.gz
-sha256  ff4fb6df38202a012ea2a0f43091ae9680878443f0ea61c9ea0e2e8152a4b810  pyspnego-0.12.1.tar.gz
+md5  2af96f8b2faaa4c35026332382c1b5bc  pyspnego-0.12.2.tar.gz
+sha256  448a491a9bf0e5fb957567fe46e6809fa836aa40dfcccebcc740bb64acb1be1c  pyspnego-0.12.2.tar.gz
 # Locally computed sha256 checksums
 sha256  286517c93031c343f809f64b38563a783614b762e1367242af6cdd4107335471  LICENSE
diff --git a/package/python-pyspnego/python-pyspnego.mk b/package/python-pyspnego/python-pyspnego.mk
index ebe74bd879..7592eea3ba 100644
--- a/package/python-pyspnego/python-pyspnego.mk
+++ b/package/python-pyspnego/python-pyspnego.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYSPNEGO_VERSION = 0.12.1
+PYTHON_PYSPNEGO_VERSION = 0.12.2
 PYTHON_PYSPNEGO_SOURCE = pyspnego-$(PYTHON_PYSPNEGO_VERSION).tar.gz
-PYTHON_PYSPNEGO_SITE = https://files.pythonhosted.org/packages/7d/84/58577bd1b14293650879de0579ec263a1d8350f1d6d227226cf776b5a6a6
+PYTHON_PYSPNEGO_SITE = https://files.pythonhosted.org/packages/03/c4/790211e7a2180509dc29137c488c7b038ef89bdf83db0ce4da802f64f9d4
 PYTHON_PYSPNEGO_SETUP_TYPE = setuptools
 PYTHON_PYSPNEGO_LICENSE = MIT
 PYTHON_PYSPNEGO_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
