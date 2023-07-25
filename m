Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B98C001DE
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 13:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0FB94188F;
	Tue, 25 Jul 2023 13:24:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0FB94188F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4lkftGu5T2Lw; Tue, 25 Jul 2023 13:24:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C532841898;
	Tue, 25 Jul 2023 13:24:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C532841898
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 759181BF317
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 13:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5CAD940A77
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 13:24:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CAD940A77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qkVTfAz9gOrc for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 13:24:16 +0000 (UTC)
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 89F3F40126
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 13:24:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89F3F40126
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-348c62db335so12987845ab.0
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 06:24:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690291455; x=1690896255;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a83ThNaifN6TDLOEF9HGYx4O7GhqSOpWvGLkxxCfFKo=;
 b=DiAfpd5tVKhizcd8/t/v6YBPvo9zKrJlB9Rvas0jaIyM8ToO5WZkmqaZ4Ibcb010Kv
 1CoEp+yFCgjyJPhyAH+YOgaPY61PztM9j+xLJ1L8OuZiMA6dyoqDWEC2NXzjEnHLnE/a
 5RSP4CT5qAIwl44Jw46vkIBlm0cegOGv5UA/INJERl1mV3SRrXqPnger8Xq8i9VMFHp4
 RXI4LtKaZhymYwrXhYyFK7NVijCdcaFCjtsSCsXWpX0VReL2YTvXz+5yWCPO9oJ74Sy7
 Nen+9K5559QCZJxtKZiZ3+xcye0b63JOUtprEW4jibewFPfJNoIlg648O5H2wxVTI78i
 Y2dg==
X-Gm-Message-State: ABy/qLZJUT0lC9m1ZQL06+hnTKguuBeABi8A9Yw4DQJI20lDfcWZK2gT
 4WyM3g2l3rGIKlnDoCngLVSsy4U44v8=
X-Google-Smtp-Source: APBJJlExMAlEyEZXCzwXa/f0SYdxue/g95/C52HKnSEskskesB6YyO5SD58w4MpYoC5lQF2RRjYZ0A==
X-Received: by 2002:a05:6e02:929:b0:348:92ef:ac83 with SMTP id
 o9-20020a056e02092900b0034892efac83mr2748951ilt.29.1690291455101; 
 Tue, 25 Jul 2023 06:24:15 -0700 (PDT)
Received: from james-x399.localdomain (71-33-156-134.hlrn.qwest.net.
 [71.33.156.134]) by smtp.gmail.com with ESMTPSA id
 c12-20020a92dc8c000000b00345dd778ab8sm3679172iln.27.2023.07.25.06.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 06:24:14 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 07:24:13 -0600
Message-Id: <20230725132413.135679-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690291455; x=1690896255;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=a83ThNaifN6TDLOEF9HGYx4O7GhqSOpWvGLkxxCfFKo=;
 b=ITxu3WbhaN4SR+l2a6FnwaTMf4jrfs2MWl7jDR8qj3I1c2s8a6gqWlQyIz3DMtEYbH
 ydg2RWhworHS48EODOhaO0E9qSIqNcNPn/wRKaa6pK+dzeRBGO6rXNCdg2f+KR5BTuJh
 HPRF33j7I1u8vpSkXaol8M9OT5BqfGDtDQ1r0+6z20tMxX7rhtBokhNYvplU+6sYCmdz
 QmqTPwmv7EIML4R6A6Ze8dOfJWcRkop3vd1Upz8yXlRkbd9SFNoVS01RQ2HFU9dAq/Ou
 +uTXJ4jvDI/7g827huDcuchsIfhZ0MAtHMQTphRalwxLDqjPWSLqb3nXc8O80lfCOEuC
 Pf5Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=ITxu3Wbh
Subject: [Buildroot] [PATCH 1/1] package/python-charset-normalizer: bump to
 version 3.2.0
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
 .../python-charset-normalizer/python-charset-normalizer.hash  | 4 ++--
 .../python-charset-normalizer/python-charset-normalizer.mk    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-charset-normalizer/python-charset-normalizer.hash b/package/python-charset-normalizer/python-charset-normalizer.hash
index a70499917a..05e52fe2a6 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.hash
+++ b/package/python-charset-normalizer/python-charset-normalizer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/charset-normalizer/json
-md5  12ee1c8bedbfba84e99db46d5d94f411  charset-normalizer-3.0.1.tar.gz
-sha256  ebea339af930f8ca5d7a699b921106c6e29c617fe9606fa7baa043c1cdae326f  charset-normalizer-3.0.1.tar.gz
+md5  dbb8c5b745beddbaae67d06dce0b7c29  charset-normalizer-3.2.0.tar.gz
+sha256  3bb3d25a8e6c0aedd251753a79ae98a093c7e7b471faa3aa9a93a81431987ace  charset-normalizer-3.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  eb31a0c5a4fb09b8a4e32055d25c1e5f9c358a2752fef3cd720213d1ccfee241  LICENSE
diff --git a/package/python-charset-normalizer/python-charset-normalizer.mk b/package/python-charset-normalizer/python-charset-normalizer.mk
index 95c55ffd3c..46f8530b5f 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.mk
+++ b/package/python-charset-normalizer/python-charset-normalizer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHARSET_NORMALIZER_VERSION = 3.0.1
+PYTHON_CHARSET_NORMALIZER_VERSION = 3.2.0
 PYTHON_CHARSET_NORMALIZER_SOURCE = charset-normalizer-$(PYTHON_CHARSET_NORMALIZER_VERSION).tar.gz
-PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/96/d7/1675d9089a1f4677df5eb29c3f8b064aa1e70c1251a0a8a127803158942d
+PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/2a/53/cf0a48de1bdcf6ff6e1c9a023f5f523dfe303e4024f216feac64b6eb7f67
 PYTHON_CHARSET_NORMALIZER_SETUP_TYPE = setuptools
 PYTHON_CHARSET_NORMALIZER_LICENSE = MIT
 PYTHON_CHARSET_NORMALIZER_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
