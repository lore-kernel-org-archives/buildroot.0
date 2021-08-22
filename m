Return-Path: <SRS0=qqE2=NN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60785C4338F
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 18:53:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 249996126A
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 18:53:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 249996126A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4844401AE;
	Sun, 22 Aug 2021 18:53:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lS66QYBmabR1; Sun, 22 Aug 2021 18:53:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B5CA40252;
	Sun, 22 Aug 2021 18:53:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A96F21BF47A
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 18:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 980D240252
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 18:53:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p6VbERK4STzs for <buildroot@lists.busybox.net>;
 Sun, 22 Aug 2021 18:53:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AC03C401AE
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 18:53:16 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id k8so22771137wrn.3
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 11:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1Yp+pA3t15+nqiTV0Jew7TeDtnDhG5cNePRS5y5UaCk=;
 b=jUHqKn7YvZ+LiFmxk+ks8Z9aFDL+ecMCAnCtR5ARNh4/sCAxYVVRnyh4YdsZBX4BVZ
 4BX8S/VUEd0XI5TPGnWa93LcxfhZRwnZDsvhXkuLEPPZ51Dj7LQezAqNhoqOKqgtm9P6
 0f/fCXqUabzdfHY8ezrNbdywGMGd8wL0sTqnhA5wPjI/EnloOK88q2tKSxfe+fg1I6rZ
 SbjG1rBcSxA4hyKTihLO7UVOjOtv5Huusz9QgRZpBgUTXwZFe3jgONqmagZ0blWopMFb
 BAyyGYRbCYw/rMKfSTuw5c80oenzjpXeHAduIOH1VZ32DH8cNZt0aS9eS5fFP4vEZCyQ
 fX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1Yp+pA3t15+nqiTV0Jew7TeDtnDhG5cNePRS5y5UaCk=;
 b=h2KqX48E75KFU6gRpzwFkhDycsY3LyC3OKaw3xYYbs1fHJ87yQS1CQSisbPzoQLE5F
 P8yaZGJvwPUguDRvqKgPhPApn8CuNsHDUzWHxsg7Ea3Uv7rp2kApE+v50nGmum+GjyLX
 xfxblD7P2XhmSKRYEZl4AFQh8v7nlOe9NYZKiLrrqIWVKYkrtx2AiUjRiyovRzi5NW+8
 E/5RK2miiRh9vuIZPpYtA0KF5s+0pjEebj7UoqCegEiAehoD8LyirXX2YPHcTixrCa9n
 PwzTGi0WAxQxzUcYpCg0l45Thr32nJ1rMJLtDUa48T+B5O+So9zG8Xug0RQbKlx9KfkG
 uGQA==
X-Gm-Message-State: AOAM530PzYI5xjc9tQ4hd/H2jOQPolXp1u2kF8h5SrjzvgmFFAHtkPLD
 FYiscUbt/pdfZH3vPIUIH/i1aiGjbmE=
X-Google-Smtp-Source: ABdhPJwRjfnUUuWb01frQaSxXfjjratZ3HdjeCDOJcu1iFE7TJ7yXA3XvjYDvOe37M6bX5hYiJDwKw==
X-Received: by 2002:adf:efc2:: with SMTP id i2mr2969097wrp.94.1629658394815;
 Sun, 22 Aug 2021 11:53:14 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb058f8a180098814a9aef637f91.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91])
 by smtp.gmail.com with ESMTPSA id q22sm16174970wmj.32.2021.08.22.11.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Aug 2021 11:53:14 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Aug 2021 20:53:08 +0200
Message-Id: <20210822185309.2914068-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] support/testing: test_docker_compose: bump
 the kernel to 4.19.204
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

gcc 10.x is now used by default but the kernel 4.19 used by
test_docker_compose doesn't build with it.

Bump the kernel to 4.19.204 release that contains a lot of
fixes for newer gcc.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/testing/tests/package/test_docker_compose.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_docker_compose.py b/support/testing/tests/package/test_docker_compose.py
index 142ac95d03..35e659a74d 100644
--- a/support/testing/tests/package/test_docker_compose.py
+++ b/support/testing/tests/package/test_docker_compose.py
@@ -16,7 +16,7 @@ class TestDockerCompose(infra.basetest.BRTest):
         BR2_ROOTFS_POST_SCRIPT_ARGS="{}"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="{}"
         BR2_PACKAGE_CA_CERTIFICATES=y
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
