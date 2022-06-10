Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08731C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Jun 2022 21:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A69C784496;
	Fri, 10 Jun 2022 21:11:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CLPnAp3jPM3f; Fri, 10 Jun 2022 21:11:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8A218446D;
	Fri, 10 Jun 2022 21:11:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 22B761BF3E0
 for <buildroot@lists.busybox.net>; Fri, 10 Jun 2022 21:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12240417A5
 for <buildroot@lists.busybox.net>; Fri, 10 Jun 2022 21:10:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r-9mzDG4yQpa for <buildroot@lists.busybox.net>;
 Fri, 10 Jun 2022 21:10:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E8295409F4
 for <buildroot@buildroot.org>; Fri, 10 Jun 2022 21:10:57 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id z9so88156wmf.3
 for <buildroot@buildroot.org>; Fri, 10 Jun 2022 14:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P4J4kpVCdapKjW80BeyL8kQWvIrgMtpUtnX8ZaU4Zm8=;
 b=n0RXhhRPadV3rpyQYfI8+DEAysi8rwW9c0mMqjYkY6czgj3mYsi2f6Mp2nXFkaq4q4
 Z3RBHCJf/W39K/cj/ujRRWnLdkSYuW0o4HvRIR02MbSV7TdDyuF52XqYIfmthvVjfMYO
 1sXBeGIF9J5fo3MkBAz0RuJumYj5z1OY51wJK+D9Vk1mW7JRDXzO51pMJQ4vAEh0Oe46
 4pRvY/rFuVhUge+4zydCl6bAjjZ1xXg3kV9gzeWMVJaGKZF2jzRgUzeHWl8yd2aT8T8A
 m6nWKZ7B/+uioX2NPIICYMTmo+4dAQ7qz5vEFA5gcbHVOzbzVTI+0JSXsjj3IE9IWFnt
 t10g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P4J4kpVCdapKjW80BeyL8kQWvIrgMtpUtnX8ZaU4Zm8=;
 b=3I8dUq3GdIEKND1unqchV3K43aAsX0jTVays9REDUFXmksMan3jktLCocSHMwMIuwG
 +XmtabkqOS6CxXEO/luNwC+u+fqmajHT+bpkCpQ+qB4Iw7d4BVCydIdf+dUOSXbmZSdH
 4FTBqAhG9k3G+qzTTMsDxMdBRI1oMpozczAHEGzin/OnscG5tgDtfGzLCoYj2OACNTDD
 oKFxAvPUPIfCQvl4HIq9WUYbae5vXoxOQMnQbQtbH3hleBS/0l5on/NpnM2dsBt/T9rG
 y78wrzVXxQzu706gmnyMi+L9s/MGj1be11pfUSMUHirZRA+So6gltO4njO1DPVHIlmKE
 1D8A==
X-Gm-Message-State: AOAM530zWfS97t9FUme7V6Xz0AOlvyJCEAZeMS3h3r5KITxlzKsf8Fwf
 5R5zfV2tBdpVKeuVjwpW7vxOET2uQuo=
X-Google-Smtp-Source: ABdhPJw6JbSQRW/muvgQuM84LYFxFvJyefvM+qKzEAunMVW37v2DjSumuWgQnRbf0OXLDW6JLDmcHA==
X-Received: by 2002:a1c:f704:0:b0:39c:6684:b375 with SMTP id
 v4-20020a1cf704000000b0039c6684b375mr1554853wmh.66.1654895455838; 
 Fri, 10 Jun 2022 14:10:55 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a5d4b48000000b002108ab90e5asm458139wrs.58.2022.06.10.14.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 14:10:55 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 10 Jun 2022 23:08:20 +0200
Message-Id: <20220610210820.3645527-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/logrotate: security bump to version
 3.20.1
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2022-1348: A vulnerability was found in logrotate in how the
state file is created. The state file is used to prevent parallel
executions of multiple instances of logrotate by acquiring and releasing
a file lock. When the state file does not exist, it is created with
world-readable permission, allowing an unprivileged user to lock the
state file, stopping any rotation. This flaw affects logrotate versions
before 3.20.

https://github.com/logrotate/logrotate/blob/3.20.1/ChangeLog.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/logrotate/logrotate.hash | 2 +-
 package/logrotate/logrotate.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/logrotate/logrotate.hash b/package/logrotate/logrotate.hash
index 2af46d60b7..9c8e73f738 100644
--- a/package/logrotate/logrotate.hash
+++ b/package/logrotate/logrotate.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256  841f81bf09d0014e4a2e11af166bb33fcd8429cc0c2d4a7d3d9ceb3858cfccc5  logrotate-3.18.0.tar.xz
+sha256  742f6d6e18eceffa49a4bacd933686d3e42931cfccfb694d7f6369b704e5d094  logrotate-3.20.1.tar.xz
diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index 4d1344c2cd..453dbe477a 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LOGROTATE_VERSION = 3.18.0
-LOGROTATE_SOURCE = logrotate-3.18.0.tar.xz
+LOGROTATE_VERSION = 3.20.1
+LOGROTATE_SOURCE = logrotate-$(LOGROTATE_VERSION).tar.xz
 LOGROTATE_SITE = https://github.com/logrotate/logrotate/releases/download/$(LOGROTATE_VERSION)
 LOGROTATE_LICENSE = GPL-2.0+
 LOGROTATE_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
