Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26903C05027
	for <buildroot@archiver.kernel.org>; Thu,  2 Feb 2023 13:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACDCD41C25;
	Thu,  2 Feb 2023 13:35:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACDCD41C25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bkLruAsVVdq5; Thu,  2 Feb 2023 13:34:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6592F41BF2;
	Thu,  2 Feb 2023 13:34:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6592F41BF2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4228A1BF30A
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 13:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B6E941BF2
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 13:34:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B6E941BF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6ZrMw5IccAzT for <buildroot@lists.busybox.net>;
 Thu,  2 Feb 2023 13:34:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CF2541BD6
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2CF2541BD6
 for <buildroot@buildroot.org>; Thu,  2 Feb 2023 13:34:56 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id m13so1785224plx.13
 for <buildroot@buildroot.org>; Thu, 02 Feb 2023 05:34:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OLiik6ckILMD1xyT2Oz72gn+hn+l+55de6Ub0ROEMtQ=;
 b=g0oksGKc5jVZoSlC6nSQsoVhbZQmjfsqIQMUKxRFMVvtBKaLVtNpv+ZJe/mUvxIttU
 eQG0xHDJPjUioxMo8p7+hHz4hDkC0ZjT9LU67kYg0n74wOF5fB2WMUp8RSUA8wzfQFKB
 u1+Qysi1fNHoDmZdS3JAI8fBSZs6zD82J8fXliJB+AflcEg4pEeJQV8rZzlVQMfx9jlh
 3d+g5aNqVz5I+d7Rs95UAazmdt1P0v4cbvq8DR3lARJxFqYfOid1Un6t3eC7v47+Xt6M
 qo++ifx9PBmNy1a143BiyuFoW+RhHO2l3/sBWgdxZTvO/FgJiL88FmIftr5Mz2GLVFlD
 fB6A==
X-Gm-Message-State: AO0yUKWY9cx1uDQqnYOCfF1LkvZ6uuOVHk1EI2XD6ufwhs3JCxQA9x98
 LBu4ACuNGORSLMwLRRXnn9qICPTNzhN/wg==
X-Google-Smtp-Source: AK7set/2DLuYdnEVanVhRogk0laf5SrdKWk7Dv8/JwlGEHoUJNh2jGEWrkKtLexP+dBpSkZLghrkHg==
X-Received: by 2002:a05:6a20:12cf:b0:bf:14cc:51d8 with SMTP id
 v15-20020a056a2012cf00b000bf14cc51d8mr8477633pzg.26.1675344895245; 
 Thu, 02 Feb 2023 05:34:55 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 c10-20020a170902848a00b0019254c19697sm13629484plo.289.2023.02.02.05.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 05:34:54 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu,  2 Feb 2023 05:34:53 -0800
Message-Id: <20230202133453.1747150-1-christian@paral.in>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 1/1] package/containerd: bump to version
 1.6.16
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

Bugfixes and improvements.

https://github.com/containerd/containerd/releases/tag/v1.6.16

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index 04a29949d7..16474089d1 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  b86e5c42f58b8348422c972513ff49783c0d505ed84e498d0d0245c5992e4320  containerd-1.6.12.tar.gz
+sha256  e0a893cf67df9dfaecbcde2ba4e896efb3a86ffe48dcfe0d2b26f7cf19b5af3a  containerd-1.6.16.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index 192175800c..c27e538a30 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 1.6.12
+CONTAINERD_VERSION = 1.6.16
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
