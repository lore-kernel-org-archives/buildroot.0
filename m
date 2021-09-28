Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A811CC433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 06:45:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C6EF60FF2
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 06:45:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0C6EF60FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D72040544;
	Tue, 28 Sep 2021 06:45:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sIOC0fUYJ7G6; Tue, 28 Sep 2021 06:45:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63C43404EC;
	Tue, 28 Sep 2021 06:45:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4BEEA1BF40A
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 06:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B70D60ACB
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 06:44:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e6g7weGlOgzy for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 06:44:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4342D6062F
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 06:44:14 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id d6so55898193wrc.11
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 23:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lIdCopFmZAfH7aDLExIrgbwmQVdC0hF1u6fPIB4ySZY=;
 b=Fk5f8SYObRB02+A10vygy2IxhOnCPR18Gw3OTvqsGnbySOan0qM1oBiNAhdcS0slka
 k79mK3UBsLSK1Dd80PZ42NePUmVxXJkzGr5lZblTaDbD+VneM7R9tCPdThAxMdj3dtwN
 c4sY256ZJwaNEFqTAW9D407+ARIG9vgesiuQaTIPppI7HvxVTVUbLxrQa9yS7+C5/RmR
 VGm739LGQ3L3EPpV0I1sbfh6pHUaALgmHLbRWlo/x4VfhGiEDHacWYpm3lNXq+YgW75x
 I/djdQRnPPWep09Csal+vVaOjz8V/f4GLzSPkhPO7iIF9xM1V2g0fKMY3BFk9ZOf/WXy
 U83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lIdCopFmZAfH7aDLExIrgbwmQVdC0hF1u6fPIB4ySZY=;
 b=67ZrdMxnHANyo1qdPVE1L2GsyGqs3Fs3aVU+Uh0yJN9bUxTDwFc2sGExbiDjt6RrAJ
 Q9gHp+lo1gGG37gqctlPxwgurRoHI/saIqYxO6igAvwpwpsG+kLgAYvib60Xj8I/t27r
 GJ4u1VQQ2k5Dwmu88rzw2ab2pTYqojKMJwLUBlUCDFK3jsRl9eVILxi9lWiL+enRsgYz
 BwKYnc3xyQJzi4fQ0VUhjc09ChoBEd4RUS0h7l09HnR2QqjULyTtkwvPiq56pmgY0cGz
 WO6vawYHejGWM4xKca6WAWgBKaGTB2auclf9KRuvSC9u734jZPL8v2agg7Ec4M3ehtIf
 ajUA==
X-Gm-Message-State: AOAM530is6laj4EX3MJAuc6gVmbS6maYMLN/XTbvk6Aq7a1NBbHCdzXc
 8YFopF8/jbQ/0b0wPt4RqBMs29T85CQ=
X-Google-Smtp-Source: ABdhPJxR5N3zgpREmhkZc3KjDFgzdWClDmKtNPePefsal5LXaTZGor4nuNY5LNy8N+wSbQVhKpPfDQ==
X-Received: by 2002:a5d:42c2:: with SMTP id t2mr4423007wrr.409.1632811452217; 
 Mon, 27 Sep 2021 23:44:12 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:7b33:8acc:211c:62ed])
 by smtp.gmail.com with ESMTPSA id 1sm1923428wms.0.2021.09.27.23.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 23:44:11 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Sep 2021 09:44:00 +0300
Message-Id: <20210928064400.573159-6-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210928064400.573159-1-asafka7@gmail.com>
References: <20210928064400.573159-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-netifaces: bump to version
 0.11.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Plus, indent with two spaces in the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-netifaces/python-netifaces.hash | 6 +++---
 package/python-netifaces/python-netifaces.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-netifaces/python-netifaces.hash b/package/python-netifaces/python-netifaces.hash
index f59208014b..ec8ccf623e 100644
--- a/package/python-netifaces/python-netifaces.hash
+++ b/package/python-netifaces/python-netifaces.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/netifaces/json
-md5	de92cc322b4f56047c073f802ad77860  netifaces-0.10.9.tar.gz
-sha256	2dee9ffdd16292878336a58d04a20f0ffe95555465fee7c9bd23b3490ef2abf3  netifaces-0.10.9.tar.gz
+md5  3146dcb3297dd018ae5eb9a52b440419  netifaces-0.11.0.tar.gz
+sha256  043a79146eb2907edf439899f262b3dfe41717d34124298ed281139a8b93ca32  netifaces-0.11.0.tar.gz
 # Locally computed sha256 checksums
-sha256	b20b895164b72b9cc0170e6c0d60b14f9aaacc6862c0556eed41eaa348883705  LICENSE
+sha256  b20b895164b72b9cc0170e6c0d60b14f9aaacc6862c0556eed41eaa348883705  LICENSE
diff --git a/package/python-netifaces/python-netifaces.mk b/package/python-netifaces/python-netifaces.mk
index 502529c008..1b1aa99568 100644
--- a/package/python-netifaces/python-netifaces.mk
+++ b/package/python-netifaces/python-netifaces.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_NETIFACES_VERSION = 0.10.9
+PYTHON_NETIFACES_VERSION = 0.11.0
 PYTHON_NETIFACES_SOURCE = netifaces-$(PYTHON_NETIFACES_VERSION).tar.gz
-PYTHON_NETIFACES_SITE = https://files.pythonhosted.org/packages/0d/18/fd6e9c71a35b67a73160ec80a49da63d1eed2d2055054cc2995714949132
+PYTHON_NETIFACES_SITE = https://files.pythonhosted.org/packages/a6/91/86a6eac449ddfae239e93ffc1918cf33fd9bab35c04d1e963b311e347a73
 PYTHON_NETIFACES_LICENSE = MIT
 PYTHON_NETIFACES_LICENSE_FILES = LICENSE
 PYTHON_NETIFACES_SETUP_TYPE = setuptools
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
