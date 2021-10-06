Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23D1CC433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 23:09:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84C6261077
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 23:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 84C6261077
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EED384178;
	Wed,  6 Oct 2021 23:09:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wqP7NN4KinYr; Wed,  6 Oct 2021 23:09:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A32B84151;
	Wed,  6 Oct 2021 23:09:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6CD8C1BF30B
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 23:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 590D2404C2
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 23:08:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JSpNIOy69U3B for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 23:08:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B50040477
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 23:08:58 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id y197so4629846iof.11
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 16:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LK9AVDLY5gogKI+MXtg0HIoEzALg7sb2yuLylNTOT6o=;
 b=HAstHshYUT+Ks4+bzN9cy6YHRQ0rYuhv96MeucUmXwllsrd5pqdT7ui6OtvANGL062
 Im7rjRDTltPsxc3lgbFPTq5xPV7l1+NiXH8yWdFCPOqXt10w/BfF0ipAjjMccILjS32O
 KWuhQXlvEgJeoZAGk7jqDi+6i3T0xd2NZ99Tl9H/Z5vTx2yi/RnbIiaNRjtLbE9vRXJb
 dSooTuPSb0RO20o1i2aocBT5RqxlMtBpFithOC26EYRo/9rf//dNcpLnrCST144X9p/O
 4XUxtmJQql4AnesJgsudzXfcABmbbKtymSUjqdxa9R7u96AUaJ3IaQcJUqXFyNma96kZ
 IGIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LK9AVDLY5gogKI+MXtg0HIoEzALg7sb2yuLylNTOT6o=;
 b=W3k9Wp77SlzUWQVY3oSWMzc7k2ZdSQDVSEXatQDZUqzFqFSGlh02As5cmsfU83eQkf
 9tt/3i/zAYuAjoS52Rzk/RpcjyjN6bzME7XBWg3Kz6YfSmDfZx7caPmXyGKPvlPSzj7W
 DDw0CDIlo4qrqrh1qgOcX5VU2tDgfl0gYkJqRKzfVq5LbEVaGsUPIhCax/5pqY2RzQ3j
 UX8LuRqDhHL9fhbrKsoZIgQ9iDDxrjEKfaOmWo7qJSRfrQwtXTSLpJtRhqVNg5VpyO+g
 awWjPLN/Q7Du795ePr0GJANOICh1h45aAym9YBOQe0/DtYnA1wfqlt6EOUttK2NICrLi
 dfog==
X-Gm-Message-State: AOAM531DE8bpr2yImLJsOV7fXDdUYUk0rN92rdwo+F7IgG/DfndOfJB9
 pnNFk9gwQkdBKfPQqEuiIj9Y5U6sViw=
X-Google-Smtp-Source: ABdhPJw+Uic5QPbUAMTebnrSu0eawSrZSSM+Ac6i+1cS9wZno3vu3yNAq1q69+10J7ldUOgBHoZuIQ==
X-Received: by 2002:a05:6602:160b:: with SMTP id
 x11mr802954iow.108.1633561737022; 
 Wed, 06 Oct 2021 16:08:57 -0700 (PDT)
Received: from james-x399.localdomain (97-118-169-148.hlrn.qwest.net.
 [97.118.169.148])
 by smtp.gmail.com with ESMTPSA id v1sm295146ilo.48.2021.10.06.16.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 16:08:56 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 Oct 2021 17:08:54 -0600
Message-Id: <20211006230854.3218640-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-aiorwlock: bump to version
 1.1.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiorwlock/python-aiorwlock.hash | 4 ++--
 package/python-aiorwlock/python-aiorwlock.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiorwlock/python-aiorwlock.hash b/package/python-aiorwlock/python-aiorwlock.hash
index 2398b15424..bddc846a5b 100644
--- a/package/python-aiorwlock/python-aiorwlock.hash
+++ b/package/python-aiorwlock/python-aiorwlock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiorwlock/json
-md5  8d89ed0d80820aad8d9320204779fd62  aiorwlock-1.0.0.tar.gz
-sha256  4f773e31d78037e3ec27056a22200af482768b43da66e2cc33dd64aa5ea6518a  aiorwlock-1.0.0.tar.gz
+md5  066260ea2c6798f6e18258d4430031bb  aiorwlock-1.1.0.tar.gz
+sha256  2aaf1d1cc995abfd5b2f07ca0e9b5c23bd369517c75495a347eb5896bc307f29  aiorwlock-1.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  fa99ee9d7727194a9f8994c67d1948dc42e8e00ab809fd4a47acfae119d11403  LICENSE
diff --git a/package/python-aiorwlock/python-aiorwlock.mk b/package/python-aiorwlock/python-aiorwlock.mk
index f6f3c97404..acc6f90158 100644
--- a/package/python-aiorwlock/python-aiorwlock.mk
+++ b/package/python-aiorwlock/python-aiorwlock.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIORWLOCK_VERSION = 1.0.0
+PYTHON_AIORWLOCK_VERSION = 1.1.0
 PYTHON_AIORWLOCK_SOURCE = aiorwlock-$(PYTHON_AIORWLOCK_VERSION).tar.gz
-PYTHON_AIORWLOCK_SITE = https://files.pythonhosted.org/packages/40/af/e55b3266352f3383c723e0a3304b0df46a59dfc6235b0b1a0a416afd60c1
+PYTHON_AIORWLOCK_SITE = https://files.pythonhosted.org/packages/ca/e5/3221d49edb432024f6b1b7e9e36cad6363601973375667477f2130d5da7d
 PYTHON_AIORWLOCK_SETUP_TYPE = setuptools
 PYTHON_AIORWLOCK_LICENSE = Apache-2.0
 PYTHON_AIORWLOCK_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
