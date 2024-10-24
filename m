Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4986D0BB5E
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 04:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A11B3600B6;
	Thu, 24 Oct 2024 04:48:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7PhnSciZ-0G5; Thu, 24 Oct 2024 04:48:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA2526089E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA2526089E;
	Thu, 24 Oct 2024 04:48:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E75EF972
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 04:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C76844075A
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 04:48:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5OWA1ePFwncV for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 04:48:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AD67D405D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD67D405D7
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD67D405D7
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 04:48:52 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-3a3b8b34be9so2103535ab.2
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:48:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729745331; x=1730350131;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AmytOKNi10LpChrwwfRUNVh6S9+hUiXwFNEFAhl3t6o=;
 b=xJfCTnaR3/wJXLzkOkg7HqaPiNsCCV5bBE5UG6XAMlctoAOzvtlFhs6i96NhYfT3Z/
 nz6MAKktbqfXM60UcH5edgX6u3R8oQQASzwvwIub1o2JiLy+aqxOi+N/BKyImm91YN54
 /SieQrYdjCczwfWTH2xeIz7By0XOS79QZa6Wxvh/qezTWEz8D5c0yeLeat/lk+DvSiA3
 ntqaG0iMJ8Y01hjIhJhaE4fwqqwCEcgACR2Y+dilJzZoCg9gZjq0rLVcjQVmU/mEq3Ng
 qNtLlyKlayrncAoQqzkEcBu35l4yX1q5JNmaia/HrU1p2zaW+mYYR6PPeSxuhNjyHhKb
 ZNvw==
X-Gm-Message-State: AOJu0YzIJmHwewlntQqZbUkgof+uIc+ggM2i3thf74yjvfVFeGaKinx7
 zYsnqDyhDGbac9COwK/GU2v5wOj1x78icKHmGEAzUeJmCa1ayiAnntWXlA==
X-Google-Smtp-Source: AGHT+IEN6akDt2N+HCyz+3SWybNJrfomStbzSbsYwJxKcPjtLX94n6hoCDy7VPiNq1iCAyHVlTzxkw==
X-Received: by 2002:a05:6e02:1c2a:b0:3a1:a5dc:aa4e with SMTP id
 e9e14a558f8ab-3a4d595e403mr54967205ab.8.1729745331129; 
 Wed, 23 Oct 2024 21:48:51 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a400aeaadesm28744325ab.48.2024.10.23.21.48.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 21:48:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 22:48:47 -0600
Message-Id: <20241024044847.3377114-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729745331; x=1730350131; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AmytOKNi10LpChrwwfRUNVh6S9+hUiXwFNEFAhl3t6o=;
 b=U4I4F1lx3wrRp1J5KJTFmIEo5seqIIUA5p50dWqWQWtd5rxG5ynXzonunOpWsLznv4
 S0vHwuXQcSaoFw60TsVErerXPBgYtttkphjGPANZBLqQhUJ9A1dinUWPi5CL7vZNhd7h
 0Tm0H6q/2hTUlEMt5upSt+Akv/7WU6Am9gbQ4sAwEgLKQxbPzFXzsRgWCz7AtvtWe2r+
 bbWYVaObp67rdPhn1AAoz3eITkUC9C2bGI8UzHDLJTr1cBuRH4W820uHbffHoFWfk+pL
 80RDlfMR8dMQLRy7EWeSPtH3aR14owPpjJFQ+JnR0HlXI1804EYn5OETH1mArV6QqGaz
 0CCQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=U4I4F1lx
Subject: [Buildroot] [PATCH 1/1] package/python-hatch-vcs: use hatch setup
 type
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the new hatch setup type which automatically pulls in the
host-python-hatchling dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-hatch-vcs/python-hatch-vcs.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/python-hatch-vcs/python-hatch-vcs.mk b/package/python-hatch-vcs/python-hatch-vcs.mk
index 46e59f8aa0..f63d8b26fe 100644
--- a/package/python-hatch-vcs/python-hatch-vcs.mk
+++ b/package/python-hatch-vcs/python-hatch-vcs.mk
@@ -9,9 +9,7 @@ PYTHON_HATCH_VCS_SOURCE = hatch_vcs-$(PYTHON_HATCH_VCS_VERSION).tar.gz
 PYTHON_HATCH_VCS_SITE = https://files.pythonhosted.org/packages/f5/c9/54bb4fa27b4e4a014ef3bb17710cdf692b3aa2cbc7953da885f1bf7e06ea
 PYTHON_HATCH_VCS_LICENSE = MIT
 PYTHON_HATCH_VCS_LICENSE_FILES = LICENSE.txt
-PYTHON_HATCH_VCS_SETUP_TYPE = pep517
-HOST_PYTHON_HATCH_VCS_DEPENDENCIES = \
-	host-python-hatchling \
-	host-python-setuptools-scm
+PYTHON_HATCH_VCS_SETUP_TYPE = hatch
+HOST_PYTHON_HATCH_VCS_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
