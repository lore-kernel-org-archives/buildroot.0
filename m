Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E602C433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 21:45:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5A3460FDC
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 21:45:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E5A3460FDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 949636073A;
	Fri,  3 Sep 2021 21:45:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kHdDjyExFyCN; Fri,  3 Sep 2021 21:45:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C692E60680;
	Fri,  3 Sep 2021 21:45:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5C4D41BF389
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 21:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C2DA426D5
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 21:45:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id afPNkKO9KIC0 for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 21:45:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 073DC426D1
 for <buildroot@buildroot.org>; Fri,  3 Sep 2021 21:45:35 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id q11so545543wrr.9
 for <buildroot@buildroot.org>; Fri, 03 Sep 2021 14:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6KcJte6exWzM5S22AnEVvUdsuIve8ayZmKifZL/BrfU=;
 b=lvK0uy3oyxwC5hFT1rJb2KD0TIinycl1wf0ZDj2rze/ztZrU0XmSNpZGHjdQRwp80w
 4xqEr1XoVsSI0pqm2i50TJaSMJWZVGkRPQhMdwXsdBbGoT1mBXgVYwRZFQoWTBZVkNAM
 c56o2X/zCxiTG36kea4yzbKI+zR/y5zGMtRncW9JBhquFl+EOOhNYXQhu+iIokngNr8K
 gBmTvKkqqekkivnjjkHHzCtKqGxnbaTQ6VIzp7sHN5aCkKwPjIW4R612Z6pubgR0ve3f
 Cuga8YCv/UF6J9/mhxoim7gNXTJN2yISVUJhGj1MaVD703vC2VPqKqSPBcD4ATcZw7UA
 hfCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6KcJte6exWzM5S22AnEVvUdsuIve8ayZmKifZL/BrfU=;
 b=ETnjo0RYB71vcUPA33WjTfAG6juFRMe4fdAHLjtOTRVnVaUSnCtasrDQXdX+ekZjDb
 qj0zHpWf/ajWv9wsHYRTIAOHZ7+TX2NuOwteNUXg4zu9VF6cfLukW3aPgJIP0ySMaL8x
 lx7wYRDu3BxLdjfLeDz9TpJKTULzykpgMvzPx1qRv9lSTT3VPeEn8vv0DFrq4sXnJq4K
 cWArBA/d9taFuUEnu3ejXJc6qZ43x25JABZYTQlZIvsnKHW9wchKFO09NkO0PkB2Vvo7
 phNrTp8TiqMJfERLZvDxeUE18tkLSvZmUE9l6Bf7zbDRjTr6zEGkQuKA1TFOgoQjP3sw
 ytbQ==
X-Gm-Message-State: AOAM530v1+YPaUmoaAWUFwLvLHk6P8k7iRqsNjXCR1A/PZNhaX2Uav9w
 sIg3LEDP7asFzBv3EFw74vm2h1Z3SMqdbQ==
X-Google-Smtp-Source: ABdhPJxVQ52yK0v9IBs20Mppyo8143VnrPK/cIW/ajXyUWl+SZf90yKyHxNtQE/t1+lx2mDSz28wGw==
X-Received: by 2002:a05:6000:18c2:: with SMTP id
 w2mr1045075wrq.282.1630705533745; 
 Fri, 03 Sep 2021 14:45:33 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id a10sm457272wmj.44.2021.09.03.14.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 14:45:33 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  3 Sep 2021 23:45:25 +0200
Message-Id: <20210903214525.615577-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pyudev: fix build with
 python 2
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Build with python 2 is broken since bump to version 0.22.0 in commit
0adb141d342707ca9a478f57f187e38d5bb716f2:

error:   File "/usr/lib/python2.7/site-packages/pyudev/_ctypeslib/utils.py", line 54
    lib = cdll.LoadLibrary(f'lib{name}.so')
                                         ^
SyntaxError: invalid syntax

Fixes:
 - http://autobuild.buildroot.org/results/8b35ca6910dfd881953968f8d88ac842d57c9262

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...Workaround-finding-libudev-on-systems-without-ldconf.patch | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/python-pyudev/0001-Workaround-finding-libudev-on-systems-without-ldconf.patch b/package/python-pyudev/0001-Workaround-finding-libudev-on-systems-without-ldconf.patch
index 67c2766496..d798f836a5 100644
--- a/package/python-pyudev/0001-Workaround-finding-libudev-on-systems-without-ldconf.patch
+++ b/package/python-pyudev/0001-Workaround-finding-libudev-on-systems-without-ldconf.patch
@@ -13,6 +13,8 @@ https://github.com/pyudev/pyudev/pull/117
 Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 [Marcin: adjust to 0.22.0]
 Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
+[Fabrice: Use %-formatting instead of f-string for python 2]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  src/pyudev/_ctypeslib/utils.py | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
@@ -37,7 +39,7 @@ index 9dffb3c..aa9942f 100644
 -    library_name = find_library(name)
 -    if not library_name:
 +    try:
-+        lib = cdll.LoadLibrary(f'lib{name}.so')
++        lib = cdll.LoadLibrary('lib%s.so' % name)
 +    except OSError:
          raise ImportError('No library named %s' % name)
 -    lib = CDLL(library_name, use_errno=True)
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
