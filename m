Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C09DE6689E
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 10:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 292AD40B32;
	Sat, 20 Dec 2025 10:09:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UUeLlBOTrQW8; Sat, 20 Dec 2025 10:09:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5767040B35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766225396;
	bh=GdsixMjc81Nan3/jFUhNfvm9Vlu4dZwtALWkBKoJqm0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oHyr9Raefd3bPHO7IyQgnVuXgfpdgorjgNwyztdCWv4JtdG+DtJN8pN8JUpBby9zy
	 D5qnaErCJjWUpEItVM9jy/gad2Y7+yzM4W+8tF6k2UD8XP2EJi9jIswGvKVpkO1fZx
	 QYwmvNNop8FJQj9otlq68E79cu+RnCzC1jU+uDmhgUqyvuefyK91sHEwI/2qmplHv2
	 DqKUlawnTojaeDZzun8c9owmawrv2Gzb5h0KLiXA81jZ5jswwL/HTx6nrM+EZcolm/
	 TdOy5QtA7T5mamIma5ayuwYE/nwnOPHqTusLbr9Pst6LML9aAAA5sgK74smLgOfZVZ
	 uSDN+FPVo1kLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5767040B35;
	Sat, 20 Dec 2025 10:09:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F9A423D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 10:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3638483CCB
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 10:09:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i4-XJuwZL4Mo for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 10:09:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.101;
 helo=smtpdh16-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5208C83CC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5208C83CC6
Received: from smtpdh16-2.aruba.it (smtpdh16-2.aruba.it [62.149.155.101])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5208C83CC6
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 10:09:52 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id WtuGv6d1m3pJ0WtuGvlqlV; Sat, 20 Dec 2025 11:09:48 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sat, 20 Dec 2025 11:09:38 +0100
Message-ID: <20251220100938.517246-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfOsw2CQTT29yaKt78pyKmKQO5q6u0MUsynbX266uvYcekQU0vixFR8//QCNZM+yb5m3v5oxJSrYQb/6t6iEI2Ixm2YXGqi95slTbU434li3iaC1WkQD1
 bn7S8ipNrxuexTyBPMxQvjlMKePTDJfPzYd3m6jYNkoKfpSWWSw/64oc+wAj7VPDQZPZHfyTIwwhQVnMr8uVBnf6quVaA57UBuWq3S3IlR4tfwfAi0fgVCIq
 Oe5KlGRJ7wv66FjW9NuMkqTxoN3jRr617F1QgxP8GjY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1766225388; bh=bk6bRX7vCw01K27dCU8tPLTOwomzPSkW1ovBwrr1QjI=;
 h=From:To:Subject:Date:MIME-Version;
 b=hDkRGgB1Oy/Jc/GwRqlfE0JKW3j/pWaY1qkuLKR33+4BmecO57LSc5XhKJSxSsPYV
 GCyBgv9M1FvCNTDUNMnNFHXtGpX1LIhEHV7z3hKGXKrUrVZYmNa/TbNit/IVkBTm1a
 ZmHvp2nOpJo3bGLmhfqXCFfMguiYZ6eIZzxqFwqSOc+w0Lq286ekbC1pSaCu4M2ws7
 z/7gQdRUjWKxRLT5K1qFF6PKL7UAYu49eedRf+CJ8GHmadK8MULuc62ary9wzvPUVG
 lK7Gojl7E7uSdNBsygA06SAicIuBekVSg/3yuGIME7MInmjHhKbfTmx3yh7cKtC1lv
 um7ybQuqCuGeA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=hDkRGgB1
Subject: [Buildroot] [PATCH] package/cryptsetup: bump version to 2.8.3
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

For release note, see:
https://gitlab.com/cryptsetup/cryptsetup/-/blob/v2.8.3/docs/v2.8.3-ReleaseNotes

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/cryptsetup/cryptsetup.hash | 2 +-
 package/cryptsetup/cryptsetup.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index e85607cdb6..bbc9171e77 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.8/sha256sums.asc
-sha256  dd9ede9875976cb25f3d29bfabf343b1c60f6186646b67ef5e40e60ab4935ec1  cryptsetup-2.8.2.tar.xz
+sha256  4a8a23b8b9d1a3250452e40acead4421a03e45a38954ad0595634f4266aa800f  cryptsetup-2.8.3.tar.xz
 sha256  45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  docs/licenses/COPYING.Apache-2.0
 sha256  28a9529c7d0bb4dc51f4bf5c116a3d16ef247a052f7591466768ddf563fd1cf5  docs/licenses/COPYING.CC-BY-SA-4.0
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 8421543f41..e8f2f1673a 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CRYPTSETUP_VERSION_MAJOR = 2.8
-CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).2
+CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).3
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
