Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E79D0E6FB
	for <buildroot@archiver.kernel.org>; Mon, 21 Oct 2024 11:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9720402D9;
	Mon, 21 Oct 2024 11:54:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pVgjVh_A67oh; Mon, 21 Oct 2024 11:54:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6E72402E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6E72402E6;
	Mon, 21 Oct 2024 11:54:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 908A171F
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 11:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E331400C5
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 11:54:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lwHVrSRfydED for <buildroot@buildroot.org>;
 Mon, 21 Oct 2024 11:54:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B97AE40175
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B97AE40175
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B97AE40175
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 11:54:26 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id D0C7D4402B5;
 Mon, 21 Oct 2024 14:51:20 +0300 (IDT)
To: buildroot@buildroot.org
Date: Mon, 21 Oct 2024 14:54:17 +0300
Message-ID: <462871d252e473dfd0850058abdffb85c5c90f79.1729511657.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1729511480;
 bh=1U87k9iPqBBPbAqkGhh34rS9r4ViIe4v8ZcD8MgHg9A=;
 h=From:To:Cc:Subject:Date:From;
 b=dD203iSKpBUGeGejz7A38fdlRwSbtMWtS2OmD2DCgdCoaYFZtfQgFJVJmhs5Fu13b
 w2uLG2T2pSMdOlKRoyKRFH2bkjN6Bo9H+SfD82BVLCyO9qIkuxmcaq11XZLonIURoq
 1UUjhZ9K6A1tWE9Cy/KX6V5RC7ADebbCMlRADMTcQD4GLVC1/whYJPIuxeF6KbtWkV
 VDyvP9aLDHBcHN2yDgd6jHWY08T0NYHDMcVH9LAq+caelWdNmPv+Wt10NQkiQ1lpym
 eIfZ0j5tMpxgOUqSeX9hMgKX0asG/A+N2OzoAsbofKWu4QnExQusCtGpDUuW4gsmuU
 Q93qQiUzQj+6Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=dD203iSK
Subject: [Buildroot] [PATCH] package/libcurl: ignore CVE-2024-32928
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This vulnerability only affects libcurl deployments in Nest products
because of incorrect use.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libcurl/libcurl.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 9bf7724e7d54..71fb6152c73d 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -32,6 +32,10 @@ LIBCURL_CONF_OPTS = \
 	--disable-ldap \
 	--disable-ldaps
 
+# Only affects Nest products.
+# https://nvd.nist.gov/vuln/detail/CVE-2024-32928
+LIBCURL_IGNORE_CVES += CVE-2024-32928
+
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 LIBCURL_CONF_OPTS += --enable-threaded-resolver
 else
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
