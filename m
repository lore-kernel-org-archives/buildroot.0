Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F523C433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 17:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C400660B91;
	Tue, 19 Jul 2022 17:01:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C400660B91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p0q_hH9PJZAf; Tue, 19 Jul 2022 17:01:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC08C60C19;
	Tue, 19 Jul 2022 17:01:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC08C60C19
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4E7E71BF417
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 17:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 372ED40547
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 17:01:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 372ED40547
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q_5MOlLh8Wc2 for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 17:01:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2DE0540126
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 17:01:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DE0540126
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0FDF783E2C; Tue, 19 Jul 2022 16:48:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 19 Jul 2022 19:01:12 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 97052fb2db81bb8d8856cea2225907759023d6e6
X-Git-Newrev: 8d125066c283e45981fa388c844ab57db107abd2
X-Patchwork-Hint: ignore
Message-Id: <20220719164804.0FDF783E2C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/libtalloc: fix
 build wihout SSP
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

commit: https://git.buildroot.net/buildroot/commit/?id=8d125066c283e45981fa388c844ab57db107abd2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Fix the following build failure without SSP raised since the addition of
the package in commit f0d37e275a915539a581c4ac7fd066eddc41fc8c:

/home/autobuild/autobuild/instance-5/output-1/host/lib/gcc/i686-buildroot-linux-musl/9.4.0/../../../../i686-buildroot-linux-musl/bin/ld: talloc.c.5.o: in function `_vasprintf_tc':
talloc.c:(.text+0x427d): undefined reference to `__stack_chk_fail_local'

Fixes:
 - http://autobuild.buildroot.org/results/e221bde25c7622db99761d0adcd56663296beb15

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 6a8dae6ddd5f23c391ff4dd1c63cb6f5bb010417)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
