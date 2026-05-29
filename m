Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1849ECD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 21:53:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2734384ACE;
	Fri, 29 May 2026 21:52:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yW7BbWyZ4kSQ; Fri, 29 May 2026 21:52:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1653184ACA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780091576;
	bh=TluzubHoxR4/3xmU4NxSCS4s2agTuRxC1W9+OhNgKpU=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=niUTXG8EHKIeQwqVKOx3SdWWBhsuJnaKcS+C+ocdgpFFLrixiEBDIaXMPI2F7MAyI
	 tjB127lxclfrF3gfmuP0xutqznjWZttnjaWIDa5FTP7XtxcQ0Zi83Y15DGvD5Ygnsy
	 ocquWjDu1N0ypQQ3DTQYzEGbHcQ8sq1n1iFBNG45+A8UkTRXQ/IvhSpOxZ8bRWYkUX
	 SEcM9jnfJ1Smax4qjQ665Lnvag9VyBxbeKoq5s9Yd+r3wlN0lpLl3bwU3iPX/zVfst
	 LZz3HwdLNkUDkGUgArMhhS1HJCCeGRBMXpoANaz5Fj9ANK6XwDAN/M08vSF4ORt+/G
	 mBAgz8S2WF1zg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1653184ACA;
	Fri, 29 May 2026 21:52:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 36B55F4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 21:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 258CB84ACA
 for <buildroot@buildroot.org>; Fri, 29 May 2026 21:52:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vf-URkS6XASr for <buildroot@buildroot.org>;
 Fri, 29 May 2026 21:52:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0D6C584AC5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D6C584AC5
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D6C584AC5
 for <buildroot@buildroot.org>; Fri, 29 May 2026 21:52:52 +0000 (UTC)
Received: from bubutux.localdomain (82-65-127-30.subs.proxad.net
 [82.65.127.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id A7B1C2C89121
 for <buildroot@buildroot.org>; Fri, 29 May 2026 23:52:50 +0200 (CEST)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 23:52:15 +0200
Message-ID: <20260529215220.552527-2-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529215220.552527-1-buildroot@bubu1.eu>
References: <20260529215220.552527-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1780091570; bh=jPjdoUkFndR+4yX48vDQDLbT63uOQNum9XjC8VOmmKg=;
 h=From:To:Subject:Date:In-Reply-To:References;
 b=L4bSb1zfqZTgZAMZ/KTHegrJ3i+dw3yHJ5/QPFSblYghAPTTiqK1CThOyxpn01Rew
 EU6fQ/QTNtOUy5kCCfFy+9OShgkHbmHsthob0KVJ2GNMWs6XMIo5njHmxxu2fW018W
 OJ48fwXH/jr8wMAe6TyU4aFjHOFUTLAgFq4/rZQAWBzitfDnY+Ywamjz7vZRNzRRE0
 cajKEg/ZOmyJYT4bQhRHCFW72trLVlhIkfxl+pkPNwUQ5jFpkInYvpofg7RQPPQAdQ
 4Ttb/Q/HovYBdLhNCQgxPWy4uUXnEKLIu4NCiCOHDCCpcGtglsMwmdTBzPepn+Ibkx
 Vv1WNSYb2GgEA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=L4bSb1zf
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: drop John Faith, email bounces
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 DEVELOPERS | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 657b06d7df..855ec491c9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1710,10 +1710,6 @@ F:	package/nginx-dav-ext/
 N:	John Stile <johns@msli.com>
 F:	package/dhcpcd/
 
-N:	John Faith <jfaith@impinj.com>
-F:	package/python-inflection/
-F:	package/sdbusplus/
-
 N:	Jon Ringle <jringle@gridpoint.com>
 F:	package/mbpoll/
 
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
