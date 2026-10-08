Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258B5CA9EC0
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1F7160ED4;
	Sat, 10 Oct 2026 09:27:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jin3aeONp5h2; Sat, 10 Oct 2026 09:27:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C9038608FB
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624473;
	b=KQX1iObm/kD8kEkX6zYtyG7oSkPNpzjaLudm7Y8F8ZoND7c9H5BwYwyj+W9y2cjeS9jM
	 206FWa/o/8M4eYu6Pr9308YrIKRncAEFmhmzF6Lqy7oDmzmRn6mPvIJZjJ1p2QQ5wE1UY
	 mWVuVs0VT+EAw7M4DKDitfx6RzdoJ7SuMhA9vCFthbr3JKb9coySXbvW/X0CNP90Da45J
	 Z/CSuiUDt4z46HuafkzcWVE8b04KVpSggoA6Fbo+pPxfB2P9e9oMLsUl0+CdFlkPxZbWh
	 sZ4kecTtAmza6uMq2AZAXJKa92Bzk1iY3ul3A1hNymMPwMwWpn1D9lXnyn/G6p6SopQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624473;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=J6vwRxX1eHauV6XMXrvz96XsoopRI7PmRXY52F6ulyE=;
	b=ZZItg/JpLQ45QT6ipcDGO/NaynxIZbjF7SFNmbMGte7YMtoXihLbK4DkMc8BJR6PjqpE
	 yEidNe25GQZKzOCg9vSf7wSEPaNeP+jkoooXtPMJO9spcPyKbKVxmcdoK8S5Pl/pmz0yV
	 TKfGt6J7a2T9xzRo9dXGTL+m8Hv1pG7dXDV+l/7wZdVI3PoGlIud4hVcX9BHLP9REMNdq
	 dqr/X/aLxvi4Grb5ZByXCN94h1t2pvRhrzirp/TM1cYIpizB/x+w65xHYKIbL/2yQweou
	 YEzvVCv5YP90HC91nymheBX+LPW+MhppTz41pv490MfHVs9RTuPfhWRRcsiF9O4gztA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624473;
	bh=J6vwRxX1eHauV6XMXrvz96XsoopRI7PmRXY52F6ulyE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NWqxXxjFf/8c2wlIv5PqBQXA40k/uXBQTCtk8h3nurL8wpP6382pFW+lu3tLPmbdh
	 Af6Utc55qeWKL7IcxDh0IFduG1VBCdEmnUQh1Sz7nQe+8jTszKB7iIqpYPHn/cG0XM
	 MbnqB/yVQri6tAYuuObvG/inAZcqPGDSm87zce2NBZ3mWyEFmE5qvKU+G/87xEj1gK
	 kEtRpk1MDHnfHRhMlbw61oPQohYFSr5y9qFeGi6YI8+v+ViggVz53pAjEwXcDx5fzw
	 9hcHN4mTI7VXIJNVjMgmsGmVSCIPM4IIjdhmesLXHMqVWc/+e7hxE6yJCGYrwyfHDU
	 o+zW4YoQ/Vosg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9038608FB;
	Sat, 10 Oct 2026 09:27:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 383A475
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BB8380F85
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VjP1b1qnYzPd for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BAA2F81173
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624441;
 b=K+RDSMfYmMcZocfcbpumZCfA0XBh0K0ND9Ev/qNAy4NoGa3rLBDrn+H40kRO9ZvphDvS
 jh/EA7AP6VqqDfg48kLiwPLat+9J5ekvkSYtVZ4AQqFiRtNDc4HvjyPPazP3VlG5nD0QC
 Wuwk3BYUJKLSOovDkQtIbvuzCOKV1QXUsQiIBZ/mHq1gUn7Udezmi749BqPugNEh6c5a3
 1bab3y94fEMcDa76VJIneh05zAuGw7hYuZPK6Rb3SIYMHJqTWQcW51lXqe/3EG/zbx5S2
 qTgF8K51rXmpzvr/OVj148dg0ygV9HC0q7MZtQVJ9zQ+S8YCzl85Q3bn1WMMUNfS0hg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624441;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=dgELFeSAlmbxYrRCz+/J/haDC/OGqPsIAUAe3rq6tdo=;
 b=DQv/ls4/fqTiZiRrRV09HG3KDy61ONsw6cEMCQ8kLMRWRfg8a6tc4iHPuxt1N/8LGAlH
 MfzOS7/iTNrPdMu2dofnVRWr0Uvkb2TE8BjQTlx55DX6Ay7S7IlOwRqxRzWsfQ0x7iBnB
 NrAvQNb07rfG+ARfC1k5+KKSUBWrQC178k0QT37IzG8O53wzFMzAdge1IQkD7UVQxJIeg
 mVM7rIUmmB8OHRuEWejkKzrWSbpuL026bqGgQVo6AMnOt84Kbwxz7tBia+xh2Z5sj65zj
 o+rsh5FWcKTZQxorpZDG4bVGCg/WP3SW6hAt8bltVe+Ux/EMo46cldjuu6SdW5oLxeQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BAA2F81173
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A3C958F1BD; Sat, 10 Oct 2026 09:26:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:01:55 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 2a90512d09369ac8cd044f51f4019dcd8cfc21ba
X-Git-Newrev: d26ff664dbf313c16c1b0426300e69bb6df9d030
X-Patchwork-Hint: ignore
Message-Id: <20261010092603.A3C958F1BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/erlang: fix build
 with BR2_TIME_BITS_64
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8945006094522861777=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8945006094522861777==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d26ff664dbf313c16c1b0426300e69bb6df9d030
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

erts/emulator/sys/unix/sys_time.c undefines _FILE_OFFSET_BITS before
including system headers. With BR2_TIME_BITS_64=y, Buildroot passes
-D_TIME_BITS=64, which glibc only accepts together with
_FILE_OFFSET_BITS=64, so the build fails with:

  error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"

Backport the upstream commit that removes this ancient workaround.

Fixes:
https://autobuild.buildroot.org/results/72443d8e794451cbc4063e906d6b2405021cb52f

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b2005938aed8798b2ce2df7733dcb75394b2d6b7)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/erlang/0002-otp-Fix-build-on-Yocto.patch | 80 ++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/package/erlang/0002-otp-Fix-build-on-Yocto.patch b/package/erlang/0002-otp-Fix-build-on-Yocto.patch
new file mode 100644
index 0000000000..9f4de3508e
--- /dev/null
+++ b/package/erlang/0002-otp-Fix-build-on-Yocto.patch
@@ -0,0 +1,80 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?John=20H=C3=B6gberg?= <john@erlang.org>
+Date: Wed, 13 Dec 2023 16:34:04 +0100
+Subject: [PATCH] otp: Fix build on Yocto
+
+A workaround to avoid breaking "micro level process accounting on
+/proc/self" broke the build on Yocto. As this is a really ancient
+workaround (pre-2009) and the comment is unclear about what
+actually breaks, we'll try removing it to see if this is still a
+problem.
+
+Upstream: https://github.com/erlang/otp/commit/c38fc7c62e818273870340f3faf83cc3905e1cf1
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ erts/configure                    |  9 ---------
+ erts/emulator/sys/unix/sys_time.c | 10 ----------
+ make/autoconf/otp.m4              |  9 ---------
+ 3 files changed, 28 deletions(-)
+
+diff --git a/erts/configure b/erts/configure
+index 1d573b4..0b046dd 100755
+--- a/erts/configure
++++ b/erts/configure
+@@ -24417,15 +24417,6 @@ else $as_nop
+ /* end confdefs.h.  */
+ 
+ /* gethrvtime procfs ioctl test */
+-/* These need to be undef:ed to not break activation of
+- * micro level process accounting on /proc/self
+- */
+-#ifdef _LARGEFILE_SOURCE
+-#  undef _LARGEFILE_SOURCE
+-#endif
+-#ifdef _FILE_OFFSET_BITS
+-#  undef _FILE_OFFSET_BITS
+-#endif
+ #include <stdlib.h>
+ #include <unistd.h>
+ #include <string.h>
+diff --git a/erts/emulator/sys/unix/sys_time.c b/erts/emulator/sys/unix/sys_time.c
+index eb2c47b..f60e345 100644
+--- a/erts/emulator/sys/unix/sys_time.c
++++ b/erts/emulator/sys/unix/sys_time.c
+@@ -22,16 +22,6 @@
+ #  include "config.h"
+ #endif
+ 
+-/* These need to be undef:ed to not break activation of
+- * micro level process accounting on /proc/self 
+- */
+-#ifdef _LARGEFILE_SOURCE
+-#  undef _LARGEFILE_SOURCE
+-#endif
+-#ifdef _FILE_OFFSET_BITS
+-#  undef _FILE_OFFSET_BITS
+-#endif
+-
+ #include <stdlib.h>
+ #include "sys.h"
+ #include "global.h"
+diff --git a/make/autoconf/otp.m4 b/make/autoconf/otp.m4
+index f543101..984ee1a 100644
+--- a/make/autoconf/otp.m4
++++ b/make/autoconf/otp.m4
+@@ -2705,15 +2705,6 @@ dnl
+ AC_MSG_CHECKING([if gethrvtime works and how to use it])
+ AC_RUN_IFELSE([AC_LANG_SOURCE([[
+ /* gethrvtime procfs ioctl test */
+-/* These need to be undef:ed to not break activation of
+- * micro level process accounting on /proc/self 
+- */
+-#ifdef _LARGEFILE_SOURCE
+-#  undef _LARGEFILE_SOURCE
+-#endif
+-#ifdef _FILE_OFFSET_BITS
+-#  undef _FILE_OFFSET_BITS
+-#endif
+ #include <stdlib.h>
+ #include <unistd.h>
+ #include <string.h>

--===============8945006094522861777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8945006094522861777==--
