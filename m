Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B6EEC982E6
	for <buildroot@archiver.kernel.org>; Mon, 21 Sep 2026 21:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F29A8407D0;
	Mon, 21 Sep 2026 21:45:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j4llgtP-CsGX; Mon, 21 Sep 2026 21:45:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 470214053F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790027126;
	b=Y4z6zBVDaSGqkzmrmncTw692EWo+MW8/t6v7pr1dlzuHbUOcjckC5Ea9PEvpXS8Vgwks
	 ChcfatjHmEti7mInXW0zKhlbqAIAZYdXqjLpy4b8JUk7CHlptC+rAY3KI2RXWuFTA8NFV
	 VMye4igoYroEN0v5x6k/RYXExH+MjmNvIAPO6ryNbwglqSWIif+dQZhP7hcFlTmROv2rY
	 /vi0iEKVPbZFaMZhoCsXNOX7sDsJ7tHSOv+BeH0mILA47Y4lPqb8SKhk3sPQpvdX2qO6B
	 p9JUzT9W2RAqVqcZYeLo09gBBOWyfzYudIFkNkLWeWos2TGa5mSEJNQ+mfkR5bG3VLQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790027126;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=avDahGO4R3TqpHZ3JXuQzOXUiWtGpgF6yxxkZDyTrME=;
	b=Q53xqBKM+gbOWZZrZ3HIDPOiwD6LUfEnNOZW8WhbOZU/T6RkeUrKvv2KHOiuWxMEzunu
	 8TO95LP3H4RbC5sdWxL2ZqTH0xI8bp6KfK0oDChpdKreJR+4vjZvVF+2+7AFXx6cBBpn5
	 ePKDlHtz0H9x4hpZYp6+Au7xTf+tDg3kw0GOo2T08nd+UMGBCF1GO/gAvt2idnPU3nizO
	 riz8/Q9mt3TM+dzMsZnisUP6QiFHj6JioTAH2VpnYFpmfVPN8B61r3ZQ73F9qKsZhlHtf
	 pMUmD9lx6cnDiuu6Pw4fq9guq4igPhMyiD0hhtzA1PdsY2neVUVwoCaX8Q7Nl20S3pQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790027126;
	bh=avDahGO4R3TqpHZ3JXuQzOXUiWtGpgF6yxxkZDyTrME=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NTBg0nroxEQkajO1hyNMNwS+iliRLTrfpL/r+jsW/eMbU7oKFAF0bpQzOLsObufbw
	 PxJQfui0NybbEH3A7FADqTeblplGQ6iwZ7BQI0gJ4IhwQU5+jBh+ehuKnvY4gaqD3m
	 gX4wJkDt3hLXui5JO2vjp5mGB0wxzegf0AxvxhwQyvkAk0jI97xClmGLys7IMwpweI
	 Ku6Kp/hyRx2CJJv32r7XJ3c9M+wfol+BB1WYEoV5ekDICEgVjfxhL3XUjv5yK1qTVa
	 ranPtRLkce/spjepKFf/58ztmnd1YmcYoEzY01NxFJvvyjMbbrNDHTAccml2X9bCw9
	 prAfagcvioD2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 470214053F;
	Mon, 21 Sep 2026 21:45:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 98F9C91C
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 21:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89D9E80C95
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 21:45:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GlfIG0fPfg50 for <buildroot@buildroot.org>;
 Mon, 21 Sep 2026 21:45:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 36D6980C86
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790027123;
 b=pD+BDYlGVCN+SFAaKAZamlmc/FkpeA9YmGWejJuLpW/vedlDcUR7atxXb6R4G78OV6un
 yb5ms932SRgCf2ilQlS9vufQN9hDbvBzvwaX9Erb1diFQFg4SjaY0pOYzr6Kk5OVC3O3K
 F0JkGd7tbc+U0//2Ckz8zMXrjOr2JX2vYTFZM8VJra2rBF5KvKtjmPKlYC9kaYo6VT6Aw
 +CwOnX5T2c5wtk9uCG2796L3gkP4LzepAr682rJqNAYYJtCEPol78CbekK8ZJggTGLjpD
 iv4uofxJOI193r39phKfSnX5AWT30aR52f7TxE8uERB4nbMx01msvQ4tTsWj1ACUItg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790027123;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=TftEmR6fNKQgAsXubQJyZgoIBFBdqDiKSmd6rZ7CXqM=;
 b=kdxBP7wE3NNpwUoIywteQUPE0UAvdDPTmhsdKUF9ZI5xvjTOdmBGLnM7RiB5N90YZDm8
 GvTgDsS0uZpYsv6H5M+Rs1+bWdMI/fOR1HQH6CaDLddXfuXyyYV7s9RIU6kSib5wCWoGy
 6eUadZzgofVkl0ET/EJAKLKWsQiIBIXiYp1Ix3Qqadw5irsUYTyJPIYLsIWrCmh0oPwas
 bdMHPyhxEXcXJ9o97J6/5UZriAzosdYlYdYrPxZVFw7by48Y6VCfuBb4gTcxqq71u/UoI
 NGFasU23k4uX1ZIDOuG9jMJG46k+yn40wAE7sZDZWhQUpoJrVzFXdL5CjbOoIF0uE/Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="gw5CazE/"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=gw5CazE/
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 36D6980C86
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 21:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790027119;
 bh=TftEmR6fNKQgAsXubQJyZgoIBFBdqDiKSmd6rZ7CXqM=;
 h=From:To:Cc:Subject:Date:From;
 b=gw5CazE/ynrpDmev56FneSLn8ny87wLozjQ+PmgKlo86OyZ0m+66+cNVzpPU2HEa7
 3q3G7JZCytLJOshaCmSEq6Th22Bs+rq3quDtDXYyxiCDO8AuTdA46m3MCVGppvR4p+
 Bbc4LO9PwJMS7QL8UrwwitdHOpuiGCTsCXIbP6dhKQx/CfZa6RmleHNezAqJxH6Cdo
 2ChGEcw0wpGdcKkl4veHa3RbQyx1uWt0R68IUCiIrSnA5gwf86rtFp9pP+1KlFvI9c
 g+mZ4shyibkCLHAHtl0v0yVUp4z2ugFpBxVXDVmmx7p5AMTmuCdRUqHqx+3HNX+5N1
 CBfDsQIBfTy4A==
X-KAS-Sym: v3:f51bdf72230551df:ZqUfWfh+bMOjEpHfPHR3UZ2ScZEcJUXGAcocY45NRs/fF0r6dbpMWakOSXXF4lfp30limGQldOV/aAp6ygOEGLZy8CUGhrkOWhFyc048C5vNcJcGgAqTNcO8JVFGWlTaZN+QPuUp1TYa4Zkn1tCnBm1+7KDNERFCyANJpGbKek56jDdK1t4P7GOgFlhjcTlFPiPNx/dv1+N8+kOp1h9S46JqaP+fgHcKiJzud+Tt1fMhyNV5sl2SvzYJcbbyBnMGKoGsbO7ktDQVHjAA6lC9q2ANxP2n/S7qYj8Z/WkEv1P+iHFKrWlcVtwhPGMQ+7OS22S/zDIcIRN58NA3qH2ZQw==:FzpYmfLdNrfzbAtj5T5o0hMXeWvmC9NyrPFZeJvlB9Z50ojH83AdVnRDtrCxCWjpzrSHmeTJ7AvQsgu2GwmwlCtEAA+rOhktMDDQ/mreZtNbw7quF7KlWoqqbJuvohJZF8a+4LWJSsfZin6YvTYCsBXa9tMTJC9xRgPIN9Su9AriMa5EwysWWD2U84Ww5rnC3Pmh1gqfw7hhRLpOVJN71b87G2bTEmof4jD+NSPItdqA374xkXJXCKakXsHBjnauw0Cy/D1nmdO20I6Ibd8z2EMuzyycujDR2LGaybgCJbzVX5fN0VGFpqZHS8eZqmETe6HnZUhojNhtjslbbZyAX3tZKEH/3m2ZYskvwRu4luD46EkM1qNOrdCbm6a9OXbBRhM0CltdsPxaVnxnc6CngDgbQR3DRlyM1Xu2Iy3E+lrZdhReaWWmyc4oUqHllVcwrkQB3+/auunz7kY+qP05LmUzPOgUecuwS8/Pn2tOn1zu+Ff77HSSYGeJ4y/4YvT9LM5d7I6qTwSecshKu1hdaU3fNJEe8sXdBgUABsRnewUYu8kYqfdEdeqyJsjU/jZUWUeMmvxkj2xBtfk2FSTW0ZR2Iqk0nTfXAPVeolMLFkWg+7
 TJIiZ/Jmf+FE+b6E0VhMSm44Vj5HAs7KSiTVKYaajKpM781krqCrxXWUXqwLBgsXYqmrfuln6noszhPZ4q
Received: from fli4l.lan.fli4l (p54a1b329.dip0.t-ipconnect.de [84.161.179.41])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5A3A0A4C3483;
 Mon, 21 Sep 2026 23:45:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53096)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8lp9-000000006Qx-02m5;
 Mon, 21 Sep 2026 21:45:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon, 21 Sep 2026 23:45:17 +0200
Message-ID: <20260921214518.3764002-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/2] package/at-spi2-core: bump version to
 2.62.0.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.gnome.org/GNOME/at-spi2-core/-/blob/2.62.0.1/NEWS

Version 2.58.3 contains a fix for a flutter-engine build error:
"What's new in at-spi2-core 2.58.3:

* Fix atk_get_major_version etc not linking on C++."
https://gitlab.gnome.org/GNOME/at-spi2-core/-/commit/5ae24f981ddce448682d123fd71ff20329bdd014
https://github.com/flutter/flutter/pull/178712#issuecomment-5265225780

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/2d129445102659bc17939cb8681f6b80c2b5e985

with the exception of an unrelated build error at
bootlin-sparc-uclibc/build/dbus-1.16.2/.stamp_built

 package/at-spi2-core/at-spi2-core.hash | 4 ++--
 package/at-spi2-core/at-spi2-core.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/at-spi2-core/at-spi2-core.hash b/package/at-spi2-core/at-spi2-core.hash
index bcf3de9a44..df4d91751e 100644
--- a/package/at-spi2-core/at-spi2-core.hash
+++ b/package/at-spi2-core/at-spi2-core.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/at-spi2-core/2.58/at-spi2-core-2.58.2.sha256sum
-sha256  a2823b962ed16cdd5cb1fc5365029fd218394d852acd4098b321854bd6692f6e  at-spi2-core-2.58.2.tar.xz
+# From https://download.gnome.org/sources/at-spi2-core/2.62/at-spi2-core-2.62.0.1.sha256sum
+sha256  fa462f1834bae569c5944c34608872f9447e5a2889ba2aa4d5ff9f2d6ff8a395  at-spi2-core-2.62.0.1.tar.xz
 
 # locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/at-spi2-core/at-spi2-core.mk b/package/at-spi2-core/at-spi2-core.mk
index 72703e923c..8188710141 100644
--- a/package/at-spi2-core/at-spi2-core.mk
+++ b/package/at-spi2-core/at-spi2-core.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-AT_SPI2_CORE_VERSION_MAJOR = 2.58
-AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).2
+AT_SPI2_CORE_VERSION_MAJOR = 2.62
+AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).0.1
 AT_SPI2_CORE_SOURCE = at-spi2-core-$(AT_SPI2_CORE_VERSION).tar.xz
 AT_SPI2_CORE_SITE = https://download.gnome.org/sources/at-spi2-core/$(AT_SPI2_CORE_VERSION_MAJOR)
 AT_SPI2_CORE_LICENSE = LGPL-2.1+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
