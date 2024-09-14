Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6397C0219F
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 15:48:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57405814C9;
	Sat, 14 Sep 2024 15:48:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IE9cJP1zENBm; Sat, 14 Sep 2024 15:48:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EA2D815C1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EA2D815C1;
	Sat, 14 Sep 2024 15:48:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 03D8A1BF844
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 15:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3F7B6076D
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 15:47:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 43zXcNsOhx4t for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 15:47:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=hugo.cornelis@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D300B6069E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D300B6069E
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D300B6069E
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 15:47:57 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-42cde6b5094so25049555e9.3
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 08:47:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726328875; x=1726933675;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qzSWUye6EzcYiDGxZz9sS0D/K20LrbhXdW2GGJP2+dE=;
 b=hqQu5I5FdvBPiEpz5MPHJX7lqgGD5htcmQrCF5x5XfdB3F05F1CSuf1sYFiKY2l2kc
 gmx3KBsavC4laZ5N/78/uPocDrAi6BWfokXjFNJJgRriqLMXM2IF6UJXnBGV65OAk803
 3FzWoNjCgjoDsONOuD9Yznn3H19rR9LCXJl0VMolVtp2MO3ChOMYLg/z2VNHegExyOuP
 ZoMrB4agqPzejhAZMk133EmRTVp1t4iNzpu1IPphZ2emOhfc4945tIG3iqH9Sq2O7PdF
 ei3JBOdvNo/LIKmvMh2ygvGpC0tuczD0aiitIMgP5eTkH5WYh4VNl/Prs2YrHoiYO24y
 e+rw==
X-Gm-Message-State: AOJu0YzSTSXeofYHxaAAr+FLhQ0BD3pmvCqY7uIW18fLJyI4ZxwJ8Y+k
 QfSjaXgh2RSp9W1ebKCH3WP4kI0f+sijJ8VnbE2RMbeBLh7ztI+55lChkZSKZyLMRwt3pM3lgwv
 Z
X-Google-Smtp-Source: AGHT+IEv1j8tJ1cee5yc9wD+sbS0/Eg8/oq/s9mXAR2z8LpAjBNjhiBrHD1k2bI9Scwnpw7n90DbLg==
X-Received: by 2002:a05:600c:3514:b0:42c:bae0:f059 with SMTP id
 5b1f17b1804b1-42cdb531943mr75139795e9.5.1726328875377; 
 Sat, 14 Sep 2024 08:47:55 -0700 (PDT)
Received: from hugo-IdeaPad-3-15ALC6.lan ([2a02:61:a2:0:b62f:105:dcc:49fb])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42da23dd5e8sm22237905e9.28.2024.09.14.08.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 08:47:54 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 17:47:48 +0200
Message-Id: <20240914154748.2289155-1-hugo.cornelis@essensium.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1726328875; x=1726933675; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qzSWUye6EzcYiDGxZz9sS0D/K20LrbhXdW2GGJP2+dE=;
 b=aI/MVYeQLLl6v63WfnNuy+1IkVl33+EKw4fjHmH6yf2Wvh5JgeixKj9hz53/amhNrH
 9QCYH+7oW8aG8Vouqsw32Kw04flnv6AsD99nKTvFCsRsLPXOPZyIY6/yggnOtnAHnOrP
 wcZGC+8P6yE2BmeKLJl29g2GnrLlISAIPkH5jbLbQshHN1r5hFSmHHa5915aGQrUuI+1
 Vnv97H4A8TCKsRCQhZlKwzaEm8f1BFquFdd1kGDQSmaAc5Gg8pckqNOQmoWqkA7fzFce
 jlAlPMfEX+YV3flZa38yTErMLFfTAuly74aqw3FMNgFTJMIqvRKA5+TT8SeS1jkmKten
 FxfA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=aI/MVYeQ
Subject: [Buildroot] [PATCH 1/1] package/procps-ng: link the w command with
 systemd or elogin libs.
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
From: Hugo Cornelis via buildroot <buildroot@buildroot.org>
Reply-To: Hugo Cornelis <hugo.cornelis@essensium.com>
Cc: hugo.cornelis@essensium.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The build of procps-ng was broken when systemd was enabled.  The
solution was to apply commit ca004d46 of procps-ng upstream.

Signed-off-by: Hugo Cornelis <hugo.cornelis@essensium.com>
---
 ...1-build-sys-Add-systemd-elogind-to-w.patch | 46 +++++++++++++++++++
 package/procps-ng/procps-ng.mk                |  3 ++
 2 files changed, 49 insertions(+)
 create mode 100644 package/procps-ng/0001-build-sys-Add-systemd-elogind-to-w.patch

diff --git a/package/procps-ng/0001-build-sys-Add-systemd-elogind-to-w.patch b/package/procps-ng/0001-build-sys-Add-systemd-elogind-to-w.patch
new file mode 100644
index 0000000000..e778b5f14d
--- /dev/null
+++ b/package/procps-ng/0001-build-sys-Add-systemd-elogind-to-w.patch
@@ -0,0 +1,46 @@
+From ca004d4657d5e8b468a4552ede429be53193a3a9 Mon Sep 17 00:00:00 2001
+From: Craig Small <csmall@dropbear.xyz>
+Date: Thu, 31 Aug 2023 22:24:23 +1000
+Subject: [PATCH] build-sys: Add systemd/elogind to w
+
+Depending on the compiler flags, w needs to be explictly linked
+to libsystemd or elogind even though libproc2 is linked to it.
+
+Signed-off-by: Craig Small <csmall@dropbear.xyz>
+---
+ Makefile.am | 7 +++++++
+ NEWS        | 3 +++
+ 2 files changed, 10 insertions(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index f70c8fb1..ddfc0141 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -149,6 +149,13 @@ endif
+ 
+ dist_man_MANS += man/w.1
+ src_w_SOURCES = src/w.c local/fileutils.c
++src_w_LDADD = $(LDADD)
++if WITH_SYSTEMD
++src_w_LDADD += @SYSTEMD_LIBS@
++endif
++if WITH_ELOGIND
++src_w_LDADD += @ELOGIND_LIBS@
++endif
+ else
+   EXTRA_DIST += man/w.1
+ endif
+diff --git a/NEWS b/NEWS
+index 3f2158d4..4ad9f74e 100644
+--- a/NEWS
++++ b/NEWS
+@@ -1,3 +1,6 @@
++procps-ng-NEXT
++---------------
++
+ procps-ng-4.0.4
+ ---------------
+   * library (API & ABI unchanged)
+-- 
+2.34.1
+
diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index 2f28e3571e..1002d6340f 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -14,6 +14,9 @@ PROCPS_NG_INSTALL_STAGING = YES
 PROCPS_NG_DEPENDENCIES = ncurses host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 PROCPS_NG_CONF_OPTS = LIBS=$(TARGET_NLS_LIBS)
 
+# Applying 0001-build-sys-Add-systemd-elogind-to-w.patch touches Makefile.am
+PROCPS_NG_AUTORECONF = YES
+
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 PROCPS_NG_DEPENDENCIES += systemd
 PROCPS_NG_CONF_OPTS += --with-systemd
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
