Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B413BC433FE
	for <buildroot@archiver.kernel.org>; Fri,  7 Oct 2022 12:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2019C401CC;
	Fri,  7 Oct 2022 12:25:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2019C401CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hCvqQuLTWJDu; Fri,  7 Oct 2022 12:25:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9537401D8;
	Fri,  7 Oct 2022 12:24:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9537401D8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C766D1BF338
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 12:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B04F4401D8
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 12:24:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B04F4401D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mUmA-_DzFGNm for <buildroot@lists.busybox.net>;
 Fri,  7 Oct 2022 12:24:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B9ED401B2
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B9ED401B2
 for <buildroot@buildroot.org>; Fri,  7 Oct 2022 12:24:55 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id n198so3474512iod.3
 for <buildroot@buildroot.org>; Fri, 07 Oct 2022 05:24:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZFBJgCGAVXNEFhXrmY748SHRdcnW6M3PT2OYkbAY/Oo=;
 b=3aarmuXSE+10xd/5UprmGpoQNigAftAwYBId772zINEzE90Hg+I1Var9ZIifCXVotT
 P1L84YGbO+vb7qXZGtifRLma7TRm6OCDTe4/s+olLTBn/KFc0KCU1KSlB6d1c6FY0odx
 jEbb6BQw6CQNvhh9ajPWOLXVtUhE8dhUh7oU75k8ys+0FubZq5Cx4V//Zwx4IVGrI4uR
 2hUb56HAIyXFPi2GuhwjBeUeF/DU2Ii7IhRU3bdwIM8/kXLURWzYTKQO86aaQqZ4bOpD
 Tn9hHiIzaeRGiN8odQjd7Rz9kGJzvL2JtOCPkcXnVD1bAEo2U8YQxZ1tpVyaAtTSsyPe
 3dBg==
X-Gm-Message-State: ACrzQf2oQ3FsOEwzrg5YsA3i2I6zLt5GAnn3bGp6IolNdlJiWkSptCts
 sRsnKvFhFwL3Dw9VYtpPRY6zpTNntuo=
X-Google-Smtp-Source: AMsMyM7HBIjq9YbWR4CSX+QaKyZjzdWhve8VQKO4f242PTouvLf2TERMyVcrpkGPlqnAmUc30BB48w==
X-Received: by 2002:a05:6602:164b:b0:6a2:83c0:d3f5 with SMTP id
 y11-20020a056602164b00b006a283c0d3f5mr2091334iow.77.1665145493809; 
 Fri, 07 Oct 2022 05:24:53 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 n15-20020a92260f000000b002fa7b6e9cf5sm847690ile.31.2022.10.07.05.24.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 05:24:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  7 Oct 2022 06:24:47 -0600
Message-Id: <20221007122447.1048167-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZFBJgCGAVXNEFhXrmY748SHRdcnW6M3PT2OYkbAY/Oo=;
 b=NVHflwwZWlLGfwkbzMy6plyI0WNus+6GIM5K7pUmTH789vfF1uMWWatWKLB/THFAVg
 pdC4YSZz4YsFUQ4CtGyHe4u+H7ktF7nT5sMbL0770vAdvr5DlU92Rl8JfggT29RuIUKT
 pfOL1ijdtb59KMoCRqYKdJlm0MxM6q0nTLhEnxUhPXQiQJz9I0sk5+eaySH66VpFjAtc
 Bh7G4jCw48GExm4o5yJve3/XJlWkobA2ui08e55YqY4KhxbEDoNkiaXW7gWoKExv575H
 uSD5dmSnTTdi1mqE4u976buVI5FFynZR+aSGHLDo+K0Fm7P5GkGk5FCSApMgcgPSQbKG
 b5aA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NVHflwwZ
Subject: [Buildroot] [PATCH 1/1] package/ocf-linux: bump to version 20171122
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/ocf-linux/ocf-linux.hash | 2 +-
 package/ocf-linux/ocf-linux.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ocf-linux/ocf-linux.hash b/package/ocf-linux/ocf-linux.hash
index 0bd0ea19df..747bbcab56 100644
--- a/package/ocf-linux/ocf-linux.hash
+++ b/package/ocf-linux/ocf-linux.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  5113609d2c2c43fde962bec1238fe5a81211a751ebb0337b54a9804d40cfef53  ocf-linux-20120127.tar.gz
+sha256  3d7984754d58ced5695889744caf1e18a53f5d2e35ed40cc04d3595e59b7431f  ocf-linux-20171122.tar.gz
diff --git a/package/ocf-linux/ocf-linux.mk b/package/ocf-linux/ocf-linux.mk
index 01854fa73a..52169eda4f 100644
--- a/package/ocf-linux/ocf-linux.mk
+++ b/package/ocf-linux/ocf-linux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OCF_LINUX_VERSION = 20120127
+OCF_LINUX_VERSION = 20171122
 OCF_LINUX_SITE = http://downloads.sourceforge.net/project/ocf-linux/ocf-linux/$(OCF_LINUX_VERSION)
 OCF_LINUX_INSTALL_STAGING = YES
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
