Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988BFC433FE
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 15:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F8E940162;
	Sun,  6 Nov 2022 15:17:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F8E940162
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vvIn6FOxJgd2; Sun,  6 Nov 2022 15:17:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E2F0400FF;
	Sun,  6 Nov 2022 15:17:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E2F0400FF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 910B11BF287
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 15:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C5DA81A27
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 15:17:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C5DA81A27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ugqp2eRiOJZc for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 15:17:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22CC481A18
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 22CC481A18
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 15:17:50 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id d123so7089548iof.7
 for <buildroot@buildroot.org>; Sun, 06 Nov 2022 07:17:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EoBDqTVV3H+ztFArRrNdw1LYttxNCfa0KF4lQjSjNsQ=;
 b=JlczFraLvjAwUGF+SekU+sQuBZVkhhyNosCotv+JONrhYRvtq6TXxx19zrmXAfR8UH
 66HDYo50TfM1jSKzyfp0HiqjoApr9x/csXclFCCTjSOyveGMzzo5m9HbhPkIUxBewo4H
 6sAmbmHZDR3+neSaOq23K4K0rxkN/sUDOWbOXTnqDH+LX8oJUbWrmalfA33/Ufy1DPVl
 FBMk/87Pw6W2aTFBM03o9q1VPMojmitKfDB8wZ89EFJk1RAjxQ07UxJKVY8hgW96ETCP
 FxgHD70zjzdgtv3/XQ9J9wRTz4UWwywzZctn6q/kzHngTZX42CHs9X/p1RcOojy7EK1A
 ilwQ==
X-Gm-Message-State: ACrzQf2WamhGNd+f0p/TsgNiWzf/IFYdajEa0QLe0YM7R64slzWEmKa5
 JYDTYsMxENQgwSRq0vDOqTSMmJ+wSGSdrw==
X-Google-Smtp-Source: AMsMyM6RvQbs9y3rerUPKivwT+Tjrb4bEa1iM0Xr93pGJfng2qdA4PKiUKYFn53dceFLuzfJR7Omqw==
X-Received: by 2002:a02:cc38:0:b0:375:6182:d220 with SMTP id
 o24-20020a02cc38000000b003756182d220mr21222443jap.16.1667747868884; 
 Sun, 06 Nov 2022 07:17:48 -0800 (PST)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 c98-20020a02966b000000b00374fbd37c72sm1764656jai.147.2022.11.06.07.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 07:17:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Nov 2022 08:17:46 -0700
Message-Id: <20221106151746.4043006-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EoBDqTVV3H+ztFArRrNdw1LYttxNCfa0KF4lQjSjNsQ=;
 b=pjgwyfKdql+qQguoyFRqUWnQSjdAA5rwiF0pZBdxhk9BiFwZXKonoUQ+AEsCtMQUIQ
 XEqjp3jiFas0tftEozN9C6kdIm/5KYHrI4zMo57B6OO8X4944s7MclHo4dhnWDM/jamI
 it2cDPzjDpv5XX8zS5pK1lOhczz1hzsy0Vl3o+JiCF45tF5lPPtbN/gZYkpohNhcpoAy
 XJo/fzOAwwo6ERrfzYp1v696isDQL4uAE68FSRVCV+7ePSXsljH5DjdqW7SIQaYJCTiO
 o/h+xr0XQHSZ6ybqLVBPyibBhibiXtjgn8+Jej41YeZnhwyfZL8D+m5MYWRNpjIz+CHk
 m5zg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pjgwyfKd
Subject: [Buildroot] [PATCH 1/1] package/python-setuptools: bump to version
 65.5.1
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
 package/python-setuptools/python-setuptools.hash | 4 ++--
 package/python-setuptools/python-setuptools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index 2592fc201c..3e4ae01d92 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,4 +1,4 @@
 # From https://pypi.org/pypi/setuptools/json
-md5  9018a18990e7c16159ec3972affba76c  setuptools-65.5.0.tar.gz
-sha256  512e5536220e38146176efb833d4a62aa726b7bbff82cfbc8ba9eaa3996e0b17  setuptools-65.5.0.tar.gz
+md5  3f062858ddfb5efa564c9c02a30cb104  setuptools-65.5.1.tar.gz
+sha256  e197a19aa8ec9722928f2206f8de752def0e4c9fc6953527360d1c36d94ddb2f  setuptools-65.5.1.tar.gz
 sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 9dc0a6a38b..3b62221e25 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = 65.5.0
+PYTHON_SETUPTOOLS_VERSION = 65.5.1
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/c5/41/247814d8b7a044717164c74080725a6c8f3d2b5fc82b34bd825b617df663
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/26/f4/ca5cb6df512f453ad50f78900bf7ec6a5491ee44bb49d0f6f76802dbdd43
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
