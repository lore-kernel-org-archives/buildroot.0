Return-Path: <SRS0=JPVL=O4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50B2EC433F5
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 23:56:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBDC160FA0
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 23:56:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CBDC160FA0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E3DB4055F;
	Fri,  8 Oct 2021 23:56:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nyQvFjx10bkt; Fri,  8 Oct 2021 23:56:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66E284055D;
	Fri,  8 Oct 2021 23:56:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BEA431BF4E4
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 23:56:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB8D983D22
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 23:56:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G6mrtLaqPigQ for <buildroot@lists.busybox.net>;
 Fri,  8 Oct 2021 23:56:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED7DE83CB8
 for <buildroot@buildroot.org>; Fri,  8 Oct 2021 23:56:38 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id kk10so8746542pjb.1
 for <buildroot@buildroot.org>; Fri, 08 Oct 2021 16:56:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+rwYAx9hp4p1FQc1lRRU+u2rJJ7LlOx55yB7vvR2vx8=;
 b=j8R+NmPTARnNBgYCA8JVzNQQQLb12U2lu3Ko+w8ZiKrmv+lzNHjsww+XkBf097MDdv
 pAoxO7PCJarO87LqZGJJ7X4BU9zbCaNtD5Ss2IoUvthlueGAbw8/h6MvBFTLp0K6Wjg/
 avX/1XEC7C4RopPhC+jT7zOEsvWHtABPfbQR/nOjqCO60aHOWkD1Mec+hKLXUBn9qiZh
 ntEh2TOATWLsA103Uz6RFvkEp2N+L5VpSckTq2LjC0FlFDwWL4T8JegZW4S1ZOxOhpUn
 8DVArqupNei2eR2+7kskBEq/ne/F5y3miimIGWJG49YLhDgvLoVj0vSTC8JOoQpDxLOa
 cN1A==
X-Gm-Message-State: AOAM530vsxwKUVLxnYIvsjn7dN+EcdgSnBmXSb+TDf2vmfaBKymoSjT2
 YNQZJavez8sqvCR7JBAfm/gsnKpXrrgTag==
X-Google-Smtp-Source: ABdhPJwSLzglhqN/iL+SU7Bowm/WX5CQNMTDCct7heuHO0XwPHO0jheuKb/hqIhzpVufLTmuUBWrQQ==
X-Received: by 2002:a17:90b:3844:: with SMTP id
 nl4mr15468232pjb.168.1633737398064; 
 Fri, 08 Oct 2021 16:56:38 -0700 (PDT)
Received: from localhost.localdomain (ip68-111-8-11.sb.sd.cox.net.
 [68.111.8.11])
 by smtp.gmail.com with ESMTPSA id w185sm367008pfd.113.2021.10.08.16.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 16:56:37 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri,  8 Oct 2021 16:56:35 -0700
Message-Id: <20211008235635.97342-1-christian@paral.in>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH-2021.02 1/1] package/go: security bump to
 version 1.16.9
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
Cc: Christian Stewart <christian@paral.in>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

go1.16.9 (released 2021-10-07) includes a security fix to the linker and
misc/wasm directory, as well as bug fixes to the runtime and to the
text/template package.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index bc828f41c8..39eec5b228 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  8f2a8c24b793375b3243df82fdb0c8387486dcc8a892ca1c991aa99ace086b98  go1.16.8.src.tar.gz
+sha256  0a1cc7fd7bd20448f71ebed64d846138850d5099b18cf5cc10a4fc45160d8c3d  go1.16.9.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 8b99916f90..c6d756566e 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.16.8
+GO_VERSION = 1.16.9
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
