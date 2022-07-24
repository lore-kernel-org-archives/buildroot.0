Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96AB7C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 05:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 203628469C;
	Sun, 24 Jul 2022 05:52:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 203628469C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0GHcXAqp82It; Sun, 24 Jul 2022 05:52:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 311B883E70;
	Sun, 24 Jul 2022 05:52:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 311B883E70
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7CAE31BF964
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 05:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 626ED60C09
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 05:50:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 626ED60C09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ms7mBfqUJcI6 for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 05:50:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A080F60AD8
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A080F60AD8
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 05:50:39 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id n206so9924666oia.6
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 22:50:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=ZTRKRyMxG29SyJcJ6EuwXUVGlCcrySlEusTuGqfCWMQ=;
 b=tkhaZRwOIY+ENDBYZEgqWdVkrczajx9loZu0RymFXhlvRl8ie1vxqGEwrDmWmrdkWq
 ZiP1W4bnuXusBzr3MBS3Ov24UjivFsvKR1keadyAlVgbU5n+oWe0no7OMIjbjCRZ0wfx
 V5V5Sit05ciW+sa2Hc62odckiXlVtYex3L1+zPURW/+jSznU8J1fT9QrB/VuPgjK0JlQ
 2GFgEDobYTmZdSmcxKDRaFUOsSRHUCZN2UeWdbSTbORdnQ3qKcv5iS8Mao8n3e8yktUz
 gcFDdDoq9u4JscjdapbDWFHObpQ9Vl2/PUCyolxCp6QgRw7O0xodKxW7hlmhOQaFB23B
 24BA==
X-Gm-Message-State: AJIora/YboG+qRYIu7fByqmdpLwmYnSOhgxk1m+y3uYvBjDAzd7jhW1a
 3HAJ7hRV2oY3OGNmMcepQJb22tS0mgA=
X-Google-Smtp-Source: AGRyM1tZD+/325FFVWUo+uPrdhsMlD7XW6/f6G7Z3EqjF+bnIJMMPqM9G/1r0P6rteOPPQljnTy6FQ==
X-Received: by 2002:a05:6808:191b:b0:33a:ac22:da2d with SMTP id
 bf27-20020a056808191b00b0033aac22da2dmr3034651oib.83.1658641838705; 
 Sat, 23 Jul 2022 22:50:38 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a056870818d00b000f5d8d031b6sm4236969oae.49.2022.07.23.22.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 22:50:37 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 02:49:03 -0300
Message-Id: <20220724054912.2354219-8-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220724054912.2354219-1-ricardo.martincoski@gmail.com>
References: <20220724054912.2354219-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=ZTRKRyMxG29SyJcJ6EuwXUVGlCcrySlEusTuGqfCWMQ=;
 b=AxUWQkROPFIjosmuTOwNHwAkd16z6lqWbl141Jg5dBqvZDAVuMF+Mq7oaJLPdojoqb
 RyV94s5mcLT3FSSPDHojBHEL53j+18dmA/n/JKfTayCMFndS81uDepn5vrr/OScKFXJH
 AFO9piP0mh93pF3ZFRtv0T/xgE6lbLMwxprPe8uEDcOlH1LxM96osViV3x5LUoMdMn6W
 gE+/q/nY0blbnq+xXoScJgZEpzlZxnFzK3kDi/u9FZrNDtc5ybxFjTntgS564GUB/4/E
 y+YoFgO5U4l2EeVFKm+fNPGfEF7AVIDZYV08dYuWBUfKaZx4EVD3VeSGrZGKNWFexfsg
 iUjA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=AxUWQkRO
Subject: [Buildroot] [PATCH 07/16] Makefile: run check-* inside docker image
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently the result for both check-package and check-flake8 targets
depend on the version of the tools flake8 and shellcheck installed on
the host.

In order to ensure reproducibility across machines of different
developers, always use the docker image to run these targets.

When one of these targets is called, test if it is already running
inside the docker image, and if it not, start the docker image and run
the same command inside it.
Do the check for the docker image in a simple way: just check current
user belongs only to group br-user. It is very unlikely a developer has
exactly this user configuration in the host.

Add a note in the Dockerfile about this use.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 Makefile                  | 10 ++++++++++
 support/docker/Dockerfile |  1 +
 2 files changed, 11 insertions(+)

diff --git a/Makefile b/Makefile
index bd7ab9675d..f42dc3151d 100644
--- a/Makefile
+++ b/Makefile
@@ -1237,6 +1237,15 @@ release:
 print-version:
 	@echo $(BR2_VERSION_FULL)
 
+check_inside_docker := $(shell if [ "`groups`" = 'br-user' ]; then echo y; else echo n; fi)
+
+# List of target that need to run inside docker image to ensure reproducible results
+inside_docker_targets := check-package check-flake8
+
+ifeq ($(check_inside_docker),n)
+$(inside_docker_targets):
+	$(Q)utils/docker-run $(MAKE) V=$(V) $@
+else
 check-flake8:
 	$(Q)git ls-tree -r --name-only HEAD \
 	| xargs file \
@@ -1246,6 +1255,7 @@ check-flake8:
 
 check-package:
 	$(Q)./utils/check-package `git ls-tree -r --name-only HEAD`
+endif
 
 include docs/manual/manual.mk
 -include $(foreach dir,$(BR2_EXTERNAL_DIRS),$(sort $(wildcard $(dir)/docs/*/*.mk)))
diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index f54c31b54a..afe8911e78 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -60,6 +60,7 @@ RUN sed -i 's/# \(en_US.UTF-8\)/\1/' /etc/locale.gen && \
 RUN useradd -ms /bin/bash br-user && \
     chown -R br-user:br-user /home/br-user
 
+# Note: below user is used to check if we are running inside docker
 USER br-user
 WORKDIR /home/br-user
 ENV HOME /home/br-user
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
