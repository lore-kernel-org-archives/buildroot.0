Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	TVD_SPACE_RATIO,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBB6CC433F5
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 08:44:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 888B16108E
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 08:44:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 888B16108E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AE7380CA0;
	Tue,  7 Sep 2021 08:44:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FMFsz47avK8f; Tue,  7 Sep 2021 08:44:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B248380C26;
	Tue,  7 Sep 2021 08:44:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4A1791BF48D
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 08:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 358AB6084A
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 08:44:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qDEthhRfPUDj for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 08:44:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8859860BA0
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 08:44:08 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id 17so9212382pgp.4
 for <buildroot@buildroot.org>; Tue, 07 Sep 2021 01:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RfPIkf6O/uSQOJwF0JDUjsFNfc83Yhwx0+clli9JSzo=;
 b=bbUQ5v+4xSTWeJ2QkzukeKVEoDVJRSdEFUAvevuX9hwZEL08p/vApR0nAnPKggeG7K
 cwdGHxa4Ua16VcWc+geAHvXcb83kfn2kR4QYSxyMWOo4k1CQbsw42gs0n94eU2ObEp0X
 ulxIxu5plnHEfU7NcBb1MFiWeloWJbHbGrN9mDtPw+XRYSMrhwQDkmgBgW4UzTvVH//E
 p4td9BEQVwTAY7zTwYiG0pxcz9ZentLFBtgAqrIevyXg0m/cVyacBc+8i3EDMuOMqxQ7
 25nAIHmJpwjzJF9MJTw1M+ixcYLeHcJcKxhw1uxf0QDGVaYeRYio07PbngwtBJ54Dsth
 ldaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RfPIkf6O/uSQOJwF0JDUjsFNfc83Yhwx0+clli9JSzo=;
 b=Nf1G9sg29p36wFCIoAKZj+EkAKo79lYMYQxU+01hVq7cvT3PLTjrw1RXGXDotvZbeE
 L+PPYoxWYBPRJnWHovtSpTm0ZBuYtCD9WCeDX2/udS5SjuxbWz7QjYIJUtTuGpH/Wev1
 L9frAAtzOJW0jr47cj1cLl2hmeKwZCQMd1bMxkBRol+O05ePBdX6HlyzPTA0bHKmJwdB
 oRB0XQWDdhJFXPczq9dM+tH+QMh4yC2WzRfOoe9E4cmzGWK2SuTiH7zPeG+lPbbzaSO8
 VIdNf03PwgQiLft9TlGv+1O00Dir1DGI5n8A0QfDg3A4zK+lWfeAx8ViFAPGCrP5Lq99
 Te4g==
X-Gm-Message-State: AOAM530QhahS203QTRAI6CztNj7lwZmU/MWtqqdRaw1yiE14fzOLGdWL
 dz3ERZ5ekQPFBOnZ0WJ+FlO9EtN6zKjAMQ==
X-Google-Smtp-Source: ABdhPJyYco5zN6twhuJMO1kv12DU0goTi41b+rCfFd4oiRWbglFquCOcgKrTqCesVISUfs4m3NNqoQ==
X-Received: by 2002:aa7:8c17:0:b0:3fe:bb5c:4556 with SMTP id
 c23-20020aa78c17000000b003febb5c4556mr15820576pfd.48.1631004247822; 
 Tue, 07 Sep 2021 01:44:07 -0700 (PDT)
Received: from chrisp-dl.atlnz.lc ([2001:df5:b000:22:99c1:78a8:271f:9808])
 by smtp.gmail.com with ESMTPSA id u12sm12513308pgi.21.2021.09.07.01.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 01:44:07 -0700 (PDT)
From: Chris Packham <judge.packham@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  7 Sep 2021 20:43:45 +1200
Message-Id: <20210907084345.6192-3-judge.packham@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210907084345.6192-1-judge.packham@gmail.com>
References: <20210907084345.6192-1-judge.packham@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/gstreamer1/gst1-shark: Bump version
 to v0.7.3
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Chris Packham <judge.packham@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
 package/gstreamer1/gst1-shark/gst1-shark.hash | 2 +-
 package/gstreamer1/gst1-shark/gst1-shark.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-shark/gst1-shark.hash b/package/gstreamer1/gst1-shark/gst1-shark.hash
index caa9107bd8..be26050715 100644
--- a/package/gstreamer1/gst1-shark/gst1-shark.hash
+++ b/package/gstreamer1/gst1-shark/gst1-shark.hash
@@ -1,5 +1,5 @@
 # locally computed hash
-sha256  b141312603af82f600981dd7231e2ecc5a42b3550fadd2450965a0a85f62cbb2  gst1-shark-v0.7.2-br1.tar.gz
+sha256  689e60b4e10635a4f3af795b53045c6e90643896fa07b61e164a96158a79bdcf  gst1-shark-v0.7.3-br1.tar.gz
 
 # Hashes for license files:
 sha256  6d191b8f1fa03cabced18b8e48fddbf960a19f965bed8491e76ed62238f92f0b  COPYING
diff --git a/package/gstreamer1/gst1-shark/gst1-shark.mk b/package/gstreamer1/gst1-shark/gst1-shark.mk
index ea0c5a29cd..4e7801e920 100644
--- a/package/gstreamer1/gst1-shark/gst1-shark.mk
+++ b/package/gstreamer1/gst1-shark/gst1-shark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_SHARK_VERSION = v0.7.2
+GST1_SHARK_VERSION = v0.7.3
 GST1_SHARK_SITE =  https://github.com/RidgeRun/gst-shark.git
 GST1_SHARK_SITE_METHOD = git
 GST1_SHARK_GIT_SUBMODULES = YES
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
