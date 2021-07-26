Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4A7FC4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 09:15:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9338160F02
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 09:15:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9338160F02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59FDE401CB;
	Mon, 26 Jul 2021 09:15:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bk2cu5eR7xOR; Mon, 26 Jul 2021 09:15:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 822C54017A;
	Mon, 26 Jul 2021 09:15:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D018D1BF23F
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 09:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9A67400D7
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 09:15:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KtPKkvsFeDKS for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 09:15:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E1706402A2
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 09:15:00 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 m20-20020a05600c4f54b029024e75a15716so4831299wmq.2
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 02:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2g+HE/fzmdiUweRQ1kWvr/Aow75CS+frJ855rbPIDCc=;
 b=peoQERTeHTHtTxAooEfpg1WjXEQ28uvA911fIJEOVZARDdWTR2N07ZDtc0tzDt308c
 /aiJPssYYVeGFS0tiO173T/BjcjYG15WGtZMRdWswAZFE6FGH0yueQVHK8TCK+1G8LBn
 HL6k+ab6kSSU38G+nlgPDnFPjHYNdyYLJynqz/DMsiv6G05wxRUAuXx/0ZlSOl1ahJYg
 3UBXv5LHYS+xhQmvBIH6S0B1eFobJ+kuWfCQ99+lFgg60cLFrOGMBkkHnwdaX+Ykpmf+
 NbtEWu7goWCQa7a09SjEz4+GvG6VtyQpYM61SxRA32rKBS9Xk/Rw0uQxXteNzjLdJkPL
 L1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2g+HE/fzmdiUweRQ1kWvr/Aow75CS+frJ855rbPIDCc=;
 b=le+u6wePgXGrnR8sZzirE1uuRw6weNBC3HZBKE3AMnhUACu6aLbmAK1fXP3gl+4Rox
 6O6TKT+xhwPDFcer7D/eb1xRzGBthz5r3TnUtm9EWDpMBd1loc1rByopD7VYrfwIL1Wd
 VAiYrfSTotFeKbtvcipMyJ0rHRgsGHM65FiE60+DmkLAVZYhMAtdVgUr2YhiXhAM8kWi
 N5n2kNRUfF/O7JBWysOW9mL+X330dIx2kWA4//gq/oo5HU39zksXKb5r+gUFQUUccasM
 6CNexfDkIGHVJPbs30Gzj0fYuzbWk2qlinkgeYCqgoAAu4RNrsutGnbqxeSotrun+XCI
 9RWQ==
X-Gm-Message-State: AOAM532UvVpA9GWCtzuYZKxLlnfkDlmFb+znVlooNRKXMxCc7P0NOR6q
 hSsiZwwDsS1uhQIkT198HXjVSsDimab/0A==
X-Google-Smtp-Source: ABdhPJwXMGQfjveqVyHrvka/Y9djTKSP/AsrzqKOXvFj0xY6jFUMMAxxA4yZPHyZQgVU+WWieiI3dg==
X-Received: by 2002:a05:600c:21c8:: with SMTP id
 x8mr24887273wmj.173.1627290898953; 
 Mon, 26 Jul 2021 02:14:58 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id g18sm34598326wmk.37.2021.07.26.02.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 02:14:58 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 11:14:49 +0200
Message-Id: <20210726091450.1712562-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/monit: add MONIT_CPE_ID_VENDOR
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

cpe:2.3:a:mmonit:monit is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ammonit%3Amonit

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/monit/monit.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/monit/monit.mk b/package/monit/monit.mk
index 93e310ff78..b9e131a363 100644
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -8,6 +8,7 @@ MONIT_VERSION = 5.26.0
 MONIT_SITE = http://mmonit.com/monit/dist
 MONIT_LICENSE = AGPL-3.0 with OpenSSL exception
 MONIT_LICENSE_FILES = COPYING
+MONIT_CPE_ID_VENDOR = mmonit
 #
 # Touching Makefile.am:
 MONIT_AUTORECONF = YES
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
