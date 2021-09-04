Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B061C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 15:38:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFD7460F21
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 15:38:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BFD7460F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F68582F76;
	Sat,  4 Sep 2021 15:38:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QsBSfi3XPbqx; Sat,  4 Sep 2021 15:38:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C13582F3D;
	Sat,  4 Sep 2021 15:38:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 05AAC1BF3C4
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 15:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2C8A6071E
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 15:38:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uNoJmtQh5Nsx for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 15:38:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A83E06070B
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 15:38:15 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id d6so2426464wrc.11
 for <buildroot@buildroot.org>; Sat, 04 Sep 2021 08:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qxhA/CdgUWvPPRMQkdv+wDejbrESem51ihuscnjXcSU=;
 b=YFv9nHMiw+udIFTT0bx4TbPcHIBH7g6B9ocgpAvYZVKbcULxHK8U5dnl+In/ceVo1j
 m0ZSPtEgtxbhHkhtIELbWLZr4ZsmSTQ+URRzXQg3E9rIXuSRJLSKQ5053t5ltI/Uj9Op
 INVtkdlgknI3phrdo1wb1Tg9OwH8NEIhtF/Gx3H3Jfpm4MTr0Z+Lni1ixQbv4P7b6402
 GNdRVvP71w0JG1sMVgvmTmWsnmcs7WbsB/p5zmjqW8G0KDFhCHhI790jrf/qohi5zGYR
 XNwqc0/kU7qYAdb6egdAsa5SbWzLzkGZ7RNHlNB+eMW0lHUC2cXm5lk+Rr0eLuuAbad1
 4Dvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qxhA/CdgUWvPPRMQkdv+wDejbrESem51ihuscnjXcSU=;
 b=m4iFUOtSuinmcuCaKgpgCs7f3+v6qEGeDHty9TwdE1WetRRPGMdnNJUYbHhvZXAcbE
 0h92L4MzG/NgWdaqHhzX8kGY/tXwYXNxCFvS+WQQdR5h2Z5Bvh8nS8x1Y86GCT3HKV74
 HllAcXYRyo2eOEXxZ5gqk9muri6MpXYbaiFAvNimczPV2gcNzr6B1wZSV9v7B4gzFFpV
 8tRnjfKcgLOSt0JlhYMvxYiumpq5wkiL0kEPe99s2Bw07yowoBuxjMjXSuCYaoDRt5h6
 YnRKxWNWCLRnpwR4unNPHLUfOEHjG3KNOb0L7h+O684J5gtnE6dAsBWpn+ES+0KnUAo2
 e70A==
X-Gm-Message-State: AOAM530HmZRelkPBFn07dGjDNZ9fJc2RdYCBYymNCJOxvdTKOc3dsdgF
 cZCFUAvJjQhDUfq9CtHnz8pI7l7y2arTJQ==
X-Google-Smtp-Source: ABdhPJyKS16h8EjBF+HSyTWeRdptkYqBCVciK54Ct4rillmI9+BY9TzThx6iIfiQV5nDUwoN/e9oLA==
X-Received: by 2002:adf:f101:: with SMTP id r1mr4294651wro.355.1630769893443; 
 Sat, 04 Sep 2021 08:38:13 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id n4sm2860664wro.81.2021.09.04.08.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 08:38:12 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Sep 2021 17:37:35 +0200
Message-Id: <20210904153735.1760686-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/luasyslog: fix build when host root
 directory is /usr
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

Fix the following build failure when host root directory is /usr which
is raised since bump to version 2.2.0 in commit
caa32ac237909999eb6e0bd3616ef4440190970a:

 /usr/bin/install -c -m 644 syslog.lua '/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/target/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/host/usr/share/lua/5.3/logging'
libtool: install: /usr/bin/install -c .libs/lsyslog.so /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/target/usr/lib/lua/5.3/lsyslog.so
libtool: install: /usr/bin/install -c .libs/lsyslog.lai /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/target/usr/lib/lua/5.3/lsyslog.la
libtool: warning: remember to run 'libtool --finish /usr/lib/lua/5.3'
/usr/bin/make  install-exec-hook
make[3]: Entering directory `/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/build/luasyslog-2.2.0'
rm -f /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/target/usr/lib/lua/5.3/lsyslog.la
make[3]: Leaving directory `/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/build/luasyslog-2.2.0'
make[2]: Leaving directory `/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/build/luasyslog-2.2.0'
make[1]: Leaving directory `/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/build/luasyslog-2.2.0'
luasyslog: installs files in /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/target//usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1

This failure is raised because lua script directory is "found" and
"fixed" to
${prefix}/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/host/usr/share/lua/5.3
because of the following test in ax_lua.m4:

       dnl Try to find a path with the prefix.
        _AX_LUA_FND_PRFX_PTH([$LUA], [$ax_lua_prefix], [package.path])
        AS_IF([test "x$ax_lua_prefixed_path" != 'x'],
        [ dnl Fix the prefix.
          _ax_strip_prefix=`echo "$ax_lua_prefix" | sed 's|.|.|g'`
          ax_cv_lua_luadir=`echo "$ax_lua_prefixed_path" | \
            sed "s,^$_ax_strip_prefix,$LUA_PREFIX,"`
        ])

Fixes:
 - http://autobuild.buildroot.org/results/09fa6dd9844d6d4694801ec59434dad7a56bf290

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...uild-ax_lua.m4-fix-cross-compilation.patch | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/luasyslog/0002-build-ax_lua.m4-fix-cross-compilation.patch

diff --git a/package/luasyslog/0002-build-ax_lua.m4-fix-cross-compilation.patch b/package/luasyslog/0002-build-ax_lua.m4-fix-cross-compilation.patch
new file mode 100644
index 0000000000..ac7c1d97e2
--- /dev/null
+++ b/package/luasyslog/0002-build-ax_lua.m4-fix-cross-compilation.patch
@@ -0,0 +1,45 @@
+From aed16d13d881492e8558f9da21be2dffc4ab2c33 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 4 Sep 2021 17:23:58 +0200
+Subject: [PATCH] build/ax_lua.m4: fix cross-compilation
+
+Don't try to "find" and "fix" the script and module directories when
+cross-compiling as this will give unexpected results such as using
+${prefix}/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/host/usr/share/lua/5.3
+instead of
+${prefix}/share/lua/5.3
+if the host machine root directory is /usr
+
+Fixes:
+ - http://autobuild.buildroot.org/results/09fa6dd9844d6d4694801ec59434dad7a56bf290
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ build/ax_lua.m4 | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/build/ax_lua.m4 b/build/ax_lua.m4
+index 23ca774..7c25cfd 100644
+--- a/build/ax_lua.m4
++++ b/build/ax_lua.m4
+@@ -291,7 +291,7 @@ AC_DEFUN([AX_PROG_LUA],
+ 
+         dnl Try to find a path with the prefix.
+         _AX_LUA_FND_PRFX_PTH([$LUA], [$ax_lua_prefix], [package.path])
+-        AS_IF([test "x$ax_lua_prefixed_path" != 'x'],
++        AS_IF([test "x$ax_lua_prefixed_path" != 'x' && test "x$cross_compiling" != 'xyes'],
+         [ dnl Fix the prefix.
+           _ax_strip_prefix=`echo "$ax_lua_prefix" | sed 's|.|.|g'`
+           ax_cv_lua_luadir=`echo "$ax_lua_prefixed_path" | \
+@@ -318,7 +318,7 @@ AC_DEFUN([AX_PROG_LUA],
+         dnl Try to find a path with the prefix.
+         _AX_LUA_FND_PRFX_PTH([$LUA],
+           [$ax_lua_exec_prefix], [package.cpathd])
+-        AS_IF([test "x$ax_lua_prefixed_path" != 'x'],
++        AS_IF([test "x$ax_lua_prefixed_path" != 'x' && test "x$cross_compiling" != 'xyes'],
+         [ dnl Fix the prefix.
+           _ax_strip_prefix=`echo "$ax_lua_exec_prefix" | sed 's|.|.|g'`
+           ax_cv_lua_luaexecdir=`echo "$ax_lua_prefixed_path" | \
+-- 
+2.32.0
+
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
