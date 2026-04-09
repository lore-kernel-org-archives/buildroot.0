Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B914BEA3C4A
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 10:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BBB460ED4;
	Thu,  9 Apr 2026 10:43:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aWhD2ChCl8AS; Thu,  9 Apr 2026 10:43:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AD0360891
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775731437;
	bh=V80KUVGVJ9X28WG7AGUcLMFVONqLrauJeNVw/AWP6+E=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=GfyGhJtePmLDkYruaQYe5xzTe4zOVllcUPgf/oxlq1ZmxR7zHfYFaLWGAWoZ3JUL7
	 0rQ3Pz4zC5mjtTI3ATiHdhUOb00OHZeJDzh7VcY072+JiOnrM5YEyH5T4oiDm+wWcS
	 oEFSlQCA+LVd6JoOvTPkPp+ZLPFyQmDzg6N8dFoeMQZ8LLX5KP+VRkbWN1W1M0UvXs
	 QDSzQRBmqWvYdBuxOf8RKqrZdGUWWeuaVlQON75CQkq16A4q0m3kRXQkwq32q3uaaN
	 +li6KfdBZ+xzN9j96xw505skzJ0M1A+aFKqXnGWy7YhGPrQIsZF/V/8m1baHOB1GHh
	 jDBuFIue0ozlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AD0360891;
	Thu,  9 Apr 2026 10:43:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 88A29237
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 10:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A70A41049
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 10:43:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BNdRBIYYkgLf for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 10:43:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:1600:4:17::bc0e;
 helo=smtp-bc0e.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 42EC241046
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42EC241046
Received: from smtp-bc0e.mail.infomaniak.ch (smtp-bc0e.mail.infomaniak.ch
 [IPv6:2001:1600:4:17::bc0e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 42EC241046
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 10:43:54 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown
 [IPv6:2001:1600:4:17::246c])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4frxPN6YjWzCfB;
 Thu,  9 Apr 2026 12:43:52 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4frxPN3VG3z64S; Thu,  9 Apr 2026 12:43:52 +0200 (CEST)
Date: Thu, 09 Apr 2026 12:43:42 +0200
MIME-Version: 1.0
Message-Id: <20260409-b4-2025-02-v1-1-187337706139@cherry.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMSw5AQBAFryK91tLzIeEqYuHTaAtkBpGIuxvsX
 uWl6gLPTthDEV3g+BAvyxxAxRG0Yz0PjNIFBk06I0s5NhbDTpE0GsW9qbPOmlxBEFbHvZxfrHy
 FNCGdnFD9l9+bidvtjcF9P2d9Fr95AAAA
X-Change-ID: 20260409-b4-2025-02-31ef3a6d4391
To: buildroot@buildroot.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=0leil.net; s=20231125; t=1775731432;
 bh=lVmgjU4kyWM8q8a701JH2/zkB7KLmf8c9xYntiIuYfw=;
 h=From:Date:Subject:To:Cc:From;
 b=YV6Im9CUY/5b8+pFnDeiQ62jstCfa14OI4SIeUlDNyk+YXPyHRcQ5ybfFwi/HyE82
 aII1GMMQH6fG//YKlI1CgNXwz0+X0prsVI9015t93EufFRp3KHT2CAsCErabooT2Ee
 PEu9qTfRU+Ded0oJV7dPhEenBV1OdO0NUyiHoEK29nxhfZ3ZgExbeSlsOrIcUarO1L
 nx2ERCPYg9MDBsiXHGpB75pR/TNp1xbLshKE8/O6VLBiqgJPB5GvS1dSvYhbhrex4w
 qK38GOyjLInNAHpvosRY6cEPq/z/d+39FQnef7JjveWNmcmRRRYeQcjzd7KJT3x29O
 kwe5e5n7Ka+BQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=0leil.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256
 header.s=20231125 header.b=YV6Im9CU
Subject: [Buildroot] [PATCH 2025.02.x] .b4-config: automatically add
 2025.02.x prefix
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
From: Quentin Schulz via buildroot <buildroot@buildroot.org>
Reply-To: Quentin Schulz <foss+buildroot@0leil.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Quentin Schulz <quentin.schulz@cherry.de>

This avoids having to run b4 prep --set-prefixes 2025.02.x to add the
2025.02.x prefix to the patch subject.

You do need b4 0.11+ to make use of that.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 .b4-config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.b4-config b/.b4-config
index d568669864..0c6966c0c8 100644
--- a/.b4-config
+++ b/.b4-config
@@ -1,6 +1,7 @@
 # Configuration for the `b4` tool
 # See https://b4.docs.kernel.org/en/latest/config.html
 [b4]
+    send-prefixes = 2025.02.x
     send-series-to = buildroot@buildroot.org
     send-auto-cc-cmd = "./utils/get-developers -e -"
     prep-perpatch-check-cmd = "./utils/check-package -q -p -"

---
base-commit: 22eb284823338dd9cfbaf08c0a98943c482f21a8
change-id: 20260409-b4-2025-02-31ef3a6d4391

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
