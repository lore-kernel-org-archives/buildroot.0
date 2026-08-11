Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634ACC5B56A
	for <buildroot@archiver.kernel.org>; Tue, 11 Aug 2026 11:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12A2E6065A;
	Tue, 11 Aug 2026 11:54:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l3YPM2mCJ3_c; Tue, 11 Aug 2026 11:54:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BE2260693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786449275;
	bh=ftId4ZJJJJpOKduFuhgpXl4e4XBZWvVS6c1TVLcyhII=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=S88DS9tA5o9o5E5V7Ny51CqDRwfzmfnTe5rB0s3gOezCqhYmsxv/W5j2lutGcge4u
	 5rLL2uCBqc5WJSLMr9XLZkAXEkPos01dOJs+WDHfYls7Ngvy3D+1y2y10OIpZH9NYy
	 5HywrYdSdvQ25m7tKDxe9Ra8cLzxYlLGjmnXtQnn+kWfgvOAjqLIWn4oTGzrjUj1Gs
	 dqQzXyqf+JPyQXaxuV4tv/rTgKicUh1K1TyH3mQKhUe2jHSEp2WmEJyoQDJdWAAt6F
	 HJgFnSmYxOPuu/rGW77TZkZlDASxzOS/1fhX3Iar1AN6n3IvTTIJCLEFA32nXRyO7k
	 ziAoQWMjufDkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BE2260693;
	Tue, 11 Aug 2026 11:54:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1464D345
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 11:54:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06E1080FB9
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 11:54:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q2A9hSsGIIHN for <buildroot@buildroot.org>;
 Tue, 11 Aug 2026 11:54:33 +0000 (UTC)
X-Greylist: delayed 312 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 11 Aug 2026 11:54:32 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C8B7C80FAF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8B7C80FAF
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:67c:2050:102:465::202; helo=mout-b-202.mailbox.org;
 envelope-from=sebastian.michel@oss.othermo.de; receiver=<UNKNOWN> 
Received: from mout-b-202.mailbox.org (mout-b-202.mailbox.org
 [IPv6:2001:67c:2050:102:465::202])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C8B7C80FAF
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 11:54:32 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-b-202.mailbox.org (Postfix) with ESMTPS id 4hK8zc2kRTzKnX0;
 Tue, 11 Aug 2026 13:49:16 +0200 (CEST)
From: Sebastian Michel <sebastian.michel@oss.othermo.de>
To: buildroot@buildroot.org
Cc: Sebastian Michel <sebastian.michel@oss.othermo.de>,
 Manuel Diener <manuel.diener@oss.othermo.de>
Date: Tue, 11 Aug 2026 13:48:51 +0200
Message-ID: <20260811114854.690028-1-sebastian.michel@oss.othermo.de>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4hK8zc2kRTzKnX0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.othermo.de; s=MBO0001; t=1786448956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=rBnvUxfmVm/Oe0mewLekLgbV0isBClaGi4+Yxoy30Wc=;
 b=FcrrSGJUDZmTgBoq/P5UYJ5wTk11ff54kjlF4RiHNZC+7W9Sanw+aapjLeht7DAqr9dS5M
 03BqbHy/ozHEf/tZc5nohqx5u8RfBtiZYOwcikU92EB2viWI6nNsKWOhgEf0HK5L/KXAYc
 2ZKKrCPnYgq3IR/g0xQEmmxk0kcUvdAd/QQPOFw0kVBFHFvkDWY2QmA7QAtbaZ4BqH3dkW
 votTYDO5yaUQ5Jf2Xr43ujsXzPew/NLIxTv+8USxSFoKNUqFc4oCyRtbKm9SEn5A6cRfGV
 h5Ar0coeAG2FZy4XiQwC4L180vCf9mGAEDQCdKa+6HJlHY8C5y4iGIznvAGSzA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=oss.othermo.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=oss.othermo.de header.i=@oss.othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=FcrrSGJU
X-Mailman-Original-Authentication-Results: outgoing_mbo_mout; dkim=none;
 spf=pass (outgoing_mbo_mout: domain of sebastian.michel@oss.othermo.de
 designates 2001:67c:2050:b231:465::2 as permitted sender)
 smtp.mailfrom=sebastian.michel@oss.othermo.de
Subject: [Buildroot] [PATCH] package/pico-sdk,
 package/picotool: bump to 2.3.0
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

Fixes CVE-2026-25833 (via mbedtls udpate in pico-sdk)
Fixes CVE-2026-25834 (via mbedtls udpate in pico-sdk)
Fixes CVE-2026-25835 (via mbedtls udpate in pico-sdk)

Signed-off-by: Sebastian Michel <sebastian.michel@oss.othermo.de>
---
 package/pico-sdk/pico-sdk.hash | 2 +-
 package/pico-sdk/pico-sdk.mk   | 2 +-
 package/picotool/picotool.hash | 2 +-
 package/picotool/picotool.mk   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pico-sdk/pico-sdk.hash b/package/pico-sdk/pico-sdk.hash
index 7bb764a266..2cad5b4b6e 100644
--- a/package/pico-sdk/pico-sdk.hash
+++ b/package/pico-sdk/pico-sdk.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1a6a0f76cf312d528023d093f132e6c67930fc70c360533cf155998cc9594abd  pico-sdk-2.2.0-git4.tar.gz
+sha256  bbb60e768c1feeb1a4b7155da7361a135cba3ce197cef7cb93a300c559302897  pico-sdk-2.3.0-git4.tar.gz
 sha256  483f865953435b66c443dee7558debe3cc3cf8fcbb6a112fd9fc6a795d53f1f6  LICENSE.TXT
diff --git a/package/pico-sdk/pico-sdk.mk b/package/pico-sdk/pico-sdk.mk
index dfb29d2320..08760325f3 100644
--- a/package/pico-sdk/pico-sdk.mk
+++ b/package/pico-sdk/pico-sdk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PICO_SDK_VERSION = 2.2.0
+PICO_SDK_VERSION = 2.3.0
 PICO_SDK_SITE = https://github.com/raspberrypi/pico-sdk.git
 PICO_SDK_SITE_METHOD = git
 PICO_SDK_GIT_SUBMODULES = YES
diff --git a/package/picotool/picotool.hash b/package/picotool/picotool.hash
index 048a7f1e0d..f8589e3592 100644
--- a/package/picotool/picotool.hash
+++ b/package/picotool/picotool.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  42558a239b3b8f99dfcb080300e849a2eacbd0f6571efb6ccc6e259fdfaef22b  picotool-2.2.0-a4.tar.gz
+sha256  97aaf36800d2317683528cba5762e3d4e7a5de0cba729d28011a6ee94b3b7538  picotool-2.3.0.tar.gz
 sha256  483f865953435b66c443dee7558debe3cc3cf8fcbb6a112fd9fc6a795d53f1f6  LICENSE.TXT
diff --git a/package/picotool/picotool.mk b/package/picotool/picotool.mk
index cf8e294835..cf70cfc7f0 100644
--- a/package/picotool/picotool.mk
+++ b/package/picotool/picotool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PICOTOOL_VERSION = 2.2.0-a4
+PICOTOOL_VERSION = 2.3.0
 PICOTOOL_SITE = $(call github,raspberrypi,picotool,$(PICOTOOL_VERSION))
 PICOTOOL_LICENSE = BSD-3-Clause
 PICOTOOL_LICENSE_FILES = LICENSE.TXT
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
