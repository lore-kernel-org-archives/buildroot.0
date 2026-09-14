Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF905C88E72
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 22:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 725444051F;
	Mon, 14 Sep 2026 22:15:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G2hgNVRZw6Yo; Mon, 14 Sep 2026 22:15:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 87DBE404D0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789424150;
	b=r3lKLnJ0bo6bytMb+UqXggrnNlc8mz5+ur+IFMGT36bDyqxT9Dot+fE/pQo1BMmA4HOw
	 tcMv2mtnPifSnCUOz0BVjDNeu9bwXMxsOWzhbD53W0zt5HZXU77KXEcWowPXpC0Lz6s2a
	 poz5eWGKyaQo5EOhze3+ugiRqJpJlYYNwPvajIf/fmMWh0/Oipcnfpe0AspCXCHVZvu17
	 PEEyTR5kPh2BKwILSW5FCbNwWVNCl82ydHqzcaNvDgU3fSdn/jkKNqadk/r5fhiKY9cbj
	 m5tdHudmGF9hRbvf+uxkl7Z2/55pO/TAEbuhR9cjsU8ztd9xoXP+SXy+sewNyNT2SXA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789424150;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=AddqrbXLgaaJbZB7drnbG1hQpYaoDBV8NemIJOCn2UM=;
	b=IrnsiCdBnbFShVDSZ2YOMd/3mu20QgT5Xs/n+KKGL0edo2t29gC0ztz9K6L60agmpD/i
	 yFSNMQ5XTx2SHwh1oLRTLkv9vclT/ELsgUym6e+gfGxAjgsdPTJo5T3hXSND5nP/W+iu8
	 UeExa+oVnhQW4dHpJ2LcsXCRNyzCHiJSUTs7FL1Ig/aY5TqhOpLGvy7O3eoEh08GLK61K
	 +JWlmSHBsog+vbF1NN8nsUSEGj2I6/eOOm5Q5iEZ7ak9u4hO8pMy/3X4zjQFzSueZ0ASa
	 SqrBqm1BzFpFEyLhV5K/zAV79D6wfbiNUmx+lyAqQxPPbc9/ML6qys1JAs+BuqX0DMA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789424150;
	bh=AddqrbXLgaaJbZB7drnbG1hQpYaoDBV8NemIJOCn2UM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YmYzEjj8c+sryfI0pH7Sr75E2NAaOrVqS1fCbERykjMRv4K/sRz9Oclg1gpt56H2b
	 LWs03wTduNVILIddDYAZg4LqSSyGsHKbEC09k8X+xLDgmZAm4UGFhi2elAoE56Ejww
	 QI6sHOVz8bljXhKlx5SmYri8iHfn58GPfvRsg0Vc6CamFqkU96h2AHEdtz/++23uSW
	 KylrGTReqBbgl67Ns6GoYS0b6CjIpUaLIefdQJeoEXAfJnEYGZLKe3D1llePkzgN+T
	 36aI3J6RID/wEvjX6AcDfDpAisrDRmCCSiAdn4VTnPS+AKH+YD0Wyt5g4EeLXarwWg
	 79kMv/j99gEbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87DBE404D0;
	Mon, 14 Sep 2026 22:15:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 85AA2224
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 22:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65BD06062A
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 22:15:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zkgqKEJTD0yY for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 22:15:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 17BB2605E3
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789424147;
 b=Y7ooMLYa66TIok6Jt1gWzsZJlO6E434mQ5hhBokG6dhvYFUouHKx6gwSb5fRy4Ee1+VN
 ecduvctWRbkI3iFQZZzB6rNbu1dx5qAPY/t0sLLipFtxN2QOOzA1R7W/MWPZpf4N5yNSG
 lGc8kjVWtTfOgvF4wjaiM6NVSFHbSTZ32gZ17dKq7y/9/QGa09euMynmLdqs0detkJIJq
 35Wpj0uuwedYRi8jpDhjkgNp1tQN6S/xPw7SMEjlscgL8/pvkPshaYuTGW5ZYRgIZhVYY
 0l1FZvK2BunxCMcO31+bh6YS2kyAASODfF9SO2pmMT+z00E3ofp74PqvkRrV8/wSRjA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789424147;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=zxR2CTltttwpAifeslErIdgSLEGzF0qK2+DXW4QvYQ0=;
 b=bzkBpvrSVSRakmxzEZSVifcZke3cl8lpD39/8aLS/Z1/Zj1jBdl8rKp3xHh671VUDSCh
 xpe9c7xq8pQZVgy1ppBUO2T6/01pI196NSx2fFFIuQj60LkJHo7nU3vPuHAVqxnCqSVzq
 5+Zz1/chZrPkc4j9ffuXb+JrRZKnAKaL/23P9z2aQbWh8pAVozbZvY8mk7ot/kT4xd0xH
 jwkvHmvzczhZ3Rfo9UaxZuvv4Zk4aRv+J/o9kDXRAiXsZnQclDQbgN1hRRPxizIn5xPyh
 71hkqPRMq5Npd2a+pjN6F0Jp+noEiYnSPes8WwgZ1Bdkp/NqAeAwx//33LGtMllRWeQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=grjsaeLQ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=grjsaeLQ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 17BB2605E3
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 22:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789424143;
 bh=zxR2CTltttwpAifeslErIdgSLEGzF0qK2+DXW4QvYQ0=;
 h=From:To:Subject:Date:From;
 b=grjsaeLQ2E4we0Rzbf5hFR5gsQGbiwt6F8VSrOOS4m5BTd2p1jJnTZ3AjY1oqGMne
 ZS7S/0w0HeSo2zuWSf1RKcrvuxtWSVwmdy6dL2aZFdbKij6tbCNd4tJewrn3Ww921V
 UORHtFe3UOH+bK4ytwP7DASa5FdXyzy164xbYEUDQpqI3xIhu4zQ38ihkupBiGMJE3
 eUd4G0obQGAebh2xvaoGv8ybwscHVmcekwOeo813j1VPlV3gBfG81PLNqZkaKaH1ia
 LqVRktE0TNKfTEUkrDSMjvQX34o21sZ6gEgXEW3wZRu/LQAMr7ZZXFw3xebddGB815
 D58Hygr0jGjsQ==
Received: from fli4l.lan.fli4l (p54a1b732.dip0.t-ipconnect.de [84.161.183.50])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 78863A4C425A
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 00:15:43 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38422)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x6Exj-000000001kc-1vbw
 for buildroot@buildroot.org; Mon, 14 Sep 2026 22:15:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 15 Sep 2026 00:15:43 +0200
Message-ID: <20260914221543.844189-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/libdeflate: bump version to 1.26
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

https://github.com/ebiggers/libdeflate/blob/v1.26/NEWS.md

Switched to sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/726662705ec7483713367287defefe3f6900ba38

 package/libdeflate/libdeflate.hash | 3 ++-
 package/libdeflate/libdeflate.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libdeflate/libdeflate.hash b/package/libdeflate/libdeflate.hash
index 24aad4a799..851926182f 100644
--- a/package/libdeflate/libdeflate.hash
+++ b/package/libdeflate/libdeflate.hash
@@ -1,3 +1,4 @@
+# From https://github.com/ebiggers/libdeflate/releases/tag/v1.26
+sha256  125856d4656e0feab660f94842f835923410c9281fedbcee64598c918da42b5a  libdeflate-1.26.tar.gz
 # Locally computed
-sha256  fed5cd22f00f30cc4c2e5329f94e2b8a901df9fa45ee255cb70e2b0b42344477  libdeflate-1.25.tar.gz
 sha256  4ad69099cb4374836fd27583d9991e2838cd86b6e4666ab26b2d32582c91e73a  COPYING
diff --git a/package/libdeflate/libdeflate.mk b/package/libdeflate/libdeflate.mk
index 889e04c97b..a0b99cbf23 100644
--- a/package/libdeflate/libdeflate.mk
+++ b/package/libdeflate/libdeflate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDEFLATE_VERSION = 1.25
+LIBDEFLATE_VERSION = 1.26
 LIBDEFLATE_SITE = https://github.com/ebiggers/libdeflate/releases/download/v$(LIBDEFLATE_VERSION)
 LIBDEFLATE_LICENSE = MIT
 LIBDEFLATE_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
