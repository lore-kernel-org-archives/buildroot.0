Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51796CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E64160DA2;
	Sat,  3 Oct 2026 07:20:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pqpSa5oiP_Iq; Sat,  3 Oct 2026 07:20:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 37F8360DB2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791012012;
	b=DPsbIOqN89cZbY8d851dZafcd2uQE9t2ZjwSayhRkWhSeBxAR5GAbkIATO5R/5MYaAXs
	 kLrPPUFAccaQj1oZBr+gMrree4dbMiFojWxQP69S3tPsMIXCZT+fAzqBYJpfQ7qGuOiIz
	 oiBlHumZUf0ldui/3K/WdkfPhxQbUEaEYCfU4MQh+lB4s8Kd5CTUHyr7T9e0sih21GhiZ
	 dDgFpL3vWlN+pIEkE7vT5WZcZkunyHbHQyh4GPIGZhH3u01NlktLMIDqz5UvxJqzVWUPo
	 c0xDzLbeY6bfnldygieDXEj+tYvY7u5YNxyMZrYnA6gwdRS03g39bBY4PsDumLSgK5g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791012012;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=K3m6wDm82l4RQoDvDk+e8kke3GBl415KFG1fwGqwafI=;
	b=UkfR/1/ryeV+2FvW0WK+Rtff9AC5DlglK9Xw0JGTLDxlVMVpHoOcumbYIQIPU8I98Dkn
	 zvZtmMD4rwZKCrknskWRFOtvUDmJAkVgoDBsWNcqbhdI63q/WJOtsVMxkrGuxwDhzhVxr
	 P0o5sPfHk2QBi4ar8h+AwseietDeVD0wl7CzSig2x04aPs9Vi4ao7vKyz+S595zI2P7mC
	 muisQs48oFg+iq4WPEOAiO5oiSTWqGZix0fHsMKV6R0bCylmqWxSerTlnJBrkAygQ1ROG
	 8TTpQMNeUhfnLX/5PgCtaNPVr4hDQSYybpmVqe8Nc3eBMrZGuzqw0pAd5mGX81W5IVw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791012012;
	bh=K3m6wDm82l4RQoDvDk+e8kke3GBl415KFG1fwGqwafI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=BlI7IQuAXzCMNSJCLBj30DlpT66ocg3Enq3av3C8+aJALgKLKHB0BVuFH8kXc/uu8
	 fLgE+LTf7JS56TrSx6i+e+KjFVRYf9C62zYw6k0tWyS17LCUQRUXg13XflHuCZp+Qk
	 PrYxVJvSOz6xek1IYhQgU4eMzPHvISRjk3gpXRy+S3hjI37NVFXaAgWlyUjnXeRBP4
	 VI0JqYnwSPUnRzhu7fnnI2EkYHW7kElEsVrEDspMHnEaEGP7xffMgVjwEC1U7AUUft
	 Zsij53zgY3PP4fE5mp/RqLCcO1txMs/H3VR9kbieCQ53W6+5mQ3Ee53L5Rr/Xg/aZM
	 RbVuwZGvNKUiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37F8360DB2;
	Sat,  3 Oct 2026 07:20:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A65B179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60E56410CA
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:20:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gggc1N72TP-6 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:20:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7139140ECA
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791012009;
 b=gVlhQBzdBnhGL7wiN4dxoVJb+XBzhdBLgBSH5nZ8X0pCW/TbgSVS3rauS3VlkaqWURv3
 YeG9vaN9sg5unETCxRcsZ/0ZCzkEyTi3sOqq+ysKLqIAOgb2U0rAt75/0or21pgOk2FQj
 SvJ26OBzo0quBT63BkGtmhFS09O8zYKtUh69fishUkYrTAY6LgRFyx+/d8/BFe7Zncq6j
 Bk1gr5FcjQDRQgM7H9Fa/rhkI9W6ij3SNAbgJz6X9liaZxgxEcnY8bboOBKxe2GdqByNj
 cDlZJRSB+EhxLS0BG0OwCqC8jx1HQArjiDTA6fP/8Cnb0sDaQWbqz5IlDLNqG3RCnQg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791012009;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=QITzbLxcVm/Yr5DGaYj7blXis/Ekug9m7TJ6yHQRTmE=;
 b=aj4PQZcs2bANpHqHwQh2AtUlauzJVvORbdux6WiNCSxzedhWN7KZ5j96QTcanbFnohZ/
 vtwlkR91kdhE0a6PIg7tiqya4fnQV8GFqzolvokFR9hepC00v1WRKMXqz3iCFdCETtf3W
 ILcOEikiRk0PCZNzgk17uxNKJgIMVlv3HPLMn9DrpwhL3HS7Q8+qOxQwtVhKU+5oFhhF7
 nuKHg8IozgDz1SVmrXiMnQ6/thfPwML4h1fHloyjiQwtFp7r+VMdw21IdPiXlhzcjY7ib
 gGPd2pjCOpYfYROWTVcWtuLMPwhMuR1khsxvUhtBTtjW/14jSCfTMfd/cmWNez8wOnQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=okLuwoz7; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=okLuwoz7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7139140ECA
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010939;
 bh=QITzbLxcVm/Yr5DGaYj7blXis/Ekug9m7TJ6yHQRTmE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=okLuwoz7b/AJCKAfPOSH4KpFfA0/w7KfxdrVsYJixPjTe5EJ9lsfReE8AzYMHmGej
 vuQJ1m+HoAq626XnsFf2H3wDj55qDhGDiGd3xGTg3b+gYqU6zNxLcu3mgDJ9Qtb/Dy
 BvHodpVlIKhwyv2HSB5zjAlXvJZgTC8nI6HKtVRRoMKvH9gjBZeZQ2RPSCmN9dCB05
 mARfJHF4o4H3Sq4JNtY/UNhEduwFrVXMI3CdffMQilglLjsAZccyfGQq0o73lGZMOu
 8OgiXB60BwgUzBhXJekcjDjmilt1EJC0j9Zf+fd65FHE6cw63vQg+fUhlyi1iPxyVQ
 CelL3fkpus0QQ==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 nAEGfgOhZmrpA6j2LJ0KQTM01Q9ZWdMa1GM1lS2Pr6/PRUQIFuyyVX7KTYfQEi1WKH2lXseYeB7
 9kIBBd0tEf6E+mUoVUXgTYjqBsx8aBJAkv3Zyom8Oixj1OEa2EAU1ihDb3G4yhBlaIHnYZTj6XU
 T3ibUwQz53U4hBuqN0l6xRebtbXvDCqAbz71WZ1fFXLfLjJWjHem68k22nGrSXkT/WoSYS1lfMf
 2q8iAp46AevIRsSb7/FTCRd+UrZMRO3nnbCl02YqyFoiesfvfJ3NWeqSCINagCH4rS6UZK+Vctg
 4gkhWu6+62yIMPUoDLCGoVA3bcPyWn2eKWpIido30ISAseU2CD+aFOg3r9x1tlwY8ufiJ4Ov1Qx
 hOXqvxBLjsbCAHMBJQkll2Zz7tKdCdXsePfzNN3oogwWkE6/4aC6WAYt5T7ueP/qdZIs1wd6dYj
 H6ZnYow1ZWu7NhlEsPAkcYWM7mkhmS6fKiUAjEI7GdZViR1bn6DS5AlhOkGq/uRRpijkCiMY0iT
 e+xZeeQVTYIPszaLbDtM7Lw+LW9Z7DamxhVKrf2k4aULKGJBh9maPc2qc/k4vfYkLoe9vguLi5D
 yMORPUtj5EKyTUjwUIxJXzMdNiwSHs98905tgJvSGt7CS+Tz0h4nySQUPHb9WID7
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0C53DA4C548C;
 Sat,  3 Oct 2026 09:02:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkd-000000007Zo-0sFp;
 Sat, 03 Oct 2026 07:01:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:00 +0200
Message-ID: <20261003070128.1295458-28-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 028/114] package/python-google-auth: bump
 version to 2.58.1
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
 package/python-google-auth/python-google-auth.hash | 4 ++--
 package/python-google-auth/python-google-auth.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-google-auth/python-google-auth.hash b/package/python-google-auth/python-google-auth.hash
index 9a8aa4b204..af30f9dff7 100644
--- a/package/python-google-auth/python-google-auth.hash
+++ b/package/python-google-auth/python-google-auth.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-auth/json
-md5  9e586b998d814cf0a35e98f3221181ae  google_auth-2.49.1.tar.gz
-sha256  16d40da1c3c5a0533f57d268fe72e0ebb0ae1cc3b567024122651c045d879b64  google_auth-2.49.1.tar.gz
+md5  9bd25191c4cf31e6bde58788a297e8fb  google_auth-2.58.1.tar.gz
+sha256  1480461d8b2347e679af758f4003700ea79a59b603c9134e18bfa95e8004ee70  google_auth-2.58.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-google-auth/python-google-auth.mk b/package/python-google-auth/python-google-auth.mk
index 8e54c52f49..c3d6d3ed13 100644
--- a/package/python-google-auth/python-google-auth.mk
+++ b/package/python-google-auth/python-google-auth.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_AUTH_VERSION = 2.49.1
+PYTHON_GOOGLE_AUTH_VERSION = 2.58.1
 PYTHON_GOOGLE_AUTH_SOURCE = google_auth-$(PYTHON_GOOGLE_AUTH_VERSION).tar.gz
-PYTHON_GOOGLE_AUTH_SITE = https://files.pythonhosted.org/packages/ea/80/6a696a07d3d3b0a92488933532f03dbefa4a24ab80fb231395b9a2a1be77
+PYTHON_GOOGLE_AUTH_SITE = https://files.pythonhosted.org/packages/52/aa/8055c583f8eb69dd4544f0d6a83e22d2f01ab38bd2ce848ea599c259a2d2
 PYTHON_GOOGLE_AUTH_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_AUTH_LICENSE = Apache-2.0
 PYTHON_GOOGLE_AUTH_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
