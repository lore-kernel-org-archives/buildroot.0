Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A361C43334
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 07:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1371C41B54;
	Tue, 26 Jul 2022 07:00:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1371C41B54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gPekgPR5SAKH; Tue, 26 Jul 2022 07:00:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8ED5441993;
	Tue, 26 Jul 2022 07:00:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8ED5441993
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E61371BF287
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 07:00:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF2BA60D95
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 07:00:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF2BA60D95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GjP9W98hOzRp for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 07:00:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4F9060C18
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A4F9060C18
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 07:00:12 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id u5so18832647wrm.4
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 00:00:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G+stvpYDx7eebabqyqTWRDQJ0Tv8lbZ134+IFsGKHLI=;
 b=eS5Ox00+VLHLTJIOhiW/3txYyTGEA5o2w7RuR2PvnxlnqAU4XDNNb3Eubngiu84pjb
 N9+EkcTjsmtG3nDRvZOkfqegMEgm+2+Wq44x3rkkAn6BT1TUuuxlBK+BzfIl5Wx2x+n2
 Dm4AL0OEFfY77KkbTJuzBTybQtP6eviDT+GFC1sQTSOHOptGhczK69HJ2O3nmV3hOAoN
 9YCO00cBQdSyL3wYzUd3Kmbx4pQAe0ZFhLoCvdeo0ZlqYXh8feFQ9pFxM0SwGBknrgI9
 O9W3URhgcixlLI+pE4GurMkEox3JaaUjChjRKqelhW8cqSosBhg9v/IZ6vvvBVKESjU9
 jmDg==
X-Gm-Message-State: AJIora/252GZDQsrdwXPv6bxxMFqjV0707TNmZ6WHyOPaDFk4f91PBmZ
 ecJTVGvNh9GbaIKlQdaLZ4dLb6Mpgbo=
X-Google-Smtp-Source: AGRyM1vj8e8+AJkAkBNapKtSNEgBlXGSgXisRAJhA4Fd61NBqwGFrjHM7FlNmdRy/t8V/db+Vfx2YA==
X-Received: by 2002:a05:6000:719:b0:21e:4530:c558 with SMTP id
 bs25-20020a056000071900b0021e4530c558mr9295422wrb.243.1658818810683; 
 Tue, 26 Jul 2022 00:00:10 -0700 (PDT)
Received: from kali.home (2a01cb09d053e3d59a58c457f47a946a.ipv6.abo.wanadoo.fr.
 [2a01:cb09:d053:e3d5:9a58:c457:f47a:946a])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a5d5512000000b0021eb309c97dsm82563wrv.25.2022.07.26.00.00.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 00:00:10 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 08:59:59 +0200
Message-Id: <20220726065959.1185364-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G+stvpYDx7eebabqyqTWRDQJ0Tv8lbZ134+IFsGKHLI=;
 b=ZG35zi1zAbtGQc3nU77DZPAIMys/TdJomniWQf2ND3QU/n4YQxzItLAsBgAYdzo9Mp
 fkOspQlFSBRyjp5O4zvz5Rd6KWiQ3NvBuyh9rAisP8tuAIg65/42/cUyuSwqgXeNuumA
 24xViw/TNszhKfuZInr+Qia3O69ewU1irLOj6363BNo5gsXfcDLtqaXSJiljMWxCFyPl
 F32BxOFALY1aDRKK04CCNfjiGN47VRj455k1O1DU+Hj9Fjbl4wauxQaS6L1PRBwLvPXt
 FSQ17b1h7ZPTfyyWrTvXI8jsgS9oNHfb10acHTl2BBmU/5KNiE2r0lKMt3cp328CJ4t7
 q6OQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZG35zi1z
Subject: [Buildroot] [PATCH 1/1] package/pulseaudio: fix build without C++
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure without C++ raised since bump to version
16.1 in commit 6f3131296484767f037d3535ab69f328e94351db:

../output-1/build/pulseaudio-16.1/meson.build:1:0: ERROR: Unknown compiler(s): [['/home/autobuild/autobuild/instance-1/output-1/per-package/pulseaudio/host/bin/powerpc64-buildroot-linux-gnu-g++']]
The following exception(s) were encountered:
Running "/home/autobuild/autobuild/instance-1/output-1/per-package/pulseaudio/host/bin/powerpc64-buildroot-linux-gnu-g++ --version" gave "[Errno 2] No such file or directory: '/home/autobuild/autobuild/instance-1/output-1/per-package/pulseaudio/host/bin/powerpc64-buildroot-linux-gnu-g++'"

Fixes:
 - http://autobuild.buildroot.org/results/6526a21bd4da3b8458188f27c1ec04c381e4b673

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...0004-meson.build-fix-build-without-C.patch | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/pulseaudio/0004-meson.build-fix-build-without-C.patch

diff --git a/package/pulseaudio/0004-meson.build-fix-build-without-C.patch b/package/pulseaudio/0004-meson.build-fix-build-without-C.patch
new file mode 100644
index 0000000000..e6453d641d
--- /dev/null
+++ b/package/pulseaudio/0004-meson.build-fix-build-without-C.patch
@@ -0,0 +1,42 @@
+From 9de058e15a4caba4939a864fb7caf67e0164f07e Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 25 Jul 2022 21:49:25 +0200
+Subject: [PATCH] meson.build: fix build without C++
+
+Fix the following build failure without C++:
+
+../output-1/build/pulseaudio-16.1/meson.build:1:0: ERROR: Unknown compiler(s): [['/home/autobuild/autobuild/instance-1/output-1/per-package/pulseaudio/host/bin/powerpc64-buildroot-linux-gnu-g++']]
+The following exception(s) were encountered:
+Running "/home/autobuild/autobuild/instance-1/output-1/per-package/pulseaudio/host/bin/powerpc64-buildroot-linux-gnu-g++ --version" gave "[Errno 2] No such file or directory: '/home/autobuild/autobuild/instance-1/output-1/per-package/pulseaudio/host/bin/powerpc64-buildroot-linux-gnu-g++'"
+
+Fixes:
+ - http://autobuild.buildroot.org/results/6526a21bd4da3b8458188f27c1ec04c381e4b673
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/merge_requests/737]
+---
+ meson.build | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index c5135330f..8248f263b 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1,4 +1,4 @@
+-project('pulseaudio', 'c', 'cpp',
++project('pulseaudio', 'c',
+         version : run_command(find_program('git-version-gen'), join_paths(meson.current_source_dir(), '.tarball-version')).stdout().strip(),
+         meson_version : '>= 0.50.0',
+         default_options : [ 'c_std=gnu11', 'cpp_std=c++11' ]
+@@ -433,6 +433,7 @@ endif
+ # Code coverage
+ 
+ if get_option('gcov')
++  add_languages('cpp')
+   add_project_arguments('--coverage', language: ['c', 'cpp'])
+   add_project_link_arguments('--coverage', language: ['c', 'cpp'])
+ endif
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
