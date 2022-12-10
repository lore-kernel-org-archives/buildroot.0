Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9686EC4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 18:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 222C34047D;
	Sat, 10 Dec 2022 18:23:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 222C34047D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YNfc84IXxHz2; Sat, 10 Dec 2022 18:23:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D47340376;
	Sat, 10 Dec 2022 18:23:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D47340376
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 08D991BF2E4
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 18:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D841A819D1
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 18:23:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D841A819D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7GRnGSNMKpB8 for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 18:23:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0321819BE
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D0321819BE
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 18:23:24 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id z144so3759819iof.3
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 10:23:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+aUigXlZHr/HwxOrGA0NCL1+hUqH9GKi+SU9mLe1XOY=;
 b=jOcxPUX2smsZxFd0MYbLie94nJxLZwiq4wf4DHZcPsyO4hGotF5Ik0XU3o+3xEvi8n
 D+4efo2wOf1IIy5hTHFOYU7nvBlLmmRcpRR538PAgShtx22oLKivzfutwXyVQN0efXbW
 +NxbjyKDdBB/N5guhGC35XQm9Z8IVYjQxt/1OrOJapPP3Z7bX4P/N3kyLgSbkQDNUA6m
 lkQ2MZh8mSCW8Gfd0cf/xFv9jef5w+/EvyQ2SwGghulFxk3xu2ANKDSDXi+Eom63EHXG
 /Qdtww2HPEsEN/R/TdAcCf5g514maii10eOyL5ueWY3Co3J3W1PQxiGCqeEiCcFpJ/ee
 lTJw==
X-Gm-Message-State: ANoB5pnLZmsuknNgjTzsBmjuYoKN/uHOus9D9+r5feFGSfdLG1cu8lUG
 XYeLiErw1cmT4+nkglrFEocvmfRl/jylnQ==
X-Google-Smtp-Source: AA0mqf7GK+y8cN5KDM1YR5B1MzU1Fd2SLWtZlC6NvykleKPvNMgLiB7YSS71zl4XYh337wUdfCAEzw==
X-Received: by 2002:a6b:7112:0:b0:6e2:bf38:165f with SMTP id
 q18-20020a6b7112000000b006e2bf38165fmr6228331iog.1.1670696603742; 
 Sat, 10 Dec 2022 10:23:23 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 y93-20020a029566000000b0038a06a14b37sm1588255jah.103.2022.12.10.10.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 10:23:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 11:23:21 -0700
Message-Id: <20221210182321.2888899-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+aUigXlZHr/HwxOrGA0NCL1+hUqH9GKi+SU9mLe1XOY=;
 b=Klm7i/VpJOpWIQxKyQAl0cewxuhAiEaax3iWll1WP7W+DA6g4kisb8RfbmN49l5sua
 B/Lt8a0VcSq0cRNtoZhRdezZmOZ0+RYsZPPD3zCkmBtTqKucMGLmmDu8pq0waNI3I3SC
 F919ASjZBpAW0kxmSy8N8HfM7w39LS2nzUVXwkH2FMEEw8prt/oRVTAu42ZrNNFDtivO
 34ibUJUiw7/bpVU+o/+fmXKGlKfUDLskN4D0m4W6KCyNSUC3a8/1EvukgiX8vQJBSKLF
 6cVULV/smaNiX1A0nUeS28uODYn/5NiJ1i0dkPBDUzBDRv8P9f2zFuK19IqrPse3cfY3
 BVDw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Klm7i/Vp
Subject: [Buildroot] [PATCH 1/1] package/python-keyring: bump to version
 23.11.0
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
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-keyring/python-keyring.hash | 4 ++--
 package/python-keyring/python-keyring.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-keyring/python-keyring.hash b/package/python-keyring/python-keyring.hash
index 45f5bf7c84..791ee6563b 100644
--- a/package/python-keyring/python-keyring.hash
+++ b/package/python-keyring/python-keyring.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/keyring/json
-md5  60219a9a22467e15fcd09515b5b2ef39  keyring-23.9.3.tar.gz
-sha256  69b01dd83c42f590250fe7a1f503fc229b14de83857314b1933a3ddbf595c4a5  keyring-23.9.3.tar.gz
+md5  edf0645c28f16884e2b121b2c51e0770  keyring-23.11.0.tar.gz
+sha256  ad192263e2cdd5f12875dedc2da13534359a7e760e77f8d04b50968a821c2361  keyring-23.11.0.tar.gz
 # Locally computed sha256 checksums
 sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
diff --git a/package/python-keyring/python-keyring.mk b/package/python-keyring/python-keyring.mk
index 8d7833e14f..c1f124cb3e 100644
--- a/package/python-keyring/python-keyring.mk
+++ b/package/python-keyring/python-keyring.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_KEYRING_VERSION = 23.9.3
+PYTHON_KEYRING_VERSION = 23.11.0
 PYTHON_KEYRING_SOURCE = keyring-$(PYTHON_KEYRING_VERSION).tar.gz
-PYTHON_KEYRING_SITE = https://files.pythonhosted.org/packages/2a/ef/28d3d5428108111dae4304a2ebec80d113aea9e78c939e25255425d486ff
+PYTHON_KEYRING_SITE = https://files.pythonhosted.org/packages/1c/35/c22960f14f5e17384296b2f09da259f8b5244fb3831eccec71cf948a49c6
 PYTHON_KEYRING_SETUP_TYPE = setuptools
 PYTHON_KEYRING_LICENSE = MIT
 PYTHON_KEYRING_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
