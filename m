Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA3BACA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A06266062D;
	Sat,  3 Oct 2026 07:12:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xaYGDw0Eq45x; Sat,  3 Oct 2026 07:12:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B88DD60634
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011556;
	b=Ook9uibDpVB73Kqq+fdoHvV7z1FiCuhO99H5NgjecNKW2WkvsKfCYCStAPCpsZWMg1Cc
	 bZ0WDWM4UMd3IgXD+CBlK2VwLazv+iABPTUORF6i2UJnJZu1rPtZBuOmRywPWXJqajShZ
	 kkIxhq9uCeej/vhVan5CxGgO02+FIHq6YVfdPo1MkyzSdypDJ0gqhT/ONPbihH8JBI8Km
	 ywjAn0oQtVNzc9xlhTwbyycnLLGqj1UvF6s9GPv1H0aBSMN37DyBCNU0T+PJ1mj+tdR8q
	 ENSoBJiSr40bAtiMbCvVTsJXAn0WehR0mFn8s2fieYFY0Mhv9z7e4UAwp7S5l/jxI1w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011556;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=TtnCPHEjPR6W3WeZmTFmnVm4iFm/TH9ojdIxvNYGexY=;
	b=GJHw4g7hrrMrClBg9wEvFQl+dyA+mbiM0qKFivqOQbmKHMWFBJT4r+0Mbt34AVMUaa5O
	 iHRzE+nvxnYSrGcdasdUC3o9wYWn2qMK9V2Aq15BQn3htXZqUYjX0KLEHay97fMC3cBky
	 VIJpLF4xkazCW0Ntb92Ojj7UvDQaFwF+hIQCKgQOLUPRdWQBlJwsWjBqy6CKvaL52aQx8
	 YS62g3QdV3T7I2DZT7zKg9Kj5RIi21cU5MrvhZq6curqLnJkyxidnQBpGd0uY/Zkz4Jit
	 NpCk8u8+5eDQYFQimAEy1eJDVbd7DSuWh2QGd+59jEyWDStPBY+XdbouCSfJBdWI+GA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=YCy0JDjf;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011556;
	bh=TtnCPHEjPR6W3WeZmTFmnVm4iFm/TH9ojdIxvNYGexY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=mMaIDTxyu2nsim3ulGNV3NvdirZ5EnmuWod9eNNNjDe8vyGPZJzt83E9cKOoHLJmu
	 WPaXUds9BwNj1QPXCgmNHnvM9VYGrOsNPE5aQWexzvZGZUz2BwNcwmEay96S25+uP/
	 20cd2RdAzdRkG5Kg0dd4o+uScnggF6MZYhR0d7KIFG+cJ/9VBu5xA6DbpB8q3ZFLHz
	 i1hqrGnpHjHc4vtK7Vs2pzPAcllNLYlVWySvsa93qNpdGm735f1PfHdfVRJ/XnHKTY
	 nQ1SHaSeXe5VHvH8kpb04VGxM9yfz5hEwsIotVeqo4R5bERDef7ckg6PpM+hu9CJ1K
	 eIqXDyj2Cr0Lg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B88DD60634;
	Sat,  3 Oct 2026 07:12:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EC96834E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE56560634
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:12:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ymdAz0zmSB70 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:12:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E801D6062D
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011555;
 b=s57L2H9WEtu8S4QYZrxTlPypdL/07WfMtd+oZCKTdCkzQ6WZ89aqdMAwKFNOPLgqwYeK
 5pMBnE6aXe/LsKN4zvrkRrR5frQOf/rpXLzl4SHazQy/5qtZxih1Vzwa/id9rXIUnEMO0
 eMGNxuPbaYb5iZgO2HpLxRsmymgEKHbDsoCxwDrx/qJajO/w3xEDknIuGF1cOCGT0y/fj
 FBqzKQIgicCDhrH8kThxE7aMS7A3LaN00WZjv3W9Iy5fA0VWkTygA9A1kdujYdpdttrmo
 59ZBuhK3gpaHM3v5MkCMZWlXrmpmXuYWOSEHgrnFdJbJqSqxR6BUZ7JnM45LMR+15lw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011555;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=j1TqkPUzByodueKFZCtHQBXJY8T06PGbxuchqG1gNqU=;
 b=O7Uv/GOdBaRKfDSPQP5hv7dcAQwwYc6r3t2SLLV/J8O+lyYBj7eN9r8Rz4hrcKG9Vi95
 2eA9DoM0lHJ42nIVIjJQ0VlTfjK/ltIGiH8SO3LOK+kdjQ93xpNDw1zbCLPoMfTodMqAU
 Ypk37gLB2hd9b7waUdYm1CNqnDyVA5C0wr9AK/ZwHoRfF760oKeNCGCiKNbi+9LUYnVRu
 pCoqWSNDMg9D/0MKyN7NR0s5MlZB54WLlvsBEZfS49jVy0i/k9WqKZOWB81R2F9HQnVgA
 IydrMuNvYFd5hCClyLpp0bHXcBw2oWV2hM0pAMP51lMJu31vMHwqY/QWgPkoHmVkILA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=YCy0JDjf; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=YCy0JDjf
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E801D6062D
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010931;
 bh=j1TqkPUzByodueKFZCtHQBXJY8T06PGbxuchqG1gNqU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=YCy0JDjfXEnjJ4QkTLS9DmvFh19OUs9YicZOmA0I4lWZKV8oQeUxjVrMy/hz8q/i3
 tA9MeaopcVv0u7rBPiVED7lxhmv4E/Zi7C2rJC51/ql+ieOc0k7Fi/ucXzaME2II0x
 MnAvOYuUSnuO1upKp226sMu7J4d+ZcWq85eBs8PY4qHnoECHQDgQ9lASeC5KL39FRR
 Dohs6PgkgC37TAUMVMin5KMKkhBYYNtW5wAZxGBYdhvCH3oK+hIc5lCbWIgY2UFx/s
 8sTlvltXTeRV6qM3mIFy1FnlVNYCNvi2HszKZ+8OFzDsj+VhciXiXgFWZKCGIfxix7
 zqp54WUtn7AqA==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 hSeG60+d67hFWwDaXGPkeFoxfHvGSeL+diIZ0DUqLdKLNIEJmbHXdxn2RIr+5yXIvaF7/wtSfgM
 W0UqpZ6xHbxoYbRClMct7pgXbwINB8XmXM2imHCIGDBK0/hY9qLvp7T85mmORdhbrMs3XFqx/kP
 rPtz2hehPInvOEwcPnXjjyGSepvsyFXC+lucdnbbTJOTtyvRgeXoJevewUufWGr8E5iAeFNbO3u
 c3my7R6CQL53N6hcN81jm0YF7cQBN2+1+756ztwTFhsqwDa5hauxGxvNv2v+qABnCvU+wv4knIW
 tYx5JqcjGFRt89IW+l8kKW9Y8njl0W070ib+iwihrpqMRECKlqe4ox7ReUMcWW4X7GTtZO0Qrq5
 AxA/JMoDuNKm558XUom1efymP+bWM8SrG+b6jpaSjG3MbLw6/Dr1EKh8yfUYBPCJIRTMtcXHKHV
 5kProfk68s8nxOu9v4kzlqob3jX9I6X1wFyw4Hhzb44z3H0v7VcEiyp/ex18aef/cvdcQlYuI3S
 kBF/wxRpnkU8l0G2OgsFVVaV9RvSVIAsrQTV+yeHCa9KVXDMNrlmRIQHblDKFInwX3lim0Qzu77
 wJsNOG/1WvbIgqgNslN2j0WOqYQ/AMhFO1e7HxUgJxpkvomXce3Q0fxUrHciSPwq
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CB43EA4C543E;
 Sat,  3 Oct 2026 09:02:11 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtki-000000007Zo-0kMB;
 Sat, 03 Oct 2026 07:01:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:01:03 +0200
Message-ID: <20261003070128.1295458-91-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 091/114] package/python-tomlkit: bump version to
 0.15.1
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
 package/python-tomlkit/python-tomlkit.hash | 4 ++--
 package/python-tomlkit/python-tomlkit.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tomlkit/python-tomlkit.hash b/package/python-tomlkit/python-tomlkit.hash
index 51c8a2b560..d796a1c53d 100644
--- a/package/python-tomlkit/python-tomlkit.hash
+++ b/package/python-tomlkit/python-tomlkit.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tomlkit/json
-md5  5afa19bb5604584a7c7e718a5c0d8059  tomlkit-0.14.0.tar.gz
-sha256  cf00efca415dbd57575befb1f6634c4f42d2d87dbba376128adb42c121b87064  tomlkit-0.14.0.tar.gz
+md5  8e5245fd4099c9a6f99774b24a4591ae  tomlkit-0.15.1.tar.gz
+sha256  e25bbf38843005246210a12982776f27f99cb9be67160e14434d0c0d21ee1e97  tomlkit-0.15.1.tar.gz
 # Locally computed sha256 checksums
 sha256  f2f9b460ba719da6626add264d3782f275a4ff7aab677beda08b330911e23adb  LICENSE
diff --git a/package/python-tomlkit/python-tomlkit.mk b/package/python-tomlkit/python-tomlkit.mk
index df7b66f2e1..1466772fd9 100644
--- a/package/python-tomlkit/python-tomlkit.mk
+++ b/package/python-tomlkit/python-tomlkit.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TOMLKIT_VERSION = 0.14.0
+PYTHON_TOMLKIT_VERSION = 0.15.1
 PYTHON_TOMLKIT_SOURCE = tomlkit-$(PYTHON_TOMLKIT_VERSION).tar.gz
-PYTHON_TOMLKIT_SITE = https://files.pythonhosted.org/packages/c3/af/14b24e41977adb296d6bd1fb59402cf7d60ce364f90c890bd2ec65c43b5a
+PYTHON_TOMLKIT_SITE = https://files.pythonhosted.org/packages/94/96/e07752635b98536177fa1f37671c8f3cdde2e724c6bcf6034b2cfb571565
 PYTHON_TOMLKIT_SETUP_TYPE = poetry
 PYTHON_TOMLKIT_LICENSE = MIT
 PYTHON_TOMLKIT_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
