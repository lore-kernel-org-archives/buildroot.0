Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2597EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 10:05:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7489F610F9
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 10:05:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7489F610F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30BC2404B9;
	Sun, 12 Sep 2021 10:05:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3kgTb6KcwP3a; Sun, 12 Sep 2021 10:05:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CD7B40160;
	Sun, 12 Sep 2021 10:05:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 586A51BF2C1
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 10:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46ADC40160
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 10:05:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dXXxk7dTH5mh for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 10:05:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4218D40004
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 10:05:06 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 n7-20020a05600c3b8700b002f8ca941d89so4468069wms.2
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 03:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tna1B/g6VWePjy1lH+84Kc6K6DrilzKX5A+SyR/SU64=;
 b=YSn/+Xll4xV5r11cdOojrrFpADgggZ3yV1lYwRx4zJ6o3A5EHQilP/IRuvXqeEkC9o
 /tEYFOB7+rQFdaxAaTu+QlNh0/OOepqvV0a3XA6u5NuWnoizoeLYiIQPDj7er2tQctTM
 1MMv1kN3SexhRGKjEgxmSNlKYiIjvEfVo/Ch692Maasg+KHNPjM2042hwF75urbsTXRm
 IXhDnQ5+1Me855rNyZWf3mEf08NwPo9uD/1Sb9QsgsFGD9Bc3iQWwbNZs49zIzoqLvql
 zBZIecL4kojD2BEs5674Bu+GtNF1dL7VD2zs7WCJQVzjwsmooBuafoXefl9aM2Dm5TuE
 9R0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tna1B/g6VWePjy1lH+84Kc6K6DrilzKX5A+SyR/SU64=;
 b=gtf40O/d0MuFmnUilLjQqHSOyxfklYXYsviloIM8sSmu+PfS8Nhgch6CH1LAUECbXX
 C2ira3Q0he1e8v+doLSTUmu6YK0iQOyOwlZWnENEHXjW2lVbc76mxH2NbY9EXn+9e6kB
 fpFUOWio/XT1W0ToClHFfm3USzI0tWIUf2Ng1sDRKLxLm1Rn6RqB13LSR4ce/4tfsHbN
 KObKyzks4KUQcX9VcPXBLuAk9KIaR7YBLgsYANHkXL7f0KuLLVYV8+Y9/ESU+TJtVLrr
 5zkSd4dsjB/x7Iv12qPdUWf4SjjqcQ/JxHOLS+j09Xw7IZ2kkDziM/5vmJ8O1ROaLdPS
 d/+w==
X-Gm-Message-State: AOAM530+Ig8l+mA3HaFJBvW9OhlhAOHmVyXAPIVLHJa6pVNXg7UgagdH
 KpyzPcjeCPBCt/yUcGNZi0aovhhRZ54=
X-Google-Smtp-Source: ABdhPJyE1ulNpzDMQDdKPeEutDvlTGtDloezizSvLlbrqr2y4kSKuQBeJzp9fOSqQ9aOgoGqFUangA==
X-Received: by 2002:a7b:cc94:: with SMTP id p20mr6015899wma.75.1631441104280; 
 Sun, 12 Sep 2021 03:05:04 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id z5sm3788666wmf.33.2021.09.12.03.05.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 03:05:03 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 12:04:55 +0200
Message-Id: <20210912100455.1351513-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/diffutils: bump to version 3.8
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

- Update indentation in hash file (two spaces)
- Fix the following build failure with glibc 2.34 thanks to
  https://git.savannah.gnu.org/cgit/diffutils.git/commit/?id=498f88de4de761c1b5741fd8c78d4f5db9f3ce8b
  https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=f9e2b20a12a230efa30f1d479563ae07d276a94b

In file included from /home/giuliobenetti/autobuild/run/instance-0/output-1/host/arc-buildroot-linux-gnu/sysroot/usr/include/signal.h:328,
                 from ./signal.h:52,
                 from c-stack.c:49:
c-stack.c:55:26: error: missing binary operator before token "("
   55 | #elif HAVE_LIBSIGSEGV && SIGSTKSZ < 16384
      |                          ^~~~~~~~

https://savannah.gnu.org/forum/forum.php?forum_id=10031

Fixes:
 - http://autobuild.buildroot.org/results/6abde124e3124932d3c14d3b699f0572a2f4632d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/diffutils/diffutils.hash | 4 ++--
 package/diffutils/diffutils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/diffutils/diffutils.hash b/package/diffutils/diffutils.hash
index aa91fd4316..8cf4eb75c7 100644
--- a/package/diffutils/diffutils.hash
+++ b/package/diffutils/diffutils.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256 b3a7a6221c3dc916085f0d205abf6b8e1ba443d4dd965118da364a1dc1cb3a26  diffutils-3.7.tar.xz
+sha256  a6bdd7d1b31266d11c4f4de6c1b748d4607ab0231af5188fc2533d0ae2438fec  diffutils-3.8.tar.xz
 # Locally calculated
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/diffutils/diffutils.mk b/package/diffutils/diffutils.mk
index 107de79383..db8a5070a9 100644
--- a/package/diffutils/diffutils.mk
+++ b/package/diffutils/diffutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DIFFUTILS_VERSION = 3.7
+DIFFUTILS_VERSION = 3.8
 DIFFUTILS_SOURCE = diffutils-$(DIFFUTILS_VERSION).tar.xz
 DIFFUTILS_SITE = $(BR2_GNU_MIRROR)/diffutils
 DIFFUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
