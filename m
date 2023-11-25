Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB85FC61D9D
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 05:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CF0460D51;
	Sat, 25 Nov 2023 05:14:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CF0460D51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Ezi9C6WBVfZ; Sat, 25 Nov 2023 05:14:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFDA260BCB;
	Sat, 25 Nov 2023 05:14:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFDA260BCB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5DEDC1BF4E5
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 05:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 437C94216E
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 05:14:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 437C94216E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gNc_785PjR5J for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 05:14:41 +0000 (UTC)
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3921E4216A
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 05:14:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3921E4216A
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-7b34ddcc625so79785739f.1
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 21:14:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700889280; x=1701494080;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eD37p0/3QwKZmnghR0i8l3lcrzH22uiGUalUnX2faGE=;
 b=OYmaNtXxwi6gN2VC7GpLBgoEIAwHe4PRJA9xyjM5aOmQBCImX5JstypwBQDzx0nQ8O
 OlOx/7X8PKULEVXibuUhDFQNz5i8RCsAMBcIREb87JJiPPZl4JC+pWL40hguuUme1LHV
 HYnQZ9H17Vjqs3SpStD8m6Et99rttvEMOlSMAyGnPJEzE7bmd6OhLhUMN+1JCTA43yp6
 pR3yCm/Lr23HtfcaHeLLiarHL7VWJdYWGQWJbD28xbCAW0sXPbcJ7P9fNYtOv/wBzYlD
 n6nasCbZackCW0GB7kkJCrjAFYoxYOYIoji01+9xr6HVFG24BxVu9uX53GcxGjdxdxC5
 WoNA==
X-Gm-Message-State: AOJu0YwkV1xMT2zOBWLVkDOozuV/YDjJoPuv6n29FVB/SmVXKxLfBFpI
 w+IQDbAD6tJhioyhp95LapiBTS95sOA=
X-Google-Smtp-Source: AGHT+IHwUIqfHTquqqmg+cuRwAz4ICdrwvIG58UCxd0RN+uZzHynHqDTTq7rFTPpbhCfvZOhzd1/bg==
X-Received: by 2002:a05:6e02:1d8c:b0:35c:2ffa:4525 with SMTP id
 h12-20020a056e021d8c00b0035c2ffa4525mr7660377ila.4.1700889279637; 
 Fri, 24 Nov 2023 21:14:39 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 m20-20020a92c534000000b003515cdb8f23sm1416742ili.32.2023.11.24.21.14.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 21:14:39 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Nov 2023 22:14:37 -0700
Message-Id: <20231125051437.269197-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700889280; x=1701494080; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eD37p0/3QwKZmnghR0i8l3lcrzH22uiGUalUnX2faGE=;
 b=NMcOjmAon/efKabwtYnjgce7u30RkB+HqivN+N1nlyVPuVV5tw4Y98QhfftC7in0iB
 ppiF3Mt29ou2/wKgMb8+ryj7y2zzM+mquYZwOyZ/aE3OlFvIYrrNlBOy1yCFx6F8iKmy
 6tvClxoOpAe5I1epvLjzVxDZYNM8lnY8hrkfG4zHBjd+JETXwT0as7tEG82SymUtj1Hr
 SQqhrNlH2Lnz0YpJMaHTlmMzWmuCwwddkMBeifvKCeBXj09iWr83MHn41mKMGIQiZ1cX
 TljS/Vyg6BUWzgbFWAu3IZSOhBMWiwD7SljiUjKhAb9kZXKW2j3ZPJI7YnVAmip8LgsB
 TK4g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NMcOjmAo
Subject: [Buildroot] [PATCH 1/1] package/python-pbr: bump to version 6.0.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pbr/python-pbr.hash | 4 ++--
 package/python-pbr/python-pbr.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pbr/python-pbr.hash b/package/python-pbr/python-pbr.hash
index 4ca503e976..cfeef9419d 100644
--- a/package/python-pbr/python-pbr.hash
+++ b/package/python-pbr/python-pbr.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pbr/json
-md5  99ef94dbe5a00054fdcbbaa87268c3cd  pbr-5.11.0.tar.gz
-sha256  b97bc6695b2aff02144133c2e7399d5885223d42b7912ffaec2ca3898e673bfe  pbr-5.11.0.tar.gz
+md5  e01bcc0e9154d513ecad3e766f9582d7  pbr-6.0.0.tar.gz
+sha256  d1377122a5a00e2f940ee482999518efe16d745d423a670c27773dfbc3c9a7d9  pbr-6.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  5df2a0d87d6c562f0ea11c688ac52532aa28d744cabc7994ff0537f64b3b3320  LICENSE
 sha256  eb4a8c8791f6caab1cf36df26db2b6f4e2ddda52657b060ff7f02abc63910aef  pbr/tests/testpackage/LICENSE.txt
diff --git a/package/python-pbr/python-pbr.mk b/package/python-pbr/python-pbr.mk
index 99f0101e19..aaea80d389 100644
--- a/package/python-pbr/python-pbr.mk
+++ b/package/python-pbr/python-pbr.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PBR_VERSION = 5.11.0
+PYTHON_PBR_VERSION = 6.0.0
 PYTHON_PBR_SOURCE = pbr-$(PYTHON_PBR_VERSION).tar.gz
-PYTHON_PBR_SITE = https://files.pythonhosted.org/packages/52/fb/630d52aaca8fc7634a0711b6ae12a0e828b6f9264bd8051225025c3ed075
+PYTHON_PBR_SITE = https://files.pythonhosted.org/packages/8d/c2/ee43b3b11bf2b40e56536183fc9f22afbb04e882720332b6276ee2454c24
 PYTHON_PBR_SETUP_TYPE = setuptools
 PYTHON_PBR_LICENSE = Apache-2.0 (module), BSD-3-Clause (test package)
 PYTHON_PBR_LICENSE_FILES = LICENSE pbr/tests/testpackage/LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
