Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77878C433FE
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 19:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EDD624045C;
	Wed, 26 Oct 2022 19:35:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDD624045C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 15qCjoxvur8t; Wed, 26 Oct 2022 19:35:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A39F40571;
	Wed, 26 Oct 2022 19:35:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A39F40571
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D6D841BF57C
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 19:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2A1D80BB5
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 19:35:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2A1D80BB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BF3Ub03y_VzX for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 19:35:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A08B480B98
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A08B480B98
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 19:35:13 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id f9so11526404pgj.2
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 12:35:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eUuXw8PkVm9OX50Nj2Z9m5KQ5rIbZuVcXL0W+kQikAw=;
 b=FjzeheCi2JaB4EBB3uyX3XOrdhgxP/lh9bobYyXeTl9ap+RhVGNTJaYMXYkmrznJtq
 GR1Y7oysbO9L1p+aXyh1wd1c/fkUzMjJyzSjyh9B4Yf99aGrd/PjxufPGvBvXUqzHKRv
 9/j5D/nz/K0+izw2NrFXf3b0/TkiX00dqzTD0bYrNBiuGYICN1sI5vY/iGrv04xnBDKF
 +PNcK1ivl1PifpD3Pe4rrdFKcldTqf+1OkMyLi2Am4HcQwYSw4VXm4n3okiQNWufJd9u
 HP05FpkzoiIjwxPtPxwWiVYM3kgRbRunPUt/wxAVLTrdatzKh+S0fyP/0/mnR24W3mUC
 7w1Q==
X-Gm-Message-State: ACrzQf3RxkHjuiRWBGiL48pEIv+c7fzccA5YkfkDWzoDV2weqDmvrl24
 aOso6wqp9d3oUe+A0vJdIUEfjKcDe89fMQ==
X-Google-Smtp-Source: AMsMyM6lMdugpVnmBj7wCFMRf+cufk4rsjWkGiSwwMPl9BhgE3eIu4p9sxiuOQk3XhsQZmXUeUpBww==
X-Received: by 2002:aa7:810a:0:b0:55b:674d:d123 with SMTP id
 b10-20020aa7810a000000b0055b674dd123mr46607268pfi.52.1666812912122; 
 Wed, 26 Oct 2022 12:35:12 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 e2-20020a170902784200b0017a0f40fa19sm3240331pln.191.2022.10.26.12.35.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 12:35:11 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 26 Oct 2022 12:35:08 -0700
Message-Id: <20221026193508.482276-1-christian@paral.in>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/go: security bump to 1.19.2
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

go1.19.2 includes security fixes to the archive/tar, net/http/httputil, and
regexp packages, as well as bug fixes to the compiler, the linker, the runtime,
and the go/types package.

https://go.dev/doc/devel/release#go1.19
https://github.com/golang/go/issues?q=milestone%3AGo1.19.2+label%3ACherryPickApproved

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 657475adef..f944bd5304 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  27871baa490f3401414ad793fba49086f6c855b1c584385ed7771e1204c7e179  go1.19.1.src.tar.gz
+sha256  2ce930d70a931de660fdaf271d70192793b1b240272645bf0275779f6704df6b  go1.19.2.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 9f0fbbde00..fe4d3a29a9 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.19.1
+GO_VERSION = 1.19.2
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
