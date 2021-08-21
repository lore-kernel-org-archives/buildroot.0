Return-Path: <SRS0=Fkjy=NM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F49FC4338F
	for <buildroot@archiver.kernel.org>; Sat, 21 Aug 2021 23:06:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9722361268
	for <buildroot@archiver.kernel.org>; Sat, 21 Aug 2021 23:06:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9722361268
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E0C580E88;
	Sat, 21 Aug 2021 23:06:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G69BtNn2kZGA; Sat, 21 Aug 2021 23:06:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E464E80E89;
	Sat, 21 Aug 2021 23:06:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 723E91BF41B
 for <buildroot@lists.busybox.net>; Sat, 21 Aug 2021 23:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 609E040109
 for <buildroot@lists.busybox.net>; Sat, 21 Aug 2021 23:06:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CJynodjg-GBp for <buildroot@lists.busybox.net>;
 Sat, 21 Aug 2021 23:06:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-ws.aruba.it (smtpcmd01-ws.aruba.it [62.149.158.241])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48799400CB
 for <buildroot@buildroot.org>; Sat, 21 Aug 2021 23:06:16 +0000 (UTC)
Received: from ubuntu.localdomain ([141.136.161.207])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Ha46muQOVZx06Ha46mLpai; Sun, 22 Aug 2021 01:06:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1629587175; bh=T4nXOAuF6D4CbXUu1bkieDzYD9KGUDSr2sTRSPib7iw=;
 h=From:To:Subject:Date:MIME-Version;
 b=hcRZxpz19Tz4MH3KTxl6qvE94QUCQyDwGU62NYSjr0C7VOUuX24qBjoxEAQuj8LvF
 ykrHV4Kfrykq/TK1c3m5qIh0qlONojxXlll3rFhd1kAQlgGtn2SlJaR02rTntCByZD
 OyAwRcqz+ia+mFX13SCO8IqLOwqH/DpIMWMOqCwGd5jWgA211bBrnroDy4u+mcxd8L
 TCsp7YeLOKewhwCMUVpOCRpVdJv3bNw99XvecII6wPoZkIKELChPzKhjKzwQV0UqqF
 g3pmnOsbanRziIXHOMEKhnw3Er1K3HOjiOMvevj3/CtXZS2UpyG2vui9vpcDbUf1R/
 AlEUl5d9eRnbg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 22 Aug 2021 01:06:13 +0200
Message-Id: <20210821230613.470903-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfEDnkzjjwytA5fQmnOpyEqFTkA5ns9KrAr0KMN7G+tX5Y2DUtDCTW7I1osaoOl0POaqAp1Y4CFl1nOVH+5nvQBjFxPiDzCjOibp13FT0793Z4tRrE6PG
 RryOKj7/NokY0EraNWj0d75H3rO1ZaYFRSqB+Pa2YA/AFQwvLSxIgUpqK7CrRia/zgjROlXkEl6VdywhUS+MiOn3KOyx6M0grRiqPDJaOXuv4Eb/L49arjAV
 r85lg4t86d05+AiliEO0iuYvmoulZx9EAqyPPpNi/O9Tnjqp9RQ4XSGwwPWqPWAVg6tntYLMWVqBhtwuXHxFzA==
Subject: [Buildroot] [PATCH] package/libmodsecurity: fix build failure on
 m68k_cf
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Frank Vanbever <frank.vanbever@essensium.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

This package has -fPIC gcc option set by default but we can't use it on
m68k_cf since it doesn't support it throwing a gcc build failure. So let's
disable it by passing -fno-PIC.

Fixes:
http://autobuild.buildroot.net/results/b92980a563fe7ee331e70f288ce041be0bf29d40/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libmodsecurity/libmodsecurity.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
index 66e7e522a1..be46eb6e02 100644
--- a/package/libmodsecurity/libmodsecurity.mk
+++ b/package/libmodsecurity/libmodsecurity.mk
@@ -52,4 +52,14 @@ else
 LIBMODSECURITY_CONF_OPTS += --without-maxmind
 endif
 
+LIBMODSECURITY_CXXFLAGS = $(TARGET_CXXFLAGS)
+
+# m68k_cf can't use -fPIC that libmodsecurity forces to use, so we need
+# to disable it to avoid a build failure.
+ifeq ($(BR2_m68k_cf),y)
+LIBMODSECURITY_CXXFLAGS += -fno-PIC
+endif
+
+LIBMODSECURITY_CONF_OPTS += CXXFLAGS="$(LIBMODSECURITY_CXXFLAGS)"
+
 $(eval $(autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
