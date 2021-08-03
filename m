Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6FD8C432BE
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 08:16:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06DC960C41
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 08:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 06DC960C41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF42560710;
	Tue,  3 Aug 2021 08:16:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CWWU8CjEmWB0; Tue,  3 Aug 2021 08:16:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02835606B8;
	Tue,  3 Aug 2021 08:16:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 551B81BF357
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 08:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51AD7606B8
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 08:16:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8eG6EzlhnKJl for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 08:16:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 58947605DF
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 08:16:23 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id e21so22756825pla.5
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 01:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fyn5923vOi/P0Ao+FzEGLatRF/8TeOfl5oWcK3Cr68U=;
 b=mS95dtlTk/s77witSEYmiFkqTZiLzrGdWJ82IvRTUNoP+GTJqkVqCPq587OBS2eaE4
 ohi6ISybiaYD51vhR6bqNdM432cZYkk3nHWnIqn4PN9NPQb35gLlLwt5zTtQ/DHeOJ7P
 QTXU6fvrm5qrCUuAgkxM2kUX2MyVzSdSyN15XPcrFhnISmbABCTg1vwu2hnbqifsk0t6
 9/oUdLzlXVpbIO+zCHoGJCXd8LUKVSO7xsiFbMSn1OvPDjDQagcIgs+qyhfgYdHUZJMe
 rCP5mnMr1eboCkxsxM/xM6WVeaBkFJ0eZiDJGrGYTNgeWftv3ms8XI8Qklp6Gf4JbR97
 aucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=fyn5923vOi/P0Ao+FzEGLatRF/8TeOfl5oWcK3Cr68U=;
 b=OAZW4+XLCcDIKjp0pRyDZa+0V35HIxVB9OCV+JpOsGp4c+pRIJtR/2LQKy/UadP9Dv
 Fbq7UYGjGp2ku/3t9MMrJ8icfpJriOAvi4hmrlQ05SjNrrgExwWFE5nP6YRET1zPUDjN
 AX8mruDV8Ll2z2PYVtK0rTIXnL9CRY45XEtWvnKvt8sLlXktFi6dd/gG9iKyOYwurZEH
 Mpmq5Wd3m/bmcYMF841QEldVWCg2wWiHmtLCykr/tAfg+j6hPgs4iixXu7MMC0J0tBP3
 Eq0V9inO1WNxEJZTTAeH1QDjEQjC1RIPqLAFuzU0co/APhTxkKJVE0g/TssednjTZDKG
 tXUg==
X-Gm-Message-State: AOAM53054CSQCljrApIo43E1xEtR2mJgNtPaf+ox5TRYcYLMomGotVt1
 k23h02ZFWm7SY8PxQWZhLWDBwd7PWvA=
X-Google-Smtp-Source: ABdhPJywqZ8lNYvxFVXIfhe/a1PhWwJs/BWtpqMQHB+eDnMpBtwtZCTkzJ9F4iiNkl5J8Ufci8CURg==
X-Received: by 2002:a17:90b:1049:: with SMTP id
 gq9mr3219900pjb.163.1627978581895; 
 Tue, 03 Aug 2021 01:16:21 -0700 (PDT)
Received: from voyager.lan ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id bj6sm1845287pjb.53.2021.08.03.01.16.19
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 01:16:20 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: buildroot@buildroot.org
Date: Tue,  3 Aug 2021 17:46:15 +0930
Message-Id: <20210803081615.879069-1-joel@jms.id.au>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/pdbg: Fix alignment error on autobuilder
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

The autobuilder fails when building for sh because of an alignment issue
in assembly that includes an external data file.

 http://autobuild.buildroot.net/results/457b88c4ba85edb42b3a36cce48bf90712f590bf/

This fix has been submitted upstream.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .../pdbg/0001-template-Fix-alignment.patch    | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/pdbg/0001-template-Fix-alignment.patch

diff --git a/package/pdbg/0001-template-Fix-alignment.patch b/package/pdbg/0001-template-Fix-alignment.patch
new file mode 100644
index 000000000000..e95d8344e2d6
--- /dev/null
+++ b/package/pdbg/0001-template-Fix-alignment.patch
@@ -0,0 +1,39 @@
+From 0080d0a64da274207bc341491f87863952bb6e3b Mon Sep 17 00:00:00 2001
+From: Joel Stanley <joel@jms.id.au>
+Date: Tue, 3 Aug 2021 17:28:17 +0930
+Subject: [PATCH] template: Fix alignment
+
+The assembler complains about unaliged data:
+
+ ./template.S: Assembler messages:
+ ./template.S:21: Error: misaligned data
+
+If the included data is not an aligned size, the the symbols following
+will be unaligned.
+
+We lost the alignment directive in commit 5f3deee1289e ("template: new
+libfdt requires 8-byte aligned fdt"), so add it back as it was before
+that commit.
+
+Reported by the buildroot autobuilder.
+
+Signed-off-by: Joel Stanley <joel@jms.id.au>
+---
+ template.S | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/template.S b/template.S
+index ecf9bba0656d..df8c064d6bc0 100644
+--- a/template.S
++++ b/template.S
+@@ -17,6 +17,7 @@
+ SYM_START(SYMBOL_PREFIX):
+ .incbin FILENAME
+ SYM_END(SYMBOL_PREFIX):
++.align 4
+ SYM_SIZE(SYMBOL_PREFIX):
+ 	.long	SYM_END(SYMBOL_PREFIX) - SYM_START(SYMBOL_PREFIX)
+ .globl SYM_START(SYMBOL_PREFIX)
+-- 
+2.32.0
+
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
