Return-Path: <SRS0=uMfR=NA=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E0CC4338F
	for <buildroot@archiver.kernel.org>; Mon,  9 Aug 2021 15:22:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9959B60F93
	for <buildroot@archiver.kernel.org>; Mon,  9 Aug 2021 15:22:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9959B60F93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C858400CE;
	Mon,  9 Aug 2021 15:22:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o4tZr-roSpy1; Mon,  9 Aug 2021 15:22:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63E3F40209;
	Mon,  9 Aug 2021 15:22:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 530351BF3DD
 for <buildroot@lists.busybox.net>; Mon,  9 Aug 2021 15:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42EAB6076D
 for <buildroot@lists.busybox.net>; Mon,  9 Aug 2021 15:22:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vnv84yFsDX6Q for <buildroot@lists.busybox.net>;
 Mon,  9 Aug 2021 15:22:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp3.osuosl.org (Postfix) with ESMTP id B19BF60644
 for <buildroot@buildroot.org>; Mon,  9 Aug 2021 15:22:34 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.149.252])
 by Aruba Outgoing Smtp  with ESMTPSA
 id D76lmzAt4a4UMD76lm89mR; Mon, 09 Aug 2021 17:22:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1628522552; bh=kJL3RLpi/zUIcRE/ZUqPxOeSqIstNlhyn29ke9YSC5A=;
 h=From:To:Subject:Date:MIME-Version;
 b=jG9J/CwaRcZRKKJ3FO5rhWEc6OprVSoko9aGuck625iQqahVp74Lgh6UeE8dQ9viL
 mt45WEIIGVWmIB/p97zIbsf3DlvPqu7oXsOY2j/hO2IeOWMgL/6fim+ArJA7twvusV
 hM3/OCf/bicuN0zGHTCUGDqYZRpZqZI3GzXDoT9YHoBWITOH2FJvL/QN0ou/+iqvbG
 B0AqnBpKR8Two0itbftNcBdSi9EVkQydJ67lpgrvXHxxyMvJCSGWyhLFlF3J2W3RGC
 T2FqGI1GzjH5LJ7zg6hPWS7YZa9G80nmfq4FffUJ4V0imk8PO737yAuAeKBpQJuxgP
 xm02EA5qUGYwA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon,  9 Aug 2021 17:22:30 +0200
Message-Id: <20210809152230.3586250-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfF8YCJ0Mf+nifYLOUlQB92OG8Ir6+efeM/xMvTtYWoLrHmHduT7TCWUkZn18XvHiVGthpJx1gf7MPJVtRem9H14ebCCH7opBr1LnqGLkqAGDBsmv59zM
 vIrqZkK9sEBwd8n9ZGH+jM7KQV/+9iv4uhSTWzae/njN4cGsU7xmEA1RA4txoP+P2V/byiUmH75TfKzvFmQU6AMLHWwdadiO3g7IH/unYWfgKUBS28RfJvps
 dX9wNDR5N0HUINsQOEA81mL6EZObkbmGEwkTaFHXrGr6YKPJpGuOUctUUxu0clZ6
Subject: [Buildroot] [PATCH] package/libnss: bump to version 3.69
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Release Notes (not yet available, but should eventually land):
https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.69_release_notes

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index b8c58e3425..a35b382050 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_68_RTM/src/SHA256SUMS
-sha256  c402b32cac83034ec1c3d826ef4306cd14a066d7d9a6f4c30d82b3bc043c725b  nss-3.68.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_69_RTM/src/SHA256SUMS
+sha256  c880205a365e0dd488ff29fdea82716ff9fcde9da6f3b703d636f8fc08008799  nss-3.69.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 100ce2f8aa..63364ccb27 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.68
+LIBNSS_VERSION = 3.69
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
