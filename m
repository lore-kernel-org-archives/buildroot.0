Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E87AC433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 21:47:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 045C36054E
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 21:47:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 045C36054E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA31240404;
	Tue, 26 Oct 2021 21:47:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QzPGOLJiDPKN; Tue, 26 Oct 2021 21:47:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 238D9403E5;
	Tue, 26 Oct 2021 21:47:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9DEE91BF9AC
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 21:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D43D8102A
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 21:47:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6ESnvla2o_V6 for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 21:47:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AFB8D81027
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 21:47:13 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id v65so1158007ioe.5
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 14:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OmoEaki0k9KgXjVjpgeVmUBligzm7x4WirIaxvEg9Ls=;
 b=O9N7mr+Q0Fefy50t3UlXI7Hs5wfi4ja5giXFPeuQa9jqGotSQAMHo8LwOROgGrq5n8
 GtmjHfBqW1HmfaKptM9WritxAVkqMdHBh8mB260bKuILlJr6SvfOdTj+SKEY9Rgl32SL
 IiZHorhsB1HA61gGIHGR/hS7EgRtdsxe+3I1WL6F0QoaZszc2nGExIitx2keULqn9sXm
 Zu1sxzb8idn4CTOp1/wPIZKyvndtj9Qn3IppaMflMnSm+v6HSpibp3+Gyawlx1fr1yXI
 ESyYo3C/B+WBF5HAcKR+yQU5n+RgAQhs0Od7NyHULGXOH/kb7mKiYPUwsVYOHLG1OwcQ
 n/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OmoEaki0k9KgXjVjpgeVmUBligzm7x4WirIaxvEg9Ls=;
 b=7TGIuf5Q4c+68/qiG+Pxv/B64xO3Sa/8ej/sKf9V4IPFmZ4NAabNrqB0kKxwN4eI9i
 xbXFvmEirYOlUAhTRywBK9/iCrfYoY40wrAZ3abu/150mfIKNKm7AuTIRq2g56Jk7wVn
 oyeZKRhu67E3uZgHe/9TPldNyfyd+2LYI7c5wTlAYxveTmF7J+64JPQuCEnkNA4kfH8j
 PI4cY9aOAEJs7M8sG1oV1ERimWqm5QNk65oZ2/q1itKkw61X39dY1D3VKWDx3KpXVA30
 9IGl9aWqNLmS+X/BPdVWLhr0JJwlCKEHVotCGDcryGPhbooBm4YBLdGhRnELHhoQwxQz
 x/rQ==
X-Gm-Message-State: AOAM530HPMrQ0IEJBTtXUSWDU0fbAIPnwRGnZxiplA+4xV+bVIBgPmT/
 VopDt4EkOtgx3KSYRZaqajYu2Wj6JWoSIw==
X-Google-Smtp-Source: ABdhPJxuI6rdi/si4FXNksUDxZqV9ypIG7q1xay8wSgo0kC2eKMESJZBQotz0GlumjojtXqWuEf/Sg==
X-Received: by 2002:a02:5b82:: with SMTP id g124mr7853716jab.89.1635284832637; 
 Tue, 26 Oct 2021 14:47:12 -0700 (PDT)
Received: from james-x399.localdomain (71-218-115-49.hlrn.qwest.net.
 [71.218.115.49])
 by smtp.gmail.com with ESMTPSA id r11sm10492643ill.20.2021.10.26.14.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 14:47:12 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 15:47:04 -0600
Message-Id: <20211026214704.4103588-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026214704.4103588-1-james.hilliard1@gmail.com>
References: <20211026214704.4103588-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 2/2] package/python-jinja2: bump to version
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Carlo Caione <carlo.caione@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Romain Naour <romain.naour@gmail.com>, Grzegorz Blach <grzegorz@blach.pl>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Lionel Flandrin <lionel@svkt.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
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
