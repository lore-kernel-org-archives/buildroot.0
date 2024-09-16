Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C8D0C3ABA2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 15:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 000FA40DC4;
	Mon, 16 Sep 2024 15:12:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DNP-6jyRQ0Ol; Mon, 16 Sep 2024 15:12:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C52C640DBF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C52C640DBF;
	Mon, 16 Sep 2024 15:12:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6B61C1BF41D
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 15:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC9F9406EB
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 15:12:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wE3nynixTb-i for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 15:12:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::641; helo=mail-ej1-x641.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6A70A40701
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A70A40701
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A70A40701
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 15:12:16 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id
 a640c23a62f3a-a8d14fa17daso52917466b.0
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 08:12:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726499534; x=1727104334;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JH7oTqit2W2FyGUQ7aPZusZZEwFgMfQuSCqexFa2hh4=;
 b=S23ho4isGwGAhL9PVVLzGWVjAftA9cWzEVhCofgG54M4cg5cTX389vXAgY3+/lyiXM
 5upbsROL8CzQ1A+HuUzoOgRrPYRa6/dCcGH0UkqOD+5cuyRoMHSpASVBPhtb1nxJGLUN
 vI95Qx4qOf05qTBJS6HuThhI0wjF/BbTrj8qKy8+8bHQZfRS5SQUqLR+L6IIO4A2n+Z8
 84S5iUXTcub1sRLp7xB7W/l1Al0Lc0RoceNUy9NZWG//jmKJh7ILcJujv8+rbUswEhDl
 SD/a/gYINUHCj2PRRnEiWy4LvmOEPil5Zhylu5hQbtgGYauLhEd8qmXEfMkBvbsszJx8
 52qw==
X-Gm-Message-State: AOJu0YypKZCEeDaaYA7GzBNElbZ3z1N77E52JSRxe4xsblWRi2lPBhgs
 Xbe79hvWU/rWXUpWKxGpS2UOtcW9Df0lbyg3yFxGNCZZmgWrglz68Sl8hbn9N+/1WqYYfQstUuY
 vh6eRqJeU
X-Google-Smtp-Source: AGHT+IE/s55xrY3iQ1OuITFKMGPiqyCNMZjd7dGaF7rLd8iMlfgPf7C4N5mY5jJ9aPlKngaaXVBxqg==
X-Received: by 2002:a17:907:9724:b0:a8a:9054:839b with SMTP id
 a640c23a62f3a-a902960c6famr708139666b.10.1726499533885; 
 Mon, 16 Sep 2024 08:12:13 -0700 (PDT)
Received: from adam-laptop.ipgroup.local (212-57-59-66.xdsl.deanconnect.nl.
 [212.57.59.66]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90610f440bsm330460166b.86.2024.09.16.08.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 08:12:13 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 17:11:58 +0200
Message-ID: <20240916151206.947484-6-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240916151206.947484-1-adam.duskett@amarulasolutions.com>
References: <20240916151206.947484-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1726499534; x=1727104334;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JH7oTqit2W2FyGUQ7aPZusZZEwFgMfQuSCqexFa2hh4=;
 b=IZpPZ6uYlgUaByxkfB0VDAMKrG7ZOmjHwPW+dqTCopCCkAFD8n2V1sb3GqGSOg7nbS
 4sdsTjh9oEMtlKjPXGipEOHUw+7LErSPPr8nKAyZv6IwrnXEA1vil3uihO4llg6G+l9x
 VoMm2B/jXBbj+CiZ2u0DgI1EEpmSS1NJg6q+w=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=IZpPZ6uY
Subject: [Buildroot] [PATCH 05/13] package/checkpolicy: bump version to 3.7
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Antoine Tenart <atenart@kernel.org>,
 Marek Belisko <marek.belisko@open-nandra.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/checkpolicy/checkpolicy.hash | 2 +-
 package/checkpolicy/checkpolicy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/checkpolicy/checkpolicy.hash b/package/checkpolicy/checkpolicy.hash
index d2ecc7265a..e768a80cdf 100644
--- a/package/checkpolicy/checkpolicy.hash
+++ b/package/checkpolicy/checkpolicy.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  1b346b3cdd4f8a78a157627bad64a3b3479c67b6a19d15e6d5c8694620eadbc1  checkpolicy-3.6.tar.gz
+sha256  fd3e1925477d49946d1116938661af44c1f86f0d681466fd9f02eaa06002a07f  checkpolicy-3.7.tar.gz
 
 # Hash for license file
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/checkpolicy/checkpolicy.mk b/package/checkpolicy/checkpolicy.mk
index 109aaf6072..adf125ebf8 100644
--- a/package/checkpolicy/checkpolicy.mk
+++ b/package/checkpolicy/checkpolicy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHECKPOLICY_VERSION = 3.6
+CHECKPOLICY_VERSION = 3.7
 CHECKPOLICY_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(CHECKPOLICY_VERSION)
 CHECKPOLICY_LICENSE = GPL-2.0
 CHECKPOLICY_LICENSE_FILES = LICENSE
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
