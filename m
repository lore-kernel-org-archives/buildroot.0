Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D79C433FE
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 15:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 347ED60888;
	Sun,  6 Nov 2022 15:13:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 347ED60888
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hHOK1FySRNqE; Sun,  6 Nov 2022 15:13:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FA4E6072A;
	Sun,  6 Nov 2022 15:13:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FA4E6072A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 98B5E1BF287
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 15:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E15C81A27
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 15:13:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E15C81A27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZZl4v9kJNRUi for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 15:13:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8819681763
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8819681763
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 15:13:42 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id p141so7100454iod.6
 for <buildroot@buildroot.org>; Sun, 06 Nov 2022 07:13:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WbjNo3rakfA9xGwT1OUIxG9kUIHJmd5ejMVrXdJeHQ4=;
 b=lezMbECiE/YKuWLFoEP5BBcjSF+DpEOnZWlgftl5Ws5XUyGrxqJbOwiqrE91NUUyex
 CBJzyivmEw0lISvm+H2fSMfbTXL6QkigokihTT2quDgto0YwMeU1sFIYFXLsRjgwyG7Q
 1T50xdJ97JLEG4AHJWp2sd1+V+vBFECWWKi3MVv/mSbKsHyr39yfMtdhRszmh8/uKjKg
 BBuvy9fyx9GlnIJbjlzYnhhGfwBZPzdio4IlhOGvD5BxVfLugluHEju2gS65F/mkG1gE
 6fKgfx2FpDBtkF8xa2F6TKMAcjzgObUQPPR9aqrxp9QVdrSWJdgpmGXyJO/yWRc+JEos
 PUzg==
X-Gm-Message-State: ANoB5pk6s3jUWwJUX0dPM+5p7nxbEu9CYaPUiCducLCqBshvBVvn4OMo
 F939Qv+WwxqWH1fPepbDwYWGqwuuGJKa7w==
X-Google-Smtp-Source: AA0mqf7Zs6KNPfjIr7zhAG2gsqPPU27GZ7JSKTamz2kTJu9nOqt7m11ag+r262QJD+Gl5dQQP61XCg==
X-Received: by 2002:a02:b797:0:b0:375:5c6e:b23 with SMTP id
 f23-20020a02b797000000b003755c6e0b23mr220184jam.47.1667747620781; 
 Sun, 06 Nov 2022 07:13:40 -0800 (PST)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 s13-20020a92cb0d000000b002f9652849f6sm1918925ilo.67.2022.11.06.07.13.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 07:13:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Nov 2022 08:13:38 -0700
Message-Id: <20221106151338.4041049-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WbjNo3rakfA9xGwT1OUIxG9kUIHJmd5ejMVrXdJeHQ4=;
 b=qm5w7OvDzSJSHTQfmHylfJ8ymzZdtQvw0MXUD1QaMdZ86KTJ5uRzGuewbwMvwKNsVn
 88K0WXftj6x3JUuBzIqbWT7jaOjAKU77LJjXM5BDgZh//uDKGv9+Qn4TvaL8rTzoYt4D
 ZgLf+UbUWqDWqrgxT8poBNTI1cQvrV34KUf8LHJ19nZ/pjtN2m5IODb9eXB8htrHTgIg
 p/eaBm7O8rGDgRxlRMcZU4W/ir1R4JLk5lXeYuw53mo1gw7Q9spazQ5NvxPViEKDLhiL
 EUCXIzobv8z0c9Wgv3ahGAV0//lHPgpwQXVk2KYepOZNjmT7kDa3ieK/S52Eq01cvTTn
 xBcw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qm5w7OvD
Subject: [Buildroot] [PATCH 1/1] package/python-weasyprint: bump to version
 57.1
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
 package/python-weasyprint/python-weasyprint.hash | 4 ++--
 package/python-weasyprint/python-weasyprint.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-weasyprint/python-weasyprint.hash b/package/python-weasyprint/python-weasyprint.hash
index 21e58d3677..4da8ea479a 100644
--- a/package/python-weasyprint/python-weasyprint.hash
+++ b/package/python-weasyprint/python-weasyprint.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/weasyprint/json
-md5  b270213554d781c86b6c3d390b097f2f  weasyprint-57.0.tar.gz
-sha256  7b6f5cc13819e9a7d8748c1dbf0e8d2444f7a4818a98339f82dccaa822bf911b  weasyprint-57.0.tar.gz
+md5  bab389bdfb25e03d64591c56367fb344  weasyprint-57.1.tar.gz
+sha256  397a9d11298f94485ec3b7b68aeef1c6106fb638350126d9d4a64109b73508a0  weasyprint-57.1.tar.gz
 # Locally computed sha256 checksums
 sha256  bfd14eccfa6100575460e685556b183399d4bd335904e3c9521b0116d21c54da  LICENSE
diff --git a/package/python-weasyprint/python-weasyprint.mk b/package/python-weasyprint/python-weasyprint.mk
index 9dd364e1c1..d1e5e7983d 100644
--- a/package/python-weasyprint/python-weasyprint.mk
+++ b/package/python-weasyprint/python-weasyprint.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEASYPRINT_VERSION = 57.0
+PYTHON_WEASYPRINT_VERSION = 57.1
 PYTHON_WEASYPRINT_SOURCE = weasyprint-$(PYTHON_WEASYPRINT_VERSION).tar.gz
-PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/b7/98/cd0df64b306ac901ffd53c50d9d5d79d92cae756b6469fc14771adb39d77
+PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/32/3f/d305dc714c119e5b11c0ea1ecff9741407b6da90d6b684859d3b3e586692
 PYTHON_WEASYPRINT_SETUP_TYPE = flit
 PYTHON_WEASYPRINT_LICENSE = BSD-3-Clause
 PYTHON_WEASYPRINT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
