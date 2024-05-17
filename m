Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C068CC04FFE
	for <buildroot@archiver.kernel.org>; Fri, 17 May 2024 07:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 788566083B;
	Fri, 17 May 2024 07:18:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S0wkJ7HgxZ0M; Fri, 17 May 2024 07:18:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87969608A1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87969608A1;
	Fri, 17 May 2024 07:18:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BED2D1BF45A
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 07:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD50F41BF8
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 07:18:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xc1lBlFiprmn for <buildroot@lists.busybox.net>;
 Fri, 17 May 2024 07:18:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 577E941BF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 577E941BF5
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 577E941BF5
 for <buildroot@buildroot.org>; Fri, 17 May 2024 07:18:28 +0000 (UTC)
Received: from [147.173.65.159] (unknown [147.173.65.159])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id C96D2BFA2C
 for <buildroot@buildroot.org>; Fri, 17 May 2024 09:18:25 +0200 (CEST)
Message-ID: <c3811011-d5b3-4eec-99a4-dc765b98afdc@grenoble.cnrs.fr>
Date: Fri, 17 May 2024 09:18:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1715930305;
 bh=HX8tEXxcwY28WaX0/7yhYpfzFCuH6GM7w7FJ2ZY4gds=;
 h=Date:To:From:Subject:From;
 b=WETceJDKGNMXeiAhChhFfs32nYnbQ0tZY1qMWWUO0q5mbTR/lEKWUasKQVYV/honV
 YKXgyRUZHfvAwWT3svQT1eT2gTOZlUrg3fy+0rYDAzxOmxWPlWSZwlK9kC2+OKlejy
 rTQFxkT/g3QIvRfA0/XJD7GeEpF1e6sOqhFlXPBN/BqfJU3pqAwWIvB2plkh4PbpXX
 YZwBe9dW3jQenk+CHrpOlJhnj4hhMP7a1OFC0mrnH+AEEBrQSNKWZwODDTeFN8MFAK
 xXmmMVbIkAMi1cg//jc8ACxqOsSRSQuLzcHke1eekegH7WR/Ic96c9jw8aavdve9vd
 UrTdt4WCHWKWw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=WETceJDK
Subject: [Buildroot] [PATCH 1/1]
 toolchain/toolchain-external/toolchain-external-custom: add gcc 14 version
 selection
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

This patch allows to use an external toolchain based on gcc 14.

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
---
 .../toolchain-external-custom/Config.in.options               | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index f7825cb88e..1c4b0d2554 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -46,6 +46,10 @@ choice
 	  Set to the gcc version that is used by your external
 	  toolchain.
 
+config BR2_TOOLCHAIN_EXTERNAL_GCC_14
+	bool "14.x"
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+
 config BR2_TOOLCHAIN_EXTERNAL_GCC_13
 	bool "13.x"
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
-- 
2.34.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
