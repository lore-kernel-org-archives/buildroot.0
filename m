Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 112AAC433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Jul 2022 22:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C6EF83E01;
	Mon, 18 Jul 2022 22:25:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C6EF83E01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yh-mX3Wpiese; Mon, 18 Jul 2022 22:25:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9055383A47;
	Mon, 18 Jul 2022 22:25:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9055383A47
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8CE7B1BF39D
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 22:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 675216109A
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 22:25:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 675216109A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IM-lCuvofi75 for <buildroot@lists.busybox.net>;
 Mon, 18 Jul 2022 22:25:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A6D661078
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6A6D661078
 for <buildroot@buildroot.org>; Mon, 18 Jul 2022 22:25:18 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id h17so19105023wrx.0
 for <buildroot@buildroot.org>; Mon, 18 Jul 2022 15:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6fTBNcJKdlMRhLnwUi5pLvHM4wds2ildVRPvRze4vPY=;
 b=cpvSsk+TEfIDLliJ9otvIBXeZQse3qQDTrUtaJESmsbjtJL0U/97FWiun0pNhai3aO
 WfGIUiWRJvmMlG1SUvn2pJ0ociz/VqNT10FeIR71kt4IdvNsvfadonXNsHMwmCZwtZ9T
 +k2HHx8f/eVd7koERILQV6EKzDx5B3F87fD2FPRQE3j4phxhpFls8k+bkCWeOc45t9MU
 ezwOIJLyJSbGBgr/A6J/iwwe2ZMe//dI1ZAkTVMu7N/aeXpV3Sj0Tlda/D9LWHBYfoAB
 i8MUQiwf7EKWy8d0X2YKsWHPXSfY43/OmgV9HEdVpjst6veGZ8aR+dnbshOgbqd1cw2q
 rOGA==
X-Gm-Message-State: AJIora/z35z/+VLN7gePwzgR4HycDboEBuCPEflZl6xL4mq64oFg2JgT
 o0tw152HKqlmO///N9KdBaazaKsXXEI=
X-Google-Smtp-Source: AGRyM1uW0Ck5nNAsduGW10pcZkRTU/3yO4K2TnJMglfqyipnu1+5Vl5jZVPKYi2rYIo0psJNuBddvg==
X-Received: by 2002:a05:6000:144b:b0:21d:a57d:8000 with SMTP id
 v11-20020a056000144b00b0021da57d8000mr24808286wrx.204.1658183116422; 
 Mon, 18 Jul 2022 15:25:16 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 x5-20020a05600c21c500b003a3188bef63sm7051354wmj.11.2022.07.18.15.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 15:25:16 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 19 Jul 2022 00:22:08 +0200
Message-Id: <20220718222208.3119150-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6fTBNcJKdlMRhLnwUi5pLvHM4wds2ildVRPvRze4vPY=;
 b=Og7PEQFB/sm6BIv3+KhaFzY+oo9cfEoBYM9vRxzDnxjksI5lz3yInvDpWEhIiwsdAM
 YWnibBhisXUleensxMS/5hAvVKYFNkLqn8rEdZ0NvPqusoAzqOZNWR345U8C0aOkjuN7
 +O8rDQpjKy4N5Qg9NuvZMq7spjg2sbKxE5/KOYZ8Kky8Hmk4P2Z6/LTDY0xrLtlQIhGe
 gpzEkC03L4Rpl8FzCH8AXxr7oV9nO8ywH2jO8Q8YoDDZKI4Wrx/xU34ybfPfofOZ26SS
 X3chr6wfELC4FMfa1E113PN4WkaV0TucFruBZLJXa/GPzOmYXke88Hl8BXgSMfPXfaBi
 AXvQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Og7PEQFB
Subject: [Buildroot] [PATCH 1/1] package/python-smmap2: bump to version 5.0.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update indentation in hash file (two spaces)

https://github.com/gitpython-developers/smmap/blob/v5.0.0/doc/source/changes.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-smmap2/python-smmap2.hash | 6 +++---
 package/python-smmap2/python-smmap2.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-smmap2/python-smmap2.hash b/package/python-smmap2/python-smmap2.hash
index 9ae758fc62..424fa58e8c 100644
--- a/package/python-smmap2/python-smmap2.hash
+++ b/package/python-smmap2/python-smmap2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/smmap/json
-md5	61882572be57023980c36f5493523077  smmap-4.0.0.tar.gz
-sha256	7e65386bd122d45405ddf795637b7f7d2b532e7e401d46bbe3fb49b9986d5182  smmap-4.0.0.tar.gz
+md5  82b22288dcabfe257d4c1f04c83c7fdd  smmap-5.0.0.tar.gz
+sha256  c840e62059cd3be204b0c9c9f74be2c09d5648eddd4580d9314c3ecde0b30936  smmap-5.0.0.tar.gz
 # Locally computed sha256 checksums
-sha256	88e9d93f708d110b328a834302dd1d5c6afbda530e7721d15d80b3511d86f235  LICENSE
+sha256  88e9d93f708d110b328a834302dd1d5c6afbda530e7721d15d80b3511d86f235  LICENSE
diff --git a/package/python-smmap2/python-smmap2.mk b/package/python-smmap2/python-smmap2.mk
index bcf20206ce..489cf0f758 100644
--- a/package/python-smmap2/python-smmap2.mk
+++ b/package/python-smmap2/python-smmap2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SMMAP2_VERSION = 4.0.0
+PYTHON_SMMAP2_VERSION = 5.0.0
 PYTHON_SMMAP2_SOURCE = smmap-$(PYTHON_SMMAP2_VERSION).tar.gz
-PYTHON_SMMAP2_SITE = https://files.pythonhosted.org/packages/dd/d4/2b4f196171674109f0fbb3951b8beab06cd0453c1b247ec0c4556d06648d
+PYTHON_SMMAP2_SITE = https://files.pythonhosted.org/packages/21/2d/39c6c57032f786f1965022563eec60623bb3e1409ade6ad834ff703724f3
 PYTHON_SMMAP2_SETUP_TYPE = setuptools
 PYTHON_SMMAP2_LICENSE = BSD-3-Clause
 PYTHON_SMMAP2_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
