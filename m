Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8027EE7718B
	for <buildroot@archiver.kernel.org>; Thu,  2 Jan 2025 11:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 682FC80F0D;
	Thu,  2 Jan 2025 11:00:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ukW9jKMfi5Ni; Thu,  2 Jan 2025 11:00:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C88780EC3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C88780EC3;
	Thu,  2 Jan 2025 11:00:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 74A64F24
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 11:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E4F040324
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 11:00:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A5x8mOeli8hq for <buildroot@buildroot.org>;
 Thu,  2 Jan 2025 11:00:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BBBCD40317
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBBCD40317
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BBBCD40317
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 11:00:38 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5d3cfa1da14so2348962a12.1
 for <buildroot@buildroot.org>; Thu, 02 Jan 2025 03:00:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735815636; x=1736420436;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9x+o2a+FALbHrrvNzxFT16RclLHuXGdrz1QwPFLGOj8=;
 b=R7HkPLUhIZ5FMakD4amk+mNPbN5zUxShrr9gE5C7hw5ZMgnk2yLAL+l0m24/OyIl5h
 bDJPUbfmA9TJaqYSQx2IXKTs5wPnpI4bOMI3QezfdMBINKeU4NqX7x9oxlvveY2HvNKz
 IsLJQ3UWdiWMub2GscSHcLFEx+60Zco+zjr8ht/XEaOiyWPdrPBwu58M2tHWOTAqFptE
 Hnabgh59nDcBuXU7n811Vh1ruWEFIs407Q6ZvI7dTZXddBMT5hsMwf2T3FHOp7ONvhDj
 N4r94Nk/vGjaIITd43dnRsCcJU3Zq66Z/cEJ7723d1GSb12H/Tb9PWJ0yR5omARHgL9w
 Ou1Q==
X-Gm-Message-State: AOJu0YxTgj4UVgCt+xugm4O0i5aJnafpBbBoXwzNaaQ+g6vNG8WvsV34
 74jYqacWx0NDcpA+6jS7ENe5KV3Gn909sznfOcP5zmks+uin60C8qP+n3QcNRtqfYB+yLLMar2h
 ZRKg=
X-Gm-Gg: ASbGncvjNG/u8dzmHEw3XH+1ex7EUDcxqZYc9Guy0ibMso/yktLRwBy6JR9czxiKvCu
 w33pPznZ4LAVegGMjsAJ3AZJx8ojlgyAtxXU+ohXVoQSNPYGEz8LsdGs8uhTzgNDDK7yiPd1H2y
 SqRwIJqq0HTJb6QY7owZd5IeaO8+oYpvHqBLiO5YEvty7uylcoD59kqMhc3RmCWcYFEepfm9psb
 1st4oxaux4SCWVQusHU9Q0GxQZhFuSGxxSGAbY+IpgEAT4xedQ+CBx2udhApIQ9Z5I/8/aZ4rNf
 VAprllC8d/N+
X-Google-Smtp-Source: AGHT+IHsxdlmgMlrr0+jhikDeN+XJ7OKS1Bd0Yrqv0OWqg+DQpTapl39OXYEYcSYrDdGNoa3sqpAQA==
X-Received: by 2002:a17:907:3e8f:b0:aa5:3e81:5aa2 with SMTP id
 a640c23a62f3a-aac2adc463dmr1485391366b.4.1735815636431; 
 Thu, 02 Jan 2025 03:00:36 -0800 (PST)
Received: from localhost.localdomain ([212.22.143.210])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0f0652a7sm1773799466b.174.2025.01.02.03.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2025 03:00:36 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Thu,  2 Jan 2025 12:00:25 +0100
Message-ID: <20250102110025.722992-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250102110025.722992-1-adam.duskett@amarulasolutions.com>
References: <20250102110025.722992-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1735815636; x=1736420436;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9x+o2a+FALbHrrvNzxFT16RclLHuXGdrz1QwPFLGOj8=;
 b=K+yw02VQkKnTR1Is/k3s5zIYc7BRf7wolOrBtYMCFpaueSkFlyq+7YIUmEzNtslORX
 wMZzMlWj14lsDQ4pvYxNn219hGTjoSkF0hF4ubxSPZ7RT7U+4I2tt/E/NhF8tvW4chPX
 ve56FRTxK0QjlD2TU+xTmevV3RqkHSdZd1xf4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=K+yw02VQ
Subject: [Buildroot] [PATCH 1/1] package/openrc: bump to version 0.56
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

Other changes:
  - Update 0007-allow-setting-rc_libexecdir-path.patch to apply cleanly
  - Remove the split-usr logic, as it was removed in version 0.54. This
    logic is now handled by passing the following to meson during the
    configure stage: --bindir /bin --libdir /lib64 --libexecdir /lib
                     --sbindir /sbin
  - libcap is now a dependency
  - The audit package must be explicity set as disabled if not available.
    If not, configuration errors occure if audit is not found.

    
./support/testing/run-tests tests.init.test_openrc

11:45:44 TestInitSystemOpenrcRwFull               Starting
11:45:57 TestInitSystemOpenrcRwFull               Cleaning up
11:45:57 TestInitSystemOpenrcRoFull               Starting
11:46:10 TestInitSystemOpenrcRoFull               Cleaning up
11:46:10 TestInitSystemOpenrcMergedUsrFull        Starting
11:46:10 TestInitSystemOpenrcMergedUsrFull        Building
11:51:59 TestInitSystemOpenrcMergedUsrFull        Building done
11:52:12 TestInitSystemOpenrcMergedUsrFull        Cleaning up

----------------------------------------------------------------------
Ran 3 tests in 388.180s
OK

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 ...0007-allow-setting-rc_libexecdir-path.patch | 16 ++++++++--------
 package/openrc/Config.in                       |  1 +
 package/openrc/openrc.hash                     |  2 +-
 package/openrc/openrc.mk                       | 18 +++++++++---------
 4 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/package/openrc/0007-allow-setting-rc_libexecdir-path.patch b/package/openrc/0007-allow-setting-rc_libexecdir-path.patch
index a11c789275..5787c26dde 100644
--- a/package/openrc/0007-allow-setting-rc_libexecdir-path.patch
+++ b/package/openrc/0007-allow-setting-rc_libexecdir-path.patch
@@ -4,12 +4,12 @@ Date: Wed, 8 Sep 2021 22:41:58 +0200
 Subject: [PATCH] allow setting rc_libexecdir path
 
   - Allow to change the rc dir name of the rc_libexecdir path
-  - Introduce a librcdir option for override with value 'rc'
+  - Introduce a librcdir option for override with value 'rc'6
 
 Upstream: https://github.com/OpenRC/openrc/pull/443
 
 Signed-off-by: artoo <artoo@artixlinux.org>
-[Adam: update for 0.50]
+[Adam: update for 0.56]
 Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 ---
  meson.build       | 2 +-
@@ -20,10 +20,10 @@ diff --git a/meson.build b/meson.build
 index 5b3f8fa..40d4be1 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -102,7 +102,7 @@ if os == 'Linux' and libexecdir == 'libexec'
-   libexecdir = 'lib'
- endif
- libexecdir = rootprefix / libexecdir
+@@ -85,7 +85,7 @@ bindir = get_option('prefix') / get_option('bindir')
+ libdir = get_option('prefix') / get_option('libdir')
+ pluginsdir = libdir / 'rc/plugins'
+ libexecdir = get_option('prefix') / get_option('libexecdir')
 -rc_libexecdir = libexecdir / 'rc'
 +rc_libexecdir = libexecdir / get_option('librcdir')
  rc_bindir = rc_libexecdir / 'bin'
@@ -33,8 +33,8 @@ diff --git a/meson_options.txt b/meson_options.txt
 index 2c74152..d2f67e4 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
-@@ -37,3 +37,5 @@ option('termcap', type : 'combo',
-   description : 'the termcap library to use')
+@@ -26,3 +26,5 @@ option('sysvinit', type : 'boolean', value : false,
+   description : 'enable SysVinit compatibility (linux only)')
  option('zsh-completions', type : 'boolean',
    description : 'install zsh completions')
 +option('librcdir', type : 'string', value : 'rc',
diff --git a/package/openrc/Config.in b/package/openrc/Config.in
index 42d7347b0e..e1f004212b 100644
--- a/package/openrc/Config.in
+++ b/package/openrc/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_OPENRC
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # kmod tools
 	select BR2_PACKAGE_KMOD # runtime
 	select BR2_PACKAGE_KMOD_TOOLS # runtime
+	select BR2_PACKAGE_LIBCAP # runtime
 	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_NCURSES
 	help
diff --git a/package/openrc/openrc.hash b/package/openrc/openrc.hash
index c1c16a8c45..85e869f82a 100644
--- a/package/openrc/openrc.hash
+++ b/package/openrc/openrc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0b911eee4e64ad5e6945c6fed572220d537dfd0108838fa6d6797a2d7ff9f052  openrc-0.52.1.tar.gz
+sha256  a06b530290057637eab17fc943cbf79c0335eb734ba71ece38b9f3acd8a341d4  openrc-0.56.tar.gz
 sha256  6ac2bf77510808fbec7dc86cbfbca98dfc4c6b47dc99e4ca77b5370e097d8e70  LICENSE
diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
index 69f5b3a121..67846ce0ea 100644
--- a/package/openrc/openrc.mk
+++ b/package/openrc/openrc.mk
@@ -4,22 +4,28 @@
 #
 ################################################################################
 
-OPENRC_VERSION = 0.52.1
+OPENRC_VERSION = 0.56
 OPENRC_SITE = $(call github,OpenRC,openrc,$(OPENRC_VERSION))
 OPENRC_LICENSE = BSD-2-Clause
 OPENRC_LICENSE_FILES = LICENSE
 OPENRC_CPE_ID_VALID = YES
 
-OPENRC_DEPENDENCIES = ncurses
+OPENRC_DEPENDENCIES = libcap ncurses
 
 OPENRC_CONF_OPTS = \
 	-Dos=Linux \
 	-Dlibrcdir=/usr/libexec/rc \
 	-Dpkgconfig=false \
 	-Dsysvinit=true \
-	-Drootprefix=/ \
 	-Dbranding="\"Buildroot $(BR2_VERSION_FULL)\""
 
+ifeq ($(BR2_PACKAGE_AUDIT),y)
+OPENRC_CONF_OPTS += -Daudit=enabled
+OPENRC_DEPENDENCIES += audit
+else
+OPENRC_CONF_OPTS += -Daudit=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
 OPENRC_CONF_OPTS += -Dbash-completions=true
 else
@@ -44,12 +50,6 @@ else
 OPENRC_CONF_OPTS += -Dpam=false
 endif
 
-ifeq ($(BR2_ROOTFS_MERGED_USR),y)
-OPENRC_CONF_OPTS += -Dsplit-usr=false
-else
-OPENRC_CONF_OPTS += -Dsplit-usr=true
-endif
-
 define OPENRC_INSTALL_SYSV_RCS_SCRIPT
 	$(INSTALL) -D -m 0755 $(OPENRC_PKGDIR)/sysv-rcs \
 		$(TARGET_DIR)/etc/init.d/sysv-rcs
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
