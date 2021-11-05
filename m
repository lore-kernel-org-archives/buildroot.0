Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E09BC433EF
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 20:14:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBE8661076
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 20:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DBE8661076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94168401E1;
	Fri,  5 Nov 2021 20:14:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4zwzrQovCzaz; Fri,  5 Nov 2021 20:14:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E72440151;
	Fri,  5 Nov 2021 20:14:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BA0371BF57C
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 20:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A894340151
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 20:14:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xWolennlsbqz for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 20:14:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 55464400BE
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 20:14:45 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id w29so3923253wra.12
 for <buildroot@buildroot.org>; Fri, 05 Nov 2021 13:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gUoeH6ETNzvmkGOiNtYEn2ytp3ecCvkjRk2TA3Rk7HI=;
 b=Yt3QnCxQ0dfmmWtV4EZZHGjT4G6euux3t0ZLx4h6TEMWSgArlJpWgEWg8NefanH1K/
 OiaR4Bi4B9PsKoBVnQQz9z1N1aMCA0JLp9awxIrEAsbg2TtzOVYqzSc5oxSYYJ5mL73p
 aoDClr04luW58c7FTi7bzyKgkP/GhOyC5opm30zOM0psWO1jJ/WLnxSOL4WYP9OZtxCf
 Lvc2MSzgp/ZiR8Vta8uh12wKUDeftJnHfZm0/NIFNxSWdsSOJE7XBLmwWA69tZnUgAd+
 q0pVrqh3Zhm+wbYrC2wm+/+OX/Jwk6MA1s+t4QO3MRt9rJ4fNXUFzyQC8zKmWzt+/brt
 Rgng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gUoeH6ETNzvmkGOiNtYEn2ytp3ecCvkjRk2TA3Rk7HI=;
 b=Ifzxg1fvKOfQ7z4P5Gr9syoafboSx1weoYCkb+c5cdb2+FNoRfrzzIo9LtoL4YyHUG
 6JSq8TMlPENHXIWVckIlH2nltCtrYwSlTPbzvPz/a24rfEoAdc6v3uCGsvR2AdttU6Nq
 UHOZ8lW03kowMzAkGxBxBsOxTlwOFpMb2Qh9cImQHEjPSHS+0s6VnxfY8J/5WfD1B2hS
 GDA6Pxh0INSIHjCsCKG1x3+TGM6wajasgbg3gafrR0gBsBQC943/RFCPlTyTHo8wYRBV
 bA12pjD6X14waH17eAW0rApHYXWHHbfqzkGPEvt8S+AqvUzHpq1yFl40MAtJ2PZY9a7W
 KqEg==
X-Gm-Message-State: AOAM531znBEGkYI7OlqKNi0J+oYVSL3W4AjlRQ/mSUpzSK7QewEbozSl
 OIAYMeUPCTPqqHD1bi0WKzGkOAosJM0=
X-Google-Smtp-Source: ABdhPJypE51pSTbrYhMJJT3nPoXmRoJ8yWL1ttkvL7GiJy3k8sl2xoqoXYbsKu5dsEKBqw4CYUgBQw==
X-Received: by 2002:adf:f60c:: with SMTP id t12mr67817948wrp.341.1636143283907; 
 Fri, 05 Nov 2021 13:14:43 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id 4sm12347384wrz.90.2021.11.05.13.14.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 13:14:43 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  5 Nov 2021 21:12:57 +0100
Message-Id: <20211105201257.2589008-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/bird: fix build with autoconf >=
 2.70
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
Cc: =?UTF-8?q?Adrien=20Gallou=C3=ABt?= <adrien@gallouet.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of autoconf to version
2.71 in commit ecd54b65c1f998a7ccd91f7c523e4ff38c4781da:

checking for glob.h... no
configure: error: glob.h not found.

Fixes:
 - http://autobuild.buildroot.org/results/d7aab7df196e0f6d6389b87ff29da7c2971e6b6d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...gure.ac-fix-build-with-autoconf-2.70.patch | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/bird/0001-configure.ac-fix-build-with-autoconf-2.70.patch

diff --git a/package/bird/0001-configure.ac-fix-build-with-autoconf-2.70.patch b/package/bird/0001-configure.ac-fix-build-with-autoconf-2.70.patch
new file mode 100644
index 0000000000..b412a55ead
--- /dev/null
+++ b/package/bird/0001-configure.ac-fix-build-with-autoconf-2.70.patch
@@ -0,0 +1,43 @@
+From aa5bc6d2e59c5257d777a45ee4a0e0a784c44244 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 5 Nov 2021 20:58:41 +0100
+Subject: [PATCH] configure.ac: fix build with autoconf >= 2.70
+
+On some embedded toolchains, glob.h detection fails because -g is
+wrongly added (even when CFLAGS is overwritten):
+
+configure:5881: checking for glob.h
+configure:5904: /home/giuliobenetti/autobuild/run/instance-2/output-1/host/bin/mips64el-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -pthread -fno-strict-aliasing -fno-strict-overflow -flto -Wall -Wextra -Wstrict-prototypes -Wno-parentheses -Wno-pointer-sign -Wno-missing-field-initializers -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pthread -flto=4 -g conftest.c  >&5
+/home/giuliobenetti/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mips64el-buildroot-linux-uclibc/8.4.0/../../../../mips64el-buildroot-linux-uclibc/bin/ld: /tmp/ccldlED9.ltrans0.ltrans.o:(.debug_info+0x2a): undefined reference to `conftest.c.fb729d13'
+/home/giuliobenetti/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mips64el-buildroot-linux-uclibc/8.4.0/../../../../mips64el-buildroot-linux-uclibc/bin/ld: /tmp/ccldlED9.ltrans0.ltrans.o:(.debug_info+0x2f): undefined reference to `conftest.c.fb729d13'
+
+This build failure is raised since autoconf 2.70 and
+https://git.savannah.gnu.org/cgit/autoconf.git/commit/?id=76754e04fce5f6a7701bec57b057020585df2ae3
+because ac_test_CFLAGS is now set to ${CFLAGS+y} instead of
+${CFLAGS+set}
+
+Fixes:
+ - http://autobuild.buildroot.org/results/d7aab7df196e0f6d6389b87ff29da7c2971e6b6d
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: sent to bird-users@network.cz]
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 64181d29..b4b3fcfb 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -114,7 +114,7 @@ AC_SEARCH_LIBS([clock_gettime], [rt posix4],
+ AC_CANONICAL_HOST
+ 
+ # Store this value because ac_test_CFLAGS is overwritten by AC_PROG_CC
+-if test "$ac_test_CFLAGS" != set ; then
++if ! test $ac_test_CFLAGS ; then
+   bird_cflags_default=yes
+ fi
+ 
+-- 
+2.33.0
+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
