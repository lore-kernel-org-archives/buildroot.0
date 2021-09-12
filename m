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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A455DC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 14:13:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74FE260FED
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 14:13:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 74FE260FED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3AD044013A;
	Sun, 12 Sep 2021 14:13:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13B0ymHJbnwZ; Sun, 12 Sep 2021 14:13:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CCFD4014E;
	Sun, 12 Sep 2021 14:13:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BED091BF471
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 14:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF145608B8
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 14:11:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LpUYX00Kfzgr for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 14:11:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C1ADB60BDB
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 14:11:53 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id w29so9638083wra.8
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 07:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RRiXIe0aK5fiIdwZalzrUHl3TM22DiWH98hFW/f+mZo=;
 b=XHXTBZUTzE/t1HVVboGWeBpPALMHo1i1NCAXkTpd4xrbivxjT9Af9RuleCQWx77flK
 hQAH9+GFE4zoAbwl/20vRI5SeNHqd9LHVVR4pF60K+bxW6dcqJvZHNnApLT7NfEc//JR
 0PVQDSaBmTma0JMD2ZVPuBh9ZPuwXDOG++CwU97DFla1qBgPYTN/LGGTIonTuUcPoWBn
 Y5cUbI1BVG8b0ePMZusmS92AkxBBA2ZljWWQwYwshZv4lzPjoTneFBzVya5caz/2mj5/
 LGzXscG8ndt3CouhVm1k/Ezabnrtk0qGdZKFjc63m3sP0jHiV7zIgAefSXZpo8KNX/Q0
 xmug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RRiXIe0aK5fiIdwZalzrUHl3TM22DiWH98hFW/f+mZo=;
 b=qNjOPNr6xWVWmAJsyR4qJfEgwee+lHphfyCgYhCtFjqa3jXHonpoH5aGvI20DYxRUg
 4af4E9AW5Bml38jXhxxdi4QkK2R1EyiC7IaOpNqe2ijkmpxn1i29lwaR27Hej4tO56e6
 Hslg6dPt79xg4+7iFa6kB9fLYy5RKtRmoJxx8SrrWX5ONguhKR4ZZh16FTImTlp6dlXl
 ynq2ptDQgXkbWi5iqnA1qh1tZFJ37AvDZepdd0jvNAYFtY9eRf6Q2U+BqsWRavYuHtzq
 wkwrW61wHx22xzB5WrxnBS8xKuPUb1UXGghlZYNlF9itrTsomgGaoED/BPg32h7aV35l
 plCw==
X-Gm-Message-State: AOAM5309oSNo58ez3+N91cO6QRg1enktvrKCKdA03CodxtzxGocWS08H
 aoOR+jPtplvhXuPe6NQTWrWoW5ZGxyw=
X-Google-Smtp-Source: ABdhPJyIr6imXixNFw4hhdf7Z1fE4ncDdt4JQfSqmjulhTkYChz+k+32zY1/cqSq+kKWRcEIsiADkQ==
X-Received: by 2002:a5d:4cc6:: with SMTP id c6mr7017698wrt.108.1631455912141; 
 Sun, 12 Sep 2021 07:11:52 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb058f8a180022164e4eb697b4ce.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:2216:4e4e:b697:b4ce])
 by smtp.gmail.com with ESMTPSA id i5sm4570062wrc.86.2021.09.12.07.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 07:11:51 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 16:11:35 +0200
Message-Id: <20210912141140.253778-9-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210912141140.253778-1-romain.naour@gmail.com>
References: <20210912141140.253778-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 11/16] support/docker: bump docker image for the
 gitlab-ci to Debian bullseye
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Starting with Qemu 6.1.0, gcc 7.5 is needed to build.
Since we build host-qemu package for qemu defconfig, we have to
upgrade to (at least) Debian buster that provide gcc 8 as host compiler.

While testing this upgrate, the test_edk2 failed since it actually
requires Qemu >= 4.1.0 to support arm SBSA reference machine [1].
Debian Buster only provide Qemu 3.1.

Finally, upgrade to Debian bullseye but it requires some linux
kernel version bump in several defconfigs since host gcc is based
on gcc-10 [2].

Add explicitely python package in the Docker file to install python2
on the host.

[1] https://git.qemu.org/?p=qemu.git;a=commit;h=64580903c2b3aee08d74d64e6248a313b246cb69
[2] http://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/commit/?id=621f2ded601546119fabccd1651b1ae29d26cd38

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
The docker image must be rebuild and pushed to https://hub.docker.com/r/buildroot/base/
---
 support/docker/Dockerfile       | 4 +++-
 support/docker/apt-sources.list | 8 ++++----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index a9bacca3a0..795b26c276 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -6,7 +6,7 @@
 # We use a specific tag for the base image *and* the corresponding date
 # for the repository., so do not forget to update the apt-sources.list
 # file that is shipped next to this Dockerfile.
-FROM debian:stretch-20171210
+FROM debian:bullseye-20210902
 
 LABEL maintainer="Buildroot mailing list <buildroot@buildroot.org>" \
       vendor="Buildroot" \
@@ -36,6 +36,8 @@ RUN apt-get install -y --no-install-recommends \
         libncurses5-dev \
         locales \
         mercurial \
+        python \
+        python-six \
         python3 \
         python3-flake8 \
         python3-nose2 \
diff --git a/support/docker/apt-sources.list b/support/docker/apt-sources.list
index 789fb8fc17..0f872fd398 100644
--- a/support/docker/apt-sources.list
+++ b/support/docker/apt-sources.list
@@ -1,4 +1,4 @@
-# Latest just before 20171210T000000Z:
-deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20171209T220346Z/ stretch main
-deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20171209T220346Z/ stretch-updates main
-deb [check-valid-until=no] http://snapshot.debian.org/archive/debian-security/20171209T224618Z/ stretch/updates main
+# Latest just before 20210817T000000Z:
+deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20210902T205533Z/ bullseye main
+deb [check-valid-until=no] http://snapshot.debian.org/archive/debian-security/20210902T193650Z/ bullseye-security main
+deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20210902T205533Z/ bullseye-updates main
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
