Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531BBC46CD4
	for <buildroot@archiver.kernel.org>; Fri, 29 Dec 2023 21:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED1194017B;
	Fri, 29 Dec 2023 21:53:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED1194017B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZBME7omAym-7; Fri, 29 Dec 2023 21:53:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F215F402A7;
	Fri, 29 Dec 2023 21:53:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F215F402A7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B06401BF995
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 21:53:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87CC3402A7
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 21:53:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87CC3402A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2-bnVpZ6V4Ul for <buildroot@lists.busybox.net>;
 Fri, 29 Dec 2023 21:53:12 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F6594017B
 for <buildroot@buildroot.org>; Fri, 29 Dec 2023 21:53:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F6594017B
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40d60ad5f0bso26562235e9.0
 for <buildroot@buildroot.org>; Fri, 29 Dec 2023 13:53:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703886789; x=1704491589;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WMlqo0oI5pTd8kzlM8DTJu7ab3Ta6/UIcGix7aJPhDM=;
 b=lMxa/3cDrzRKWtLIgfRlNJlHzq8Gi0wm3xnj+Eqc2nN0SZWJi3F9kABQtc2bn6MKpL
 aNPK/qLZ1qpuq1sjjYXSIUdTatoWLLydFMlg0w/vg19+bD/hpABFkoz7O1iSFUxbx7EH
 BLTTAhmg83P6VUiN0ldGrHdhqOVpl/ODGBf5wE7uMf8XFIS9ZFct42S/rQvJxFcpgXsm
 KMAf9Z7zUt8hPivnLOBhW5C2BEHIpwDncCmHkOPdV28ANa+BumHXaNU228o1ZFu2AqIh
 keVWY+K/sQeCYY1UTPZSHyl7qoqegZht5rX+vhHOoIieldGOS6xaGRNBFBy7QFewipao
 +fxw==
X-Gm-Message-State: AOJu0YzGxKSbPQ72Hn5Fxks8Pr0tDTO3xSYKswCEGc0LXTZ/tKG9o/5c
 Cqqo6pPMhhN7buyIVyPhTqpZnGeb7vE=
X-Google-Smtp-Source: AGHT+IE8XNRKIoqn/CNgqnXY3sJdldYovvgWjbYCHlCODVI/ILc7uqmrs/lHmDvI0hr+M+ewtC31RQ==
X-Received: by 2002:a05:600c:b94:b0:40d:7449:96e7 with SMTP id
 fl20-20020a05600c0b9400b0040d744996e7mr1035244wmb.52.1703886789339; 
 Fri, 29 Dec 2023 13:53:09 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 h12-20020a05600c314c00b0040d6eb44b94sm6055095wmo.2.2023.12.29.13.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Dec 2023 13:53:09 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 29 Dec 2023 22:53:06 +0100
Message-ID: <20231229215306.23834-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703886789; x=1704491589; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WMlqo0oI5pTd8kzlM8DTJu7ab3Ta6/UIcGix7aJPhDM=;
 b=WPAFjWoHhYpqJEc79ATZxI8ufwEfvxH+q5C9zbaizCEkO5liIRco667jJyMLw54PFu
 1pKN7BX6g5Q25W3XMgWd0h+tSg1G/L9DzV0QNvL9CxQNJh+mURfkeKEasbSizs/9TeFW
 Ltk3WgMfTdKhmRfv6eRGnh3QYVftFDBvn1+fUI3WvlJlIOW5U85GP9C7zH6/qYI8pwRx
 n6AtMEOQWnH8FjmV+HsoQ3D2smNpDQOPJJacOxHQu8gJ1rsopgu1eF5W7J7AhQ7JUVYZ
 pNU9zjvSUVL+LqPPFId57T+Z39IEhPwW91OAom5BGsDx0MPmY9eI31lrLqyfPTytW4wM
 PHaA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WPAFjWoH
Subject: [Buildroot] [PATCH 1/1] package/nbd: bump to version 3.25
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch site to github to get latest release

https://github.com/NetworkBlockDevice/nbd/releases/tag/nbd-3.25

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nbd/nbd.hash | 6 +-----
 package/nbd/nbd.mk   | 4 ++--
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/package/nbd/nbd.hash b/package/nbd/nbd.hash
index f58a89bf9a..9fe95441af 100644
--- a/package/nbd/nbd.hash
+++ b/package/nbd/nbd.hash
@@ -1,7 +1,3 @@
-# From http://sourceforge.net/projects/nbd/files/nbd/3.24/
-md5  a6d9e7bbc311a2ed07ef84a58b82b5dd  nbd-3.24.tar.xz
-sha1  72c59ef5186ae355de6f539a1b348e18cbb8314e  nbd-3.24.tar.xz
-
 # Locally calculated
-sha256  6877156d23a7b33f75eee89d2f5c2c91c542afc3cdcb636dea5a88539a58d10c  nbd-3.24.tar.xz
+sha256  f5c8fd0fcb57b1c926594d0e57f356432ee08678bef1d40d088f0830f0cbdd0a  nbd-3.25.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
index 50f698dd24..b077e43624 100644
--- a/package/nbd/nbd.mk
+++ b/package/nbd/nbd.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-NBD_VERSION = 3.24
+NBD_VERSION = 3.25
 NBD_SOURCE = nbd-$(NBD_VERSION).tar.xz
-NBD_SITE = http://downloads.sourceforge.net/project/nbd/nbd/$(NBD_VERSION)
+NBD_SITE = https://github.com/NetworkBlockDevice/nbd/releases/download/nbd-$(NBD_VERSION)
 NBD_CONF_OPTS = --enable-lfs
 NBD_DEPENDENCIES = host-bison host-pkgconf libglib2
 NBD_LICENSE = GPL-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
