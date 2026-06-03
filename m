Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D328CD6E55
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 07:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 463E280BFF;
	Wed,  3 Jun 2026 07:24:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S_CPH4PceLFB; Wed,  3 Jun 2026 07:24:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3BE580AA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780471467;
	bh=SF22DMIcproMIybUU7E2XCZORNcwTlTWl+G/4qLp3xQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BaDc0cwMvz85zZeO3zcPFZzLsyPWrGR9qTkiPGmm5O18sU/FAageSFM0ibRwgVDLT
	 A8e9CD2n4BexTxrWj36ywBgCet7emXJMMTzw8ODEuKGh7pWuto8ehOukVl4TpCGn1/
	 fyWAy0fCpl9ai1vD/1sv5R6UFETu8CwNJOfpZlg/+eZxac++WB7dSmQQIAwESXcA1o
	 TJ6oCxGgKEQ3/79kDwnMSYTSfvHd32m2lRBFgh/COurf4hA9ZuY9CkuwBM+oTVKBX5
	 HQCRD4lg9zdvEdqIqbGrJZpuXTcNwnlIlRSGQFVBQrWDV0OlX9oXX+al7Bw+h912JJ
	 Bko8I1AaGnxmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3BE580AA9;
	Wed,  3 Jun 2026 07:24:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C6F51192
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 07:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B86D580A8C
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 07:24:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qH8ui4780mZP for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 07:24:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.132;
 helo=smtpcmd04132.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7EF3A80752
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EF3A80752
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7EF3A80752
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 07:24:24 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id Ufxdw5fwYJWrEUfxdwD4qh; Wed, 03 Jun 2026 09:24:22 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed,  3 Jun 2026 09:06:27 +0200
Message-ID: <20260603070627.720726-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfMYJT5LANoLVZGbTAthJlSCdsu3Lz0KMaZOHTMjGVXM9hieWx1x6koTnPziWBBTDTqhFKGefb+hQBq7rTeD3T2IwL2EW2hpgRgXuNX0hGgqbM1vl3OaQ
 MMMn/2xR/MCu1OqKaUSv5frJVcA4ijnsto3gRmFcnZiyf7vAZW11a8ga8sTf8vqnBfblG2r6C66+ZPraQcwKrR29LWAZQT5MuF9S1ZsWaXZJj6SZSOcrETGm
 5u0AtsbFZwGIrHLb39Sz15LMiWm6zieKhkTwIMFDj08=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1780471462; bh=ISyWeMXiKhvgf/fvptnGc2oKSVb9FoIZvlrVLru44UE=;
 h=From:To:Subject:Date:MIME-Version;
 b=fBM3dKyjlbEnUOG1ZagV8eKGtK+A8mWIRMtzFm8Ciq1Mo0lI0bj01jbOQSgD4C9Cs
 ohNRIflqzYESuy7nCsIeaktDgBMWCPyGbKRHpGnVsHHKPHtYnaiC6VRl6sUncxwFCY
 QazkON84yVnPuRk+vnnESG6+yBBz0YwWhtJJWb2zZjbw5DzfxAKXskMlQ4qfsQx9Mm
 UO58btU/3PVMomDfM1afqt2q6beRgOTTsEYRC9mRDBsnjeTC4WWh+rbMWXYjtRRMII
 tCabavvsqq5i3x27fuB2ef4/NmPqabzXcpE1x6Fnk1LxNP2LPWotkgg+FVBbLthJ9M
 cE6efTfyKkc8w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=fBM3dKyj
Subject: [Buildroot] [PATCH] package/harfbuzz: bump version to 14.2.1
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

https://github.com/harfbuzz/harfbuzz/blob/14.2.1/NEWS

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 4 ++--
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index d8df707924..c9739b2b92 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,4 +1,4 @@
-# From https://github.com/harfbuzz/harfbuzz/releases/tag/14.2.0
-sha256  94017020f96d025bb66ae91574e4cf334bcad23e8175a8a40565b3721bc2eaff  harfbuzz-14.2.0.tar.xz
+# From https://github.com/harfbuzz/harfbuzz/releases/tag/14.2.1
+sha256  a54a5d8e9380a41fbb762ce367bcbf7704792dfca0d93f1bbca86c5a57902e0e  harfbuzz-14.2.1.tar.xz
 # Locally computed
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 36b53f53eb..77d96febf3 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 14.2.0
+HARFBUZZ_VERSION = 14.2.1
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
