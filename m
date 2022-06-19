Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F945C43334
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 16:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C98CA4091F;
	Sun, 19 Jun 2022 16:00:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C98CA4091F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gHwASaMOwYlI; Sun, 19 Jun 2022 16:00:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99857408EB;
	Sun, 19 Jun 2022 16:00:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99857408EB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0CF8A1BF990
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 15:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4170E813CD
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 15:57:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4170E813CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S3LNK3f19xg7 for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 15:57:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63B3F813E7
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 15:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63B3F813E7
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3BC7D873C2; Sun, 19 Jun 2022 15:45:30 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 17:22:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9fc652a373034118535397fdd4042ab9f8fd7adf
X-Git-Newrev: 6a8dae6ddd5f23c391ff4dd1c63cb6f5bb010417
X-Patchwork-Hint: ignore
Message-Id: <20220619154530.3BC7D873C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libtalloc: fix build wihout SSP
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

commit: https://git.buildroot.net/buildroot/commit/?id=6a8dae6ddd5f23c391ff4dd1c63cb6f5bb010417
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without SSP raised since the addition of
the package in commit f0d37e275a915539a581c4ac7fd066eddc41fc8c:

/home/autobuild/autobuild/instance-5/output-1/host/lib/gcc/i686-buildroot-linux-musl/9.4.0/../../../../i686-buildroot-linux-musl/bin/ld: talloc.c.5.o: in function `_vasprintf_tc':
talloc.c:(.text+0x427d): undefined reference to `__stack_chk_fail_local'

Fixes:
 - http://autobuild.buildroot.org/results/e221bde25c7622db99761d0adcd56663296beb15

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...wafsamba-add-disable-stack-protector-opti.patch | 116 +++++++++++++++++++++
 package/libtalloc/libtalloc.mk                     |   1 +
 2 files changed, 117 insertions(+)

diff --git a/package/libtalloc/0001-buildtools-wafsamba-add-disable-stack-protector-opti.patch b/package/libtalloc/0001-buildtools-wafsamba-add-disable-stack-protector-opti.patch
new file mode 100644
index 0000000000..839479a3fa
--- /dev/null
+++ b/package/libtalloc/0001-buildtools-wafsamba-add-disable-stack-protector-opti.patch
@@ -0,0 +1,116 @@
+From 5885ed8e6db7648e6842d9811aace7edc4e8aba7 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 20 Apr 2022 11:16:52 +0200
+Subject: [PATCH] buildtools/wafsamba: add --disable-stack-protector option
+
+Allow the user to disable stack-protector through
+--disable-stack-protector to avoid the following build failure with
+libtalloc on embedded toolchains which don't support stack-protector:
+
+/home/autobuild/autobuild/instance-5/output-1/host/lib/gcc/i686-buildroot-linux-musl/9.4.0/../../../../i686-buildroot-linux-musl/bin/ld: talloc.c.5.o: in function `_vasprintf_tc':
+talloc.c:(.text+0x427d): undefined reference to `__stack_chk_fail_local'
+
+This build failure is raised since
+https://gitlab.com/ffontaine/samba/-/commit/38e97f8b52e85bdfcf2d74a4fb3c848fa46ba371
+because stack-protector is enabled on libtalloc despite the fact that
+libssp is not available:
+
+Checking if compiler accepts -fstack-protector-strong                                           : yes
+
+Fixes:
+ - http://autobuild.buildroot.org/results/e221bde25c7622db99761d0adcd56663296beb15
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.com/samba-team/samba/-/merge_requests/2493]
+---
+ buildtools/wafsamba/samba_autoconf.py | 49 ++++++++++++++-------------
+ buildtools/wafsamba/wscript           |  3 ++
+ 2 files changed, 28 insertions(+), 24 deletions(-)
+
+diff --git a/buildtools/wafsamba/samba_autoconf.py b/buildtools/wafsamba/samba_autoconf.py
+index 78927d85193..23a995e1c34 100644
+--- a/buildtools/wafsamba/samba_autoconf.py
++++ b/buildtools/wafsamba/samba_autoconf.py
+@@ -703,9 +703,28 @@ def SAMBA_CONFIG_H(conf, path=None):
+     if not IN_LAUNCH_DIR(conf):
+         return
+ 
+-    # we need to build real code that can't be optimized away to test
+-    stack_protect_list = ['-fstack-protector-strong', '-fstack-protector']
+-    for stack_protect_flag in stack_protect_list:
++    if not Options.options.disable_stack_protector:
++        # we need to build real code that can't be optimized away to test
++        stack_protect_list = ['-fstack-protector-strong', '-fstack-protector']
++        for stack_protect_flag in stack_protect_list:
++            flag_supported = conf.check(fragment='''
++                                        #include <stdio.h>
++
++                                        int main(void)
++                                        {
++                                            char t[100000];
++                                            while (fgets(t, sizeof(t), stdin));
++                                            return 0;
++                                        }
++                                        ''',
++                                        execute=0,
++                                        cflags=[ '-Werror', '-Wp,-D_FORTIFY_SOURCE=2', stack_protect_flag],
++                                        mandatory=False,
++                                        msg='Checking if compiler accepts %s' % (stack_protect_flag))
++            if flag_supported:
++                conf.ADD_CFLAGS('%s' % (stack_protect_flag))
++                break
++
+         flag_supported = conf.check(fragment='''
+                                     #include <stdio.h>
+ 
+@@ -717,29 +736,11 @@ def SAMBA_CONFIG_H(conf, path=None):
+                                     }
+                                     ''',
+                                     execute=0,
+-                                    cflags=[ '-Werror', '-Wp,-D_FORTIFY_SOURCE=2', stack_protect_flag],
++                                    cflags=[ '-Werror', '-fstack-clash-protection'],
+                                     mandatory=False,
+-                                    msg='Checking if compiler accepts %s' % (stack_protect_flag))
++                                    msg='Checking if compiler accepts -fstack-clash-protection')
+         if flag_supported:
+-            conf.ADD_CFLAGS('%s' % (stack_protect_flag))
+-            break
+-
+-    flag_supported = conf.check(fragment='''
+-                                #include <stdio.h>
+-
+-                                int main(void)
+-                                {
+-                                    char t[100000];
+-                                    while (fgets(t, sizeof(t), stdin));
+-                                    return 0;
+-                                }
+-                                ''',
+-                                execute=0,
+-                                cflags=[ '-Werror', '-fstack-clash-protection'],
+-                                mandatory=False,
+-                                msg='Checking if compiler accepts -fstack-clash-protection')
+-    if flag_supported:
+-        conf.ADD_CFLAGS('-fstack-clash-protection')
++            conf.ADD_CFLAGS('-fstack-clash-protection')
+ 
+     if Options.options.debug:
+         conf.ADD_CFLAGS('-g', testflags=True)
+diff --git a/buildtools/wafsamba/wscript b/buildtools/wafsamba/wscript
+index 8729b0829da..d75bb3b1c0c 100644
+--- a/buildtools/wafsamba/wscript
++++ b/buildtools/wafsamba/wscript
+@@ -165,6 +165,9 @@ Currently the only tested value is 'smbtorture,smbd/smbd' for Samba'''),
+     gr.add_option('--disable-warnings-as-errors',
+                    help=("Do not treat all warnings as errors (disable -Werror)"),
+                    action="store_true", dest='disable_warnings_as_errors', default=False)
++    gr.add_option('--disable-stack-protector',
++                   help=("Disable stack-protector"),
++                   action="store_true", dest='disable_stack_protector', default=False)
+     opt.add_option('--enable-coverage',
+                    help=("enable options necessary for code coverage "
+                          "reporting on selftest (default=no)"),
+-- 
+2.35.1
+
diff --git a/package/libtalloc/libtalloc.mk b/package/libtalloc/libtalloc.mk
index 79bcf94947..8cba699ea1 100644
--- a/package/libtalloc/libtalloc.mk
+++ b/package/libtalloc/libtalloc.mk
@@ -20,6 +20,7 @@ LIBTALLOC_INSTALL_STAGING = YES
 # libtalloc since it's optional.
 LIBTALLOC_CONF_OPTS += --cross-compile \
 		--cross-answers=$(@D)/cache.txt \
+		--disable-stack-protector \
 		--hostcc=gcc \
 		--with-libiconv=$(STAGING_DIR)/usr
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
