Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85849C432BE
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 10:06:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23D2B60C3E
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 10:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 23D2B60C3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBE614044D;
	Tue,  3 Aug 2021 10:06:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3o55q-t4J45J; Tue,  3 Aug 2021 10:06:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56134403B8;
	Tue,  3 Aug 2021 10:06:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 69CAB1BF310
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 10:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51B3D83260
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 10:06:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YoPQtPUyGHhF for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 10:06:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F35583252
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 10:06:46 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id k3so19025622ilu.2
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 03:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tX1xoOjyh4IeCNJppWeAo6vrqokBD3BeC4aoPIWNSuo=;
 b=VTKuveQ5oLZfVMj8RcAf4UnoQU0CuyXDP9lSXfbdaEJIwfZmUbA6LImKc7GKpQxyQU
 r/zjQ0EpXEg4w5VslpRLdp9RLq2WsW33H+l4JuNkSbFFtrT0wZWmZMil1SxxUy+FYJDT
 RVC9FMyimmCO5Xv71JtzG2dKtQ5HbnOXPWcij9ko4qNsx3CZKQLYTc6aKiWJkmPCQvFT
 HEss9henV2esDzZ2STdL9o6cb4FDKOFBKnMQwQ/6UnhrrjagEQLLmt7eKGylwO6Vpzaq
 R7eTXMSnKh4A+tbaxJoO4EMIwnOgzGUXBzzLm+yu06/TEZ+T2AO7bqdqJlU9Wxwwh1zg
 gs8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tX1xoOjyh4IeCNJppWeAo6vrqokBD3BeC4aoPIWNSuo=;
 b=kdNDeZMYpTba3VE/XWfrRUPddL1uy90OrxdIW4BSsnIkSQUS/FDLB9x1dZhdqgPUcW
 /IwjM8K/nmoJJVILCITbNgg8QEkZQmfPmwY6qnfRDhqaIbbUx3UylUKZX4I9iry/J1Pc
 sCOv3PbtO0Vr1KGwtAV4fzdtgcmBaKf6foE65Pq41d8gwQmvh/ee0EX/4xa1TaEpru3p
 KSASkaPRt9iFo1hwTDFF1e2D+eXnbbhQf6W2L1q+oIjGUO+FF9ALS//u14cK8lmsigEv
 k0mbuItTUWrYq0Doeq4Rafsv9zaZLtPyOAyVo/fzPbU5c7KDnDKIK6Oh+9pojiEdg+zZ
 Agow==
X-Gm-Message-State: AOAM530SWGZpZiYJ+7pQxbWkeBZL3AkgeO8ihEgCIsNqk4I0XPS6DT3Y
 H0d7vkIrKIdSp97WAO1qn14DWLLJokQ=
X-Google-Smtp-Source: ABdhPJzhHIZB10S3uteVkyJiOzNlvbcthdjGq2z537ujlqOx4Yo2zLSAl02UgKYUPEEYM7Zw1yJOiA==
X-Received: by 2002:a92:cb06:: with SMTP id s6mr391613ilo.87.1627985205868;
 Tue, 03 Aug 2021 03:06:45 -0700 (PDT)
Received: from james-x399.localdomain (97-118-178-184.hlrn.qwest.net.
 [97.118.178.184])
 by smtp.gmail.com with ESMTPSA id z24sm9170284iog.46.2021.08.03.03.06.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 03:06:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  3 Aug 2021 04:06:43 -0600
Message-Id: <20210803100643.2760733-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gensio: bump to version 2.2.8
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/gensio/gensio.hash | 6 +++---
 package/gensio/gensio.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gensio/gensio.hash b/package/gensio/gensio.hash
index 03bd85cd0f..94f964faad 100644
--- a/package/gensio/gensio.hash
+++ b/package/gensio/gensio.hash
@@ -1,7 +1,7 @@
 # From https://sourceforge.net/projects/ser2net/files/ser2net/
-md5  3d1135a7bd7a3aca48493997fed1f1a0  gensio-2.2.4.tar.gz
-sha1  3c59d94e48c0a8ec5ed57ebb4ea95f3709d108ac  gensio-2.2.4.tar.gz
+md5  0adab57c4fbb55a280595f6541f202da  gensio-2.2.8.tar.gz
+sha1  3030b398eef379579680240d0c732d88fdad72a8  gensio-2.2.8.tar.gz
 # Locally computed:
-sha256  36cadbc790e03e4150a12bca14b20215afdff0a0f8deaf85c10434dca54d0493  gensio-2.2.4.tar.gz
+sha256  d495bfdacd30e8fe3879b29baab034eb553e606dbf145243989c97e83ad83115  gensio-2.2.8.tar.gz
 sha256  501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
 sha256  dcac7d447dd81ab96d28dce00a07a6486e623f7ded94e2a2a8e83312405cdf89  COPYING.LIB
diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index 0b2bb63956..9163c6a37b 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GENSIO_VERSION = 2.2.4
+GENSIO_VERSION = 2.2.8
 GENSIO_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 GENSIO_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GENSIO_LICENSE_FILES = COPYING.LIB COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
