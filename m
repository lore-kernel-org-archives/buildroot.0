Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8009BC4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 00:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9F5981987;
	Fri,  9 Dec 2022 00:56:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9F5981987
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xThu8vZCQsdh; Fri,  9 Dec 2022 00:56:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB0918196E;
	Fri,  9 Dec 2022 00:56:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB0918196E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4C6A81BF96B
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 00:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 238DE41730
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 00:56:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 238DE41730
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jth88f83YHMQ for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 00:56:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44552416E2
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 44552416E2
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 00:56:33 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id jn7so3225063plb.13
 for <buildroot@buildroot.org>; Thu, 08 Dec 2022 16:56:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XUqyRde8M8yMMAZpWCMPDrnlC/FeY6T7uNr6Mrb95kM=;
 b=i+0CbZ3AwhSR4BSl2Mqb18MCpiikeB0vt4euBbP8waINq+FW7RfsJBo4MX6qr3yezq
 SBT5fX8BwOfSz3QClc12pqZHwGlhQRxuvcY/vcMOG0HkwYjtwXXAyUv9aYHTT8NoDjOy
 icX7JGunNJavQF9iiHKC/ZRVzHvvqzxoYr8k1qjjvoJzmhdrbFibbPerFyb3HTSl2LL7
 AP6AgElgj71e5gRxd50yMX6kMd1JqJBZzk78KLOWWJslhXGcIY3+h8Uvy3MoDaITlRcn
 ON8+mZtgVk+R3j+Mu5AXIRZBriSjLGiNkESgcomDFeykqjXNfoRSI2yF7b0rtAUeiOBh
 nEhQ==
X-Gm-Message-State: ANoB5pn5k6ZdZD2w9boVlJJ1Agp/TnP7LZMgwZwsExCZFX7+TusgBNBq
 FGqWyia0UX9Z+SKI7Hcj1m3SM/40k6k=
X-Google-Smtp-Source: AA0mqf6RjRfYhaJCOht7JfKJGkrJYAMn5LEa1CIi9P9R+dFgcW7VroMjFgc4rlbyRaDuuSaPOFMwOA==
X-Received: by 2002:a05:6a20:d696:b0:9d:efbe:2052 with SMTP id
 it22-20020a056a20d69600b0009defbe2052mr6411045pzb.8.1670547392342; 
 Thu, 08 Dec 2022 16:56:32 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 65-20020a630944000000b00473c36ea150sm9908pgj.92.2022.12.08.16.56.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 16:56:31 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 16:56:29 -0800
Message-Id: <20221209005629.1049654-1-christian@paral.in>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/nerdctl: bump to version 1.0.0
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

Nerdctl has reached version 1.0.0.

https://github.com/containerd/nerdctl/releases/tag/v1.0.0

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/nerdctl/nerdctl.hash | 2 +-
 package/nerdctl/nerdctl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nerdctl/nerdctl.hash b/package/nerdctl/nerdctl.hash
index 22cc97c362..e253fb74b2 100644
--- a/package/nerdctl/nerdctl.hash
+++ b/package/nerdctl/nerdctl.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  be41804ef139a3f92b774edc8439678e56b44033d7ab3fcf4389f0865c1fe069  nerdctl-0.17.1.tar.gz
+sha256  ae468c65480e9c6679e0dd23d466b723e7f19bff779d4e2e0fa4629be343af2a  nerdctl-1.0.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/nerdctl/nerdctl.mk b/package/nerdctl/nerdctl.mk
index 3f3c04aa11..fdf60cb189 100644
--- a/package/nerdctl/nerdctl.mk
+++ b/package/nerdctl/nerdctl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NERDCTL_VERSION = 0.17.1
+NERDCTL_VERSION = 1.0.0
 NERDCTL_SITE = $(call github,containerd,nerdctl,v$(NERDCTL_VERSION))
 
 NERDCTL_LICENSE = Apache-2.0
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
