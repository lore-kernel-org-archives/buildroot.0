Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E00AC43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 02:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE9D040B34;
	Sun, 24 Jul 2022 02:51:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE9D040B34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BLkKJjgvyD0d; Sun, 24 Jul 2022 02:51:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43A6740B30;
	Sun, 24 Jul 2022 02:51:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43A6740B30
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 409441BF4E7
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 02:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1992B40B30
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 02:51:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1992B40B30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p0PyEgKXekVl for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 02:51:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3443E40AE4
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3443E40AE4
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 02:51:39 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id 1so4059071ill.11
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:51:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fij40SvdJ3ARQ8bCLsHRneFEkf5MPU3HAdq6DmpREaI=;
 b=MNvXgO31eR9cNThqrLRnHrdMYDaMdSTXfucXVxVDCLzWRbGef4aN7PL0bpyERfabqc
 UnNyDayADGFaCDhh6+j1sXni6Dnhlb0EuFCRKEV7BcG/0xGf/C2TzkhvdZYmqzgAmB0n
 xZG6vqYwxrihwpqCJdgIO+jddte0W+acsjqmo7MVp+rQHM7HLcGNJhi/qSYqd3pen+Al
 iWv0cmr4TJspjB8ZRHzcdKL4y3IH5ty5LSg3AhITOj5Sj3G8zbRM6lyA1Pvqua/MSiDI
 RQzDgG2b0KJY+4fLbWdiQMIH5uoiHjPWQA5+W23x0p97g/xN541C2njRZXPNVWM/DYIQ
 eCGQ==
X-Gm-Message-State: AJIora8XzAcRHd576sHQG0+iAPRqk5wiRiMnyAlHEAp2cZiZ3kn1zEEc
 syn6CG+jyu7JUTGBrCnJ6PYOx3eFNkB1OA==
X-Google-Smtp-Source: AGRyM1t4wOWS8p1PqC3PTgGHcv4ZNqXfN9hsv3zDItzhc1FaYU3WKSgr2Kci4hwJ5XKfJUtynPcVpA==
X-Received: by 2002:a92:280e:0:b0:2dd:c13:e559 with SMTP id
 l14-20020a92280e000000b002dd0c13e559mr2321363ilf.55.1658631097990; 
 Sat, 23 Jul 2022 19:51:37 -0700 (PDT)
Received: from james-x399.localdomain (71-33-133-32.hlrn.qwest.net.
 [71.33.133.32]) by smtp.gmail.com with ESMTPSA id
 c1-20020a929401000000b002dd0d081fcesm3285898ili.0.2022.07.23.19.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 19:51:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 20:51:34 -0600
Message-Id: <20220724025134.1037845-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fij40SvdJ3ARQ8bCLsHRneFEkf5MPU3HAdq6DmpREaI=;
 b=o+OWKcB5MppEoPJcYQ0MX9pY5ZRJtGs1InHEmqH7Wh0qxu9t4BvrtKfXNqzvl5X37q
 h4yKUQ7RUj++1QAcQnf+Xn4dplE8eiLEonqy8GSsjciXVGz5mrkFSBqH6FJJ5/aNCdkx
 XlzMkAGkWZg/d3Uq1vO4ws9nWjU0dEuUJg80+71vnAEqck2+d7hLExcJ3XA1dqZ++6KP
 RiK9r05BHXmvIbEaET0GNb5cJDkc2KnBgBrZl/P+1XmjSXuwS1DPb7e0zFscUdl4mFBN
 UNyIvwIuyitlRz0JGReZvlOg3ZFsWNKLW0ZsxYPWvQyJ4Wc9gbgpEGF3ASPBXrP0A6OI
 adNQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=o+OWKcB5
Subject: [Buildroot] [PATCH 1/1] package/python-setuptools-scm: bump to
 version 7.0.5
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
 package/python-setuptools-scm/python-setuptools-scm.hash | 4 ++--
 package/python-setuptools-scm/python-setuptools-scm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools-scm/python-setuptools-scm.hash b/package/python-setuptools-scm/python-setuptools-scm.hash
index d8ec915862..8ef125840a 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.hash
+++ b/package/python-setuptools-scm/python-setuptools-scm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools-scm/json
-md5  86fe71422781939dd492cd73c93cebac  setuptools_scm-7.0.3.tar.gz
-sha256  cf8ab8e235bed840cd4559b658af0d8e8a70896a191bbc510ee914ec5325332d  setuptools_scm-7.0.3.tar.gz
+md5  0df4e7fd923e4983cd65786efaa0e0d0  setuptools_scm-7.0.5.tar.gz
+sha256  031e13af771d6f892b941adb6ea04545bbf91ebc5ce68c78aaf3fff6e1fb4844  setuptools_scm-7.0.5.tar.gz
 # sha256 locally computed
 sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSE
diff --git a/package/python-setuptools-scm/python-setuptools-scm.mk b/package/python-setuptools-scm/python-setuptools-scm.mk
index c44f983951..87d5dd290d 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.mk
+++ b/package/python-setuptools-scm/python-setuptools-scm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_SCM_VERSION = 7.0.3
+PYTHON_SETUPTOOLS_SCM_VERSION = 7.0.5
 PYTHON_SETUPTOOLS_SCM_SOURCE = setuptools_scm-$(PYTHON_SETUPTOOLS_SCM_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/bc/e6/ac8b0c5076321b9b3e4318c32a8911a260d019be6584556a0b83a47dab4b
+PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/d0/43/f038b5009f93bcd77b1b8da9e6d424b739ab17aec9726f3a99eba23d53ca
 PYTHON_SETUPTOOLS_SCM_LICENSE = MIT
 PYTHON_SETUPTOOLS_SCM_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_SCM_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
