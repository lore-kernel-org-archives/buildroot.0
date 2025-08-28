Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F363BCA0EED
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 10:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1CFC821D8;
	Thu, 28 Aug 2025 10:01:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IlhqM1m7DtZc; Thu, 28 Aug 2025 10:01:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB888820B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB888820B1;
	Thu, 28 Aug 2025 10:01:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C7E5517D
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 10:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C4FCA400E3
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 10:01:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UnGoOwHDOP0D for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 10:01:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2A40640C8B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A40640C8B
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A40640C8B
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 10:01:49 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 876252855; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 28 Aug 2025 10:01:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1urZRx-005h1D-2X;
 Thu, 28 Aug 2025 12:01:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 28 Aug 2025 12:01:44 +0200
Message-Id: <20250828100145.1356985-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=KSs0nfL1dQWqIwUjBRz7CzcEDaV/35uxCgAvadMWzeRPtV8fFokrE8ofyKeRiK7DiQr5isqJUNJ1MYbsSuwnYNWqVzEWCrzKbAhOLn9ukMbP+uT9Nqir8oNkgWz66+Fg7osNZoPDcu9G9peH3pKw3HzKO21U6VOp28F2+7t1hpAxuDKqCnnm28K6/sVJF6wkQuYFZ5Qnv7ak20AYjCuR+r7+tAx+KtKa66CIl7sWPHfHBFtcPTBkXEO4JaPivs2HjA4B4YUWQCYbtYXbW2hNwkPTjXoi4/nEqS0z4J45+sCaf78v6qaXuc4dKVhL4IKTDf8VKA6IFMVRGeDZyiIFxQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=Su151tgYMgbM3c+H20upD5DLPbETHzIt1YnKdXHkC7A=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=KSs0nfL1
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/unbound: mark CVE-2025-5994 as not
 applicable
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
Cc: Stefan Ott <stefan@ott.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Unbound is vulnerable to CVE-2025-5994: "Cache poisoning via the ECS-enabled
Rebirthday Attack" if built with --enable-subnet, which is not the case in
Buildroot, so mark it as not applicable.

https://nlnetlabs.nl/downloads/unbound/CVE-2025-5994.txt

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/unbound/unbound.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index 03a5e8e150..e9a32e6129 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -23,6 +23,9 @@ UNBOUND_CONF_OPTS = \
 	--with-libexpat=$(STAGING_DIR)/usr \
 	--with-ssl=$(STAGING_DIR)/usr
 
+# Only vulnerable if built with --enable-subnet
+UNBOUND_IGNORE_CVES += CVE-2025-5994
+
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),y)
 UNBOUND_CONF_OPTS += --with-pthreads
 else
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
