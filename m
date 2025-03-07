Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2274AC19F32
	for <buildroot@archiver.kernel.org>; Fri,  7 Mar 2025 19:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4BE180E5A;
	Fri,  7 Mar 2025 19:05:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TRVwBDjP5xEu; Fri,  7 Mar 2025 19:05:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E600E8120C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E600E8120C;
	Fri,  7 Mar 2025 19:05:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D2B411C9
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 19:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CCD194029F
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 19:05:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id evKE3RMdSKcd for <buildroot@buildroot.org>;
 Fri,  7 Mar 2025 19:05:14 +0000 (UTC)
X-Greylist: delayed 356 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 07 Mar 2025 19:05:13 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DDDB340424
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDDB340424
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=45.157.188.10;
 helo=smtp-bc0a.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
Received: from smtp-bc0a.mail.infomaniak.ch (smtp-bc0a.mail.infomaniak.ch
 [45.157.188.10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DDDB340424
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 19:05:13 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch
 [10.4.36.108])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Z8bDg4xdbzMw;
 Fri,  7 Mar 2025 19:59:15 +0100 (CET)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4Z8bDg2Y7zzKNQ; Fri,  7 Mar 2025 19:59:15 +0100 (CET)
From: Quentin Schulz <foss+buildroot@0leil.net>
Date: Fri, 07 Mar 2025 19:58:44 +0100
MIME-Version: 1.0
Message-Id: <20250307-setserial-fix-v1-2-c37c1e7e8234@cherry.de>
References: <20250307-setserial-fix-v1-0-c37c1e7e8234@cherry.de>
In-Reply-To: <20250307-setserial-fix-v1-0-c37c1e7e8234@cherry.de>
To: buildroot@buildroot.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=0leil.net
Subject: [Buildroot] [PATCH 2/4] package/setserial: autoreconfigure for
 compatibility with newer toolchains
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

From: Quentin Schulz <quentin.schulz@cherry.de>

Newer toolchains silently fail during configure step. After some
investigation, it is because -Wimplicit-int is returned for one of the
simplest test from the in-package configure file and thus fail the
configure step early, when checking if the compiler can produce an
executable.

Let's fix this by simply regenerating the configure file, similarly to
what Debian is doing, c.f. debian/rules.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 package/setserial/setserial.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/setserial/setserial.mk b/package/setserial/setserial.mk
index 002bf211613a62f99efd0b77aa89bffc3f0a16f5..6567738e762b7d628c63d10f8ab87a898ef9e236 100644
--- a/package/setserial/setserial.mk
+++ b/package/setserial/setserial.mk
@@ -13,6 +13,8 @@ SETSERIAL_LICENSE_FILES = debian/copyright
 # make all also builds setserial.cat which needs nroff
 SETSERIAL_MAKE_OPTS = setserial
 
+SETSERIAL_AUTORECONF = YES
+
 # Extract the Debian tarball inside the sources
 define SETSERIAL_DEBIAN_EXTRACT
 	$(call suitable-extractor,$(notdir $(SETSERIAL_EXTRA_DOWNLOADS))) \

-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
