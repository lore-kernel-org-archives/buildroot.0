Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85775CAC59E
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 20:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FC4381E52;
	Tue, 17 Sep 2024 20:33:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SYHAPheA6-kD; Tue, 17 Sep 2024 20:33:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8427B81E3D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8427B81E3D;
	Tue, 17 Sep 2024 20:33:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 88C6C1BF2C3
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 20:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 857178195D
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 20:33:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jsIgOFmah8gu for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 20:33:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.41;
 helo=mail-wm1-f41.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5C2D1817AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C2D1817AD
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C2D1817AD
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 20:33:17 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-42cb0f28bfbso52356725e9.1
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 13:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726605194; x=1727209994;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aE4Xz36EF4LvS4/IP25xGLEwtEyxTGeivaAZRuXch3o=;
 b=oeZiysRh8NRS1j0T0vDio/sKSM/n7UFtcYOJ6ebb89JmgdjZ4HgCDnm98MHpUh4jKT
 Qk2w1oVIW5SgusIHFWVMgBLCCG95dwuVTBQ+XohXw7xLI3upC2ov5sMk3PhAlQWMujJ5
 61Zh9JhcPBmUagJcyB+se/+PTvLeYn0Ui+4hC8vsMWCRdiG7Ce/NaLFsI6DVCw1BGrop
 65i+WJAqbUxqEq1iH2o2DZhe1sowVjneL/L1UTZ1od9DxzKpGRRgV1/pezYHRGqekoCJ
 eF9vE8V7970FDu4F2Ub4HmQmK1/dyMzzI9gVWTG39PtmENHIbE+dFIet7iz6M+VK0I9p
 E94A==
X-Gm-Message-State: AOJu0YyFB6bpI79441qmZFbo6A5qcIinAWmPR8bEaQWEaZJmtoyoJI46
 8669np1ufJt5vj+yZaFdagAcnwbnQerT0h/12SH9BePYFiGVpEZjhq1buIK1
X-Google-Smtp-Source: AGHT+IHyua7FfQH9yr/n1uk/tyjrkXFZ8tBFEErbYJNVSGF0TtYjFMZaay3lAWUeZrdHu5aIZ5OYsA==
X-Received: by 2002:a5d:6b51:0:b0:374:c2b0:6fee with SMTP id
 ffacd0b85a97d-378c2d61ff5mr10572576f8f.59.1726605194081; 
 Tue, 17 Sep 2024 13:33:14 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:eb68:2f00:2841:ccc:4e90:c28])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378e7800237sm10490141f8f.83.2024.09.17.13.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 13:33:13 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 22:33:11 +0200
Message-ID: <20240917203311.1241557-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240831120707.471306-1-thomas@devoogdt.com>
References: <20240831120707.471306-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v2] package/webkitgtk: bump to 2.44.4
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas@devoogdt.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bugfix release with many security fixes, including (but not limited to)
patches for CVE-2024-40776, CVE-2024-40779, CVE-2024-40780, CVE-2024-40782,
CVE-2024-40789, and CVE-2024-4558.

Release notes:

  https://webkitgtk.org/2024/08/13/webkitgtk2.44.3-released.html
  https://www.webkitgtk.org/release/webkitgtk-2.44.4.html

Accompanying security advisory:

  https://webkitgtk.org/security/WSA-2024-0004.html

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v2: bump to 2.44.4 iso 2.44.3
---
 package/webkitgtk/webkitgtk.hash | 6 +++---
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 7da0e97e5d..49f758d6a8 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,6 +1,6 @@
-# From https://www.webkitgtk.org/releases/webkitgtk-2.44.2.tar.xz.sums
-sha1  e62b2c545011a2f180a914529a68950c4d34a2ee  webkitgtk-2.44.2.tar.xz
-sha256  523f42c8ff24832add17631f6eaafe8f9303afe316ef1a7e1844b952a7f7521b  webkitgtk-2.44.2.tar.xz
+# From https://www.webkitgtk.org/releases/webkitgtk-2.44.4.tar.xz.sums
+sha1  3699ff9c9b84e755a0736e72dfd6e5a13151f7d6  webkitgtk-2.44.4.tar.xz
+sha256  2ce4ec1b78413035037aba8326b31ed72696626b7bea7bace5e46ac0d8cbe796  webkitgtk-2.44.4.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 5ecc1d1d09..a5bb81c3fa 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.44.2
+WEBKITGTK_VERSION = 2.44.4
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
