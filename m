Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC62FC004C0
	for <buildroot@archiver.kernel.org>; Thu, 19 Oct 2023 21:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C5554BE77;
	Thu, 19 Oct 2023 21:38:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C5554BE77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JTORiz1jlaWk; Thu, 19 Oct 2023 21:38:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF70C4BDD5;
	Thu, 19 Oct 2023 21:38:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF70C4BDD5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 588F11BF2FA
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 21:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E7DC4BC5F
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 21:38:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E7DC4BC5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mAJpVg8piYjh for <buildroot@lists.busybox.net>;
 Thu, 19 Oct 2023 21:38:13 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DAD9C4BC25
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 21:38:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAD9C4BC25
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40790b0a224so1184085e9.0
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 14:38:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697751490; x=1698356290;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KsSzghJFje/hko/2pdBkSvIoSiKlplESp9JPiUriQ+E=;
 b=j+taFI5ZDwdOvPS50qHvc2ZTCVQ0x/gDHMOW71S7hoAZNHkerBsZhjGyAIOAZK9HsF
 SRrlVZUXOHOguJj0EUFlSoQeBzuXySL2RHOu3HvQO+V2mAB1Y2Nx+35N2bQtLeUYEixE
 PUSPHhNZcWWfgD5mdLTKKUfq6XHS9uxIa1Axh5YQ51v4YO9c4LLoQZJsq3f6QTZOt35B
 iQ7wd5nr0+FP082EVj0QeaRFa6kAUgJnVA+VwSjBI6PTeGD6ELbnBB4uZLH5Nwy8Vu6c
 d7rF8jUsnOUpD7KIJYcrfRs15XUJZgZqdVp0Hhs4bL2Ncoxgk9FULqyv8WAPEHfko44Q
 kv6g==
X-Gm-Message-State: AOJu0Yw+Mw48jcNvRuYg9TO95lVrOkBBq2e2Wvol/x/KaOx2Jh/XVr6J
 96mg4/f2U/cBSnk0zSVigEvuyd3V+YQ=
X-Google-Smtp-Source: AGHT+IFHsuP7Xs//9NzZi/zvaXnWRF9UQSPLmtNtsw8z+WDK311tnopstr3aHiwC5BChT5j7ZLcXAg==
X-Received: by 2002:a05:600c:3c87:b0:406:eef6:3540 with SMTP id
 bg7-20020a05600c3c8700b00406eef63540mr99578wmb.0.1697751490289; 
 Thu, 19 Oct 2023 14:38:10 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 k6-20020a05600c1c8600b003fe1c332810sm5375591wms.33.2023.10.19.14.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Oct 2023 14:38:08 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 Oct 2023 23:37:56 +0200
Message-ID: <20231019213756.635868-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697751490; x=1698356290; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KsSzghJFje/hko/2pdBkSvIoSiKlplESp9JPiUriQ+E=;
 b=FWuA9RGCUR7fG68mzRFXcympNWVU+AEcbdmN8c8lWKCedvGIHp6p/kPMoCAfTYzGqz
 hN7Jc0Tkq5u7Mu2QgYpHBAYhaWtQOMjo6EB1Vh5kWFRH8NyTdQ4PR8s59DmOoJ5lymFb
 1KLjH5d3FvgXFwm0gYPcmsrOMsiRNmY0yLihM2FiMD5JP+sFrsowi/kzXo62dfvSGXO4
 S7IQds85bSI61+qgO77cDsFExi47V5mwx00AWdI3OX9dL8pjE7cyGcEKJi5+o03rL3I0
 WzOsdwEoeXiYziV3CzCUQHwghZmCZycDkHH4ZSvxnsNvrWK8XD4u3KplQSN2MfRLfm3l
 o5Yw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FWuA9RGC
Subject: [Buildroot] [PATCH 1/1] package/vim: security bump to version
 9.0.2053
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2023-5344, CVE-2023-5441 and CVE-2023-5535

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vim/vim.hash | 2 +-
 package/vim/vim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index 024c014bc9..8fdb6998c9 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  ba769f8513f2f75d71518f817f945809a5cb1310fd58cd86daca96e658cccf7d  vim-9.0.1903.tar.gz
+sha256  29d0e5212daedbff1b781edba1b66f549b1a226020271f20aa9884abfdf39fc7  vim-9.0.2053.tar.gz
 sha256  0b3f1f330cb1b179bb17c7c687d4cec601e0aa3462bc7f890ad4c3888d37d720  LICENSE
 sha256  b475d5d3f8c855dc1a84813bbe45c44054d7f7aee20c800950bf89d5958873de  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index b8b50cb91a..37684e0aa3 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 9.0.1903
+VIM_VERSION = 9.0.2053
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
