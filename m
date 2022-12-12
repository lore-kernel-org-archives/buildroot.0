Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E81DC4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 15:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECF3E40609;
	Mon, 12 Dec 2022 15:10:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECF3E40609
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nJ7OsUzlmzcC; Mon, 12 Dec 2022 15:10:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BD6A405FC;
	Mon, 12 Dec 2022 15:10:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BD6A405FC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E23FB1BF2B4
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 15:10:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDD72405AC
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 15:10:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDD72405AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r2CI6t84n0gT for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 15:10:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB38D40256
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB38D40256
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 15:10:14 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id x12so3497323ilg.1
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 07:10:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AGExBhljoYuocVAlh9Jf2ve4zZNPgyWfDDw4zwTAgcM=;
 b=QP8CA5e6s3PRe7DxdJSvorZuVLZpxjhvldv9GsxdA+PKQLVdQqOtP4qagjjMgdSQfv
 njZ7fr6qaWwZcLCFg61Bya5pDu6o8zTUaVI5Rn/rkUQsL4nCwcTJ8JP4sPO+kqccRiRO
 xtywuWPewaODHTDF+FW8oAx2GtShVBK1AzpHXeROODIDSwLaA/8qmEsnAz7Vds49NNuy
 RKxvrvmTp9nL/ZVXjpKt+zex4WI6tghWgkTDBM97WzWQ+T7ByIqJQu1TWXbSBrgvVYsB
 +61LPmhTuS92BqdXZB5/UI4uUSt5Onlq+L2LUlRgOKC2xXmqUO7tuT3YEAoC31Y3kX3x
 XICg==
X-Gm-Message-State: ANoB5pk5XILvZgcX9X5s6AdkveMVqFexGxgvmXl0jbNXHobG3CPT0LcD
 BHtJ3Qcewev/udgjybNiuqsDMSZUIg2qLg==
X-Google-Smtp-Source: AA0mqf4ao1OwO/z4MwDM64HR/7mkt7suKSQjUPyNCsti3/FG/CbCpWI2wuxbeR7r9KPjiUygZbE+IQ==
X-Received: by 2002:a05:6e02:f81:b0:303:76d7:860f with SMTP id
 v1-20020a056e020f8100b0030376d7860fmr12307881ilo.16.1670857813799; 
 Mon, 12 Dec 2022 07:10:13 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 w17-20020a029691000000b00389fb6c2ca5sm8082jai.98.2022.12.12.07.10.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 07:10:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 12 Dec 2022 08:10:11 -0700
Message-Id: <20221212151011.2803622-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AGExBhljoYuocVAlh9Jf2ve4zZNPgyWfDDw4zwTAgcM=;
 b=T1XeuZZ+cMLxS/aiEKxb9WwTspBek3bxGPx6t07iLfwdqR8d/P3U5enj+5lVETSwoN
 T34eBE7m51UqcsphEuloshXDXnuSgUAyZwoN7cl/3gNgGgKRHCZncNKsRulDogOA0k9p
 8uePf8xvLFVobVZlzgemFna/U9BZXpaq76cnIu1USreIfEaOiqTyHQ5eof19mgB/f2PE
 id3Xn9qO+qWQSvcyhegV3a+EBIxkr4CCo9JJblyhSk7YonemLV77d4OjpZNdnFWkBXJX
 4u4h7UCM6XPXprNO8GzA50yrxk2Wy2chyvTnPPYMnKe2W1WhfH8qAjZ8FxpYp7L26eL4
 bz9A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=T1XeuZZ+
Subject: [Buildroot] [PATCH 1/1] package/python-bleak: bump to version 0.19.5
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
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-bleak/python-bleak.hash | 4 ++--
 package/python-bleak/python-bleak.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bleak/python-bleak.hash b/package/python-bleak/python-bleak.hash
index 9a8310b11c..001ef65b65 100644
--- a/package/python-bleak/python-bleak.hash
+++ b/package/python-bleak/python-bleak.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bleak/json
-md5  57564087d6e17ad1853109f530279b27  bleak-0.19.1.tar.gz
-sha256  dff7c7f281dcb6629d0d722209c79ec3aa2a6c33867cb5c1ea3d44b72ca155c0  bleak-0.19.1.tar.gz
+md5  d038483ec145c3d32c1ef03e04c42621  bleak-0.19.5.tar.gz
+sha256  87845a96453c58c19031c735444a7b3156800534bcd3f23ba74e119e9ae3cd88  bleak-0.19.5.tar.gz
 # Locally computed sha256 checksums
 sha256  c4029a2b63b3824ab68be841f414addbdde20cb79cdbe272fa80c0b2abe65374  LICENSE
diff --git a/package/python-bleak/python-bleak.mk b/package/python-bleak/python-bleak.mk
index 00a4946ef6..95ac1d1766 100644
--- a/package/python-bleak/python-bleak.mk
+++ b/package/python-bleak/python-bleak.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BLEAK_VERSION = 0.19.1
+PYTHON_BLEAK_VERSION = 0.19.5
 PYTHON_BLEAK_SOURCE = bleak-$(PYTHON_BLEAK_VERSION).tar.gz
-PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/30/b9/60e1f455365e2340fe076cf7683f4e6d03db0b759d4f93fa45e68dc371e5
+PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/e6/b4/e63829826a157d180831a1c5d3720e75d613c1290cb239510d148b906836
 PYTHON_BLEAK_SETUP_TYPE = setuptools
 PYTHON_BLEAK_LICENSE = MIT
 PYTHON_BLEAK_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
