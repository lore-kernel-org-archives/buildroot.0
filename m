Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90999CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07CBE60609;
	Sat,  3 Oct 2026 07:01:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IWoknAGaew5V; Sat,  3 Oct 2026 07:01:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D4AC66061C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791010910;
	b=UtlqfxH26iFaGTR0fAdVImrRtDvSrxKVO+IQdmV04pZrkjoF4/7zlmE1Pi3Kt686Fu1/
	 5Y1Y+GheoM4BfsEjq70nQdINkzjjiLD1ZUhOoUwzPCe+1TLfiBYJOSyR+6rmHWAHGq12v
	 X6Nxkt1zCsRr8FXzFmwEltmNQa/JCCBOukwNXHd0X3rthXeXZk5ZJPpxXNK+Q8OaMQrbJ
	 eF3Mq9qcG5SoT1NQG6k07lioQ2evCXHskxNQecs7kPbCMMkWLjVKLZYBcJ1jHtkUxxtun
	 RKEakYSSpBNKW72Q9V59LNgApJllsftSKJNbHPPr9NXIfYwAD4F3hqeUCXZdDcJYo5g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791010910;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ElTMQ8QQkUtdGVZNumQqRfDBEbbpIpdTcXLgYG0KuFk=;
	b=okdoVqiRffIY4A8Yv3vf832V3Fy6yfIzLdu29v14f5Kns0EwYQ9IfinwpiS+qyl1t6YS
	 YmudeSoV5m4hCDEMeI19XKNjl7QZiorMAVPol/4s+C6XNGqpJXMPDhIcLxw+DFzgMYRYN
	 EQc6ZZgH5jLpaShjU3LJHb+5QpNdr7bUtxSXGjaH6UjN88lIpwb2DtN+eeeYcplesZY5c
	 YhgmT6ATmdjjtuPdbaTP4DlR5EOx458hQI0Cmz6RAjcdLh1+04F4iMdRn4BcCVSrGkyEd
	 S8N2F+5nbgwUGrYVW1PBYJ10EKHg27QSHhT/uazfWAnOcUIhJpvDm4zJFbjZsWGV/fg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=RH8qeLdZ;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791010909;
	bh=ElTMQ8QQkUtdGVZNumQqRfDBEbbpIpdTcXLgYG0KuFk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=ot92v9ybPsdErBxHW1hpFpo1egDuL6NVvjpafZJxH3FHCGiX+vmoAzploIaJRL8Gh
	 ovDgFh/NH84qOvtTVIoGEj2hFBiq3UcD9qImkW9dQNUxH97Pdl5mq2tzpVSJa/Ip+b
	 sOo/rKTdImZjSVtrTCtBaE1+hB8IGkjzDRWJgsyfIZNMd24q7AKVv/VGXH9uLKpRo5
	 2qffukmGVfIXWtzvRXCiXLbQblStdHki7o4ISZeJMqTKQ6JXgx+1yiyT3aGU0bNFIm
	 JqG3gPaV2uxamqKt7MFhDTejCq/9tpKG6OkNkQUJ2bvZ95k+X433gE7dbMi7B3swmw
	 s4B5YoWpgCrkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4AC66061C;
	Sat,  3 Oct 2026 07:01:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 43DA22E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 341656061C
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:01:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NQDc6XpjhCPz for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:01:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CEBBE60609
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791010907;
 b=OqmOKnj3EXGe8e8Cvp9La7maVl7D6FkuknZ4vVAR/trQ2OGghp78w7s5tLalry1lKIMv
 UzGavsl1hYu1vhPyGDT1wARR8ZKK1zoD0c/mVGw1QhMLSCWJh71GVOglmj1Msrh3a5qPB
 4oAsJomQYKrK3NFYTytWFLUX2Myy0663ArwTcQAEmxUMVVHP+BQ9k+jYLnlmU7NAkmMMc
 c6+AqFLujh/iEeMJmmbiZR5KO6BB1bN4SxtocbwafEwaK/DXvzoHa9ztJ+tPQDyG/z7d3
 4t0eu1rw1vsETSii86t2JYJZUVrc6vZWMWFOGPoNKPoXbuOYtCqVn1EFnPYZtNGkkQw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791010907;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=Qn4y9DZ4Voz/YTISC3iTxQQj6WtI/jTzpaLG5+2aj+0=;
 b=SHPotZvMAVOVyxH0QVuDrHs9El3r5YxEiJ6upRebvXQZRLdgVw24JvrqeAeufvIvPm1Y
 5uFPM7hPsjSKxaxRDUM+Jzwed7Efu8z8My+UNMojx1NVlinKYBFWvCdpfGw6r1FYk5HXV
 HMJTuzCnN/aHqgDb0qDavjQLzxnYtAXNb3TyhKONMJgeoE++mer1bU8l7oTjqDkr3jgi5
 KEPg4VP8v6OPJ8z4YuvMaW0QWMTtrlhFNVRg+EWxV/r1iOhBKTF8tExAYhhs4aMUk23iP
 z3Eysg7jL81liLKQL89Rr/nUsTQzsSesVvEyZ5vjmnqWN0iRW8rl6zoWUIhLCDK2FZg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=RH8qeLdZ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=RH8qeLdZ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CEBBE60609
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010901;
 bh=Qn4y9DZ4Voz/YTISC3iTxQQj6WtI/jTzpaLG5+2aj+0=;
 h=From:To:Cc:Subject:Date:From;
 b=RH8qeLdZV1lOsp0Xg0KLbOFr9yJqja11FjKXTjN6uQuzzICe3R2lvz4VPQheo8Srj
 2O/kvbgHvZ74Eygs8MNl8M3o9dF5mSof6wG00ERPxBB4qt90VlA5OS/73GAtlmNak7
 0j0i0hq13xDADpsuIO3xAK97+bmTTh46xjQCt6FHnKQTXTs4b6ivbRyj+jkdSWm3yb
 dIGhCA8gWMmfnL7mwDODf6xEo2m7RM5J8kIrqKKs9Qa1KNRoR27GDtnyWgvvRj7jjK
 6+Yt3YJwRRI7xcyrXODe56d4Ec7WDxffF+DudgKDuarRt70tBriBbuppi2kqjh/LaB
 ZeZIY//pNV91A==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 4k+0hYgBzSzEpVpdshUvFcmVmacbkfP5mjTHrSaELBvNpPK9kkjNJ7jXYajqFURRL7TJ8/RFf8v
 Vx36NqGtXJ4BOIXPSC5qvoshmad9rRdzyyFLVqiFn5Am/5rSJ0IZCwMs1z3spZ/q8pUf8BSFFAy
 psbn02ai1u4cklpbyFLDOIw7mLVRkmcc+vevipc+oIAqpvK7vaWe7cvNKNyYhq1/g6Ct3ii7fyd
 aIX8ok7lm+64phklhI9En7scVe2Qe9o+MDwKezTToXz9WkuY+LiQxKc6jEj1aiFmJUKa48Kr+hR
 guYM1icxhRgqBx2sO+xmjz3HWJgGrLDf+vL7Br750JgmpbPFItfTRH97NcFB88tQPBP1QAWthAB
 IlukMgOAf9AfDenv/Ugg5UNo/Jt2Tw6v/T09pWyMFil/4DnGXzAKfrs2JEIYMOPmZBsFS1eesbC
 i7l698vAKB7PoGp+uqRpYdrlmS5tmvTs0RMoSBMdpSn+3Q7oX1AfXGOzh2DS6P+i3xqygVA45pz
 TiOG0iFbSL2zLEBdiR6fqLnP6kC556z5GWaBRPEKNjzwr7rWEGpP0mSGq2o/Jubsy98BLFy/h+c
 86SyyRcSQw92OQCYyrzxETusTgzpczvHsZ1Eil8avcpFl7VQscGPL1trivxFE31GxtOQTnsN39Q
 5FtF9iWJIbK/iz32NxA==
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D0ED6A4C53C4;
 Sat,  3 Oct 2026 09:01:41 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkb-000000007Zo-0aM3;
 Sat, 03 Oct 2026 07:01:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 08:59:33 +0200
Message-ID: <20261003070128.1295458-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 001/114] package/python-apscheduler: bump
 version to 3.11.3
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Manuel Diener <manuel.diener@oss.othermo.de>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-apscheduler/python-apscheduler.hash | 4 ++--
 package/python-apscheduler/python-apscheduler.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-apscheduler/python-apscheduler.hash b/package/python-apscheduler/python-apscheduler.hash
index c29064c590..f0da3b306a 100644
--- a/package/python-apscheduler/python-apscheduler.hash
+++ b/package/python-apscheduler/python-apscheduler.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/apscheduler/json
-md5  22f9437792d120a17dc4154b5ebd1594  apscheduler-3.11.2.tar.gz
-sha256  2a9966b052ec805f020c8c4c3ae6e6a06e24b1bf19f2e11d91d8cca0473eef41  apscheduler-3.11.2.tar.gz
+md5  2adccf3fe49758859f5738924a9dba9c  apscheduler-3.11.3.tar.gz
+sha256  cd2fcc9330039a81a5893472ad49facf23a6d5604cbe1d918c835c6de7834d5a  apscheduler-3.11.3.tar.gz
 # Locally computed sha256 checksums
 sha256  6163f7987dfb38d6bc320ce2b70b2f02b862bc41126516d552ef1cd43247e758  LICENSE.txt
diff --git a/package/python-apscheduler/python-apscheduler.mk b/package/python-apscheduler/python-apscheduler.mk
index 0b66bb83c2..1af81a6205 100644
--- a/package/python-apscheduler/python-apscheduler.mk
+++ b/package/python-apscheduler/python-apscheduler.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_APSCHEDULER_VERSION = 3.11.2
+PYTHON_APSCHEDULER_VERSION = 3.11.3
 PYTHON_APSCHEDULER_SOURCE = apscheduler-$(PYTHON_APSCHEDULER_VERSION).tar.gz
-PYTHON_APSCHEDULER_SITE = https://files.pythonhosted.org/packages/07/12/3e4389e5920b4c1763390c6d371162f3784f86f85cd6d6c1bfe68eef14e2
+PYTHON_APSCHEDULER_SITE = https://files.pythonhosted.org/packages/8c/6b/eeff360196bb20b312c9e762a820fd1b2c6d809466c755ef57863478e454
 PYTHON_APSCHEDULER_SETUP_TYPE = setuptools
 PYTHON_APSCHEDULER_DEPENDENCIES = host-python-setuptools-scm
 PYTHON_APSCHEDULER_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
