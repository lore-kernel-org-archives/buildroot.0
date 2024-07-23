Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 569F8C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 20:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11CAB80B49;
	Tue, 23 Jul 2024 20:20:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SOVSb_IFaIAQ; Tue, 23 Jul 2024 20:20:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E42E680B0D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E42E680B0D;
	Tue, 23 Jul 2024 20:20:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2E3CB1BF27E
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 20:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B85D4025E
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 20:20:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SVugaBxjdbiQ for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 20:20:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBC0740250
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EBC0740250
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 20:20:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DDF1187539; Tue, 23 Jul 2024 20:20:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 22:19:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b68fa4c31a3d7300e36a7b33ebbf537f04b66b59
X-Git-Newrev: 482a27a7be85e17f689b77d5d21e55cacbfd06fa
X-Patchwork-Hint: ignore
Message-Id: <20240723202018.DDF1187539@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdex: fix build without SSP
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=482a27a7be85e17f689b77d5d21e55cacbfd06fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without stack-protector raised since the
addition of the package in commit
70319b47f646f74f407ed3355baf5b581a10518a:

/home/buildroot/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: src/libdex-1.a.p/dex-async-pair.c.o: in function `dex_async_pair_ready_callback':
dex-async-pair.c:(.text+0x118): undefined reference to `__stack_chk_guard'

Fixes: 70319b47f646f74f407ed3355baf5b581a10518a
 - http://autobuild.buildroot.org/results/f53768f654a9eddd95b583a366cd7386d9ddb285

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../libdex/0001-add-stack-protector-option.patch   | 45 ++++++++++++++++++++++
 package/libdex/libdex.mk                           |  1 +
 2 files changed, 46 insertions(+)

diff --git a/package/libdex/0001-add-stack-protector-option.patch b/package/libdex/0001-add-stack-protector-option.patch
new file mode 100644
index 0000000000..9021831a39
--- /dev/null
+++ b/package/libdex/0001-add-stack-protector-option.patch
@@ -0,0 +1,45 @@
+From 107efb2f1a014c4475e122677faddbe0dbef1000 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 23 Jul 2024 14:54:59 +0200
+Subject: [PATCH] add stack-protector option
+
+Allow the user to disable stack-protector as it is not supported by all
+toolchains
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://gitlab.gnome.org/GNOME/libdex/-/commit/a65d33aebbe43024a046b3f3cc4a1c6c533838d0
+---
+ meson.build       | 2 +-
+ meson_options.txt | 3 +++
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index d0ca81d..2f7aac2 100644
+--- a/meson.build
++++ b/meson.build
+@@ -126,7 +126,7 @@ test_c_args = [
+   ['-Werror=format-security', '-Werror=format=2'],
+   '-FImsvc_recommended_pragmas.h',
+ ]
+-if get_option('buildtype') != 'plain'
++if get_option('buildtype') != 'plain' and get_option('stack-protector')
+   if host_machine.system() != 'windows'
+     test_c_args += '-fstack-protector-strong'
+   endif
+diff --git a/meson_options.txt b/meson_options.txt
+index 519cd97..9e3364a 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -4,6 +4,9 @@ option('docs',
+ option('examples',
+        type: 'boolean', value: true,
+        description: 'Build example programs')
++option('stack-protector',
++       type: 'boolean', value: true,
++       description: 'Enable stack-protector')
+ option('vapi',
+        type: 'boolean', value: true,
+        description: 'Generate vapi data (requires vapigen)')
+-- 
+GitLab
+
diff --git a/package/libdex/libdex.mk b/package/libdex/libdex.mk
index 530dfc2bab..7c652a0409 100644
--- a/package/libdex/libdex.mk
+++ b/package/libdex/libdex.mk
@@ -15,6 +15,7 @@ LIBDEX_DEPENDENCIES = libglib2
 LIBDEX_CONF_OPTS = \
 	-Ddocs=false \
 	-Dexamples=false \
+	-Dstack-protector=false \
 	-Dsysprof=false \
 	-Dtests=false \
 	-Dvapi=false \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
