Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984E1C10F31
	for <buildroot@archiver.kernel.org>; Wed, 14 Dec 2022 14:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 350E340319;
	Wed, 14 Dec 2022 14:34:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 350E340319
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4iXRmKexrmxS; Wed, 14 Dec 2022 14:34:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 175F44023C;
	Wed, 14 Dec 2022 14:34:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 175F44023C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BFD101BF470
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 14:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99530400F8
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 14:34:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99530400F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DbsK6xaE20qe for <buildroot@lists.busybox.net>;
 Wed, 14 Dec 2022 14:34:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8239440034
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8239440034
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 14:34:37 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id 3so3451020iou.12
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 06:34:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mPds235Rrxg+s70RDDsD5fEP8micDTD4jv/q3mm7lKU=;
 b=fb/Wsklv2S0jPwcde4GtVEgoebpZOkG8HZOwHvpYjPlzyubCRfS4DHcFP7Ag2kP11Z
 FgTPQdMLP4KET6BXCv3Iyxn3665qijsFdd+cAYVyBly9+xSi3Y6BPpsUGVAD28wEvdBt
 j32dDCn1yKF1jTePsURTISzzTW8DhXA9sPzzzDGUpZDaOZVSYTaAqhWFYBB+esEl70zj
 j849ICB93ot3L//rBBGGZNYchel8BIuQPxA0cu3O3yW33MEUO7wovvEJSuNvKZqZXDaC
 NG2mQN37w2z+2SntYGy1rmlmRfzxWEYPjVuwa3TVNt4MaZPQaMN5p/d0u+Fe43Uut0My
 Plag==
X-Gm-Message-State: ANoB5plEq0TSJ9+/gvZb3SRE/TcKTkQXjkBGZ/Fx7yC7ghz/RK38el/2
 Wnc1uKBRrb2OMsAsJEoYSvFnOJiV0XTzQcRc
X-Google-Smtp-Source: AA0mqf6jXeClijZNyfM/Kpr+51TULm/KLJjMV/7Cn0CSBc40uQgdKLaLxB7Q/MMugV4y75dfvYREPA==
X-Received: by 2002:a6b:620a:0:b0:6df:df0c:6ce1 with SMTP id
 f10-20020a6b620a000000b006dfdf0c6ce1mr14296396iog.10.1671028476451; 
 Wed, 14 Dec 2022 06:34:36 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 v12-20020a02b08c000000b0038ac4923addsm1176216jah.53.2022.12.14.06.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 06:34:36 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 14 Dec 2022 07:34:33 -0700
Message-Id: <20221214143433.2976474-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mPds235Rrxg+s70RDDsD5fEP8micDTD4jv/q3mm7lKU=;
 b=R8ZrVhqTi28q0w3AHJpY9X2FZLW+Sziv3Zb3ndL7pv8DU0N5AOoOP+raPRYKpDyBP6
 rSKanPpFJ3f/4L3izWOSyp9IEVihOFdJFxB8csHf9Cb0Rzu7iKInvZfcSQc2Sjh2zrKU
 VfgJWXsmMXm/tshbxnbtusHP6WdhPfau+dqxUZKyDbdZVAG7SnQpLOa9cjl02sPq3OHj
 2vOKziqSJCzB29Dcn/9lAfRz6/zG/xB5ssvM1JQyW2RW04JMZL/K05xCE+BFeUg7+plc
 H/XZ9SdS4EOTcsk7O84M30tmTbNF3Kown1SRBUh9MKPQdrQSD9ACqCrG/oMiYVssDyYH
 mWEw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=R8ZrVhqT
Subject: [Buildroot] [PATCH 1/1] package/python-traitlets: bump to version
 5.7.1
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-traitlets/python-traitlets.hash | 4 ++--
 package/python-traitlets/python-traitlets.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-traitlets/python-traitlets.hash b/package/python-traitlets/python-traitlets.hash
index 3b48fb6ab8..0c68e04518 100644
--- a/package/python-traitlets/python-traitlets.hash
+++ b/package/python-traitlets/python-traitlets.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/traitlets/json
-md5  bae965c0e6ab468079f233e8a9caf581  traitlets-5.7.0.tar.gz
-sha256  bd0fca5c890a09bf66b33cce67ca14156b080429bc39c7ef26b075a4bd4f9fc3  traitlets-5.7.0.tar.gz
+md5  74ad03a0c8dd45d5621b12e0be0ab38f  traitlets-5.7.1.tar.gz
+sha256  fde8f62c05204ead43c2c1b9389cfc85befa7f54acb5da28529d671175bb4108  traitlets-5.7.1.tar.gz
 # Locally computed sha256 checksums
 sha256  3dcd47086529bf178cf7d10f35a8c188a1e9710391acecceef700898a4cf099b  COPYING.md
diff --git a/package/python-traitlets/python-traitlets.mk b/package/python-traitlets/python-traitlets.mk
index 71bb775a45..8cda56817f 100644
--- a/package/python-traitlets/python-traitlets.mk
+++ b/package/python-traitlets/python-traitlets.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TRAITLETS_VERSION = 5.7.0
+PYTHON_TRAITLETS_VERSION = 5.7.1
 PYTHON_TRAITLETS_SOURCE = traitlets-$(PYTHON_TRAITLETS_VERSION).tar.gz
-PYTHON_TRAITLETS_SITE = https://files.pythonhosted.org/packages/a2/88/5b2a191dd0287b45b933405d951ebfc490a9dfee2494442e5977653ec43b
+PYTHON_TRAITLETS_SITE = https://files.pythonhosted.org/packages/0b/db/9adbbb2bef9a43ecfa4f1cbcec1d662adade10262328a4b7ef65effc6341
 PYTHON_TRAITLETS_LICENSE = BSD-3-Clause
 PYTHON_TRAITLETS_LICENSE_FILES = COPYING.md
 PYTHON_TRAITLETS_SETUP_TYPE = pep517
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
