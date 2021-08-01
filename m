Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D28C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 08:28:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31F0060F59
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 08:28:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 31F0060F59
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6B8740305;
	Sun,  1 Aug 2021 08:28:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4WEMmn446mL9; Sun,  1 Aug 2021 08:28:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34E01415CE;
	Sun,  1 Aug 2021 08:28:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 079771BF42D
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 08:28:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA94483963
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 08:28:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WjXxgo1oK7js for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 08:28:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C6DBE836C5
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 08:28:21 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 h24-20020a1ccc180000b029022e0571d1a0so9119390wmb.5
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 01:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kE6mWfzkczDFQhzFu6VExqsU2r3tk0vhVmmyuNMEH9c=;
 b=SFMM8KTDv0IVHpm75uClGracMnW7Kmu51AV5edY+9jqbVCxB2GOE7EPbjLbwnsmz8N
 XHpY6XaDz7aqCVAiGu2z08A+i5GPHwZv0ZOA7MPPBwODgsSMB2WlpN5laGqvS4Kq5QL7
 zkyzEVbr8PHOQ6LmNZfYKBK7YPCB9zEv5+AdpFyjog+ScKMmeBXcuvYvyEeCApKjvXh7
 orEZg1YT2ifFMiK56kOYdWgV9uNg+sofccr7U/ImKreTMYSM89pp9qs+a6io8UDbft1I
 qLEu6Xw2aZ8yrThOVrAMD4ZDItATs0c8NNvBzflP0unpnsOrrM8jGiAAEKu+yOhfVRQJ
 GGhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kE6mWfzkczDFQhzFu6VExqsU2r3tk0vhVmmyuNMEH9c=;
 b=Kg8QBB0hHTVNOXzs7D35ZLAGP4RKZeR/BQKTxqKmGn9k8YiCafKSyUFGgUXVklAxcY
 zz3kQje56xiXlwY4l/Z4R2mIBvYBtjjbCu4SST89JVA5drVHtY3d6hL9TKw0yUHq0X75
 2ux6pSVPipLsoMkPRlLzalBYiMfaxYdt+tEBVUkWY0xDpb84S8SPa0eqFlPYrz1HBg17
 lsUplljXswcIe091TusPeR33UpvhxbAAIL3pPQ4R+RlGQe5x41rvKG56+k04oOGf7MFt
 5YNqF6cAn64k9M5fw2O0D2rS/ghF7P73oS1sjmkMpMJuUPB4MSH9HhzDo711VqJfgGLh
 QE5g==
X-Gm-Message-State: AOAM530QZsNpkKoUYkH70lmlz6rFdmwcpaj5mkwiLfTaqdKhZzPefRAQ
 JrPzqgvVyvINuLFEfq8nekn9a4py0C1qLg==
X-Google-Smtp-Source: ABdhPJw164O+ft8qxtwQJMhqAnCOx/wCNJVvkN4uPQ9dwQORHS37YWyOiu+Rwn021g5XGvRBN51OAg==
X-Received: by 2002:a05:600c:b51:: with SMTP id
 k17mr11033690wmr.119.1627806499356; 
 Sun, 01 Aug 2021 01:28:19 -0700 (PDT)
Received: from kali.home (pop.92-184-116-243.mobile.abo.orange.fr.
 [92.184.116.243])
 by smtp.gmail.com with ESMTPSA id r2sm7200695wrq.15.2021.08.01.01.28.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 01:28:18 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 10:28:09 +0200
Message-Id: <20210801082809.2716893-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/vdr: bump to version 2.5.6
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

- Use github mirror to get latest release
- This bump will fix a build failure with gcc 11 thanks to
  http://autobuild.buildroot.org/results/3dda387a765f7980c0bb567aeb0f0d86328ae876

https://github.com/vdr-projects/vdr/blob/2.5.6/HISTORY

Fixes:
 - http://autobuild.buildroot.org/results/3dda387a765f7980c0bb567aeb0f0d86328ae876

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vdr/vdr.hash | 4 +---
 package/vdr/vdr.mk   | 5 ++---
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/vdr/vdr.hash b/package/vdr/vdr.hash
index 3d0dc443e2..3776296aa5 100644
--- a/package/vdr/vdr.hash
+++ b/package/vdr/vdr.hash
@@ -1,5 +1,3 @@
-# From https://www.linuxtv.org/pipermail/vdr/2020-December/029578.html
-md5  aa91614159ae2db45655d35918e2c24e  vdr-2.4.6.tar.bz2
 # Locally computed
-sha256  c8993babf2a878a0fba84558de1e35f042c3c66f7c1ec569eea00a3af1014e4b  vdr-2.4.6.tar.bz2
+sha256  27026b78a663758211d15c83a21555e28d91ab640c6d4f6cdd860f2abf1cae84  vdr-2.5.6.tar.gz
 sha256  ddb9db7630752f8fdc6898f7c99a99eaeeac5213627ecb093df9c82f56175dc7  COPYING
diff --git a/package/vdr/vdr.mk b/package/vdr/vdr.mk
index eac13bfff4..251ffb9f04 100644
--- a/package/vdr/vdr.mk
+++ b/package/vdr/vdr.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-VDR_VERSION = 2.4.6
-VDR_SOURCE = vdr-$(VDR_VERSION).tar.bz2
-VDR_SITE = ftp://ftp.tvdr.de/vdr
+VDR_VERSION = 2.5.6
+VDR_SITE = $(call github,vdr-projects,vdr,$(VDR_VERSION))
 VDR_LICENSE = GPL-2.0+
 VDR_LICENSE_FILES = COPYING
 VDR_CPE_ID_VENDOR = tvdr
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
