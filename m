Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567E1C7EE22
	for <buildroot@archiver.kernel.org>; Wed,  3 May 2023 23:53:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FC8241E1F;
	Wed,  3 May 2023 23:52:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FC8241E1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XtOLkouq2a-d; Wed,  3 May 2023 23:52:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B8CB41E37;
	Wed,  3 May 2023 23:52:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B8CB41E37
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CF39A1BF3DC
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 23:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B482D61498
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 23:52:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B482D61498
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3HG4HNUKXHe1 for <buildroot@lists.busybox.net>;
 Wed,  3 May 2023 23:52:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B39B6149A
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B39B6149A
 for <buildroot@buildroot.org>; Wed,  3 May 2023 23:52:40 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-517bdd9957dso4072872a12.1
 for <buildroot@buildroot.org>; Wed, 03 May 2023 16:52:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683157960; x=1685749960;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4zxk7/1QBpRRLE42yv3chaqj+SjH+hcdzAC4ERlMu2A=;
 b=Ut9wGeDqUQ1TORsiHFiq3IpZJX8/Yb0ZQUphQ/OZu5SSH5rcjsys9aOkswm37urnPh
 g3LfGw0FO1Jp37s2rvDAsSKawMHk+g8uCsFAmXg49ew7Vjgc6RjZUijWOioesAseV++7
 xMuLYDWr6pFJaGRN1fF16ZTsTQkCaf81Be6N5YCOgENRYzvdQuOxKYKr6IVddCo1lmH9
 4907449xOqPmUGG2jmUAaqUeuBKsKGDWqF5kkurVjX16lbXbCK+KQ9fgcm3r6uZ1JmAl
 re+EYfmY7XJfxeezxkXbTEs6KG3V0/AAvmbv3SzwcJdoHx9oWbIuDVLY0YUarpm9wUUi
 gXfQ==
X-Gm-Message-State: AC+VfDzNUYGwziBT86O6VXshEDEVoanXghiQBIG7fe/r/q+lpX9ut5H2
 BmILWcbyIoBsvIJK0w9NBJ4p524BLLMrcw==
X-Google-Smtp-Source: ACHHUZ4LRL81aOkEzJgdKiTwYp/jOyChrM/r+Pu5uWzGoSYOgZGFZVbt8PCP/hoxPRhiLeq+/57vaw==
X-Received: by 2002:a17:903:120a:b0:1a6:a988:b858 with SMTP id
 l10-20020a170903120a00b001a6a988b858mr1918277plh.58.1683157959961; 
 Wed, 03 May 2023 16:52:39 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 d7-20020a170902cec700b001aada56298csm8251492plg.199.2023.05.03.16.52.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 16:52:39 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  3 May 2023 16:52:35 -0700
Message-Id: <20230503235235.1441019-2-christian@aperture.us>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230503235235.1441019-1-christian@aperture.us>
References: <20230503235235.1441019-1-christian@aperture.us>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/docker-cli: bump version to 23.0.5
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
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/moby/moby/releases/tag/v23.0.5

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index 891ccf4b4e..e9e9a18cb1 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7d67500372b560110e8200815f7111962ccec7d0eb3b743f80e262c38e2f7b82  docker-cli-23.0.3.tar.gz
+sha256  2d6599783d447ac56d4caa482e9d8f09ad9e6f91ba2be6707bc107be04f89ddd  docker-cli-23.0.5.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 69c4f76ee6..522971ac98 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 23.0.3
+DOCKER_CLI_VERSION = 23.0.5
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
