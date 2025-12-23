Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40628E74900
	for <buildroot@archiver.kernel.org>; Tue, 23 Dec 2025 22:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F41E040A08;
	Tue, 23 Dec 2025 22:14:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fz8zXqcqHJHp; Tue, 23 Dec 2025 22:14:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80FE740524
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766528072;
	bh=wgE00cqbtQyEA+tDunVM3oqtDVxaOKiqgFWYXKFJiEk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oxM+2m8g0TbUQ9nDE7t7deo3FuvTRPlXa9pQq6TpJ8vILPeQsfMHyyRtBSJBL2Px1
	 tVXXcIaqeLtpWIG6rB14XMTZydYnzrZWAmLuXA5VVkneom1ihZUZ7SSybASR2Wm4bV
	 BQM3qMa5bOMjfK7YwbXWC98CjLYitT/vXs9XocLyzNHa4HM477Ngg7ghR07UGAv18U
	 lJ1+UJeiRqKzEC/L7AMX2NEV1e7H1hhmstQd9X5AH+lkxnT5UR8F2oz6wwqF/D/Tc/
	 gNud72iNSOK0Izj5Dqw5BZ0OzOTSFgqo5eSBY0WJ7W2+Uwy2y2lUFCP1zzcWxVjNUa
	 fWCLzvAdMJWkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80FE740524;
	Tue, 23 Dec 2025 22:14:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 52D0F119
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 22:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 451914079D
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 22:14:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sRaHpHGpK_ZF for <buildroot@buildroot.org>;
 Tue, 23 Dec 2025 22:14:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.45;
 helo=mail-ed1-f45.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1F9C2401D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F9C2401D0
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1F9C2401D0
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 22:14:29 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-64d0d41404cso4917036a12.0
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 14:14:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766528068; x=1767132868;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l1hjXfsp9BlgndlyEgRM+Cyln6yefupQk/uo6wmgKII=;
 b=XtiJP21bBa17wPCKP49TuhZCQmKBoBEsejOps3AsAr6PYPqc3L9+wlH0S4l1ItgtUR
 5adh5EPDMkFK7N6riaomiR+kqX6UkQftXIWuDzD+aaSgcPY4LVI9S1Vo+GtIp+/IjkTp
 uoL6+NbdD7p3NyGRgnwVBEuxUm4SXOEThcfZt/w0CCkMvlWb4VkIGyeb7Vz8qwwiAmeH
 slNSnJpLTdHwmXNcI9AYN3aP+Aq9Wj1gSY00/znnIIuXKEcC4xt5m+aD6CqDtBLXdarB
 fJ4Coa3FN3HFCQEzpWBxhs19s/jdIwMLrzCMOEGudT+DUpZ8VfmpvnxRooVcrAzsr4s4
 STNg==
X-Gm-Message-State: AOJu0YyQ8Hb1lyjFGguy9kahrVLaY4JDZdZ9xoqMGwRMTa/brnnqEFBK
 xvWUdZ4cgOhkdWgja0o/yVw4a38jzZv4SIdZmvvs5S+M9/lLyXJno79JIHGhHCBw7Bs=
X-Gm-Gg: AY/fxX4G4+NuDXMYP/rwRUZ+JZEyFgzZNjCTK0P1XoxWuoykLWiFGSKD/oxCisKIeGd
 AWatVlAdOLexhIytXC2TTNvAocGpHIsXbnyDqGCS/Wb2MS4uFLHfyQKjXVaL0gRwdhOf0UtBq4V
 zmsbsTPBGGJ/MtdggcbBi840XnwUcTnSNfpN8ZKvtfHPJRmN3q1zOqo1HMHb4Vjmx8Kes5zbb45
 3lQYQuzDnVy/oJHs+LVTr8UxhOt9msi6FYOL7zaETwLbKFUP0k+1817jALmn3T9stUSPGkAqOWi
 iKdYXh9a3HUzHN6FTH9COhKq6F2TbD3PZpM/yDDQxsjTsyHU99CEXC/ddBWVo0sZ9zZ/rWpIGaw
 KBs/gN8ya5G1yq/gjjpJiG2rcuXdqrHlV2K+4jMB2YS3Z+Y/2mHO+Etxqpg7pSNLeyRpbsldknC
 LirAD01TEXH1Wx18os8f9O8a9C59v+syg0XNVMkqzXaNqlnlgLkI4i
X-Google-Smtp-Source: AGHT+IH73/SyrCe6oqLg+/zFm8THNjnapWwc26SvfDt8eQiyZRH/4Snx1BFW4STAa7T5mH5oN9+p1Q==
X-Received: by 2002:a17:907:dab:b0:b73:880a:fdb7 with SMTP id
 a640c23a62f3a-b80371790d6mr1598282866b.35.1766528067593; 
 Tue, 23 Dec 2025 14:14:27 -0800 (PST)
Received: from KORLIN44614.home ([2a02:a03f:eb5f:fa00:faf0:ebea:87cc:7ff9])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b8037de0de1sm1542082766b.40.2025.12.23.14.14.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 14:14:27 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Hendrik De Vloed <hendrik.devloed@dekimo.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Date: Tue, 23 Dec 2025 23:14:24 +0100
Message-ID: <20251223221424.61578-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH] package/sbctl: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Hendrik De Vloed <hendrik.devloed@dekimo.com>

sbctl intends to be a user-friendly secure boot key manager
capable of setting up secure boot, offer key management
capabilities, and keep track of files that needs to be
signed in the boot chain.

Signed-off-by: Hendrik De Vloed <hendrik.devloed@dekimo.com>
Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/Config.in        |  1 +
 package/sbctl/Config.in  | 16 ++++++++++++++++
 package/sbctl/sbctl.hash |  3 +++
 package/sbctl/sbctl.mk   | 14 ++++++++++++++
 4 files changed, 34 insertions(+)
 create mode 100644 package/sbctl/Config.in
 create mode 100644 package/sbctl/sbctl.hash
 create mode 100644 package/sbctl/sbctl.mk

diff --git a/package/Config.in b/package/Config.in
index edafe20eefe..3b29aa31a0d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2905,6 +2905,7 @@ menu "System tools"
 	source "package/s6-linux-utils/Config.in"
 	source "package/s6-portable-utils/Config.in"
 	source "package/s6-rc/Config.in"
+	source "package/sbctl/Config.in"
 	source "package/scrub/Config.in"
 	source "package/scrypt/Config.in"
 	source "package/sdbus-cpp/Config.in"
diff --git a/package/sbctl/Config.in b/package/sbctl/Config.in
new file mode 100644
index 00000000000..9c6d2e5858a
--- /dev/null
+++ b/package/sbctl/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_SBCTL
+	bool "sbctl"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pcsc-lite
+	depends on BR2_USE_MMU # pcsc-lite
+	depends on !BR2_STATIC_LIBS # pcsc-lite
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pcsc-lite
+	select BR2_PACKAGE_HOST_GO
+	select BR2_PACKAGE_PCSC_LITE # yubikey
+	help
+	  sbctl intends to be a user-friendly secure boot key manager
+	  capable of setting up secure boot, offer key management
+	  capabilities, and keep track of files that needs to be
+	  signed in the boot chain.
+
+	  https://github.com/Foxboron/sbctl
diff --git a/package/sbctl/sbctl.hash b/package/sbctl/sbctl.hash
new file mode 100644
index 00000000000..50a4fe35c1d
--- /dev/null
+++ b/package/sbctl/sbctl.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  640041d66a5040af15a4f152bd1d548813a5fe32341d61826f3d36948a0a5903  sbctl-0.18-go2.tar.gz
+sha256  aa55890164499f96de74b061b04ebc17da026d5962ae9d39180f4ba2833db9fb  LICENSE
diff --git a/package/sbctl/sbctl.mk b/package/sbctl/sbctl.mk
new file mode 100644
index 00000000000..4fdc080943b
--- /dev/null
+++ b/package/sbctl/sbctl.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# sbctl
+#
+################################################################################
+
+SBCTL_VERSION = 0.18
+SBCTL_SITE = $(call github,foxboron,sbctl,$(SBCTL_VERSION))
+SBCTL_LICENSE = MIT
+SBCTL_LICENSE_FILES = LICENSE
+SBCTL_BUILD_TARGETS = cmd/sbctl
+SBCTL_DEPENDENCIES = pcsc-lite
+
+$(eval $(golang-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
