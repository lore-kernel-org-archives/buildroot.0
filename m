Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42E5CCF9FA
	for <buildroot@archiver.kernel.org>; Fri, 31 Oct 2025 10:10:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A672084772;
	Fri, 31 Oct 2025 10:10:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xgn7SRhpN5Ow; Fri, 31 Oct 2025 10:10:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C476E8476B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C476E8476B;
	Fri, 31 Oct 2025 10:10:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 78DE3160
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 10:10:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5ED108476B
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 10:10:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id amz8wfbz_-oC for <buildroot@buildroot.org>;
 Fri, 31 Oct 2025 10:10:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 180DA84769
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 180DA84769
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 180DA84769
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 10:10:30 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b4f323cf89bso476238066b.2
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 03:10:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761905429; x=1762510229;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z95g4C6MOWjszlN8MtQq0GUKmPf11FuArA8c/bkI1Tw=;
 b=c1i5RcoX4M/Wt0r7IkvjfFqQVo0cJV1f7UYF9bA1L3FJmAZq9SgR0V/V6oIsjqjdXe
 sbRQHjTik5/05gY2MWQteXI+pZsbTfwMg3+2q/r3BzyGCMIMmOMjw23Q1vJQYafdSpL/
 ZwLV3fGmt7/SgnPre7Z+64GD2AhyimTVVPBksKCXF8+1TctpDwLqzj0AMV4cbHu5J0m7
 oJPIK6mvsIYdRPuwF4GOM/Dr8G2DwCJYUbIWIpzxenrhooc/c2i17k+TX99ie2nJbbaM
 +0BeffU2KAdWQ9cVJ9W4HyWt4scSZWZstCXabUAsSD8+SSshDK7BfMnxGC1rjtFS7Y6u
 +gKw==
X-Gm-Message-State: AOJu0Yw1eotRHY42PurUh+KbHcK6ZJ18S/kZqqKZ8mrYPrDqz8Pe5csB
 mIe0EUpzmXE8MlDdylecm7zn7NnMAUfXJcr2c9mN94C9AkI5+ISkf1CYtFzQH3NVjg++04n9AOW
 kdkd2
X-Gm-Gg: ASbGncuRYBDj3Sf90LixjLY76AnPTzZRvotXFC+TI2u/A6QRL3QKfS5TnBfb+0UqbY1
 eA7wSI4oceHHPaLpmXfKvJmCjOoqtlmhgFVAtLFvLHkwHcrtoGdhZC2qeeAcMrGsZQHzq8WmA3T
 VN2fW+tcx0AgIz+/QQYZKacbRaZUjXCuhHvHpaSK7SEgzR+EiYG+X5u1OqQGjHeip3pcpCncvMp
 WfiTNAUOV0FbXvRilC/AvZAqysPyWsIEeFIkzxqLZcy9nLmDVxsqhMS5FB3yzxJpvgXyQbixSwm
 wLim5SLpu6/el8q8oVqzp963JH9FS9ez1nPxKYoU5rzROm2qsa4qxjUT/TVM9EkxdiFxeYhYuhi
 pwlXq5zedmd0OEeteTlLKNTVTiHHA8eKObGlcMgWlYNnvgwkODKFHd5aSuptS+2xSo1aldTl6et
 jD37YQ8WyvDqOJKqKH1IWhXyyEvEVBNg5mau4pzCfcVOep0a2hJDN0ZE5xXc0FpEsi
X-Google-Smtp-Source: AGHT+IHyMQTpS3y0HIiRiZ5L3tqGzNnKXYqQt3QVWOOZSj4ewjEyBz+OSgYqKXLyKxroVtZZDl+Lkg==
X-Received: by 2002:a17:906:c143:b0:b3b:b839:577b with SMTP id
 a640c23a62f3a-b70700ad74bmr278602966b.12.1761905428575; 
 Fri, 31 Oct 2025 03:10:28 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.41.188])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7077c3ea2asm133657366b.38.2025.10.31.03.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 03:10:28 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Mario Lang <mlang@blind.guru>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 31 Oct 2025 11:10:23 +0100
Message-ID: <20251031101023.2343092-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1761905429; x=1762510229;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z95g4C6MOWjszlN8MtQq0GUKmPf11FuArA8c/bkI1Tw=;
 b=XN/0/al4SYqkyT4AC0nSyDqjHmoZagxshnCFn1bRuzGqpmzHiasLzFyg/E+zTCK46Y
 XN8ZTUC8TIXCxvPJR8g4j3Wbw+CFwkc+K3s9wJ7aCf7cHZcgAixR1uaqhEUlJUZOoe00
 unL1/eGDSJWIi4QhqPBPsKdMmhAFSsiaC4OxM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=XN/0/al4
Subject: [Buildroot] [PATCH 1/1] package/brltty: bump to version 6.8
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

The added patch fix the following build error:

/usr/bin/install -c -d ../../../lib
buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-gcc -shared   -Wl,-export-dynamic -o ../../../lib/libbrlttyxfv.so screen.o -ltinfo
buildroot/output/host/lib/gcc/arm-buildroot-linux-gnueabihf/14.3.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: cannot find -ltinfo: No such file or directory
collect2: error: ld returned 1 exit status

git format-patch -M -n -s -o outgoing origin/master
Update README hash:
- v6.8:
  - Update the copyright from 2024 to 2025.
- v6.7:
  - Update the supported braille devices lists.
  - Add support for the HIMS eMotion.
  - Add support for HT's Activator Pro models.
  - Add support for the KGS Next Touch 40.
  - Change the copyright from 2023 to 2024.
  - Document that HT's Basic Braille Plus models are supported.

Release notes:
https://github.com/brltty/brltty/blob/BRLTTY-6.8/Documents/ChangeLog

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...k-fv-driver-with-ltinfo-only-if-avai.patch | 58 +++++++++++++++++++
 package/brltty/brltty.hash                    |  4 +-
 package/brltty/brltty.mk                      |  8 ++-
 3 files changed, 65 insertions(+), 5 deletions(-)
 create mode 100644 package/brltty/0002-configure.ac-link-fv-driver-with-ltinfo-only-if-avai.patch

diff --git a/package/brltty/0002-configure.ac-link-fv-driver-with-ltinfo-only-if-avai.patch b/package/brltty/0002-configure.ac-link-fv-driver-with-ltinfo-only-if-avai.patch
new file mode 100644
index 000000000000..121237ee4987
--- /dev/null
+++ b/package/brltty/0002-configure.ac-link-fv-driver-with-ltinfo-only-if-avai.patch
@@ -0,0 +1,58 @@
+From a4f55ee941fdc94511c72c1831dedcf5bea7935d Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Thu, 30 Oct 2025 16:52:53 +0100
+Subject: [PATCH] configure.ac: link fv driver with -ltinfo only if available
+
+During the brltty bump to version 6.8 in Buildroot, the build failed on
+systems without libtinfo:
+
+  /usr/bin/ld: cannot find -ltinfo: No such file or directory
+
+Link libtinfo only if the library is present.
+
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://github.com/brltty/brltty/pull/503
+---
+ configure.ac | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 68c9c6d1b7f5..5c931f71b79a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -813,6 +813,7 @@ BRLTTY_ARG_ENABLE(
+ ])
+ AC_SUBST(fuzzer_libs)
+ 
++have_tinfo="no"
+ brltty_curses_libs_save="${LIBS}"
+ BRLTTY_PACKAGE_CHOOSE([curses],
+    [ncursesw ncursesw/ncurses.h],
+@@ -823,8 +824,10 @@ BRLTTY_PACKAGE_CHOOSE([curses],
+    [pdcurses curses.h])
+ if test -n "${curses_package}"
+ then
+-   AC_CHECK_LIB([tinfo], [intrflush])
++   AC_CHECK_LIB([tinfo], [intrflush],
++                [have_tinfo="yes"])
+ fi
++
+ curses_libs="${LIBS%${brltty_curses_libs_save}}"
+ LIBS="${brltty_curses_libs_save}"
+ AC_SUBST([curses_libs])
+@@ -1882,7 +1885,11 @@ in
+       ;;
+ esac
+ 
+-BRLTTY_SCREEN_DRIVER([fv], [FileViewer], [-ltinfo])
++if test "${have_tinfo}" = "yes"; then
++   BRLTTY_SCREEN_DRIVER([fv], [FileViewer], [-ltinfo])
++else
++   BRLTTY_SCREEN_DRIVER([fv], [FileViewer])
++fi
+ 
+ all_brltty_pty=""
+ install_brltty_pty=""
+-- 
+2.43.0
+
diff --git a/package/brltty/brltty.hash b/package/brltty/brltty.hash
index 9b707fc1c29f..9b75e0023fc1 100644
--- a/package/brltty/brltty.hash
+++ b/package/brltty/brltty.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  ab11cfc5fbd7ef0ec876ffea7e131e424b2fd004b6158064e1a2e46412825529  brltty-6.6.tar.xz
+sha256  9f3c6dc2b65059d20f60836e8f9ebc58d8e518d6a8f8fee33e1d1e50ab43c3bc  brltty-6.8.tar.xz
 sha256  d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  LICENSE-LGPL
-sha256  72740317768530c60046c591160d4552afb3ac49657b04c7b8452c1bbe7b834e  README
+sha256  a9a8b3eef5f3e2b4716912a4ed60eca78a3f561515ed17ebe80348f2f033b395  README
diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
index 22d58ebd00e3..e3105e53f1a3 100644
--- a/package/brltty/brltty.mk
+++ b/package/brltty/brltty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BRLTTY_VERSION = 6.6
+BRLTTY_VERSION = 6.8
 BRLTTY_SOURCE = brltty-$(BRLTTY_VERSION).tar.xz
 BRLTTY_SITE = http://brltty.com/archive
 BRLTTY_INSTALL_STAGING_OPTS = INSTALL_ROOT=$(STAGING_DIR) install
@@ -37,8 +37,10 @@ BRLTTY_CONF_OPTS = \
 	--without-theta
 
 # Autoreconf is needed because we're patching configure.ac in
-# 0001-Fix-linking-error-on-mips64el. However, a plain autoreconf doesn't work,
-# because this package is only autoconf-based.
+# 0001-Fix-linking-error-on-mips64el and
+# 0002-configure.ac-link-fv-driver-with-ltinfo-only-if-avai.
+# However, a plain autoreconf doesn't work, because this package
+# is only autoconf-based.
 define BRLTTY_AUTOCONF
 	cd $(BRLTTY_SRCDIR) && $(AUTOCONF)
 endef
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
