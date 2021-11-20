Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A94D4C433F5
	for <buildroot@archiver.kernel.org>; Sat, 20 Nov 2021 19:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EF9260773;
	Sat, 20 Nov 2021 19:58:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KoLUe6zXCo5M; Sat, 20 Nov 2021 19:58:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 787F26076F;
	Sat, 20 Nov 2021 19:58:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8765B1BF396
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 19:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E087401FC
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 19:57:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AkU5wKx0mHsc for <buildroot@lists.busybox.net>;
 Sat, 20 Nov 2021 19:57:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4545940106
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 19:57:57 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id i12so11566272wmq.4
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 11:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JQKoiFA0T3wsGPShFTjVDYN176abNQ27yyeEE0Ig74E=;
 b=Mzx//o56ZcSyC7T4KMOmYXAZx+lPrkbpbwVP4nmOom0SyhRPuuWF52yYOSnmn+s6h2
 SXq8Um06tgH2n++lAETi4TBV+TH/UJNljL315wPfehl+L/fVY8KX7M8kB2xJINKb9qD1
 7upwh/NP1sl6Y/emGRt4pafRb7gWV9mU3/rJbnvuL5upjPSgsM/boQ4+bdk5SyH6Xp8I
 JJ/+Q4F0bZOTadPFdb9trJ+8AGbKFbiNvwwNWl8m5c4bTfocwq2IQsq1Hvl5NYT9uHM7
 VreFkqj1GpikLvhIA/ege8Nx/VyKEXz2LKhczkaFYVksHDybBP7defHEmrtYGRMOuqtE
 tcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=JQKoiFA0T3wsGPShFTjVDYN176abNQ27yyeEE0Ig74E=;
 b=ZhWQepuuKc+TVMrqzwwq4rLxAAeGiLTBBm1yiJg9uqomAFTykdssLL2avnkjWO7KTr
 2cOkZPnqTvkP/+Lqsz92nfyq/8MSisqYq2EG9z6DNEnf9CVET/XF10DVq0htC+vc1BeU
 4Xkg6gClCg9GpOQQdRLPGxVjw3df6I21BEPOeslmv5moQpSPC66M3f3NPKG0tWAhmLHi
 PxiVrWm5pwBwG2ubY+CDsWiZxDHn0Bxq2FuFpPOGgDByhIAYkkAvwdLw6D5Z5Jw9tWDq
 5SJB0P0pmxPyYDqzpOVjl+Q9wfmArwoimG98cZDfzL+Kuk5GjD67d9nrtCQwqqZylL5V
 CRmw==
X-Gm-Message-State: AOAM530A0RM6Q6TZ4u2y0Jj+jghcP+YceOYnl/TacXXn/S/6b5qfrzWQ
 hZFZVEMY4ppfEdiVajs6M0x3JHevNrkc9g==
X-Google-Smtp-Source: ABdhPJxXFGHFN4f/z8XLSFuYdxmoiE5bR/K/E5Clqo/1hiqzSv2KMt4VJvabxL8X1bEFygGtroGOVw==
X-Received: by 2002:a7b:c007:: with SMTP id c7mr13087973wmb.82.1637438275285; 
 Sat, 20 Nov 2021 11:57:55 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:a1df:22c7:4448:7943])
 by smtp.gmail.com with ESMTPSA id e7sm4663340wrg.31.2021.11.20.11.57.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Nov 2021 11:57:54 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 20 Nov 2021 20:57:50 +0100
Message-Id: <20211120195750.1919374-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH:LTS] suport/docker: update the strech image
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
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The current stretch image we are usign on the maintenance branches still
has the old Let's Encrypt certificate that expired a few weeks ago,
causign a lot of download errors:

Suggested-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@gmail.com>
---
Note: when this is accepted, I'll regenerate and push a new image to the
docker hub, and send an new patch to use that image.
---
 support/docker/Dockerfile       | 4 ++--
 support/docker/apt-sources.list | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index a9bacca3a0..9bd62a04fe 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -4,9 +4,9 @@
 #   sudo docker push buildroot/base:YYYYMMDD.HHMM
 
 # We use a specific tag for the base image *and* the corresponding date
-# for the repository., so do not forget to update the apt-sources.list
+# for the repository, so do not forget to update the apt-sources.list
 # file that is shipped next to this Dockerfile.
-FROM debian:stretch-20171210
+FROM debian:stretch-20211115
 
 LABEL maintainer="Buildroot mailing list <buildroot@buildroot.org>" \
       vendor="Buildroot" \
diff --git a/support/docker/apt-sources.list b/support/docker/apt-sources.list
index 789fb8fc17..785b6a0d4e 100644
--- a/support/docker/apt-sources.list
+++ b/support/docker/apt-sources.list
@@ -1,4 +1,4 @@
-# Latest just before 20171210T000000Z:
-deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20171209T220346Z/ stretch main
-deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20171209T220346Z/ stretch-updates main
-deb [check-valid-until=no] http://snapshot.debian.org/archive/debian-security/20171209T224618Z/ stretch/updates main
+# Latest just before 20211115T000000Z:
+deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20211114T204852Z/ stretch main
+deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20211115T000000Z/ stretch-updates main
+deb [check-valid-until=no] http://snapshot.debian.org/archive/debian-security/20211114T121535Z/ stretch/updates main
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
