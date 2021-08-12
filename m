Return-Path: <SRS0=gEIP=ND=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECDE4C4338F
	for <buildroot@archiver.kernel.org>; Thu, 12 Aug 2021 07:58:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CBEF60560
	for <buildroot@archiver.kernel.org>; Thu, 12 Aug 2021 07:58:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7CBEF60560
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EA7640606;
	Thu, 12 Aug 2021 07:58:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VLqND6KZbm0w; Thu, 12 Aug 2021 07:58:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98D6140731;
	Thu, 12 Aug 2021 07:58:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BB92E1BF299
 for <buildroot@lists.busybox.net>; Thu, 12 Aug 2021 07:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62803605D8
 for <buildroot@lists.busybox.net>; Thu, 12 Aug 2021 07:58:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 15Fg1suzK6SG for <buildroot@lists.busybox.net>;
 Thu, 12 Aug 2021 07:58:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D85A605F7
 for <buildroot@buildroot.org>; Thu, 12 Aug 2021 07:58:31 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 c23-20020a0568301af7b029050cd611fb72so6731860otd.3
 for <buildroot@buildroot.org>; Thu, 12 Aug 2021 00:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3qD5UbpaG+pJoHPayoGgiI5vsv2CmfPMgvn0YlKg3xc=;
 b=ub3Z6/6c5iurxXrBzex10wdurCJqdCHCVNnFYMZtnMUnrhe9G9ZGsq8Jw3VxkfCrng
 MnmyZs+WahUN7daupezgS3ua7i9/8zCMwxR22akWJdqnQwWcairvK3OHZyUNpahdbpws
 uNsl2MWVkQK6cK6/JE67eH6y5lfBsPJoRxuxJ1+8MHka27PCir8xGhDgiGCfgz585x95
 hOv5R1CvXh7Z9BoS4mMfrTY7nDofQ1EaGZSXvEj0cssxuiZbioBxP18ZZJVhZA5VgAbn
 Ftwa4FXZP0AJANnq/BmsNEqlkUDdtZC+cHazLLuCITGNMwKox5pCUFNPY5bWIhydtYrb
 8+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3qD5UbpaG+pJoHPayoGgiI5vsv2CmfPMgvn0YlKg3xc=;
 b=JHWIkQ9+0drNJGJHyoPX+GpZEOnOfd2CEDmXfw+uWMvA6hT0r/xSHtPqKzeazT5uGg
 v9M0DMKddT73YWEp1IhcTy5mL86ZuVzW0zb7kJK0pmyLdW4umety14kYBdrbBibhBYPB
 2kOHior4+0d9K+ri/w0YMkQJ4zD5aEbMjBV/e30T0N7eoZ06gUq/Gq2h8108bQsDE3Kf
 k+jgsNaiRisEcyyjhv8yr9VChBb+P/xsb7d/zFbCq3BK2W4eaHkOhrGXzxy9GKq0Mnqa
 WnwWnG9sgrisXugaeXBM6d5xpMWGC2ygm7a3pI4tRfI5oofr7POgrAGaQOF+QG6H302i
 5U6A==
X-Gm-Message-State: AOAM530ze2u8JZKajzmMomNxbp/oaCqncjmJiAcaIHZz617hua8+BngV
 fWk87Z77XcXlaGlhfZdhj+R2yQb2CF8=
X-Google-Smtp-Source: ABdhPJzCPa7N/2fiZ+mSmTWxsjryZrz3QK/J7dakm+ewBPNuoV29qeozQ1CvphasTvLmA6tbkNuCBg==
X-Received: by 2002:a05:6830:4108:: with SMTP id
 w8mr2354137ott.110.1628755110406; 
 Thu, 12 Aug 2021 00:58:30 -0700 (PDT)
Received: from james-x399.localdomain (97-118-178-184.hlrn.qwest.net.
 [97.118.178.184])
 by smtp.gmail.com with ESMTPSA id j125sm444206oif.53.2021.08.12.00.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 00:58:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 12 Aug 2021 01:58:28 -0600
Message-Id: <20210812075828.2816118-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-dbus-next: bump to version
 0.2.3
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-dbus-next/python-dbus-next.hash | 4 ++--
 package/python-dbus-next/python-dbus-next.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dbus-next/python-dbus-next.hash b/package/python-dbus-next/python-dbus-next.hash
index fa1cbc9da7..57bfaaf547 100644
--- a/package/python-dbus-next/python-dbus-next.hash
+++ b/package/python-dbus-next/python-dbus-next.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dbus-next/json
-md5  fcf7443b379ef69f95727bec0221ebc9  dbus_next-0.2.2.tar.gz
-sha256  f656a3d3450b670f228248ffb1c3a703a69c4a8cb10cce63b108f17c8bd6c3de  dbus_next-0.2.2.tar.gz
+md5  0e31605bd90f3460aebcd0bb7fe0dc20  dbus_next-0.2.3.tar.gz
+sha256  f4eae26909332ada528c0a3549dda8d4f088f9b365153952a408e28023a626a5  dbus_next-0.2.3.tar.gz
 # Locally computed sha256 checksums
 sha256  c454ab6b8e0653a8eab828a8cbaaa368a1bbfba982178bb18b6177e311eae4cc  LICENSE
diff --git a/package/python-dbus-next/python-dbus-next.mk b/package/python-dbus-next/python-dbus-next.mk
index 9aab9ac92b..f35a32cb3a 100644
--- a/package/python-dbus-next/python-dbus-next.mk
+++ b/package/python-dbus-next/python-dbus-next.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DBUS_NEXT_VERSION = 0.2.2
+PYTHON_DBUS_NEXT_VERSION = 0.2.3
 PYTHON_DBUS_NEXT_SOURCE = dbus_next-$(PYTHON_DBUS_NEXT_VERSION).tar.gz
-PYTHON_DBUS_NEXT_SITE = https://files.pythonhosted.org/packages/cb/fb/5ab0485c6460e39be75e16af95c0e23c2531c1ac5a482fffb9ee7d576e6f
+PYTHON_DBUS_NEXT_SITE = https://files.pythonhosted.org/packages/ce/45/6a40fbe886d60a8c26f480e7d12535502b5ba123814b3b9a0b002ebca198
 PYTHON_DBUS_NEXT_SETUP_TYPE = setuptools
 PYTHON_DBUS_NEXT_LICENSE = MIT
 PYTHON_DBUS_NEXT_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
