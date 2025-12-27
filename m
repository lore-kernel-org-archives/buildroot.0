Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB01E8FDCD
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 13:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 512F360690;
	Sat, 27 Dec 2025 13:21:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YXxzPJahxPcX; Sat, 27 Dec 2025 13:21:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 879E560711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766841718;
	bh=2UsFqCThD+hPEpuHauyeqkZy2Mc+S6G6YPdbNypv43Q=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Tmipdncl3B3GEReULh9jZLE40jFF8wiYKJZmhnIXUgwV/93KH4f+KxTycc8JRZVgj
	 tZ7rdGQUYJJHLAu9tpgnTECIy0+mLivwp0b8FkqV8l7PfqV56M8mGxA7dOP29GGuhc
	 z+kcZNULMkznZAuHm2vlcK0o3jzv1YaxtDATia4y9q3/k/10kdqviym+fN+tRUhTX+
	 nZsjObsUBXa2sANnIGBufhfGaMEBOzU/on5dyBIHXwxBupHeIPKSBXKi0Wvnp6AvsC
	 O3QiIWZyLh+3TIyyaT2uBrfDpt2qIreHbgb0tV3KR/R58hfBhCbdfB3L9rYcyho495
	 6frwEc4+kwKNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 879E560711;
	Sat, 27 Dec 2025 13:21:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 248C9119
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 13:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C8D640417
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 13:21:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GX7CJad8KaEm for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 13:21:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.218;
 helo=smtpcmd01-sp1.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 36E024040D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36E024040D
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 36E024040D
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 13:21:53 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id ZUEvvLMYiGVgvZUEwvwKtV; Sat, 27 Dec 2025 14:21:50 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sat, 27 Dec 2025 14:21:48 +0100
Message-ID: <20251227132148.704963-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPO47k1Ni35mpKH8Hmdsp+17tkbXkLBdCVPwiMjPN2RVOmjbftduO9/F7d5t00+Kit983tRFdMnLBMzWM3XWhWGwRWFDOmHoZFN6X1tkmo/Y7RIKTLct
 e4zPlxjf9vPXzovMGKOMEQEAQrSSwKuF4QwLBu/viEytX9JhjIN7FFTgUeRxGOcGvsMO+oK/sjqDby+BO+6OqDNMJjy2/aVox7UqpkvFhRJaHfKC8A1C5VCP
 gWBehW4rCwk3Ws7FdxxqXDpwkvMljcWGTQudBVI4Ef0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1766841710; bh=R16PAkYq77tCwDXL7Gwgqxl+aboUFzhVpnq4lSDhr1k=;
 h=From:To:Subject:Date:MIME-Version;
 b=cesSKGQbdMNamnrDxlOU1ZUOz5qN1U0xi+V1GhfNFf/7EHJIWYUlCC9PSh1IJa2k5
 l8BfkpcdMxewPPFcqcaQufJqUqY/lkCXZMxo0CuDU2fonExrgS/pV0MHsIzfT90Tbs
 24sQMGLIQu8HaC2x2jlPTJFx3TOA4b8A1a3NAjKHqwStqLeY66Y0x9Nj4WNVZMYXgt
 otQHC5Gun0wG/Q2JO/mezVyg8orxY2KXM/GDEjX06BItxtZsRWRb4S8WZ+uDHD4CAE
 w2FX8+KO4ybUtObf2kJSzisluzEGnPYCbdG1rEcZNaV0Cbcz2HspELmI5DTOQ0J/S+
 +4o01/1++cKzA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=cesSKGQb
Subject: [Buildroot] [PATCH] package/dash: bump to version 0.5.13.1
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

For change log, see:
https://git.kernel.org/pub/scm/utils/dash/dash.git/log/?h=a768fcc0aafbe50a37d2d06bba23eb6671d3a9b3

NOTE: Tag v0.5.13.1 has not been emitted.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/dash/dash.hash | 6 +++---
 package/dash/dash.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dash/dash.hash b/package/dash/dash.hash
index 4697d958a3..df0f6044bf 100644
--- a/package/dash/dash.hash
+++ b/package/dash/dash.hash
@@ -1,7 +1,7 @@
-# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.13.tar.gz.sha512sum
+# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.13.1.tar.gz.sha512sum
 # After checking pgp signature
 # using key 9F9D45FE50AE361530983792C7271D0A49B18BA7
-sha512  428de1f65ab77d5fee88bbf4ba8642d77abfda223a4ede423d09db9faa4f0347199b3be841d63b93a7ed68f714ef54ff41b2dc936e4b7ebb19b74499ed4e6a01  dash-0.5.13.tar.gz
+sha512  6b3d67f76e74853349fe99121b2ee96d32da9863042744e03984eb6a01bf437eee2f2e81fbdd0436090abfecacc2f5589960820c3d0d5f3dd580948d38d5dc1d 260512 dash-0.5.13.1.tar.gz
 # Locally calculated
-sha256  fd8da121e306b27f59330613417b182b8844f11e269531cc4720bf523e3e06d7  dash-0.5.13.tar.gz
+sha256  d9271bce09c127d9866e25c011582ddc75ab988958a04bc4d8553a3b8f30e370  dash-0.5.13.1.tar.gz
 sha256  254a7894923ff62e69184a991dcbccae97edee58a1105e8efbe78caf10595d72  COPYING
diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index eb646e1a4f..78effa791c 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DASH_VERSION = 0.5.13
+DASH_VERSION = 0.5.13.1
 DASH_SITE = http://gondor.apana.org.au/~herbert/dash/files
 DASH_LICENSE = BSD-3-Clause, GPL-2.0+ (mksignames.c)
 DASH_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
