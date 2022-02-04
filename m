Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8340C433F5
	for <buildroot@archiver.kernel.org>; Fri,  4 Feb 2022 19:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57E8D81902;
	Fri,  4 Feb 2022 19:32:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b-fBkNDzFZPR; Fri,  4 Feb 2022 19:32:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C6D3818E6;
	Fri,  4 Feb 2022 19:32:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B77D61BF5A4
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 19:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5FC240991
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 19:32:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FFqQ7H2arFuY for <buildroot@lists.busybox.net>;
 Fri,  4 Feb 2022 19:32:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ED6854094D
 for <buildroot@buildroot.org>; Fri,  4 Feb 2022 19:32:18 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 v13-20020a17090ac90d00b001b87bc106bdso37286pjt.4
 for <buildroot@buildroot.org>; Fri, 04 Feb 2022 11:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J6rqEX0U+ZTrokzM1z5pHioBjToPhrPZtCrJj5LPslQ=;
 b=GT5NoyVFz9Tw25i233YJTZImY0Smf3VM9CsBcZAo+y9uOfctd+q5RFPvQhAMHTCeT7
 wGXZl0b6ZF7EsdvUyYMa1QSCHOeudprnyahMWKdRPulBgU1Lmonb2ts/ZXC1/fs2Ry2E
 wgPgzsPE7W9GHxzZLG6vJVkeyBpeckJUBk+nrtxDBDw60l1XWIB9macgu/l2Mz3KoBG4
 wMGuRhhoNvWIFx2X9yUZSag+SjMYdQukJby1uSzQJtPYSpg4WbYCuI+Spj9wAnUQr/8d
 Th3om5gyihAl/Cum77KjaigkMro5W+NyA+6F44QrbEJDDpeTzTmbnMRdg1x9VjJBwbqM
 CYLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J6rqEX0U+ZTrokzM1z5pHioBjToPhrPZtCrJj5LPslQ=;
 b=2G0BTNvET38xoK4z009qfDaAlcTXiWp3/C/edH/lgXfh1I9aYtrITfvYSpNJlApqzK
 CdpsoqocMEFEtCkKj4puEAxifO98U93JVi2EPOVUKVrNpHB8YJPzHCxofWoduXugENyy
 VOkJou/9bkbjb3XexSbkRR/ifKechINW83rqhL98w1sTYCSsFpnxctXRcI3/D8NWyAc6
 QOMik1nDkZp9BqTQjbms7166m15BiYXXr3rGcYCJyjfiy8cP3CaoTFIw8BWWBVG7+hoj
 k6vx17zCHNkuUFXaHl1OSyjdLv4BhUEu7bwUpcrfltJWRub92Qu+jF7sSB2Ang7q+yLk
 kSkg==
X-Gm-Message-State: AOAM530SQfYU8y6gkfW+VlzjMBxIb7XreHUspoYFBz37gC2AuOGiXX/B
 t1wWlEvR9WRxmLIiLlNem2n7+UuiOW8=
X-Google-Smtp-Source: ABdhPJw3zZQI+t6PkCTNiIJ+TU9LwiLHGDtnDcyirAsLU10xR1cInVzigbTWCIE4HJokN4wTlVpbOw==
X-Received: by 2002:a17:902:e545:: with SMTP id
 n5mr4542084plf.160.1644003138129; 
 Fri, 04 Feb 2022 11:32:18 -0800 (PST)
Received: from adam-workstation.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id nn5sm2799538pjb.2.2022.02.04.11.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 11:32:17 -0800 (PST)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  4 Feb 2022 11:32:15 -0800
Message-Id: <20220204193215.167521-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-django: bump to version 4.0.2
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
Cc: Adam Duskett <aduskett@gmail.com>, Oli Vogt <oli.vogt.pub01@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Tested with:
support/testing/run-tests tests.package.test_python_django.TestPythonPy3Django

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 89bc5ffb19..f78df56c5f 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  6c4a53d2ccb464bc3dd772c6f2f07df9  Django-3.2.11.tar.gz
-sha256  69c94abe5d6b1b088bf475e09b7b74403f943e34da107e798465d2045da27e75  Django-3.2.11.tar.gz
+md5  a86339c0e87241597afa8744704d9965  Django-4.0.2.tar.gz
+sha256  110fb58fb12eca59e072ad59fc42d771cd642dd7a2f2416582aa9da7a8ef954a  Django-4.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 25a645823b..652ca477ce 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 3.2.11
+PYTHON_DJANGO_VERSION = 4.0.2
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/20/86/e4348aac45bc83fc8e9dda2cfd81004b007c65b68c1499a4233acabdaa3b
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/61/84/676c840e8f1188a6c836e3224b97aa8be4c2e6857c690d6c564eb23a4975
 
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
