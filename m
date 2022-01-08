Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91705C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 21:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 144A9400C1;
	Sat,  8 Jan 2022 21:09:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cL2jb-zUxQIg; Sat,  8 Jan 2022 21:09:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E313440122;
	Sat,  8 Jan 2022 21:09:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6FD241BF283
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 21:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D847813BF
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 21:09:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A9rhiyyImiiC for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 21:09:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8973A813B7
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 21:09:01 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id w26so399279wmi.0
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 13:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tIWlkYdQRmx25g81fZus2geEiqmAkLIaUW1TQU4nduc=;
 b=h7Oiz6amPQ7aL/4mzjtVCRvyRwHqgxwCq5KQYoJJpnphml1ZJuVh9E0Tlslt+1WYE+
 O28seiaVc2bi3ZtShHDAExK5xn0FEuOlhDnjpjHpB3qffjBxEdf5K5fohABTckTo4MAr
 UksKPYMhKfwFcw/n/ULVuhctuPOzLnQTYnSIq2pB84ycB4nuIiVzS9u9L2QhC0U/+Xg0
 e1sQX0H7yrqqiBPC1jLlyGQPol7jBMHHqY38kqX3/tgiq/+A8sSf9npR0go/QgYVoEE0
 2fw+QwXaesKJjrJXY4TGE2r6/65BXQ8p3Wm7bdfpPH3Ij5UU6e0AXg0ImU29WwRNMRHm
 X2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tIWlkYdQRmx25g81fZus2geEiqmAkLIaUW1TQU4nduc=;
 b=ejH8uO+qi3JRiVS/AIyvtbs7WQW3SnEUJWZwUKYKbSH0aRU6V7ZstV+hRqhjbG+XNC
 fbY+FxH47INI8bzraa7koKe1hrYxS+nCQq1gKW4Ne8JB+YXhT/QQju5oefkiwEn7e85G
 AGErlLlt60zuqa8gXBErJMBejDupFxyz6o3w9WE+aSlSR5xbcp9ilAYnRZ5xaOhZ3uc8
 TkXKLyNjoZAHsYYZDwJEQV8WcRjFwJlRq9bNU9XH2rQvVH+LPD0tyfj8TkVCwlglpnvS
 YiQAJ9xrofMR5MgG5CqGie71SVg6tvgLcQ8X7ZA9OskITolr+5tteH1ahU5pJPjDWUwD
 mdfA==
X-Gm-Message-State: AOAM530yCADtjxPKoN4bgFFkX1SrRhtGtSUOkfBeICcFfvt99Tt3ySd2
 kiNZVBoZz4jnYNnVMKgIvfHfzKppEVw=
X-Google-Smtp-Source: ABdhPJxIFx26AhIQyEVQYCgYXuf4gG8CM78LgPmN4ZIokFa7YBVkNZkcPooXLiWQHIN2Q5fsh93EhQ==
X-Received: by 2002:a1c:2544:: with SMTP id l65mr16261206wml.101.1641676139711; 
 Sat, 08 Jan 2022 13:08:59 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id d22sm2613297wrb.83.2022.01.08.13.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 13:08:59 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 22:07:52 +0100
Message-Id: <20220108210752.3245794-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/safeclib: fix build without
 stack-protector
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

Fix the following build failure without stack-protector raised since
bump to version 02092020 in commit
ebe808ac4071395b4d1e90d617c33a5e6e514af1 and
https://github.com/rurban/safeclib/commit/caa4408eb4a5c767f0474258af3b6ccf444e10aa:

/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/m68k-buildroot-uclinux-uclibc/bin/ld.real: ../src/.libs/libsafec-3.6.0.a(safe_mem_constraint.o): in function `handle_mem_bos_chk_warn':
safe_mem_constraint.c:(.text+0x40): undefined reference to `__stack_chk_guard'

If stack-protector is enabled in the Buildroot config, the toolchain
wrapper will make sure it is used, so there's no need for the safeclib
configure to handle it.

Fixes:
 - http://autobuild.buildroot.org/results/a481ee2d26a094358b0298617cce691be3077f22

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...gure.ac-add-disable-hardening-option.patch | 63 +++++++++++++++++++
 package/safeclib/safeclib.mk                  |  3 +
 2 files changed, 66 insertions(+)
 create mode 100644 package/safeclib/0001-configure.ac-add-disable-hardening-option.patch

diff --git a/package/safeclib/0001-configure.ac-add-disable-hardening-option.patch b/package/safeclib/0001-configure.ac-add-disable-hardening-option.patch
new file mode 100644
index 0000000000..e851fce993
--- /dev/null
+++ b/package/safeclib/0001-configure.ac-add-disable-hardening-option.patch
@@ -0,0 +1,63 @@
+From 94c612016834d7bdc2b721ff5f4f5e158bda6fdd Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 8 Jan 2022 21:49:22 +0100
+Subject: [PATCH] configure.ac: add --disable-hardening option
+
+Allow the user to disable hardening which is enabled by default since
+version 02092020 and
+https://github.com/rurban/safeclib/commit/caa4408eb4a5c767f0474258af3b6ccf444e10aa
+to avoid the following build failure when the toolchain doesn't support
+stack-protector:
+
+/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/m68k-buildroot-uclinux-uclibc/bin/ld.real: ../src/.libs/libsafec-3.6.0.a(safe_mem_constraint.o): in function `handle_mem_bos_chk_warn':
+safe_mem_constraint.c:(.text+0x40): undefined reference to `__stack_chk_guard'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a481ee2d26a094358b0298617cce691be3077f22
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/rurban/safeclib/pull/107]
+---
+ configure.ac | 27 +++++++++++++++++++--------
+ 1 file changed, 19 insertions(+), 8 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 55756b06..f852ed44 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -383,6 +383,21 @@ AC_ARG_ENABLE(debug-build,
+ 	esac], [enable_debug_build=false ])
+ AM_CONDITIONAL(ENABLE_DEBUG_BUILD, test "x$enable_debug_build" = "xtrue")
+ 
++AC_ARG_ENABLE(hardening,
++	AS_HELP_STRING([--disable-hardening],
++	               [disable hardening @<:@default=no@:>@]),
++	[case "${enableval}" in
++	yes) enable_hardening=true ;;
++	no)  enable_hardening=false ;;
++	*)   AC_MSG_ERROR([bad value ${enableval} for --enable-hardening]) ;;
++	esac], [enable_hardening=true])
++
++if test "x$enable_hardening" = "xtrue" ; then
++	AX_APPEND_COMPILE_FLAGS([-fstack-protector-strong -fstack-clash-protection -fcf-protection],
++                         [WARN_CFLAGS],[$ax_ccf_err])
++	AX_APPEND_LINK_FLAGS([-fstack-protector-strong -fstack-clash-protection -fcf-protection],
++                         [WARN_LDFLAGS],[$ax_ccf_err])
++fi
+ 
+ AC_MSG_NOTICE([Check programs])
+ # ===============================================
+@@ -543,10 +562,6 @@ case $host_os in
+        [],[$ax_ccf_err])
+     ;;
+ esac
+-AX_APPEND_COMPILE_FLAGS([-fstack-protector-strong -fstack-clash-protection -fcf-protection],
+-                         [WARN_CFLAGS],[$ax_ccf_err])
+-AX_APPEND_LINK_FLAGS([-fstack-protector-strong -fstack-clash-protection -fcf-protection],
+-                         [WARN_LDFLAGS],[$ax_ccf_err])
+ 
+ if test x$ax_cv_check_cflags__Wrestrict = xyes; then
+    AC_DEFINE([HAVE_WARNING_RESTRICT], 1, [Have -Wrestrict])
+-- 
+2.34.1
+
diff --git a/package/safeclib/safeclib.mk b/package/safeclib/safeclib.mk
index 032a73bf67..87b710b37d 100644
--- a/package/safeclib/safeclib.mk
+++ b/package/safeclib/safeclib.mk
@@ -11,5 +11,8 @@ SAFECLIB_SOURCE = libsafec-$(SAFECLIB_VERSION).tar.xz
 SAFECLIB_LICENSE = MIT
 SAFECLIB_LICENSE_FILES = COPYING
 SAFECLIB_INSTALL_STAGING = YES
+# We're patching configure.ac
+SAFECLIB_AUTORECONF = YES
+SAFECLIB_CONF_OPTS = --disable-hardening
 
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
