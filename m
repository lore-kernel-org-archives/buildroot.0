Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3EDFC48260
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 12:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 095534117C;
	Tue, 13 Feb 2024 12:38:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xPkA0FMONQqG; Tue, 13 Feb 2024 12:38:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E28D41487
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E28D41487;
	Tue, 13 Feb 2024 12:38:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B79791BF2FC
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 12:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A59DF813D0
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 12:37:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jcVfh4bir6NN for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 12:37:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BCEA4813A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCEA4813A3
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BCEA4813A3
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 12:37:57 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 7FD722C83906;
 Tue, 13 Feb 2024 13:37:55 +0100 (CET)
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 13:37:53 +0100
Message-Id: <20240213123753.2471309-2-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240213123753.2471309-1-buildroot@bubu1.eu>
References: <20240213123753.2471309-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707827875; bh=kpQC+0URGUxTveNuswbMSglU8x7L2nY+h2mOtB+Qp28=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=TjCzL1hWqajefLtluRqZCAh0oJHmbKsODwgGoZ7b04P/jLOz/6tkUN1qBQjkZ0V91
 Z+0eTfWcFmmHOOYaOv+k7DBd4ePG4ekKonsWD+rg2Z/fthi0O/PV64hLiAgRuONJ5q
 C9sTLMVvgz27N8Opv+kT9s/jwjCAwspRTS1lUMnEfXN040dVfa5/FY8Ie2McyQDFE+
 Zy0VhQXHUAVGV2NhwYiAKL9jK+lWk/CRRs1L3pQlgdkAhetU3p/7DHx6StGyzCZ8Rt
 NGhtWHHNPdoXv2VEVAqKuy7QlMPlzIBa9SuJCL21EfVMIzcAAM2YpjUJXpr4uO+kzd
 tnKCoPYYYutTg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=TjCzL1hW
Subject: [Buildroot] [PATCH 2/2] package/python-can: needs PYTHON3_CURSES
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The can.viewer tool requires curses support. [1]

[1] https://github.com/hardbyte/python-can/blob/v4.3.1/can/viewer.py#L44-L53

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-can/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-can/Config.in b/package/python-can/Config.in
index 61955a2b00..106da4560c 100644
--- a/package/python-can/Config.in
+++ b/package/python-can/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_CAN
 	bool "python-can"
+	select BR2_PACKAGE_PYTHON3_CURSES # runtime for can.viewer tool
 	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	select BR2_PACKAGE_PYTHON_MSGPACK # runtime
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
