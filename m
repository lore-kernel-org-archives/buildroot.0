Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034F7C43334
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 10:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9721782695;
	Mon,  4 Jul 2022 10:48:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9721782695
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0FOtGIoPOv6t; Mon,  4 Jul 2022 10:48:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC43182572;
	Mon,  4 Jul 2022 10:48:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC43182572
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 54BBC1BF295
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 10:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F60F82572
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 10:48:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F60F82572
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ZxkH4q-tSX9 for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 10:48:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B38848268B
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B38848268B
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 10:48:29 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id q6so15954697eji.13
 for <buildroot@buildroot.org>; Mon, 04 Jul 2022 03:48:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=AteGpqP9XbtBqmsXwktq2+D/SJGjiKJGlHZN40F9s3U=;
 b=33XqIBRqN8yyeiL65wOM1JA3y6LuGBzK0jEICqukB/Sd/QgbSQrko8srLR/C6Hecyk
 1IIfRalackYL12yKiG9AzyKe5FwFVUK8H/nJQTljdCkP/VW4CbuzFSw/6mRV+GvfeLZP
 9Qsx2YCer+cno4hfxfyjkKXoduUljLLcZ5CIXYZro6uF3c7OXm7ck/5l6AsQLqSkLX6O
 2IlHWc3j/0/puGIdu8RbjY0ZeKMo1QVnrKMFiEf/0HRU1MU4KnFz+7RUamg4rdwYaXkJ
 yWvEZ7/I27l2/Sic2vh8LhH6skexWSlNId9NzcLrbJvDODRn1LKPJh8yRVqJOYttXmHK
 lQXw==
X-Gm-Message-State: AJIora+oF7U0klzq1KI5pDpTK/FqMRLxe/9lxhIlUb/i9EE68Ee/EKpo
 sfGfi189NhV0CtQXfiRmrMa1HEp72lSljA==
X-Google-Smtp-Source: AGRyM1sIZ21njuVl2FkBSFQFH9D91RJlRm/EHNUakEmqdLe36kIsSowkggHN+d0qXQHQ2yXzyeXr9g==
X-Received: by 2002:a17:906:d54f:b0:726:2c7c:c0f9 with SMTP id
 cr15-20020a170906d54f00b007262c7cc0f9mr28180109ejc.441.1656931707711; 
 Mon, 04 Jul 2022 03:48:27 -0700 (PDT)
Received: from development1.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 i23-20020aa7c9d7000000b0042de3d661d2sm20262921edt.1.2022.07.04.03.48.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 04 Jul 2022 03:48:27 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  4 Jul 2022 12:48:20 +0200
Message-Id: <20220704104820.5332-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=AteGpqP9XbtBqmsXwktq2+D/SJGjiKJGlHZN40F9s3U=;
 b=n5wMF4a8ipEpAauKlFwkZI2oF7bH/9Ib1vqJ+SJvDlSOQTuCif0jpJy8K4l1OHnGRr
 6sEvg/io8uTJGnauu3dICaMJcrgfxfVZweUSGgbSE16S4VnyOlUMGxbXsBlj6u9+AkES
 rdGz5Crvw7ZrswLRG38zjews5xm+kZ1zczxCypVGmFtcxl1fqsbeqXTTeF/goVl96lQH
 CiPns2MB/rGJKnMHEgdEvZ4+yUX8Y7ZMbiCV53LP+5HG2/772j2I4hm4B1r2WAZbje4n
 4dWixRM9BbR/020d5+LOLx4Mt0T0KpH4cVCGp1irEGZ2PcgMJ6Re6W4arKTUbTalg/xj
 Sk4g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=n5wMF4a8
Subject: [Buildroot] [PATCH] package/python-setuptools-scm: add missing
 runtime dependency
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: james.hilliard1@gmail.com, Asaf Kahlon <asafka7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Since version 7.0.4 python-setuptools-scm requires
host-python-typing-extensions package.

Fixes:
http://autobuild.buildroot.net/results/a4a52da24032222860ad6abe89bf66839cc2e812/
http://autobuild.buildroot.net/results/2b381cd32671db4aa0b281ece5569667bae0f923/
http://autobuild.buildroot.net/results/a3c5208224cc7825152d9a27b64fd82fb000a259/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-setuptools-scm/python-setuptools-scm.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-setuptools-scm/python-setuptools-scm.mk b/package/python-setuptools-scm/python-setuptools-scm.mk
index 890ee0c9c1..a3de013cc5 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.mk
+++ b/package/python-setuptools-scm/python-setuptools-scm.mk
@@ -10,6 +10,6 @@ PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/bc/e6/ac8b0
 PYTHON_SETUPTOOLS_SCM_LICENSE = MIT
 PYTHON_SETUPTOOLS_SCM_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_SCM_SETUP_TYPE = setuptools
-HOST_PYTHON_SETUPTOOLS_SCM_DEPENDENCIES = host-python-packaging host-python-tomli
+HOST_PYTHON_SETUPTOOLS_SCM_DEPENDENCIES = host-python-packaging host-python-tomli host-python-typing-extensions
 
 $(eval $(host-python-package))
-- 
2.17.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
