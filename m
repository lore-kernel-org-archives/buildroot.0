Return-Path: <SRS0=oNq7=PI=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CC02C433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 20:38:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0ED061284
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 20:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F0ED061284
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9441A83B85;
	Wed, 20 Oct 2021 20:38:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xbVXTbjQjn8S; Wed, 20 Oct 2021 20:38:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAFB383A8F;
	Wed, 20 Oct 2021 20:38:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A8D1E1BF2C0
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 20:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 984674079F
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 20:38:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YAJJsVrRjt2N for <buildroot@lists.busybox.net>;
 Wed, 20 Oct 2021 20:38:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A6A3840667
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 20:38:24 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id v127so20865591wme.5
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 13:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a0SW0ZwzJUFxpt1AaFnLeT17dW01CS16o59fJ5Qgfmc=;
 b=oqlHYoxvzIBJTgip59217j/x98c+LUtfQ8YgYmsDePGSm0tbBKxwXHLjBUJPcdpGRl
 A9d4x84osiXmPJLN6HP3RaOWh8TPePmSnlVSe9rmKMweZKmybx98AnxhHEkey0uE+Uyo
 qVQLUDY8dYHhpGT0Fs33fROljwKkEYF3M6JNdiUC+oEMEN0j2XUjSxQKI/XeYEgYgxec
 wiqLcyOZMoctjY+rU77EYFLl++edcDqwtAbRZxBao4A7K535BbLBfaHfArpETcB+AuPV
 uNmIbzFbiT5n/YWimTNiaxevGJJ9aWBIY5BD6eyOxjqfjUsMHN0v91RMUP2Pgkv7e92U
 BQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a0SW0ZwzJUFxpt1AaFnLeT17dW01CS16o59fJ5Qgfmc=;
 b=eai3SDaEUsgXdI58ZfQJyiafhm558wAA/qfiU1c/sRtCfmYPVH9gtBQ/h9e+k7Ev7A
 W7BKERTUhyvppIcenHXirNtTEaEMCrecl+GQ9KGIakkafMnOY5jf12hovwHK2ChHG0iu
 V9VYMR76T/KzN9BHOoCfn8498Uqv8znZiURf9v/8mrI9Fiu/trNxYmMJW2wKlA4fSrxU
 2quyuGr8qSbXf8nks36CO4AHxwjfzZCsrB7m8xb5rDTBGtjudRx132ZuVPfFJGyEpBX3
 FIJu+bDff0wmoO8Tn9bdQcRkmwoKUaT73Umz7FMN8WV1uQEYZi4U2lyrA+ROgrtYHHuW
 aDmg==
X-Gm-Message-State: AOAM532lc49HzDqYDqKcxFUVwKqUFltgbwxsiT83Rm6f/1qTX39Q5Isy
 h+1FosRAFi7HK/ga10PzArdjTLsO/34=
X-Google-Smtp-Source: ABdhPJxeQLdU9ceRfDPKGBZQf1IUdDl+Ctux1Lq/y3znOPe6QGJoy3bOMHVrowd8n2mLq6FFhC9ioQ==
X-Received: by 2002:a1c:4d15:: with SMTP id o21mr16359344wmh.167.1634762302861; 
 Wed, 20 Oct 2021 13:38:22 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id u2sm2844420wrr.35.2021.10.20.13.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 13:38:22 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 20 Oct 2021 22:38:16 +0200
Message-Id: <20211020203816.128986-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] gitlab-ci: use the Docker image from gitlab
 registry
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From [1]:
"In November 2020, Docker introduced rate limits on pull requests from
Docker Hub [2]. If your GitLab CI/CD configuration uses an image from
Docker Hub, each time a job runs, it may count as a pull request."

Since then, some jobs in our gitlab-ci fail when this rate limits is
reached [3].

To avoid this rate limit, move our Docker image from dockerhub to the
registry provided by gitlab. Keeping the image from dockerhub would be
possible by using dependency proxy [4] but the gitlab registry is good
enough.

Tested on gitlab:
https://gitlab.com/kubu93/buildroot/-/jobs/1694863584

[1] https://docs.gitlab.com/ee/user/packages/container_registry/index.html
[2] https://docs.docker.com/docker-hub/download-rate-limit/
[3] https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590417
[4] https://docs.gitlab.com/ee/user/packages/dependency_proxy

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 150b8eac1a..dc45744a81 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,7 +1,7 @@
 # Configuration for Gitlab-CI.
 # Builds appear on https://gitlab.com/buildroot.org/buildroot/pipelines
 
-image: buildroot/base:20210922.2200
+image: $CI_REGISTRY/buildroot.org/buildroot/base:20210922.2200
 
 stages:
   - generate-gitlab-ci
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
