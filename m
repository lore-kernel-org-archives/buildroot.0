Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AD9C982C0
	for <buildroot@archiver.kernel.org>; Fri, 16 Jan 2026 21:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72B3B61667;
	Fri, 16 Jan 2026 21:34:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zr-xRkdwqW-a; Fri, 16 Jan 2026 21:34:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A70B61668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768599244;
	bh=tno/JALGnOQnperzlSIHKL4pFdM2C/VDd4bGgaCZYA4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Fp4pdmgsWlIYdHTgE3lHIkjZRTIz12kGGRPLNpbr5fljt9CbNGH6wRgxbm27RTPof
	 QQ5JafL0H8olhEN1diNVE2HqZLMUX5i4c1DMu3RMalcxnWjHntgat+kDhhXje8inp4
	 V3putvGDoZODk6GJKFW2StpO7U1PCp0IExQVG8PwJ53KRP/y0MZ7q60weknSwN7QwW
	 gwO9TA4zAH7Uru974p+nrs7Y6h4Vjnm95UWl9nzhzzpftFSusS1xGc/aC5zjDoKPBj
	 plZCv2jzrMzAn1Ad0suvhTBy4/5i9IeaCEqhqD7j3tcOwi87gQ6n/5cJods2EvZSA1
	 U4TdxyHntzquw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A70B61668;
	Fri, 16 Jan 2026 21:34:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A039160
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6032661668
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:34:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SdY5tFFhvsaa for <buildroot@buildroot.org>;
 Fri, 16 Jan 2026 21:34:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1E9E361667
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E9E361667
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E9E361667
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:34:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc04.dip0.t-ipconnect.de [84.161.188.4])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1C0BEA4C4219
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 22:34:00 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50322)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vgrSB-000000006Ck-1Tlm
 for buildroot@buildroot.org; Fri, 16 Jan 2026 21:33:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 16 Jan 2026 22:33:58 +0100
Message-ID: <20260116213359.2747785-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768599240;
 bh=E+vGu7+DS+Cyi/VhCr/4vSobVQbShC0V6kathNc/Pus=;
 h=From:To:Subject:Date:From;
 b=SZ4XEvUOLW03VJ79U8QjE/Kntkfmj4FnXOYsFSEtq/fK+XBhwblFnUMfjjrWn64vh
 jofbcIJ0bIMyziB7g1YjOvPUJGfCHh+T39DqCTRQL4JkpPIgjMtlwCVOte+doX25pU
 nW4Y46ZtbIZ4ZwBqfekk00J2vwEM4M940gpF8op0RflUrVG7C583ZqQw08VAvMHbqw
 dxE3M2O3ZaZ+T/CLMM7NGfFjJQ+U6mjvlApFp1O8J0S6k8FcerbUeJjXcL5w/43li8
 2x5XdaBLuSBda7REmwcuRsM3qNDIor1Jrd6tdzLGX4MlL6aG16DhMXJVE0ZbM469mb
 fhbJziANYVkPg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=SZ4XEvUO
Subject: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version to
 26.1.0
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

https://github.com/intel/media-driver/releases/tag/intel-media-26.1.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index ad742a3af1..a3a61f867f 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e5cf57c66e22359d1ec07d766b04e5da43677b9330999ce0dbf686aac60cf6bb  intel-media-25.4.6.tar.gz
+sha256  b9bb6177a36c69a44d821062637b4bb69f7751e8a3be354e5402e1abdf93b96a  intel-media-26.1.0.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 0ee1854259..9bca1d8640 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 25.4.6
+INTEL_MEDIADRIVER_VERSION = 26.1.0
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
