Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71D5DC433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 19:50:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1C0160F21
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 19:50:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D1C0160F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FD1581D5A;
	Sun, 10 Oct 2021 19:50:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Q6JOlnUztOk; Sun, 10 Oct 2021 19:50:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1362A81D5C;
	Sun, 10 Oct 2021 19:50:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 54B371BF3BE
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 19:50:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4258E4018C
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 19:50:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n4e2RvP8j2LV for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 19:50:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB76E40101
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 19:50:49 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id u18so48926926wrg.5
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 12:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RE08VCGi6QFXOYSLJ2ndR7qiQkDS+9YSdfvUWtJERCM=;
 b=FUOqxIkpB8NKh80B0i3NR6H105rg1wk3M+sbs0ZYPHHHaO3eozU2+tIia3nt5wrGDy
 twCBZGuPTD/+/PQp8b7kDFGHYQa2uVsis2tdKSa4KIgWBAY1GmBJ9pm6u15kH919nIIw
 10YWHy4/I0Rfs5a9gwt3kxpyCkuCzzdjlEP1PVWO0PfgiwkH3XD2KjN1G9HN+sX+eoyg
 5+YNM1BkhuFM0tTpsupNu4e4Ca7LH1s12adwJrC75tJfV/uDqwh0c3+MNS8JZY2tV/5n
 jYCGc2SnapulR6AmK21Vds8zO16lX1axBZM+2o13oo4Ysh/l/X1PyyaFDsqVT9konNta
 p5tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RE08VCGi6QFXOYSLJ2ndR7qiQkDS+9YSdfvUWtJERCM=;
 b=TUEegYJE4PZXyD5F0fOJKXNR2M00e5h+Uc+wO4WxpVVD142yuC3z9Adt6cVFMehk+C
 Nu4BgiXpI2hRSVwCt1Y7inTJkgI8mUkXpVrkbKl8cTXhI//h8L3GYRr+xLMAM/BiBy0S
 r+ACtC7PpfvyJf8pxN9OvhVd50hGTlJo1wf/mU9Zn+czifEA49U0d47K3MPvaX2oVEo+
 vT8KvOM0mbZGRWISWnZH+OoxMt5Jc4irQIWiHYDKVxSNnN+jIcwyPse5QiIdcwOxvV6j
 vYIeSP+pipyUWI3gQlv3NH0KjOdtx1nbcsCqOHVzMe7XmqLFQxX6YtYom7erng0ms4FB
 vb6Q==
X-Gm-Message-State: AOAM533QDhRLI6FLmc5Msw9sjJU4//l60s70c6Wgt5G6pGNcEC/+UWT1
 C7n9S4fr/DepsHX2OyIw1lb9RBqSvCY=
X-Google-Smtp-Source: ABdhPJxXMBetVCrIBfVYEq52ttclEmmaODKcFVyBFDp4csHsQ9AYZxNTrp/Rl3NxJWFadRFKMAwDng==
X-Received: by 2002:a1c:9d97:: with SMTP id g145mr16807226wme.78.1633895447822; 
 Sun, 10 Oct 2021 12:50:47 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id l21sm5837284wmh.31.2021.10.10.12.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Oct 2021 12:50:47 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 10 Oct 2021 21:49:36 +0200
Message-Id: <20211010194937.1419893-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/knock: bump to version 0.8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Michael Rommel <rommel@layer-7.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use official tarball and so drop autoreconf

https://github.com/jvinet/knock/blob/v0.8/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/knock/knock.hash | 4 +++-
 package/knock/knock.mk   | 5 ++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/knock/knock.hash b/package/knock/knock.hash
index 0b9a0918fc..3dc971b4a1 100644
--- a/package/knock/knock.hash
+++ b/package/knock/knock.hash
@@ -1,3 +1,5 @@
+# Hash from: https://zeroflux.org/projects/knock
+sha256  698d8c965624ea2ecb1e3df4524ed05afe387f6d20ded1e8a231209ad48169c7  knock-0.8.tar.gz
+
 # locally computed hash
-sha256  940a8de61b4b3530560805c3b9310a077c28c99173c2ccb07ff96720b0e93c58  knock-258a27e5a47809f97c2b9f2751a88c2f94aae891.tar.gz
 sha256  d747e19206e41702e40822dd91d37cbf40edd86f364ea416d667a0e3013f7189  COPYING
diff --git a/package/knock/knock.mk b/package/knock/knock.mk
index 55f5bfdf36..02811540bf 100644
--- a/package/knock/knock.mk
+++ b/package/knock/knock.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-KNOCK_VERSION = 258a27e5a47809f97c2b9f2751a88c2f94aae891
-KNOCK_SITE = $(call github,jvinet,knock,$(KNOCK_VERSION))
-KNOCK_AUTORECONF = YES
+KNOCK_VERSION = 0.8
+KNOCK_SITE = http://www.zeroflux.org/proj/knock/files
 KNOCK_LICENSE = GPL-2.0+
 KNOCK_LICENSE_FILES = COPYING
 KNOCK_DEPENDENCIES = libpcap
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
