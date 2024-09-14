Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C30C021A8
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 17:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9A81404D2;
	Sat, 14 Sep 2024 17:27:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4QgFYAMumCs0; Sat, 14 Sep 2024 17:27:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5780D4035B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5780D4035B;
	Sat, 14 Sep 2024 17:27:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B19A41BF86C
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 17:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A007140120
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 17:27:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IHoIYBDwQPpv for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 17:27:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=hugo.cornelis@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 81DDB400EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81DDB400EA
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81DDB400EA
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 17:27:33 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-42cacabd2e0so27848975e9.3
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 10:27:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726334851; x=1726939651;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zhN3f30Jvjsv6ApQqgJkvJFSdRdqLrzcU11wtvD7kNU=;
 b=EmPpRYWquvHQVUrUpHhlKdru5wtsY54DTUnJ2MjWYHGUzFFcKo069qlzLrIMVSBRW4
 a2Cpa80ApISbx4mf4PE1+wxg0vjTlcdXe4h3ltEOnE5K5hwAs/mRUWM8ZYC1AeY0psUf
 /7d/2RONZL1CFx62E84HRI5yuWfwHpBJBnBtOUwto/OqV9cqyMp0mAgKkzuQEuGzzeT4
 OF3PoW1vYawT6ExmRELSLr7LRPbNKCwLSfOTErWj5IWEYO3CeT0DfFQwdtyH2+lK7YKm
 xuBzKSZ9va7gypZ4y/dZBrNakfvgOavrg/iASXtmkP6sRQgiTt9Lu9U4iCn4nUEhyb3G
 sFig==
X-Gm-Message-State: AOJu0YxCUdogir00Y+8Yc87jNiOx1UnI3sKEYSWkLfPJ2Q83REHHTr6s
 mjwHOkwGCn6EufwqX5UXAUswVo7T9rzKJDaM5rdYN3W1ZyqkwF4RyX/jmElmnYML2Efjy0mtRx8
 U
X-Google-Smtp-Source: AGHT+IFQh8QfCmj/iDOVzResC2DxoNihdaPL0DlhRisqIho5sGQnt0ybWpppuczw0ZzOMloxGvIKyQ==
X-Received: by 2002:a05:600c:4e94:b0:42c:a574:6362 with SMTP id
 5b1f17b1804b1-42cdb522c74mr68900725e9.11.1726334850767; 
 Sat, 14 Sep 2024 10:27:30 -0700 (PDT)
Received: from hugo-IdeaPad-3-15ALC6.lan ([2a02:61:a2:0:b62f:105:dcc:49fb])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42d9b055052sm59116435e9.9.2024.09.14.10.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 10:27:30 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 19:27:10 +0200
Message-Id: <20240914172710.2917184-1-hugo.cornelis@essensium.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <c7a62004-10ab-4351-a3f5-7fd3ab157551@mind.be>
References: <c7a62004-10ab-4351-a3f5-7fd3ab157551@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1726334851; x=1726939651; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zhN3f30Jvjsv6ApQqgJkvJFSdRdqLrzcU11wtvD7kNU=;
 b=VVWPieSuh14Se9HWtQ8PuxUZlJmdzqpKHEjxWs4eApJ0Y/X9AJejkUhpmxoRTOMU5t
 /3K7jyNCzdGitAEgJhylSCJ1GcfIYmUb/3DpBTKIBdOgBvt35TsTAmjJ7EdEEeJs+JoO
 rknrfrhU5BgW/NNox7FVLpUjwWJes7SMf/yOtDThStVM4/XuCIj1jRK0gqrPV7VA26gq
 itOe0QieTskYwWrTk5RwVR3oy18FKzg8dPjQOakWsJ/NRApbte8qQS0hEYhNR9oQebmH
 Jg+h9x3QUU+ZfcPzB73YqMI+FWN/kRNHoqBPYrHP25RZhAIBrXAHE7Mk68MQKZPqzU2+
 J0cA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=VVWPieSu
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

The build of procps-ng was broken when systemd was enabled.  Applying
commit ca004d46 of procps-ng upstream to explictly link the 'w'
command to libsystemd or elogind even though libproc2 is linked to it.

This was (likely) broken since the upgrade to procps-ng v4.0.4 with
commit d79f40dbbe98983bc657d4c82d46b38b8283351b.

Fixes: http://autobuild.buildroot.org/results/e8b/e8bae7bfd7d6a7987f3afa199d8d944429144817/build-end.log
Signed-off-by: Hugo Cornelis <hugo.cornelis@essensium.com>
---
 ...1-build-sys-Add-systemd-elogind-to-w.patch | 48 +++++++++++++++++++
 package/procps-ng/procps-ng.mk                |  3 ++
 2 files changed, 51 insertions(+)
 create mode 100644 package/procps-ng/0001-build-sys-Add-systemd-elogind-to-w.patch

diff --git a/package/procps-ng/0001-build-sys-Add-systemd-elogind-to-w.patch b/package/procps-ng/0001-build-sys-Add-systemd-elogind-to-w.patch
new file mode 100644
index 0000000000..3fecb4746d
--- /dev/null
+++ b/package/procps-ng/0001-build-sys-Add-systemd-elogind-to-w.patch
@@ -0,0 +1,48 @@
+From 788248ee631b3b5f82073c36320fc3f4a3c8f9ba Mon Sep 17 00:00:00 2001
+From: Craig Small <csmall@dropbear.xyz>
+Date: Thu, 31 Aug 2023 22:24:23 +1000
+Subject: [PATCH 1/1] build-sys: Add systemd/elogind to w
+
+Depending on the compiler flags, w needs to be explictly linked
+to libsystemd or elogind even though libproc2 is linked to it.
+
+Signed-off-by: Craig Small <csmall@dropbear.xyz>
+Upstream: https://gitlab.com/procps-ng/procps/-/commit/ca004d4657d5e8b468a4552ede429be53193a3a9
+Signed-off-by: Hugo Cornelis <hugo.cornelis@essensium.com>
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
