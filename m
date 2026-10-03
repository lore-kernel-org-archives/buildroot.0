Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A14CA5FE4
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 19:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57F26813C9;
	Sat,  3 Oct 2026 19:33:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tc9n3wI1ENbL; Sat,  3 Oct 2026 19:33:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5272F8139F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791056013;
	b=MqX/0fvRAkUEDZKCWrvSNzBnsBHGGMOYL6C1i8Wx8gkfpDRLJ+nBOwT5QOs23mlPGJLa
	 O9T1UArRJaboaE3II8nGLX10zYqsqhqQ7FSWFxuiTEoPXtdd3swpmZsotIf+HZHLjNECY
	 jUzyRSsQHNzY6FLVFaOOUaBOWOLuNqVHf5cVPAvZBbi4rDc7fCBJWiUUmLCQrjo3n5xNP
	 vgUSarwWfdzNfLwTaXt8dV1PkWFqs0CRPGgs0FqxqoyONIQb406vWG0J0hdoaPecynU/l
	 ar0gwBSt7s2+suQP1Oa3HnoicVCASoUqQ3xD1kpeiIn8rGZqmnScTM4T+OWheeYbZOg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791056013;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=sWgJb/u8xYS3sc9/gdqIT4Ff1hExYMF/VBlz76ljGG8=;
	b=rdBh0vs1uP0UwYDx1cVxRlatzLuyVCAupiTsnqeOyKpeUO9b1owLM/0N3vvcbAW8AnYT
	 Q/Oolpl99ioGVmaz9Xj1NpTnkXz7mYIweZ4l0kBh1ludAy25ax+vxNv7qz3xrVtfKfiYC
	 AyVA9GM4/7GHXrOSGyxusy2q1iYu0FdudkeU3hXWseY+KSTz5S3AbYdz+mP4x9h1vWbD3
	 e9efP+/v9Um//L7RG2IBF+mlqBcOOOFNRCAu+8J7H5rKHy7n3KYclXRLZzTruJTuKX+92
	 WgKnmhJajXADQCdeNYqaafCWi15QpYaqNwCB66vFda2Qe19mtsVhIvIWfGhBuKlRvIQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791056013;
	bh=sWgJb/u8xYS3sc9/gdqIT4Ff1hExYMF/VBlz76ljGG8=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Xca4Ib3MMFMFtV9gCLlHFlLQdGDZIkgu/4tyjr4s7gK4j0uP1ISRU9gy1huPzJhYG
	 aYERVMZM2g6T2eybmpcRKKb1KuBlUeuAZlzqdgY/gYiTQcKhzui2+dWtu+e8GPKtHI
	 Hv2/sFO3LO9g4T1ijRXcJvOrEqCIalqaDrrYnzX1Hx2+pCNMQyeGe6JNWlnyj3wgxx
	 DrVBXGUjtXpTlYnfn7NjWaWkcdAoQtSRB5fqIhv99u2AfNqKQ2n/QAjpKA8kdVjmjw
	 hMzsd6jD8t0i2NMsr9ruItriXKjmcfajvtuAwEstgX6D2Qxyqqldwz+iWlqsi6Ykmj
	 7gbI+Eyz4MhlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5272F8139F;
	Sat,  3 Oct 2026 19:33:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BB851D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 19:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CB544007E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 19:33:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I4gtbxdj45SG for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 19:33:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org D6C6140064
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791056011;
 b=OKpbm9qrdBe9igY7VrU6JG9tMda7lMjTG/9H+5ZpbVKY10mksTFH27RMt0jsmxg+8fd/
 YzMQpC060UDLyw/OeKcfCJTFXQUBDiMwMWP4GsnzNbT5NikvUR5huFO96jZNLXqxp+uty
 wjV97GGVz+4CpYPgo0jWNHjhP/USN6gJ4+io2b/QGPQgyH/zvsBA282Q0ZOwTy6d57WF7
 SOjtWpdMGjpFfga21F4szLojxjAmq0Vp06tHz2po+tvK78W6xokrjb7C1CC36JtmikDdw
 hCr8/7MwlAD+cnYChr2p1FCw2QcBU2IscHxoPdV2Yd+Lqc0qeBvL1Wcfff3noxzY7xg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791056011;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=YrZ6kmG0igTKU6LfLZ/8ef9V+9PrS/REaC9BdmfLScc=;
 b=ipWOqVg3H4ukG7TWrzoj2OfbF9K/o7ay0/9srZZAA6cy715EbXf0D1iAmH9S/oaZRoFi
 WHbqjtYyiautRS7fjDCNhy5OqMEB9Qg+DzvdZW0YX11Z5rOauOIbxdgayXxGfzJUYyres
 9irhep/JXIh7reKP49v3XVKpmYPY1RoEQbD+AaWexy9Xxg9FfN4OhTFMo51/iTurBDzIk
 jS2uibk3X9F6Asoana0b/lE/sLBOSS7uVV7esDXCv7iUkyvIudB4f4RZOwKwXVif5ZCST
 vKn14pAp1uVrtXf9AssY3TOlh1F1y5Py/+HJclSoZHnfyVebjnBZoBrOoiWKEloTWcQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ee1kkNga; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D6C6140064
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 19:33:30 +0000 (UTC)
Received: from home.juju.sh (unknown [94.230.151.199])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 372415FFAF;
 Sat,  3 Oct 2026 21:33:27 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sat,  3 Oct 2026 21:33:15 +0200
Message-ID: <20261003193315.440847-1-ju.o@free.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/fwts: bump to version 26.09.00
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See release announce:
https://lists.ubuntu.com/archives/fwts-devel/2026-September/014232.html

Release notes:
https://github.com/fwts/fwts/releases/tag/V26.09.00

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested with commands:

utils/docker-run support/testing/run-tests \
    -d dl -o output_folder \
    tests.package.test_fwts
---
 package/fwts/fwts.hash | 4 ++--
 package/fwts/fwts.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fwts/fwts.hash b/package/fwts/fwts.hash
index 89ee2a5e6f..6b606e4db4 100644
--- a/package/fwts/fwts.hash
+++ b/package/fwts/fwts.hash
@@ -1,5 +1,5 @@
-# Hash from: https://github.com/fwts/fwts/releases/tag/V26.07.00
-sha256  ccee3375fe905a30311ea45f8baefc10af2517669f724f09f8df788bb8b4cbec  fwts-V26.07.00.tar.gz
+# Hash from: https://github.com/fwts/fwts/releases/tag/V26.09.00
+sha256  dd322a2392665113576da3392fd422884646f261dfbef72f741d7f6cc87c6503  fwts-V26.09.00.tar.gz
 
 # Hash for license file
 sha256  1ec8cffc8cf213afc5d854027d746c80e638a13b1688f2a352221490c681c54f  debian/copyright
diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
index 1f135c72c9..3c2fe96e11 100644
--- a/package/fwts/fwts.mk
+++ b/package/fwts/fwts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FWTS_VERSION = 26.07.00
+FWTS_VERSION = 26.09.00
 FWTS_SOURCE = fwts-V$(FWTS_VERSION).tar.gz
 FWTS_SITE = https://github.com/fwts/fwts/releases/download/V$(FWTS_VERSION)
 FWTS_LICENSE = GPL-2.0, LGPL-2.1, Custom
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
