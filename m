Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DF71C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:33:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4996D611AE
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:33:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4996D611AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C1264090F;
	Wed,  6 Oct 2021 19:33:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UbB3nNM4bcYr; Wed,  6 Oct 2021 19:33:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D06A4090D;
	Wed,  6 Oct 2021 19:33:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 58FBC1BF350
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A1A983E5B
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:30:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z9C7mReQc9Dn for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 19:30:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1B6683E59
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 19:30:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 68E5593466; Wed,  6 Oct 2021 19:28:14 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 6 Oct 2021 21:11:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c6e6872df467fd0d91a7c3b2f5381e9010a42e74
X-Git-Newrev: 19866efb589ab42eb8489de263b35fded03e558d
X-Patchwork-Hint: ignore
Message-Id: <20211006192814.68E5593466@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/usbredir: fix build without
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=19866efb589ab42eb8489de263b35fded03e558d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without stack-protector raised since
bump to version 0.11.0 in commit
c3a907a770b88529ea5a93c77cf001096799c556:

/home/giuliobenetti/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: usbredirparser/libusbredirparser.so.1.1.0.p/usbredirparser.c.o: in function `va_log':
usbredirparser.c:(.text+0x1c4): undefined reference to `__stack_chk_guard'

Fixes:
 - http://autobuild.buildroot.org/results/40de5443e98157ad50c6841ea70a835cd5ad4fe9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0002-meson-add-stack_protector-option.patch    | 60 ++++++++++++++++++++++
 package/usbredir/usbredir.mk                       |  1 +
 2 files changed, 61 insertions(+)

diff --git a/package/usbredir/0002-meson-add-stack_protector-option.patch b/package/usbredir/0002-meson-add-stack_protector-option.patch
new file mode 100644
index 0000000000..613e2714e3
--- /dev/null
+++ b/package/usbredir/0002-meson-add-stack_protector-option.patch
@@ -0,0 +1,60 @@
+From 54cf1897ef3aa4d0a35b5f4eb1f5c6928b033af5 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 24 Sep 2021 17:24:43 +0200
+Subject: [PATCH] meson: add stack_protector option
+
+Add stack_protector option to allow the user to disable it as some
+embedded toolchains don't support it which will result in the following
+build failure:
+
+/home/giuliobenetti/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: usbredirparser/libusbredirparser.so.1.1.0.p/usbredirparser.c.o: in function `va_log':
+usbredirparser.c:(.text+0x1c4): undefined reference to `__stack_chk_guard'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/40de5443e98157ad50c6841ea70a835cd5ad4fe9
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.freedesktop.org/spice/usbredir/-/merge_requests/53]
+---
+ meson.build       | 6 +++++-
+ meson_options.txt | 5 +++++
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index a6d21b8..4350f53 100644
+--- a/meson.build
++++ b/meson.build
+@@ -17,8 +17,12 @@ cc_flags = [
+ if host_machine.system() != 'windows'
+     cc_flags += [
+ 	'-Wp,-D_FORTIFY_SOURCE=2',
+-	'-fstack-protector',
+     ]
++    if get_option('stack_protector').enabled()
++        cc_flags += [
++	    '-fstack-protector',
++        ]
++    endif
+ endif
+ 
+ # Check if we are building from .git
+diff --git a/meson_options.txt b/meson_options.txt
+index 63e8c85..34dd392 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -17,6 +17,11 @@ option('fuzzing-install-dir',
+     type : 'string',
+     description : 'Installation directory for fuzzing binaries')
+ 
++option('stack_protector',
++    type : 'feature',
++    value : 'enabled',
++    description : 'Build usbredir\'s with stack-protector')
++
+ option('tools',
+     type : 'feature',
+     value : 'enabled',
+-- 
+2.33.0
+
diff --git a/package/usbredir/usbredir.mk b/package/usbredir/usbredir.mk
index 25c4bb382e..0a8dbf012d 100644
--- a/package/usbredir/usbredir.mk
+++ b/package/usbredir/usbredir.mk
@@ -13,6 +13,7 @@ USBREDIR_INSTALL_STAGING = YES
 USBREDIR_DEPENDENCIES = host-pkgconf libusb
 USBREDIR_CONF_OPTS = \
 	-Dgit_werror=disabled \
+	-Dstack_protector=disabled \
 	-Dtests=disabled \
 	-Dtools=disabled
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
