Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29093C4332F
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 21:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86E4081916;
	Mon,  7 Nov 2022 21:49:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86E4081916
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0tQZ0F_kaD6b; Mon,  7 Nov 2022 21:49:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8406581454;
	Mon,  7 Nov 2022 21:49:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8406581454
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ABC8A1BF27A
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 21:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D3F240329
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 21:49:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D3F240329
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AVraea0YJV7r for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 21:49:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A05EA4031F
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A05EA4031F
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 21:49:06 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 h133-20020a1c218b000000b003cf4d389c41so288943wmh.3
 for <buildroot@buildroot.org>; Mon, 07 Nov 2022 13:49:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TXg+5ydHuCt+wB8jJ1XqAb/d4HTeZbJY3Q4EddBOsBg=;
 b=jQXhLwSTRSpithobsy7EK3kn32W746cIAeSnfRatVPV+WKcnF2gFmfmlHV3UkDOG+w
 Q5VfOSJmaNI9YHpW/1yrTW30Lb5aAnyX6Ihxcx0rIieE15HW9OMfYdgsir2MhCZgi0or
 wdzkB9myCJRIPKE7WNVKP2tizZNIoRPyXm0XqQ3a8pYuZWkECC0UYFBTrTx/NEPpH5gq
 OqcSl/Ze/S6P6rPIprYApYQKrOo0Lsd9o3jIlCD6jvTbr/wzs7qFo/nYYqt4mjNHGBkP
 0JqD6tVnJzlSYjooVGY5XL7YzOQ4DaezwNYis83+gWx52RFlSmOWBKq+4WLKqPkPpbZw
 yk3w==
X-Gm-Message-State: ACrzQf0+J2Q4dkGlRWWr+4BMXsmrKl2pI6gPwAPrOPlLPx9n5wvm7FI+
 iSrWXPxrUnA36E/V4iDmJBmYOX5Ntd4=
X-Google-Smtp-Source: AMsMyM77p3/eHNsfesI6LVI2gEVjM3pV9QnB1nmMe5AjfnrQM+qQj+iKaCdo6xAuj6MPcPLP7mQzuw==
X-Received: by 2002:a05:600c:548a:b0:3cf:a358:ee3 with SMTP id
 iv10-20020a05600c548a00b003cfa3580ee3mr8681829wmb.12.1667857744697; 
 Mon, 07 Nov 2022 13:49:04 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:1dd2:f7fa:6fba:b565])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a5d48c7000000b0022cce7689d3sm9988026wrs.36.2022.11.07.13.49.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 13:49:04 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon,  7 Nov 2022 22:49:03 +0100
Message-Id: <20221107214903.1565321-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=TXg+5ydHuCt+wB8jJ1XqAb/d4HTeZbJY3Q4EddBOsBg=;
 b=buFUf+ZeuvxWPE2i7d5B/mMXcSrYh4UJezK1IUKSw+kqvYSgtQb/2giDnhww2bIlok
 WNUWcNTKpLOBXHGXgcI8ZrPtcxQ03ADmFi0n4eF/tBED80OISDyZ5IUDYhRzzSHcOMIh
 N0mwjW1ISN5kbU/BRKGf0h8Hgg9WMuw/yP3NDFk5rAxrMSomgUCrGfKWRqimX4zYeKX3
 SYX1UBXx7qZ70dM99wGGXQ9GMENN3vs6j1i7LnoRMPvYRY71zUqcTInhJGR4wf7BQRhn
 DxDvNbf2cYGZdAlIDXjDoZP0V/BWcXGfkLGe2eZ8kYtm8o4bcAyXlZvmRrEnsiv0uWjh
 5QsQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=buFUf+Ze
Subject: [Buildroot] [PATCH] toolchain: make paranoid check of
 library/header paths unconditional
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
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When we introduced support for the paranoid check of unsafe libraries
and headers path with commit 4ac8f78d3771 (Add option for paranoid
unsafe path checking) back in 2014, we made it optional, as we expected
that would break quite a few packages.

Now, almost 8 years later, we only have three packages that explicitly
reference the option (dillo, gnuradio, and libtalloc), either in a patch
or in their .mk.

The option has been enabled by default since 2016, with 61c8854cef2a
(toolchain: enable paranoid unsafe path check by default), and that has
not triggered many build failures in a while.

The minimal defconfig used by test-pkg has also had it enabled as of
b6c98b3549d8 (minimal.config: add BR2_COMPILER_PARANOID_UNSAFE_PATH=y)
in 2017.

It is time to make that globally unconditional now.

There is still a remnant, in our binutils patches. As our toolchain may
get used outside of Buildroot, people may got the expectation that path
poisoning is only a warning, so we keep the current behaviour.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Romain Naour <romain.naour@gmail.com>
---
 Config.in                               | 18 ------------------
 package/Makefile.in                     |  3 +--
 support/config-fragments/minimal.config |  1 -
 toolchain/toolchain-wrapper.c           | 21 ++++-----------------
 4 files changed, 5 insertions(+), 38 deletions(-)

diff --git a/Config.in b/Config.in
index 3c57c591a8..7423394918 100644
--- a/Config.in
+++ b/Config.in
@@ -684,24 +684,6 @@ config BR2_GLOBAL_PATCH_DIR
 
 menu "Advanced"
 
-config BR2_COMPILER_PARANOID_UNSAFE_PATH
-	bool "paranoid check of library/header paths"
-	default y
-	help
-	  By default, when this option is disabled, when the Buildroot
-	  cross-compiler will encounter an unsafe library or header path
-	  (such as /usr/include, or /usr/lib), the compiler will display
-	  a warning.
-
-	  By enabling this option, this warning is turned into an error,
-	  which will completely abort the build when such unsafe paths
-	  are encountered.
-
-	  Note that this mechanism is available for both the internal
-	  toolchain (through the toolchain wrapper and binutils patches)
-	  and external toolchain backends (through the toolchain
-	  wrapper).
-
 config BR2_FORCE_HOST_BUILD
 	bool "Force the building of host dependencies"
 	help
diff --git a/package/Makefile.in b/package/Makefile.in
index 43d214bcbe..98ae3851a6 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -424,9 +424,8 @@ else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
 SHARED_STATIC_LIBS_OPTS = --enable-static --enable-shared
 endif
 
-ifeq ($(BR2_COMPILER_PARANOID_UNSAFE_PATH),y)
+# Used by our binutils patches.
 export BR_COMPILER_PARANOID_UNSAFE_PATH=enabled
-endif
 
 include package/pkg-download.mk
 include package/pkg-autotools.mk
diff --git a/support/config-fragments/minimal.config b/support/config-fragments/minimal.config
index 71344e2c69..3430fcce11 100644
--- a/support/config-fragments/minimal.config
+++ b/support/config-fragments/minimal.config
@@ -4,5 +4,4 @@ BR2_INIT_NONE=y
 BR2_SYSTEM_BIN_SH_NONE=y
 # BR2_PACKAGE_BUSYBOX is not set
 # BR2_TARGET_ROOTFS_TAR is not set
-BR2_COMPILER_PARANOID_UNSAFE_PATH=y
 BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 37b24dd24a..4c08e97237 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -154,12 +154,9 @@ static const struct str_len_s unsafe_opts[] = {
  * or separated (e.g. -I /foo/bar). In the first case, we need only print
  * the argument as it already contains the path (arg_has_path), while in
  * the second case we need to print both (!arg_has_path).
- *
- * If paranoid, exit in error instead of just printing a warning.
  */
 static void check_unsafe_path(const char *arg,
 			      const char *path,
-			      int paranoid,
 			      int arg_has_path)
 {
 	const struct str_len_s *p;
@@ -168,14 +165,12 @@ static void check_unsafe_path(const char *arg,
 		if (strncmp(path, p->str, p->len))
 			continue;
 		fprintf(stderr,
-			"%s: %s: unsafe header/library path used in cross-compilation: '%s%s%s'\n",
+			"%s: ERROR: unsafe header/library path used in cross-compilation: '%s%s%s'\n",
 			program_invocation_short_name,
-			paranoid ? "ERROR" : "WARNING",
 			arg,
 			arg_has_path ? "" : "' '", /* close single-quote, space, open single-quote */
 			arg_has_path ? "" : path); /* so that arg and path are properly quoted. */
-		if (paranoid)
-			exit(1);
+		exit(1);
 	}
 }
 
@@ -250,8 +245,6 @@ int main(int argc, char **argv)
 	char *progpath = argv[0];
 	char *basename;
 	char *env_debug;
-	char *paranoid_wrapper;
-	int paranoid;
 	int ret, i, count = 0, debug = 0, found_shared = 0;
 
 	/* Debug the wrapper to see arguments it was called with.
@@ -470,12 +463,6 @@ int main(int argc, char **argv)
 #endif
 	}
 
-	paranoid_wrapper = getenv("BR_COMPILER_PARANOID_UNSAFE_PATH");
-	if (paranoid_wrapper && strlen(paranoid_wrapper) > 0)
-		paranoid = 1;
-	else
-		paranoid = 0;
-
 	/* Check for unsafe library and header paths */
 	for (i = 1; i < argc; i++) {
 		const struct str_len_s *opt;
@@ -492,9 +479,9 @@ int main(int argc, char **argv)
 				i++;
 				if (i == argc)
 					break;
-				check_unsafe_path(argv[i-1], argv[i], paranoid, 0);
+				check_unsafe_path(argv[i-1], argv[i], 0);
 			} else
-				check_unsafe_path(argv[i], argv[i] + opt->len, paranoid, 1);
+				check_unsafe_path(argv[i], argv[i] + opt->len, 1);
 		}
 	}
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
