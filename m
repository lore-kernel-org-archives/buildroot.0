Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3607BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 23:47:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 695AD60E97
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 23:47:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 695AD60E97
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E633080D68;
	Sun, 24 Oct 2021 23:47:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id czeIr_G5XaSG; Sun, 24 Oct 2021 23:47:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 475A880D73;
	Sun, 24 Oct 2021 23:47:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CC1B81BF3C4
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 23:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9C2C401BC
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 23:47:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CvPizZ3esJsC for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 23:47:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9340240196
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 23:47:23 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id r134so13162472iod.11
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 16:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OmoEaki0k9KgXjVjpgeVmUBligzm7x4WirIaxvEg9Ls=;
 b=ebwSfOD1MHolvlSAPxyIy754Suz7CZizOBbc3ah/yWoimeYWuZfmqllgPlqosea5M/
 svnmssqVrtJ+iGpNJLpar5YuDIKIu6RRmKlVH4aFkvpRSmDcN2zB6Y4IFLmYRCpRLrL9
 CaaaSGDUioaDuzjtuKLFyj4mbbupmGXckAMPb8HsJ+cGkpXATI8xUjrfzJ9jaF/gJlO3
 srHbg+5cF5MnOobIiC2mYREQ6GdUKLeogZPj5t/j6v/T10hqgR1HRg/tskHGBhQVgWiL
 gktjvQvLxYmGwbo5mf91EB9kVsNBU8LsnOlq/aaUHHetrDXkMAE2HccgfR3oUwRFLXXv
 dOjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OmoEaki0k9KgXjVjpgeVmUBligzm7x4WirIaxvEg9Ls=;
 b=CS+nvQbURCMPzxmRbAzGVVrirU+8GiJzXwrbsLj6qT9qK1gDmX45MRwteLgDkQtaPj
 l/3CyJI5gpj1GCeVlO5x4fgB9wlIMyq/0Vn/cxFyiBlN8R9CfkPQRyiwdR5H7tiCy5TW
 YX6mn0iysk7CPoSRZpGdCjOSZcbBoG/PWpCn8Qil7+6ZCK5ECGWqbgJNk2X+utm0lSt1
 hEVPrY8SvRnn529fgM00KaFSzl510I9r8Wac3bzCqYNeJ0u3Ci1D3K7ocARv/LYHeryG
 9tiaxb022yE0/NeLd49KylzJBSkAqNTzgeq4/LrQCJoLaTXCQVFAVZP4Hcb22lZ8tcpP
 HM2w==
X-Gm-Message-State: AOAM53268w2ZkRY8FRw2VNu5HRd4R4NjqUp0FAcv6Gg/10iAkVWqgp8H
 dlXfXWKt8X2PDdnGP5hWveLMs5YVfIkXTw==
X-Google-Smtp-Source: ABdhPJyo9LnMNJLMOhjUjCPXvJIsyCiXEvXkEFetP3MSQqfWrFtJ/8lEhkK3aYgREwTrkEhPS4Pbzg==
X-Received: by 2002:a05:6638:3396:: with SMTP id
 h22mr8479749jav.13.1635119242513; 
 Sun, 24 Oct 2021 16:47:22 -0700 (PDT)
Received: from james-x399.localdomain (71-218-115-49.hlrn.qwest.net.
 [71.218.115.49])
 by smtp.gmail.com with ESMTPSA id k10sm1381076ilv.4.2021.10.24.16.47.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 16:47:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Oct 2021 17:47:15 -0600
Message-Id: <20211024234715.2138507-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211024234715.2138507-1-james.hilliard1@gmail.com>
References: <20211024234715.2138507-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/2] package/python-jinja2: bump to version
 3.0.2
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
Cc: Matt Weber <matthew.weber@collins.com>, Grzegorz Blach <grzegorz@blach.pl>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Lionel Flandrin <lionel@svkt.org>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-jinja2/python-jinja2.hash | 4 ++--
 package/python-jinja2/python-jinja2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jinja2/python-jinja2.hash b/package/python-jinja2/python-jinja2.hash
index 51590b17d2..afd07e89f1 100644
--- a/package/python-jinja2/python-jinja2.hash
+++ b/package/python-jinja2/python-jinja2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jinja2/json
-md5  231dc00d34afb2672c497713fa9cdaaa  Jinja2-2.11.3.tar.gz
-sha256  a6d58433de0ae800347cab1fa3043cebbabe8baa9d29e668f1c768cb87a333c6  Jinja2-2.11.3.tar.gz
+md5  059f89375d7ea60eb7013f341f0b89e7  Jinja2-3.0.2.tar.gz
+sha256  827a0e32839ab1600d4eb1c4c33ec5a8edfbc5cb42dafa13b81f182f97784b45  Jinja2-3.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.rst
diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
index e3f47f953a..bb53f95699 100644
--- a/package/python-jinja2/python-jinja2.mk
+++ b/package/python-jinja2/python-jinja2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JINJA2_VERSION = 2.11.3
+PYTHON_JINJA2_VERSION = 3.0.2
 PYTHON_JINJA2_SOURCE = Jinja2-$(PYTHON_JINJA2_VERSION).tar.gz
-PYTHON_JINJA2_SITE = https://files.pythonhosted.org/packages/4f/e7/65300e6b32e69768ded990494809106f87da1d436418d5f1367ed3966fd7
+PYTHON_JINJA2_SITE = https://files.pythonhosted.org/packages/f8/86/7c0eb6e8b05385d1ce682abc0f994abd1668e148fb52603fa86e15d4c110
 PYTHON_JINJA2_SETUP_TYPE = setuptools
 PYTHON_JINJA2_LICENSE = BSD-3-Clause
 PYTHON_JINJA2_LICENSE_FILES = LICENSE.rst
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
