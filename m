Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62EE8C61DEB
	for <buildroot@archiver.kernel.org>; Sat, 21 Feb 2026 18:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8ECE384201;
	Sat, 21 Feb 2026 18:46:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HKFBVDwvwNuG; Sat, 21 Feb 2026 18:45:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F4F3841A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771699559;
	bh=98k04OCGnY1IRvvP+graf00wJKLtZclxnob1OD0vW+Q=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EJxumxgllzPeJVLlYlxN+cTA/oS3bZAmevM+QYVxWV0tOyihQo7I3OhOd7VUg5qDy
	 vjHE1Y8NkudjIhqJXH1Su/ejSNrdt4n1cKvqPerz2HDX1zbHzGXqkSd5R2JufKfvw1
	 Q/3doeK1ExrBa8NzRWuDxqAifpi+icEsOCREjIQDV6Dy2XWJ6/kPk4NPDnm2O5hLeP
	 guRpWoTD/WxxecERD6cphvlwdtm37wND6zbMz7nbhQDIpxJBSCp+jhxDJfRmxHDMp3
	 6tOknXD0Wwbz72NNtbx2WoGI3FURmZsXP78m5+TX2+n1lG+hXGABj0hBNgKwIXXbhf
	 e+7dBTRO7S6ag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F4F3841A2;
	Sat, 21 Feb 2026 18:45:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DE3C2DF
 for <buildroot@buildroot.org>; Sat, 21 Feb 2026 18:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2F06841A2
 for <buildroot@buildroot.org>; Sat, 21 Feb 2026 18:45:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7OZHWUncCugF for <buildroot@buildroot.org>;
 Sat, 21 Feb 2026 18:45:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.147;
 helo=smtpcmd13147.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BA9288418C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA9288418C
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BA9288418C
 for <buildroot@buildroot.org>; Sat, 21 Feb 2026 18:45:54 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id trzDv8ChzRHshtrzDvnmIO; Sat, 21 Feb 2026 19:45:51 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sat, 21 Feb 2026 19:45:50 +0100
Message-ID: <20260221184550.3080991-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPrmPV1bhhAwMtndpcUHKuefZecs1GjmqxRIHgYGC6FELkHgQ6vfxbMDVMJsgsOvhFw9XAcY4YY1O8T6DGRbaeDZKoG27G+MXzcqiJOmJSHyTdyhCN5J
 TYJaR1gj87XkPvkZxzATTsMQTdlPUFZNO2oY0lW8YWemhOHl++srVtPOWe1aMCL+uVcCM5oW4SGg8LvcK2lW6dK3QBVhnxo6oSisxyU+wt5yI+mvVbG5zBb2
 3g2+G42WRDUKEym9c0zdHPx7jEXxgX6BwDsPSaEmiyA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1771699551; bh=J7qE/faDu7prwv2HMcDCXf0+wX0yyXNUxAdOUOOM5u4=;
 h=From:To:Subject:Date:MIME-Version;
 b=hEMe3YP5RLD10M3w2+CYNSIg4QaNmwdrka/Yy3M4zKojgqfsCBTXi4/1aO1A2JbeB
 QNFjSXXapLzGinVToQ2SKg30xpuf2OecN8fQv/y9UosqGpL5klVgVjXkRZFEb7YrrM
 pWpturPxxtB6M0ljLJ3inEs/H3tsTTsBubzobOurhs4xO1FFGwjf94Lbi/hgcJCl6D
 CN6ic90B0FK+UUdwvHs8d8naRVvfnpC1vJWMXv/vZ9gSsamhZZeblSq5hc/ORoQMAH
 h2zj3N2zDj5cwi2KV34KxT+1vJWBtpeU1Y2fIks4xGEB1yevgWxv7Cu4+OBJdd7qtb
 ZBaFczS18BnkQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=hEMe3YP5
Subject: [Buildroot] [PATCH] package/zlib-ng: fix build failure for PowerPC
 soft-float
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

As suggested in this review[1], when building for PowerPC with soft-float
enabled, let's also disable both WITH_POWER8/9 that in order disables
all the possible PowerPC acceleration instructions.

Fixes:
https://autobuild.buildroot.org/results/a0fa5a175c546993d818371a0de93b2e9845a183/

[1]: https://github.com/zlib-ng/zlib-ng/pull/2151/changes#r2803264882

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/zlib-ng/zlib-ng.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
index 59e4e15282..92e3659b59 100644
--- a/package/zlib-ng/zlib-ng.mk
+++ b/package/zlib-ng/zlib-ng.mk
@@ -30,6 +30,10 @@ else
 ZLIB_NG_CONF_OPTS += -DWITH_NEON=OFF
 endif
 
+ifeq ($(BR2_POWERPC_SOFT_FLOAT),y)
+# Explicitly disable PowerPC accelerations
+ZLIB_NG_CONF_OPTS += -DWITH_POWER8=OFF -DWITH_POWER9=OFF
+else
 ifeq ($(BR2_powerpc_power8),y)
 ZLIB_NG_CONF_OPTS += -DWITH_POWER8=ON
 else
@@ -41,5 +45,6 @@ ZLIB_NG_CONF_OPTS += -DWITH_POWER9=ON
 else
 ZLIB_NG_CONF_OPTS += -DWITH_POWER9=OFF
 endif
+endif
 
 $(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
