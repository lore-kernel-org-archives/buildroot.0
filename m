Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D61BC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 06:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FBBA400FC;
	Wed, 27 Jul 2022 06:40:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FBBA400FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YQSwYMu_msZU; Wed, 27 Jul 2022 06:40:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A1C8400FE;
	Wed, 27 Jul 2022 06:40:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A1C8400FE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3C5421BF3A8
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 06:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 16DA860AC0
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 06:40:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16DA860AC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NRv-a-bmldwF for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 06:40:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 325C760A8B
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 325C760A8B
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 06:40:13 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id k11so22388642wrx.5
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 23:40:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ohR7EyjYba8Cp/2fcxBiPSW+JNb+JAo5k3UjRcJXncs=;
 b=quY/BeMhHTYwilbY1q/BX5DABp2APglg90s1G5+T1rrPey0N9Nytb8HyHmUcbPVsXw
 jl0L/RiPzDxe+eHwhu/54V8Q1WwXJPUUl+xbQtacefFjOky+y/5D4C0TKOzRloMaqY7Q
 cjxLdAyWel6qWs4hOwEcF41LjfgyxVk4nLrXfyizppwshGZSsru7H2G7IiSOoMUFdBHR
 WZOY6qCwWc+DIylxnnJ2D7grRBXiFy8gltbpySu9vonHFlvIe4EI/pp82uLL5+vj68EA
 fUQEN2ByXrVeUWSxZ2CYaknYmH1+AS6S22o9iOzJirBxyXy3jw0vfaO6cU4d6LPyfWEg
 Y+FQ==
X-Gm-Message-State: AJIora8ZujVoAvtwrVSy5ETLK488SZpE6q1VujzNkZnT385+KDQ2/bN5
 /IcsaA0ws0Gncblv3mCXC/p5V2qz5dw=
X-Google-Smtp-Source: AGRyM1tHx7Z8VtTAcdsGzn7Dnpk51u9hNehkxcH3SXY+XAbLMsWP/uiAoNyfEN1lu1hvnBKXgx5moQ==
X-Received: by 2002:a5d:60cc:0:b0:21e:5844:578a with SMTP id
 x12-20020a5d60cc000000b0021e5844578amr12697940wrt.505.1658904010994; 
 Tue, 26 Jul 2022 23:40:10 -0700 (PDT)
Received: from kali.home (2a01cb0680494f3e376d079efd3cafb3.ipv6.abo.wanadoo.fr.
 [2a01:cb06:8049:4f3e:376d:79e:fd3c:afb3])
 by smtp.gmail.com with ESMTPSA id
 n1-20020a05600c4f8100b003a327b98c0asm1258819wmq.22.2022.07.26.23.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 23:40:10 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 08:40:06 +0200
Message-Id: <20220727064006.218610-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ohR7EyjYba8Cp/2fcxBiPSW+JNb+JAo5k3UjRcJXncs=;
 b=NcxsTkQ6/muhcNOamg+H5SroVHrIL0V9r8n3ZngWn4hxl8gttVx+0NWqihYNZFNz7D
 mQanShi/DoqAcfWZ4XgvGAk5wFKv+xO4Jemeb3uexw6FLwSBX1m+8xQcdziXe5r+Ee1L
 tgigPji/tXxehhZ1ZzTaW4mbD3i/c7xmXkeiLbAOzLMcKH9AREEub+QSiYL3JjOg5KDB
 97+eb//YMD33MsfGwmH/0SKhvqVILJ7mCUS+Y/8UCL3+RvaaUuespZ3h17E2M7sQmtAq
 RIpu3J1BaBn0KsEXFE96ZSe8+2MW+PeH4EMi1bwsWWjTZgFYkl5BwX11M7Ptef+pOOtc
 6wng==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NcxsTkQ6
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
 - http://autobuild.buildroot.org/results/77c10947ddc749c54c7c233e3143f5cdf1edc73d

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
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
