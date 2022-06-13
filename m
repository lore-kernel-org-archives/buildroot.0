Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E83C433EF
	for <buildroot@archiver.kernel.org>; Mon, 13 Jun 2022 20:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E8BA41686;
	Mon, 13 Jun 2022 20:20:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ELKcfAHBfUZU; Mon, 13 Jun 2022 20:20:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22E9241676;
	Mon, 13 Jun 2022 20:20:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BA81D1BF37C
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 20:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B75F160E76
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 20:20:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R7MQ55tJIisq for <buildroot@lists.busybox.net>;
 Mon, 13 Jun 2022 20:20:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8B1DF60E48
 for <buildroot@buildroot.org>; Mon, 13 Jun 2022 20:20:36 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id k19so8474587wrd.8
 for <buildroot@buildroot.org>; Mon, 13 Jun 2022 13:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h1Y9LyDZr71NWJFlMvML4q5fbt2WmkY071UDdEyxPj4=;
 b=FnL3zmyvEmd0h31sudBS99zFu7dSkValYLvAzqf5M4hJrZL9cz9LsFCy8dsmXiSztB
 Sl7UD4ArdXDv8Un/3W+k/p10/QvSF4tOaLcl0Hg5M3y6zEMdHN0H8RDkzxYotpg1oVOE
 MEWdt2Fy8of0uO+olPnNpq1zFXcxW9FN2PoULFgYM/BNFknf8WlPk6co8dHEapDUaE5z
 lXF4Ct58PZfRBE6n5jbYW6qDqXEEWpxaX/P/7BAJZDuq2BkIPnnyfytAjS6ByzWgRXnq
 Ougdc2ok05E8JifNBvM2B1KT10SOd2y1Pw4QnyRWN0B5uV2WdTBlRlkc8U3qwWTbe0NU
 mWbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h1Y9LyDZr71NWJFlMvML4q5fbt2WmkY071UDdEyxPj4=;
 b=pCUUvDM+jtGxowLHbOkOvjtiUjS9/sxyMJ31OlR79LaA5NaHSIxYR6PJFeOFTVbart
 c/0PZYTaDks6LPHsv1UzCS2P54RjgUXwfoBe8cYTIY8emhsGd+x2y8pmCQ95Iw0qI9un
 VUjOiIvhXI2425hwvisuB8NXjbEBJAxw2rxtCO2RRGoa1f1J2QQgbvuXPdCo68lP8t5v
 uLQ3zoxPxGxo0Iu67LI3CMVCAdwW6HKfgRYUvQWU5HllV/SO/z/zTCqRoG46zK3d/WwY
 ChxAE5POkVivDDFUTgBkxou8gXuGi9VCoMGgSzIrqM/lg13yFvSzzahO46j5KHM7p/hh
 tvdQ==
X-Gm-Message-State: AJIora+4W3vDxc4iTUZK8q0r3CMz0N77ySBJaoi81NQZ44PShder6kaN
 Fi5HFbR7ICWjOkPk7FDwwCmKB0d8qz4=
X-Google-Smtp-Source: AGRyM1sLx1MK2g6jbOftPI2J4++n2gBUXXrFiTmCPANyXLv+RcEnd56qA8atqzFw4UspJckXDE/yBQ==
X-Received: by 2002:a5d:5a94:0:b0:218:531a:eea with SMTP id
 bp20-20020a5d5a94000000b00218531a0eeamr1394465wrb.703.1655151634589; 
 Mon, 13 Jun 2022 13:20:34 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 bh8-20020a05600c3d0800b003942a244ee6sm10542843wmb.43.2022.06.13.13.20.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 13:20:33 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 13 Jun 2022 22:17:58 +0200
Message-Id: <20220613201758.293344-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libtalloc: fix build wihout SSP
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
Cc: David GOUARIN <dgouarin@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure without SSP raised since the addition of
the package in commit f0d37e275a915539a581c4ac7fd066eddc41fc8c:

/home/autobuild/autobuild/instance-5/output-1/host/lib/gcc/i686-buildroot-linux-musl/9.4.0/../../../../i686-buildroot-linux-musl/bin/ld: talloc.c.5.o: in function `_vasprintf_tc':
talloc.c:(.text+0x427d): undefined reference to `__stack_chk_fail_local'

Fixes:
 - http://autobuild.buildroot.org/results/e221bde25c7622db99761d0adcd56663296beb15

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...mba-add-disable-stack-protector-opti.patch | 116 ++++++++++++++++++
 package/libtalloc/libtalloc.mk                |   1 +
 2 files changed, 117 insertions(+)
 create mode 100644 package/libtalloc/0001-buildtools-wafsamba-add-disable-stack-protector-opti.patch

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
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
