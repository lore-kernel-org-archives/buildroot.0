Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F36CC64EC3
	for <buildroot@archiver.kernel.org>; Thu,  2 Feb 2023 13:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DDBE41C3A;
	Thu,  2 Feb 2023 13:51:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DDBE41C3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mAV9fiA1OJo3; Thu,  2 Feb 2023 13:51:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 301A241C2C;
	Thu,  2 Feb 2023 13:51:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 301A241C2C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 75F0F1BF30A
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 13:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56331403F8
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 13:51:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56331403F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wHvJnYk5rekz for <buildroot@lists.busybox.net>;
 Thu,  2 Feb 2023 13:51:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21BDB40120
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 21BDB40120
 for <buildroot@buildroot.org>; Thu,  2 Feb 2023 13:51:05 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 n20-20020a17090aab9400b00229ca6a4636so5643877pjq.0
 for <buildroot@buildroot.org>; Thu, 02 Feb 2023 05:51:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OT/pUQ2u0OiVlnFAWzq9G7itRLawc21UvmyigXA2N1g=;
 b=8CPRAbFv7yaPvQHnsap7iO+WB3taa8OylVuJ95W1TfUFzFgQVeDWzwq7CcHHjLdi9+
 wykVZfi2ZqjQkz7jeYk9N01bCgvPmjfRltDoUyEn5fsKZW6a9Wdbca+Aykr4R7gRngez
 f2rrHSeORosANA0WlB71Pd09yIhrA1e4Kv5q9ZMLmMGhwia4HoSsCI+SHkI7rrevdHAP
 +hopBK1G8L6O8D2GelGaSEwtBkTabZdM2M1nUDCBABg4pBSx05djiWruguld8ox9VZNP
 /GbhHOL/vhIUW0SGk+EpPUI8Y5PyGmWbwP8o1whLFxVzZp38eYrCXQ1Oi9VcsyD6ACAA
 SDiA==
X-Gm-Message-State: AO0yUKUDrgWnpK+tDYeFt/4o+l8ZMjmSHt2f+8ua/V3CjR+4gMr/vdvf
 JpynsxKMuQ2Nq7RRYa8sjmmgcl4ByilQbw==
X-Google-Smtp-Source: AK7set92oYHqE3NRnztH+uk/YSWWGW0eSpWdxCuZ4++dnE2/2iY7Z6Whjs+dtifhNUeENO2ob7eirg==
X-Received: by 2002:a17:902:d482:b0:196:2b0d:fece with SMTP id
 c2-20020a170902d48200b001962b0dfecemr8527494plg.15.1675345864096; 
 Thu, 02 Feb 2023 05:51:04 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 jc7-20020a17090325c700b00192588bcce7sm13764903plb.125.2023.02.02.05.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 05:51:03 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu,  2 Feb 2023 05:51:01 -0800
Message-Id: <20230202135101.1949947-1-christian@paral.in>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/nerdctl: bump version to 1.2.0
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/containerd/nerdctl/releases/tag/v1.2.0

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/nerdctl/nerdctl.hash | 2 +-
 package/nerdctl/nerdctl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nerdctl/nerdctl.hash b/package/nerdctl/nerdctl.hash
index e253fb74b2..8f2c678198 100644
--- a/package/nerdctl/nerdctl.hash
+++ b/package/nerdctl/nerdctl.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  ae468c65480e9c6679e0dd23d466b723e7f19bff779d4e2e0fa4629be343af2a  nerdctl-1.0.0.tar.gz
+sha256  08a84b9481b37dbd8cc6f955dbec0c18a1934bcffeb135fd5d2dc23987152b7c  nerdctl-1.2.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/nerdctl/nerdctl.mk b/package/nerdctl/nerdctl.mk
index fdf60cb189..7556bcc391 100644
--- a/package/nerdctl/nerdctl.mk
+++ b/package/nerdctl/nerdctl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NERDCTL_VERSION = 1.0.0
+NERDCTL_VERSION = 1.2.0
 NERDCTL_SITE = $(call github,containerd,nerdctl,v$(NERDCTL_VERSION))
 
 NERDCTL_LICENSE = Apache-2.0
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
