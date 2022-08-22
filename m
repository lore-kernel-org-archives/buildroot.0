Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3894C32772
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 08:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D98E81C18;
	Mon, 22 Aug 2022 08:40:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D98E81C18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EG2I8isxGept; Mon, 22 Aug 2022 08:40:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C20381AC4;
	Mon, 22 Aug 2022 08:40:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C20381AC4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 838B71BF321
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 08:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 57D9F81ABA
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 08:40:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57D9F81ABA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7kuxrUu3WG-o for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 08:40:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E68F81AC4
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E68F81AC4
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 08:40:51 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 z22-20020a056830129600b0063711f456ceso7232310otp.7
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 01:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=irG6EZ08yfO5CrMadvLfsiIZN8CMCvozMdDbQgxFC0k=;
 b=ybJkZuTVTl0d6zizzL+FdSdt5WY05fV+pw82vmwJCW9lTMSv8nlXwTC11mMdT0zLsA
 HGYshDjE/wUp+iKFV/b8oU4q4yZGpVE/Ye6xZIp03u7eGV/PZVAOs+G5EJWbJCbSkcxr
 f5QrYBjzgaK8TTygg7p4JyJvreSWwloxmFSVFqqGLc71jvdDrC6B0AgfSG114QYmNiWr
 b1msgR1NCbzZA3rqIqioVany4IxN0mOgoZG/Go+2j8IPClULpLTJgt6qR8Z6/S/FTchN
 mQzXqPaFdJcewGaID/XktOIPsXmDjyxY80wvRynBIE9A5RDkyj7LDTzQeXcTZI8qtqko
 2O3A==
X-Gm-Message-State: ACgBeo2085JlLgiwTDu26bpr5XxtPalFJQgnCe5mqyDlSdQzuOGUQmA0
 9AZJ8LP/RgPZeGb6ySXSgR4It6oot/s=
X-Google-Smtp-Source: AA6agR6w2y2mDEuZ1jxJ9PXA77BFVe2dd1I3gcupYAV7HleTrnXlcJpgs8IYMBWl89NhYiOc4LzJow==
X-Received: by 2002:a05:6830:4194:b0:638:be5e:55e8 with SMTP id
 r20-20020a056830419400b00638be5e55e8mr7556678otu.361.1661157650317; 
 Mon, 22 Aug 2022 01:40:50 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 r26-20020a056830135a00b006391bdbb361sm1194412otq.31.2022.08.22.01.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 01:40:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 22 Aug 2022 02:40:47 -0600
Message-Id: <20220822084047.2846789-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=irG6EZ08yfO5CrMadvLfsiIZN8CMCvozMdDbQgxFC0k=;
 b=ayCxVXsSx8yijiClWbBX3fXUg5bq9SAEvm2lk9wqvpq2CnWuIngkOZXKwVEoVQtOO7
 Ek0zbwWRjpnpRKHzMoZLwRYozSWwrECucgAS3vB0yRHwDFKesIb/O/Y8B1yCQvGTSJJ6
 gJ3EJLI1G9F4gq5KCOEbIDF/4Himp8iwNZhDP/gRp/xfNjwBF754BtztUSgOlPPDFXMY
 CyviM5TSg6s253nObRb/G9kC+Yu0GNpbWpTTBG6Y2/hd9UHFdqw3N4VTg6qs+yh3GSn8
 RuOVRnnx7j5JFNO/w4NA4eH920TbpVDOT3H+g2bB1PBhgVpiJqAi08wEeLMHuw0YDxb3
 79QQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ayCxVXsS
Subject: [Buildroot] [PATCH 1/1] package/python-pycares: bump to version
 4.2.2
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
 package/python-pycares/python-pycares.hash | 4 ++--
 package/python-pycares/python-pycares.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycares/python-pycares.hash b/package/python-pycares/python-pycares.hash
index 2037c17172..13f640b1c1 100644
--- a/package/python-pycares/python-pycares.hash
+++ b/package/python-pycares/python-pycares.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pycares/json
-md5  92fa9622ba42cb895d598910722e80b5  pycares-4.2.1.tar.gz
-sha256  735b4f75fd0f595c4e9184da18cd87737f46bc81a64ea41f4edce2b6b68d46d2  pycares-4.2.1.tar.gz
+md5  7706a01fdbfc593564b63ac0d71031d9  pycares-4.2.2.tar.gz
+sha256  e1f57a8004370080694bd6fb969a1ffc9171a59c6824d54f791c1b2e4d298385  pycares-4.2.2.tar.gz
 # Locally computed sha256 checksums
 sha256  427bb3a5372024a26e2c290b24382512bcc7ca123431c4dd178dd613beea7eee  LICENSE
diff --git a/package/python-pycares/python-pycares.mk b/package/python-pycares/python-pycares.mk
index e2b813b278..858adbf33b 100644
--- a/package/python-pycares/python-pycares.mk
+++ b/package/python-pycares/python-pycares.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCARES_VERSION = 4.2.1
+PYTHON_PYCARES_VERSION = 4.2.2
 PYTHON_PYCARES_SOURCE = pycares-$(PYTHON_PYCARES_VERSION).tar.gz
-PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/99/da/d3d20bc7bd5baadeea04ee84db16f1f07557138c313bd6200e1cffab5bee
+PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/ac/a3/21594384c2398420dd7f6e8656aeb5a2c15128ddf2b85ef5f4403342e18d
 PYTHON_PYCARES_SETUP_TYPE = setuptools
 PYTHON_PYCARES_LICENSE = MIT
 PYTHON_PYCARES_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
