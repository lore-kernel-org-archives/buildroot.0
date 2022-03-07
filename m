Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC16EC433FE
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 22:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A79A441757;
	Mon,  7 Mar 2022 22:10:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w1-JNxSGwdWQ; Mon,  7 Mar 2022 22:10:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B891E41758;
	Mon,  7 Mar 2022 22:10:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ACC1C1BF39D
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B0234173F
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:09:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id crLBpbwVOF1s for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 22:09:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D076841743
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 22:09:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 05E2782DD8; Mon,  7 Mar 2022 22:01:27 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 7 Mar 2022 22:58:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0e9565f831da2377622c79bfd6e5be37f7baaa7c
X-Git-Newrev: 44306369e9821ee5c9a12114ecd4296b0e374ad4
X-Patchwork-Hint: ignore
Message-Id: <20220307220127.05E2782DD8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sord: fix build without threads
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

commit: https://git.buildroot.net/buildroot/commit/?id=44306369e9821ee5c9a12114ecd4296b0e374ad4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without threads raised since the
addition of the package in commit
0d4c8ce8a2f26989e0e2d95b977d60e450c090a9:

/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: cannot find -lpthread

Fixes:
 - http://autobuild.buildroot.org/results/170d0114987b39a2b9ea173df7a5e806bd270fd8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../sord/0001-wscript-add-no-threads-option.patch  | 59 ++++++++++++++++++++++
 package/sord/sord.mk                               |  4 ++
 2 files changed, 63 insertions(+)

diff --git a/package/sord/0001-wscript-add-no-threads-option.patch b/package/sord/0001-wscript-add-no-threads-option.patch
new file mode 100644
index 0000000000..750ea8f4ad
--- /dev/null
+++ b/package/sord/0001-wscript-add-no-threads-option.patch
@@ -0,0 +1,59 @@
+From 82ab045a45c06187dca5e9d2a9a4003fcfbfa830 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 22 Feb 2022 21:22:31 +0100
+Subject: [PATCH] wscript: add -no-threads option
+
+Add -no-threads options to avoid the following build failure on embedded
+toolchains without threads support:
+
+/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: cannot find -lpthread
+
+Fixes:
+ - http://autobuild.buildroot.org/results/170d0114987b39a2b9ea173df7a5e806bd270fd8
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/drobilla/sord/pull/3]
+---
+ wscript | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/wscript b/wscript
+index fd8578e..d71d78c 100644
+--- a/wscript
++++ b/wscript
+@@ -35,6 +35,7 @@ def options(ctx):
+         {'no-utils':     'do not build command line utilities',
+          'static':       'build static library',
+          'no-shared':    'do not build shared library',
++         'no-threads':   'disable threads',
+          'static-progs': 'build programs as static binaries'})
+ 
+     opt.add_option('--dump', type='string', default='', dest='dump',
+@@ -55,6 +56,7 @@ def configure(conf):
+ 
+     conf.env.BUILD_UTILS  = not Options.options.no_utils
+     conf.env.BUILD_SHARED = not Options.options.no_shared
++    conf.env.ENABLE_THREADS = not Options.options.no_threads
+     conf.env.STATIC_PROGS = Options.options.static_progs
+     conf.env.BUILD_STATIC = (Options.options.static or
+                              Options.options.static_progs)
+@@ -124,7 +126,7 @@ def configure(conf):
+     conf.check_pkg('serd-0 >= 0.30.0', uselib_store='SERD')
+     conf.check_pkg('libpcre', uselib_store='PCRE', mandatory=False)
+ 
+-    if conf.env.HAVE_PCRE:
++    if conf.env.HAVE_PCRE and conf.env.ENABLE_THREADS:
+         if conf.check(cflags=['-pthread'], mandatory=False):
+             conf.env.PTHREAD_CFLAGS    = ['-pthread']
+             if conf.env.CC_NAME != 'clang':
+@@ -160,6 +162,7 @@ def configure(conf):
+         conf,
+         {'Static library': bool(conf.env.BUILD_STATIC),
+          'Shared library': bool(conf.env.BUILD_SHARED),
++         'Threads':        bool(conf.env.ENABLE_THREADS),
+          'Utilities':      bool(conf.env.BUILD_UTILS),
+          'Unit tests':     bool(conf.env.BUILD_TESTS),
+          'Debug dumping':  dump})
+-- 
+2.34.1
+
diff --git a/package/sord/sord.mk b/package/sord/sord.mk
index f805805e9d..c06ef9c55c 100644
--- a/package/sord/sord.mk
+++ b/package/sord/sord.mk
@@ -22,4 +22,8 @@ ifeq ($(BR2_STATIC_LIBS),y)
 SORD_CONF_OPTS += --static --no-shared --static-progs
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
+SORD_CONF_OPTS += --no-threads
+endif
+
 $(eval $(waf-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
