Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC72C5DF81
	for <buildroot@archiver.kernel.org>; Wed, 19 Aug 2026 20:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 000CA807FA;
	Wed, 19 Aug 2026 20:50:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JQfENfm6ao8N; Wed, 19 Aug 2026 20:50:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787172648;
	bh=PrWeeAr1lNcTvp5JheWJ0TVUy6jsci8HV065lATgUnY=;
	h=Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=SRu3XQTfS5B//rtTnQzCbWL6k+kWAJ/IQ1pAEt6cg4HPHGGghrz3vcoc+su8+LHHL
	 wFNsalIxp7qHdibWS7el0jnXoPD/5IKXUzdPrAb/3ahU/VrvX7bQXsQLsSIvxPEI84
	 +SoPwotWNtfsmRibnwrUeMfP2r6cIZy+CGZRWXBDC5eHxALJCOpCqt2PhaURBePkfp
	 utkEcjexvGdaVXm10bT6rlkYDdc0ooB0GeJD+RbvvvH4mr6HMPlnrzJzrBHVaNshIZ
	 LXkRkDWwSFGCSgF3e4RIDnfihymfFDFzwLc35mPMi30yk9QW3RTt8GwOzkUIe61Og2
	 QT5jgKzdFIYEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2525E80849;
	Wed, 19 Aug 2026 20:50:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FB6C29D
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 20:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18C3A40079
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 20:50:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TIKXsYhVV7lJ for <buildroot@buildroot.org>;
 Wed, 19 Aug 2026 20:50:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 56DD540055
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 20:50:43 +0000 (UTC)
Received: from [IPV6:2a01:e0a:1164:dba0:3770:5627:8c1d:d139] (unknown
 [IPv6:2a01:e0a:1164:dba0:3770:5627:8c1d:d139])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519) (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id A4BB61817B2;
 Wed, 19 Aug 2026 22:50:40 +0200 (CEST)
Message-ID: <a0108d7a-0e31-4177-982a-c07a38570384@grenoble.cnrs.fr>
Date: Wed, 19 Aug 2026 22:50:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, fr
To: Buildroot development <buildroot@buildroot.org>
Subject: [Buildroot] [PATCH 1/1] package/libgpiod2: fix build failure on
 missing C++ compiler
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
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Cc: Boerge Struempfel <boerge.struempfel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The meson build configuration of libgpiod2 unconditionally requires a
C++ compiler, although it is only useful if building the C++ bindings.
This is causing autobuild failures with an obscure error message:
"ERROR: Unable to get gcc pre-processor defines".

Fix the failures by only requiring a C++ compiler when we want the C++
bindings.

Fixes:
 - https://autobuild.buildroot.org/results/d1c19ffa0c599bd2ba9be965a98fc8f778d6e366
 - https://autobuild.buildroot.org/results/c6b3c9311d628bdb4ea103431767493fab9a3668
 - https://autobuild.buildroot.org/results/8e799050c5779c680ff5e5136571f57d29239f2f
 - https://autobuild.buildroot.org/results/d6d8833acfe00559579defbbf3ca34c0edbe7869
Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
---
 ...uire-a-C-compiler-if-it-is-not-neede.patch | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/libgpiod2/0001-build-do-not-require-a-C-compiler-if-it-is-not-neede.patch

diff --git a/package/libgpiod2/0001-build-do-not-require-a-C-compiler-if-it-is-not-neede.patch b/package/libgpiod2/0001-build-do-not-require-a-C-compiler-if-it-is-not-neede.patch
new file mode 100644
index 0000000000..ccc4430a8c
--- /dev/null
+++ b/package/libgpiod2/0001-build-do-not-require-a-C-compiler-if-it-is-not-neede.patch
@@ -0,0 +1,46 @@
+From fce6b611e2530602c44fd914222529028173c509 Mon Sep 17 00:00:00 2001
+From: Edgar Bonet <bonet@grenoble.cnrs.fr>
+Date: Wed, 19 Aug 2026 18:15:25 +0200
+Subject: [PATCH] build: do not require a C++ compiler if it is not needed
+
+Languages specified in the meson project() function are considered hard
+dependencies. When trying to build libgpiod in an environment lacking a
+C++ compiler, the build fails with an obscure error message ("ERROR:
+Unable to get gcc pre-processor defines").
+
+As the C++ compiler is only needed for building the C++ bindings, do not
+require it unless the option bindings-cxx is enabled.
+
+Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
+Upstream: https://lore.kernel.org/linux-gpio/0eb5c26d-731c-4ebb-be34-76466cf57720@grenoble.cnrs.fr/
+---
+ meson.build | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index c030b50..fed612f 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1,7 +1,7 @@
+ # SPDX-License-Identifier: GPL-2.0-or-later
+ # SPDX-FileCopyrightText: 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+ 
+-project('libgpiod', ['c', 'cpp'],
++project('libgpiod', 'c',
+   version: '2.3.1',
+   license: 'LGPL-2.1-or-later',
+   default_options: [
+@@ -56,6 +56,10 @@ opt_dbus                = get_option('dbus')
+ opt_introspection       = get_option('introspection')
+ opt_systemd             = get_option('systemd')
+ 
++if opt_bindings_cxx.allowed()
++  add_languages('cpp')
++endif
++
+ if get_option('profiling')
+   profiling_c_args    = ['-fprofile-arcs', '-ftest-coverage']
+   profiling_link_args = ['-lgcov']
+-- 
+2.43.0
+
-- 
2.43.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
