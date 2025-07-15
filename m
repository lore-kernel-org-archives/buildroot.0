Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7FFC83F22
	for <buildroot@archiver.kernel.org>; Tue, 15 Jul 2025 12:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDDCA83498;
	Tue, 15 Jul 2025 12:09:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VdYgp8VgAMu1; Tue, 15 Jul 2025 12:09:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26E768399B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26E768399B;
	Tue, 15 Jul 2025 12:09:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D88B8DCA
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 12:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9DE76106A
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 12:09:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ja27ezJo5Zxc for <buildroot@buildroot.org>;
 Tue, 15 Jul 2025 12:09:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 010AB60EC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 010AB60EC6
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 010AB60EC6
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 12:09:28 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 498A42C890C1;
 Tue, 15 Jul 2025 14:09:26 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue, 15 Jul 2025 14:09:22 +0200
Message-ID: <20250715120924.1223648-2-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250715120924.1223648-1-buildroot@bubu1.eu>
References: <20250715120924.1223648-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1752581366; bh=3UMFLM8lLK4Mm7zb+YBTF0QmJEIr4TUkIOHhwHplew4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=D6GkPBPP28EL60x/cgKPODR3GZKxDcJ+TmIMpnb5GggJJtNwe05SrYse/wzf8plfl
 T4Qf+2DU3rDogjxBEW9KH5QN2Pt/jvodpo+A+4aHvlX5aBkZbnfrTZT5lcVuK9kpWC
 YCdVD7R5nMEcULhUmdIWuiGkjqbPITMtCCeztQIzeKhHcF2k1Nbjy8yr+puG/E8/ap
 bjFmPyBU/Xg6Iu/Rl7PLSi+ic1vDKP+EpCwU+scXRWe9nLxmVxS2fqQL92WizGw6V5
 XOmJIksUKsMrWVZ0Rv0OGl6zzpOCMKLmz9tjyZEHrOvUfKuiQliF/sMOOWyBnjFI/e
 ut5HsHbi9DkoA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=D6GkPBPP
Subject: [Buildroot] [PATCH 2/2] package/python-msgpack: fix project url
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: "Wojciech M. Zabolotny" <wzab01@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The previous url pointed to an unrelated but similarly named project.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-msgpack/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-msgpack/Config.in b/package/python-msgpack/Config.in
index 2050d4f078..82b8c08417 100644
--- a/package/python-msgpack/Config.in
+++ b/package/python-msgpack/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_PYTHON_MSGPACK
 	  This package provides a pure python library for reading
 	  and writing MessagePack data.
 
-	  https://pypi.python.org/pypi/msgpack-python/
+	  https://pypi.org/project/msgpack/
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
