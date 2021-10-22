Return-Path: <SRS0=MwHx=PK=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8915C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 06:14:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50241610CB
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 06:14:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 50241610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 203F7832B3;
	Fri, 22 Oct 2021 06:14:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u_K8YDNSq3X7; Fri, 22 Oct 2021 06:14:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BA2181CA0;
	Fri, 22 Oct 2021 06:14:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A2E561BF681
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 06:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CB0E4085D
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 06:14:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rgGG4HTapUtH for <buildroot@lists.busybox.net>;
 Fri, 22 Oct 2021 06:14:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 392EE4083C
 for <buildroot@buildroot.org>; Fri, 22 Oct 2021 06:14:43 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id m42so1785841wms.2
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 23:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RpC6QtHSzFMX5+qbuh7TlnVvfCY/pl1W6mqV10Z+C3c=;
 b=cqMfiSxjbkV+8UmcMOpnV/3OaWFX5b/LGH4JsaeomyM3Vb8lU660u5mGDvtOydhf2r
 f6InitX4+IjvSpR3rGuuwiSrD88xtQK7MgoxnlkwoVWpWpLcm1FMseAsKLMJ1vrJNd0W
 E/u6mgPzybN/P4y2ln2NoXch45bbiBamMZ2EBcWM/phpcd0dBs6UIu6ESkkCy9WCXRXZ
 pDQNNbGKg2bpuPDh5hqchdEEvjlVIRhB5h4LBvk+f3RW0wTjn5X/vUALTHKKxDaHGMEr
 T/qzmL/XBDV3/g1QLrhm7qCTQi2RdgluCWDyHE5YtRyBHtNHMCtjfXKQeMF8WnoTwHhS
 thIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RpC6QtHSzFMX5+qbuh7TlnVvfCY/pl1W6mqV10Z+C3c=;
 b=EapEaxs3Un7k0HNBTVq+GojFBIDY7yJHjPeRcji0JNOlr283Ri81po7Tb2wGL54crE
 5TM2ktJlWCIn14q4CPIFN2MDNFp3Ho1OYDYCqfQFR7njdOgVqhBdhvZxQEMuYEqjr7jy
 y1FK07J4VyATsIMe0cHeOgk2OxJ2/HLF2rbRzOyJz4iFzCaQiO353r8nMlqSpVmpX50h
 2EqNk4Vmnr3giG5V7Gk34DXToPZxIwT9ArbGh09bFpxk0ZKnkJGTGto/fWxDwFUqc6s8
 074cSX4wEfAWs/Fol5d2WS+lIElOpY6gJZuvUG3NTTrkMSRfg738wqLmNb3SX7IK5v6/
 Hl9Q==
X-Gm-Message-State: AOAM533GsIwNSmF2s0M8EiBd3kp675wml5QCv09cKfU5zoN12F6NlYpt
 PpEx7/QzNvLDnbpIgqavef4JfFXIXDE=
X-Google-Smtp-Source: ABdhPJwZbYcEWhFrwzbr7MfuA23nhG9emE06pSos/dI0cn2cAZ4nG+GWoYJ7aLETtVZ3vqduf6cd0A==
X-Received: by 2002:a7b:c744:: with SMTP id w4mr26709493wmk.51.1634883281094; 
 Thu, 21 Oct 2021 23:14:41 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id w26sm6895471wmk.34.2021.10.21.23.14.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 23:14:40 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 22 Oct 2021 08:13:13 +0200
Message-Id: <20211022061313.474808-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gstd: fix static build
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

Fix the following static build failure raised since the addition of the
package in commit 02ea01ea22e94ef353a638bf16f62f6e3ed1208e:

/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: /home/buildroot/autobuild/instance-1/output-1/host/i586-buildroot-linux-musl/sysroot/usr/lib/libreadline.a(display.o): in function `_rl_move_cursor_relative':
display.c:(.text+0xbb5): undefined reference to `tputs'

Fixes:
 - http://autobuild.buildroot.org/results/77c/77c10947ddc749c54c7c233e3143f5cdf1edc73d/build-end.log

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...use-dependency-function-for-readline.patch | 51 +++++++++++++++++++
 ...-use-library-instead-of-both_librari.patch | 33 ++++++++++++
 2 files changed, 84 insertions(+)
 create mode 100644 package/gstreamer1/gstd/0006-meson.build-use-dependency-function-for-readline.patch
 create mode 100644 package/gstreamer1/gstd/0007-gstd-meson.build-use-library-instead-of-both_librari.patch

diff --git a/package/gstreamer1/gstd/0006-meson.build-use-dependency-function-for-readline.patch b/package/gstreamer1/gstd/0006-meson.build-use-dependency-function-for-readline.patch
new file mode 100644
index 0000000000..60ffc6a90a
--- /dev/null
+++ b/package/gstreamer1/gstd/0006-meson.build-use-dependency-function-for-readline.patch
@@ -0,0 +1,51 @@
+From 80ab24d439594bad4365b0395759a57ab0760c6f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 22 Oct 2021 07:33:04 +0200
+Subject: [PATCH] meson.build: use dependency function for readline
+
+Use meson dependency function to find readline instead of
+cc.find_library. This function will retrieve readline pkg-config file
+which is available since version 7 (released 5 years ago) and
+https://git.savannah.gnu.org/cgit/readline.git/commit/readline.pc.in?id=d49a9082c0e15bba8cd3d8cc0a994409cf823cac.
+readline.pc sets tinfo in Requires.Private which will avoid the
+following static build failure:
+
+/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: /home/buildroot/autobuild/instance-1/output-1/host/i586-buildroot-linux-musl/sysroot/usr/lib/libreadline.a(display.o): in function `_rl_move_cursor_relative':
+display.c:(.text+0xbb5): undefined reference to `tputs'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/77c10947ddc749c54c7c233e3143f5cdf1edc73d
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/RidgeRun/gstd-1.x/pull/261]
+---
+ meson.build | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index a0af2e2..8edd7aa 100644
+--- a/meson.build
++++ b/meson.build
+@@ -30,8 +30,8 @@ systemd_required = get_option('enable-systemd').enabled()
+ systemd_dep = dependency('systemd', required : systemd_required, version : '>=232')
+ 
+ cc = meson.get_compiler('c')
+-readline = cc.find_library('readline', required: true)
+-if readline.found()
++readline_dep = dependency('readline')
++if readline_dep.found()
+   add_project_arguments('-DHAVE_LIBREADLINE', language: 'c')
+   add_project_arguments('-DHAVE_READLINE_HISTORY', language: 'c')
+   # Add arguments to the compiler command line. 
+@@ -46,8 +46,6 @@ if readline.found()
+   else
+     add_project_arguments('-DHAVE_HISTORY_H', language: 'c')
+   endif
+-  
+-  readline_dep = readline
+ endif
+ 
+ ## Dependencies
+-- 
+2.33.0
+
diff --git a/package/gstreamer1/gstd/0007-gstd-meson.build-use-library-instead-of-both_librari.patch b/package/gstreamer1/gstd/0007-gstd-meson.build-use-library-instead-of-both_librari.patch
new file mode 100644
index 0000000000..258c53fd46
--- /dev/null
+++ b/package/gstreamer1/gstd/0007-gstd-meson.build-use-library-instead-of-both_librari.patch
@@ -0,0 +1,33 @@
+From b30122ef45516b4fc5ce75a36117ef05aa84d944 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 22 Oct 2021 08:00:44 +0200
+Subject: [PATCH] gstd/meson.build: use library instead of both_libraries
+
+Use meson library function instead of both_libraries to avoid the
+following static build failure which is raised because there is no way
+to specify that a static library must be used in declare_dependency:
+
+/home/fabrice/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: attempted static link of dynamic object `gstd/libgstd-core.so.0.13.0'
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ gstd/meson.build | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/gstd/meson.build b/gstd/meson.build
+index b81a686..5c59add 100644
+--- a/gstd/meson.build
++++ b/gstd/meson.build
+@@ -116,8 +116,7 @@ libgstd_header_files = [
+   'gstd_unix.h'
+ ]
+ 
+-# Create a static library used to create gstd daemon and also is used for tests
+-gstd_lib = both_libraries('gstd-core',
++gstd_lib = library('gstd-core',
+   libgstd_src_files,
+   c_args : gst_c_args,
+   version : gstd_version,
+-- 
+2.33.0
+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
