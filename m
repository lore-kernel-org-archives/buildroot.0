Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5715AC27C52
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 07:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1BF482224;
	Thu,  6 Jun 2024 07:22:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VuuLn6oHoxp3; Thu,  6 Jun 2024 07:22:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DABBD8222D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DABBD8222D;
	Thu,  6 Jun 2024 07:22:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4EBB31BF292
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 07:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 39572416AD
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 07:22:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q1xCE0hkjBgE for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 07:22:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com;
 envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6977A41691
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6977A41691
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6977A41691
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 07:22:09 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-371c97913cdso2337425ab.3
 for <buildroot@buildroot.org>; Thu, 06 Jun 2024 00:22:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717658528; x=1718263328;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Te1LMgWUMEwQturcghcFNoz8EgyHuaY3e8zwJnSSh0U=;
 b=fKfIXg8tL2Sf1PHEjCZcQw/GUwY5Xm7OZIZtNXOW+w1mfkb/QZd+eIXx/RbWXaVoL4
 ZnmkDDdLYtgoLklkiX0GjoRvFIPwofn8bOShl3ooNgcIiuQnm/2rUCzTcLtyQ+RVpxzS
 UtZ1mtkfZBH6FWbthOUNlaFkD7O7o2hyVbe+QPeqPDwOv9Lg+NaU1G1W+0Q1dEiIDDzu
 tgoJZGTZ+YpMvFfdBEtivUHVHYfB1Pct9kOUs1k+XqTUL0LlfmauDmf1EbQZchd8gB40
 keWgSXWJOqDMoG/r2D+g5YmDnzZ/7wa4z3gyxKiOO7ewfo9ILPCcJaMcI/+SmcqsgQdq
 GpVQ==
X-Gm-Message-State: AOJu0YwklcdYpHyN1N1RZu/Swf+ln3FcEEiLFdHkij0Nvt4wI7q037cY
 ZD4G8y1WQjciYkcgRKqdGsdqH4RzhenNW3PGQyn0SUXOwbFuU7aMOXg/+Q==
X-Google-Smtp-Source: AGHT+IF7UF5X+6LGNj7l/AGcU+acXWZcCdY3S5K0w9WajLv2MBRUOOEZk1Q93ZpDbGQj+qV7ncM0Kw==
X-Received: by 2002:a05:6e02:1d05:b0:374:9af0:5f38 with SMTP id
 e9e14a558f8ab-374b1f55db6mr46547025ab.32.1717658527876; 
 Thu, 06 Jun 2024 00:22:07 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-6de264ae1b1sm578472a12.74.2024.06.06.00.22.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jun 2024 00:22:07 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 5C4BF183262C3; Thu, 06 Jun 2024 14:22:04 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Buildroot Development <buildroot@buildroot.org>
Date: Thu,  6 Jun 2024 14:21:47 +0700
Message-ID: <20240606072146.281831-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1493; i=bagasdotme@gmail.com;
 h=from:subject; bh=EjFD7gTjZt4nJMLJPuHww+Nc8XdShddALnYpM3kvPBk=;
 b=owGbwMvMwCUmqirOYPHY4znjabUkhrTE5O5rZxN5FCcyblmYs7ze50dAntfHt9LLj+Z5/dl6b
 8fHoEKnjlIWBjEuBlkxRZbotbK7jHn3XjKLSSiCmcPKBDKEgYtTACZStZeR4Y7aRQ21dMtvfZME
 FouKnEif/7sto3tDtsC/8uZtYvM8gxj+ZxRO7r7384m2WeyD/44d5+6u3b2O7UP0xP9lNf5/Yya
 UcQMA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=5BAD1DBA330DBDD2365C60721525170038E348E7
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717658528; x=1718263328; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Te1LMgWUMEwQturcghcFNoz8EgyHuaY3e8zwJnSSh0U=;
 b=ZLYIbjggrEvFd34P++PpC949IHYEMPNB8LhSzVahakh7JUhcifoRrvkUmpp+84vPCg
 FDaWYiCP6c9VHY7RpZBH1Nde7wy0N/GLwT0bi8rHXomr+bkpMUEs/KJu0DK72T6NMyKO
 DOlevU4TzGKNNBIwRBP39C2sNc1RmWw/iJe9FJFu621bVuSbNQdo0UFJ3saGXfFU1KJJ
 YiT2dygLrMm31FFayhAGiyJZEgzm5dw8nw2E6ks/Ugb3yIi4iGYzJSrdWce9DwCNddkl
 htiCWwjlrd8mVwwaXngQL3Wa6RVQpK7iovh127FWK92rCCZGc/lBTVqDDHKYccaELKvq
 IQ1g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZLYIbjgg
Subject: [Buildroot] [PATCH] package/git: minor bump to 2.45.2
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Minor release bump to address "git lfs" and "git annex" breakage (for
release notes see [1]).

Link: https://lore.kernel.org/git/xmqqr0dheuw5.fsf@gitster.g/ [1]
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 7dbeec714b..f72fd60ec2 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  e64d340a8e627ae22cfb8bcc651cca0b497cf1e9fdf523735544ff4a732f12bf  git-2.45.1.tar.xz
+sha256  51bfe87eb1c02fed1484051875365eeab229831d30d0cec5d89a14f9e40e9adb  git-2.45.2.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index 04f489e038..d84b2e487c 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.45.1
+GIT_VERSION = 2.45.2
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+

base-commit: e19ae5ecad7a12673d61781f9090c2610f2dcf18
-- 
An old man doll... just what I always wanted! - Clara

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
