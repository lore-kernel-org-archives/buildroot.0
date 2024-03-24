Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC773C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 21:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EB6381CA3;
	Sun, 24 Mar 2024 21:25:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uy29kQtqad9L; Sun, 24 Mar 2024 21:25:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8BFF81CAF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8BFF81CAF;
	Sun, 24 Mar 2024 21:25:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C76E11BF4E5
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 21:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF4B640423
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 21:24:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id afsBRp0drEaf for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 21:24:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2f; helo=mail-oa1-x2f.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6437A400D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6437A400D7
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6437A400D7
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 21:24:55 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-222a9eae9a7so2028720fac.3
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 14:24:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711315493; x=1711920293;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TVMfC0d3APSk6zY7pZhT8G5c5OPC7PKazPoLKO8WCB8=;
 b=vV8q2kplw6JVEWRxjC1NP58aEuDm1+q4M9L/Piftxz/HsVGPYzW18Nje5VPBsb1HJZ
 3TnlbxXmhMbXqHf2AtPNFH2rAgz5K7pvv1A0EB0BvW4ySyrEbTUAsHFuNtOb94t5j/6t
 e9vDZY6eeU+qP2v5mPm8qJot5ZtC7kxIZRwLHCM+WAxZzowa/4djgLd2buPpzqXxRG3G
 +Lq1MYBdtExnDJUB3EoaG9qTF1BVq/fBAY6rjO2ppe51/uk0gcRoGcWjU4llEqhWPXff
 C9bcp1C8i25Z5INi1oObzHhdGcZMHZ7T+RpxwviRqOR0cr13scqczcnaN4TvT6JRol25
 t+1w==
X-Gm-Message-State: AOJu0YyrYHCXLA2VOgoV2yvj7ppKFNE9Fg9svQQEgsBS6ORXGBC6iceq
 ELiB2FihHRrxiTooXX7h9/RpwPjsS+eznkkkeskN7AoWiTlcNBLePsRHYFSBskEVPmD6WtDC52x
 a
X-Google-Smtp-Source: AGHT+IFSp3H0m5t9cO4NtLG6QzoIOLR2mCTZITLahC0rVhz8bhg0Sy5cxsE/7+7gOJxoI/lDVu1TsQ==
X-Received: by 2002:a05:6870:a90d:b0:220:aaf1:d35f with SMTP id
 eq13-20020a056870a90d00b00220aaf1d35fmr6610469oab.16.1711315493312; 
 Sun, 24 Mar 2024 14:24:53 -0700 (PDT)
Received: from localhost.localdomain ([204.229.2.167])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a17090a658700b0029c3bac0aa8sm8979556pjj.4.2024.03.24.14.24.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Mar 2024 14:24:52 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 15:24:35 -0600
Message-ID: <20240324212441.526544-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240324212441.526544-1-adam.duskett@amarulasolutions.com>
References: <20240324212441.526544-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711315493; x=1711920293;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TVMfC0d3APSk6zY7pZhT8G5c5OPC7PKazPoLKO8WCB8=;
 b=DsoYJip3ZHn8f3RYIXp0vwn8Z78wEQ2hIV7o1lngLZzT75LOb5vT0hamiCnKMkBVzg
 e5PM5bRj2NACocgDJy4vcd+h0vu2f5/TGBsX6thbQNTINoAn4QFJ0Vg1mmHk8/PKvvA+
 L5vSDBERz1HmuvRHw/bi+FjJARF0Utu9Nch18=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=DsoYJip3
Subject: [Buildroot] [PATCH v2 4/9] package/policycoreutils: bump version to
 3.6
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

setsebool/Makefile now unconditionally links against libsepol.
As such, it is now a new dependency.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
changes v1 -> v2:
  - Update dependency comments [Thomas]

 package/policycoreutils/Config.in            | 5 +++--
 package/policycoreutils/policycoreutils.hash | 2 +-
 package/policycoreutils/policycoreutils.mk   | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/policycoreutils/Config.in b/package/policycoreutils/Config.in
index 3201c8fede..9548588c5d 100644
--- a/package/policycoreutils/Config.in
+++ b/package/policycoreutils/Config.in
@@ -6,10 +6,11 @@ comment "policycoreutils needs a toolchain w/ threads, dynamic library, gcc >= 5
 config BR2_PACKAGE_POLICYCOREUTILS
 	bool "policycoreutils"
 	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS # libsemanage
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libsemanage
-	depends on !BR2_STATIC_LIBS # libsemanage
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libsemanage, libsepol
+	depends on !BR2_STATIC_LIBS # libsemanage, libsepol
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # libsemanage -> libselinux -> libsepol
 	select BR2_PACKAGE_LIBSEMANAGE
+	select BR2_PACKAGE_LIBSEPOL
 	select BR2_PACKAGE_LIBCAP_NG
 	help
 	  Policycoreutils is a collection of policy utilities
diff --git a/package/policycoreutils/policycoreutils.hash b/package/policycoreutils/policycoreutils.hash
index e29d192b13..ea45116912 100644
--- a/package/policycoreutils/policycoreutils.hash
+++ b/package/policycoreutils/policycoreutils.hash
@@ -1,3 +1,3 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  78453e1529fbbf800e88860094d555e781ce1fba11a7ef77b5aabb43e1173276  policycoreutils-3.5.tar.gz
+sha256  a76ac431ea40a35a83164ce9007909c1c6c12fd1056627f622144e4a705c0a2c  policycoreutils-3.6.tar.gz
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
index 0e639760fa..79a1729bf9 100644
--- a/package/policycoreutils/policycoreutils.mk
+++ b/package/policycoreutils/policycoreutils.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-POLICYCOREUTILS_VERSION = 3.5
+POLICYCOREUTILS_VERSION = 3.6
 POLICYCOREUTILS_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(POLICYCOREUTILS_VERSION)
 POLICYCOREUTILS_LICENSE = GPL-2.0
 POLICYCOREUTILS_LICENSE_FILES = LICENSE
 POLICYCOREUTILS_CPE_ID_VENDOR = selinuxproject
 
-POLICYCOREUTILS_DEPENDENCIES = libsemanage libcap-ng $(TARGET_NLS_DEPENDENCIES)
+POLICYCOREUTILS_DEPENDENCIES = libsemanage libsepol libcap-ng $(TARGET_NLS_DEPENDENCIES)
 POLICYCOREUTILS_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) LDLIBS=$(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
