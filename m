Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2377C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 19:48:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EFFA60FE3
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 19:48:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9EFFA60FE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F8944012A;
	Sun, 12 Sep 2021 19:48:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FN2xFzZMVTeF; Sun, 12 Sep 2021 19:48:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 774AD40155;
	Sun, 12 Sep 2021 19:48:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AFD531BF409
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 19:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CB6781A92
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 19:48:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U_tsnv56Txy5 for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 19:48:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6591A81A30
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 19:48:20 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id t8so6232936wrq.4
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 12:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0EUJixdo5GgJrsJ5E1og8j6sFh2avtnZ+5ubKGtk+ZY=;
 b=Rtje5MFywdkmz8wLcaiepYp5l4+46vgBPc1Tgzkcg1JLwGHVFEkDJ8Z9pSsNHYR8Xo
 dibBJgWeWumA128Th/bavtoUIryCLVjuAf5+b+s+Xbobi8ISlgQeL6HkM2AgM7upVr5v
 7MOE5P4Bdoi9dIbc+bv1Tmz+kIDeR/Jty8palMW6ZOaT1wOAac8C5suurQt65osFGYE5
 2+1tupUA+YuXV2y/N1gMHiqLnH0IrgZG+1DVIHbbNpqhOgxzmlGjsLU202yHhmqVeSyj
 SndsiEwkWGBIY4JG7xgD0x0rdZ7YdD/E5QVSt+JKSm5kC4WVDyVuF9baAQiDrestdpLM
 YXuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0EUJixdo5GgJrsJ5E1og8j6sFh2avtnZ+5ubKGtk+ZY=;
 b=3K6WZkehzq2W9Y2m0W/rAZjHVNWHy0rPmNAGASbYfq1nMgE02q4lm8gtS/+yZj4KcH
 7IO6iEQ7VBN3adu+OYEeQ0gpY77VO35zl1Z080XLFVdiwCJk+p1OEpfNYm6cTBAyVkAb
 hAgM01Y4maHmV0avra11MhMKgOoZTdAgeCHCoxnJwkCwLtr55WMkkgl12hF+Og88vHxd
 QA+mxAWdfUICFmRSvaXaZjQCQ3G+U985wJPvtVry5QH6AZIwHYe1zzzdDB4JSHeoKpvk
 FzF5rteVIVrBX1+fJhfZi2hVh0nwbrLg1U2Nxkh47CnQNgkHu5/Kq6rEPrfptP20vkmp
 3tsg==
X-Gm-Message-State: AOAM531NDP0fkE3XTKSVrOrSCGcFPlf/h/ebXZIH51ZvFsUDhm7uFMKV
 xpXk40X6lO3U8KSoMgIrzyhVBCDmuas=
X-Google-Smtp-Source: ABdhPJzNVSNN5w8eplZiiAyA54tD0tayKb6AiL7AV2/Ts8IH8+Ldt9WVquV09/RGIJudTc3X2586HQ==
X-Received: by 2002:adf:b745:: with SMTP id n5mr8936478wre.338.1631476098388; 
 Sun, 12 Sep 2021 12:48:18 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id m18sm5264784wrn.85.2021.09.12.12.48.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 12:48:17 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 21:48:15 +0200
Message-Id: <20210912194815.2694153-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/botan: bump to version 2.18.1
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Drop patches (already in version)

https://github.com/randombit/botan/blob/2.18.1/news.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...roup-l-flags-from-LDFLAGS-to-the-end.patch | 75 -------------------
 package/botan/0002-Avoid-empty-l.patch        | 25 -------
 .../botan/0003-Add-support-for-riscv32.patch  | 31 --------
 package/botan/botan.hash                      |  2 +-
 package/botan/botan.mk                        |  2 +-
 5 files changed, 2 insertions(+), 133 deletions(-)
 delete mode 100644 package/botan/0001-Add--extra-libs-option-and-group-l-flags-from-LDFLAGS-to-the-end.patch
 delete mode 100644 package/botan/0002-Avoid-empty-l.patch
 delete mode 100644 package/botan/0003-Add-support-for-riscv32.patch

diff --git a/package/botan/0001-Add--extra-libs-option-and-group-l-flags-from-LDFLAGS-to-the-end.patch b/package/botan/0001-Add--extra-libs-option-and-group-l-flags-from-LDFLAGS-to-the-end.patch
deleted file mode 100644
index 8aa5c68652..0000000000
--- a/package/botan/0001-Add--extra-libs-option-and-group-l-flags-from-LDFLAGS-to-the-end.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From af63fe89228172e5a395f7e6491fae3bfa9da4b1 Mon Sep 17 00:00:00 2001
-From: Jack Lloyd <jack@randombit.net>
-Date: Mon, 15 Feb 2021 15:01:38 -0500
-Subject: [PATCH] Add --extra-libs option and group -l flags from LDFLAGS to
- the end
-
-Ref #2622
-
-[Retrieved from:
-https://github.com/randombit/botan/commit/af63fe89228172e5a395f7e6491fae3bfa9da4b1]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.py               | 14 ++++++++++++++
- src/build-data/makefile.in |  2 +-
- 2 files changed, 15 insertions(+), 1 deletion(-)
-
-diff --git a/configure.py b/configure.py
-index 73fc0271e9..865a6c8e62 100755
---- a/configure.py
-+++ b/configure.py
-@@ -333,6 +333,9 @@ def process_command_line(args): # pylint: disable=too-many-locals,too-many-state
-     target_group.add_option('--ldflags', metavar='FLAGS',
-                             help='set linker flags', default=None)
- 
-+    target_group.add_option('--extra-libs', metavar='LIBS',
-+                            help='specify extra libraries to link against', default='')
-+
-     target_group.add_option('--ar-command', dest='ar_command', metavar='AR', default=None,
-                             help='set path to static archive creator')
- 
-@@ -2020,6 +2023,12 @@ def choose_cxx_exe():
-         else:
-             return '%s %s' % (options.compiler_cache, cxx)
- 
-+    def extra_libs(libs, cc):
-+        if libs is None:
-+            return ''
-+
-+        return ' '.join([(cc.add_lib_option % lib) for lib in libs.split(',')])
-+
-     variables = {
-         'version_major':  Version.major(),
-         'version_minor':  Version.minor(),
-@@ -2149,6 +2158,7 @@ def choose_cxx_exe():
-         'cc_sysroot': sysroot_option(),
-         'cc_compile_flags': options.cxxflags or cc.cc_compile_flags(options),
-         'ldflags': options.ldflags or '',
-+        'extra_libs': extra_libs(options.extra_libs, cc),
-         'cc_warning_flags': cc.cc_warning_flags(options),
-         'output_to_exe': cc.output_to_exe,
-         'cc_macro': cc.macro_name,
-@@ -3029,6 +3039,10 @@ def canonicalize_build_targets(options):
-     if options.build_fuzzers == 'libfuzzer' and options.fuzzer_lib is None:
-         options.fuzzer_lib = 'Fuzzer'
- 
-+    if options.ldflags is not None:
-+        libs = [m.group(1) for m in re.finditer(r'-l([a-z0-9]+)', options.ldflags)]
-+        options.extra_libs += ','.join(libs)
-+
- # Checks user options for consistency
- # This method DOES NOT change options on behalf of the user but explains
- # why the given configuration does not work.
-diff --git a/src/build-data/makefile.in b/src/build-data/makefile.in
-index 4692d00f71..82f6576650 100644
---- a/src/build-data/makefile.in
-+++ b/src/build-data/makefile.in
-@@ -20,7 +20,7 @@ LDFLAGS        = %{ldflags}
- EXE_LINK_CMD   = %{exe_link_cmd}
- 
- LIB_LINKS_TO   = %{external_link_cmd} %{link_to}
--EXE_LINKS_TO   = %{link_to_botan} $(LIB_LINKS_TO)
-+EXE_LINKS_TO   = %{link_to_botan} $(LIB_LINKS_TO) %{extra_libs}
- 
- BUILD_FLAGS    = $(ABI_FLAGS) $(LANG_FLAGS) $(CXXFLAGS) $(WARN_FLAGS)
- 
diff --git a/package/botan/0002-Avoid-empty-l.patch b/package/botan/0002-Avoid-empty-l.patch
deleted file mode 100644
index 9102360244..0000000000
--- a/package/botan/0002-Avoid-empty-l.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 4b2225ea54988e09b649768848b3c14b43e064de Mon Sep 17 00:00:00 2001
-From: Jack Lloyd <jack@randombit.net>
-Date: Mon, 15 Feb 2021 15:11:12 -0500
-Subject: [PATCH] Avoid empty -l
-
-[Retrieved from:
-https://github.com/randombit/botan/commit/4b2225ea54988e09b649768848b3c14b43e064de]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.py b/configure.py
-index 865a6c8e62..a79f672eca 100755
---- a/configure.py
-+++ b/configure.py
-@@ -2027,7 +2027,7 @@ def extra_libs(libs, cc):
-         if libs is None:
-             return ''
- 
--        return ' '.join([(cc.add_lib_option % lib) for lib in libs.split(',')])
-+        return ' '.join([(cc.add_lib_option % lib) for lib in libs.split(',') if lib != ''])
- 
-     variables = {
-         'version_major':  Version.major(),
diff --git a/package/botan/0003-Add-support-for-riscv32.patch b/package/botan/0003-Add-support-for-riscv32.patch
deleted file mode 100644
index d8978b2f11..0000000000
--- a/package/botan/0003-Add-support-for-riscv32.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 443bf46ee2b1b1d7acd63e3f00dcbe66646138f8 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 2 Apr 2021 20:37:03 +0200
-Subject: [PATCH] Add support for riscv32
-
-Fix the following build failure:
-
-  ERROR: Unknown or unidentifiable processor "riscv32"
-
-Fixes:
- - http://autobuild.buildroot.org/results/1c399312dbec5d7a28ec90d62fdd8f47fa14ff4b
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/randombit/botan/commit/aa7958880bee2091a8a71bf9e1f6e6efb34581e3]
----
- src/build-data/arch/riscv32.txt | 2 ++
- 1 file changed, 2 insertions(+)
- create mode 100644 src/build-data/arch/riscv32.txt
-
-diff --git a/src/build-data/arch/riscv32.txt b/src/build-data/arch/riscv32.txt
-new file mode 100644
-index 000000000..ba88b42e9
---- /dev/null
-+++ b/src/build-data/arch/riscv32.txt
-@@ -0,0 +1,2 @@
-+family riscv32
-+endian little
--- 
-2.30.2
-
diff --git a/package/botan/botan.hash b/package/botan/botan.hash
index d1b1d14acb..b7804ce9d7 100644
--- a/package/botan/botan.hash
+++ b/package/botan/botan.hash
@@ -1,4 +1,4 @@
 # From https://botan.randombit.net/releases/sha256sums.txt
-sha256  79123b654445a4abba486e09a431788545c708237382a3e765664c9f55b03b88  Botan-2.17.3.tar.xz
+sha256  f8c7b46222a857168a754a5cc329bb780504122b270018dda5304c98db28ae29  Botan-2.18.1.tar.xz
 # Locally computed
 sha256  fb7f0322d36fba55ca17d77bc203a9f09a40daa8a249b75cf8887aba36cec9d0  license.txt
diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 2e3f99b49b..c23aba99dd 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOTAN_VERSION = 2.17.3
+BOTAN_VERSION = 2.18.1
 BOTAN_SOURCE = Botan-$(BOTAN_VERSION).tar.xz
 BOTAN_SITE = http://botan.randombit.net/releases
 BOTAN_LICENSE = BSD-2-Clause
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
