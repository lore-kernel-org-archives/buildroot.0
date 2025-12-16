Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 698E3D609D9
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 18:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 157AC607B9;
	Tue, 16 Dec 2025 18:28:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wTK8XawavlWj; Tue, 16 Dec 2025 18:28:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FE6F6076D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765909729;
	bh=EhYxJmg1Owc6968jTT7TWDO4dfR47y4DfYbKNmTUtYY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sZ2CsIYXtH5Iyoy4Gzy3/zSyqSpcrHeWQWjXgJ4OxqA8Hdc9hKsRoBkAHzLxWFhQm
	 uvqxCIWEilSaiT5lcEi1/8c3IpHYDsBNCIZMKaJB9McfnMDzP0v0gNP8iSvXdUf9Yu
	 2fCHLS7j7i49cYiirGOuuALYX+j1zO+cixBRMqML5NeCXEKfn7rxt8LVEzYr7w51ld
	 HEn0rTxnhdJBdBJSQGF1R2UtBZhLgSOHj+FeruD53oo46UVrn8EjxeEK2y7F5QbAgs
	 XeRXCLZCEQP3jQsGHYO4wBM/t7VZDgQuq9tma3/w69KQUJdmP+VBqtmXcJr4Jjjlmg
	 7Bsz8Dukc4xzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FE6F6076D;
	Tue, 16 Dec 2025 18:28:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 694B8364
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 18:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B4BB8115E
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 18:28:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qhcrc8wJjpcj for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 18:28:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 53F678114D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53F678114D
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 53F678114D
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 18:28:46 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 487BF2C894D9;
 Tue, 16 Dec 2025 19:28:44 +0100 (CET)
To: buildroot@buildroot.org
Cc: Martin Bark <martin@barkynet.com>
Date: Tue, 16 Dec 2025 19:28:44 +0100
Message-ID: <20251216182845.2575378-2-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251216182845.2575378-1-buildroot@bubu1.eu>
References: <20251216182845.2575378-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1765909724; bh=dCfqsJ7DCsmrzZKwQQAvxFtBUeAdTpxKHf8j5BIv6DU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=G2i+WiIptbip/VXUQR0HpVYAge2Q95AIE+yziTYxdnhko5HYgzoVgYkxTp8WbC5CA
 8tmLIDRWty7Izs11W+D/1hJzErAtnRLRdzRgak3AerDn4GSRCgovgFE8CdRvPOACYm
 EhfJcgTzdsAektw5yParVxto023Llhx22JsWLrqadff2NtEvSfoa2mWFyjLwu8i284
 Mh8xjK6oZ0+EBVuYtAA+Zp5GUGDmiJDjYZNsUV6YxutngXtte/njD7hoiYpbTCQDjr
 TXrOgtllFmOCtXap1evxsYJO+TDZ2HTj+6p9HPPJe0K2EmxvngVdxZce50f8aURDT2
 a7KQKuBLCa1Kg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=G2i+WiIp
Subject: [Buildroot] [PATCH 2/2] package/zic: bump to 2025c
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

Release notes:
https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/TAGXKYLMAQRZRFTERQ33CEKOW7KRJVAK/

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/zic/zic.hash | 4 ++--
 package/zic/zic.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zic/zic.hash b/package/zic/zic.hash
index b9daccb381..7fe7582f10 100644
--- a/package/zic/zic.hash
+++ b/package/zic/zic.hash
@@ -1,4 +1,4 @@
-# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/6JVHNHLB6I2WAYTQ75L6KEPEQHFXAJK3/
-sha512  19826b12968c10fc4db7e4b07ba782bfb8590eeebaec6f719d74b92a2e642ab817bd72bceff0015ce52a838edfdb00753b3cd87dd84b35abf2606e5bee445f76  tzcode2025b.tar.gz
+# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/TAGXKYLMAQRZRFTERQ33CEKOW7KRJVAK/
+sha512  d14bc0680b9cb33d6526a2c0e483f2abafc2593cfe5fbfe7dcab940aafdc1baaec065dbaa1bb58b03586a8631ffdf43ebb22ff5a70503298b6ea2cf061d82c16  tzcode2025c.tar.gz
 # Locally computed:
 sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index 1abeb2d70e..06d8ebaf15 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZIC_VERSION = 2025b
+ZIC_VERSION = 2025c
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
 ZIC_SITE = https://www.iana.org/time-zones/repository/releases
 ZIC_STRIP_COMPONENTS = 0
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
