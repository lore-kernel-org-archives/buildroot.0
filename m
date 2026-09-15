Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D1EC88E77
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 17:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BE4280AD5;
	Tue, 15 Sep 2026 17:04:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t3sN95TjD0Kh; Tue, 15 Sep 2026 17:04:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1561180ADE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789491863;
	b=IC09o2+65zR/dths6ASiNUzrsCXz867BZ9TB3Wu/x564NDnbpbAN8J8ElgnGEZfOZzEU
	 DVa0jGZib9a136Q1sQCZ32So3S4UiKOdgOXnQyAKA09vmzw5MAH+a0aZabWxIcxD1Jmpk
	 v5mHJNq1loHTZlLG/Ju24uAFsbR6Yz/R5lUW8lpe+M6JvsCdyi+P1AUyVRxOOVISi6Vvy
	 n+DyKWxGTm7LOq8rb54f+vZRyXPAdCFmSEEGAas8iA5cPsddFsie5TDz9rKe4A1g1Unsn
	 JBHFibnsDYHbq17ni34591/82Pwey96vn4PzS+tM41E+f9W6JqIw1nlKRXzmwtqozHQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789491863;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=n5F0AShImT6vUwFPcRPUmRGj85f4OH4QWHgFWgb6xT4=;
	b=SQQQ6ebbIvzGLJ1xn1Ym+dVrUz4lHTh3olqCQOFeASZQ4/0OphxulxpSamTSmtkb41yZ
	 PHTy5NoWaCs0+j23EOSgx3Fx2G/T5eGk0HEr0WEbg1lu3sKHafqpAA8d+pK6ZP/jOpsJj
	 4f6ZooIbyzgjWcaBXs00S8ucvrwpYq8bdVT7Gbs7tcW+E90BUDGY2NZJwyv1IK4Mms6Bg
	 lljTo1Zv+kl750l3zsopfRFPFdNbAs2WYdaFOpq8fafP2xkxDocHVMgX+tiR+38dUFtJL
	 njVH7jMjYfL9Yn0K00p50iW/O/vlz4ECxSb0hDBVcZpwor/csW9jWNg0sfmUJpjopNw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789491863;
	bh=n5F0AShImT6vUwFPcRPUmRGj85f4OH4QWHgFWgb6xT4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Kgwf4hCgcMfGUIPbE09aO1ODrIAf66NdFyjD5Fm083peWZGtQlDDKhlMty+wGJsNw
	 CQWS6igX4umeRIgSD3xw9SmdqlqDHo5OW/D5fqKTzCrhyUobjymRJ5QRvnhtrc8vJ9
	 t+yTNtxqfJTbR3SozZTY2olaEZtZbpy6jispG8A3TXf8tPlqisKjlvXlZjA2SOReCw
	 jSt+7x8P+MutMRdlUxpCpTKkDPck71wqOVqt2Dnnp9FtF3YTjCPCmsT0ZEMa9XodnZ
	 GrxoWwmAFW3B1nvjwVuY8csEVh54EWVtzpWQ1ltx8rsTJvNhgtIMqcjO3Dtnb12MMc
	 Nth0dpUDZNSvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1561180ADE;
	Tue, 15 Sep 2026 17:04:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CCCCDD8
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F121240111
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:04:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4FhFO-GESNaD for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 17:04:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org C69A5400FF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789491856;
 b=N9PxVw4Ein5cEx/co6p0Y3czy4/+eQMc5XLxjBbzjjJATQNVOyRcZBJRyl67HDhBiehi
 wXYgTAdkHkvCMkvkqNj3vrLn5hiLOSNXQBCtdV1SuFRm2OwM8MQxyuwZqqEWVEV8/8nDY
 gK3geXi7wAVJhWbvI9AqNycTA7/ZOGpyWPpJFcC8aslA2mTc7HuH3n2Er61bSRqpV1V4F
 7OimbAGh+S8T/eTys6npaEo9sRiwxrBnrzrxc+9xaI6ibxL5+z9wlfJDagiESuFPbqbth
 HOqSUSMT5saZCWvL534ewNj9o1v5rz29JVauYH4tprktNiFSFiac1YX7FQtmkXZnCmQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789491856;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=AVYRV/u1aWa5bJQAk5a0A6s7pc/GZrdVGNTwobRWhsA=;
 b=F1FbxI8bs6XEBPcX14j0s2K0D2r/ijo2j1uKSBIezOjN8nCNEJm5NIFfNd078mylnJSS
 /Ompq5qcVoeDDmou+w0qqgGk6Gsus4Xx9azTQ0eoS93FBkQkjJFHwDBtAYqxUVEHiqcIc
 l8XzHc0c9sSpMMc2cZK0Un0sGzKF/Bl9svGF3/gBSfC1y+8ydB2Z8WXIld7q1jbetNmBq
 CtfxYhEfPvk6Aptj1bN7Q0n/pAvO2sf+VVHJLCSQp3pxxfQSglECA1wIjvpYYmWF82r6X
 iSb9dS6OvimfhFxR8wQGDznOLnD2iCCgOU5GDik8bHEOw3I5QOzWOaO55juC5hjx0Xw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C69A5400FF
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:04:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D1BEB95CED; Tue, 15 Sep 2026 17:03:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 15 Sep 2026 18:52:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 055a1e249c8d15dbee3a3c10dc7d0acde03e0c91
X-Git-Newrev: 489aefc22af70996cae8d49694f5646be67d90bb
X-Patchwork-Hint: ignore
Message-Id: <20260915170310.D1BEB95CED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zabbix: fix build without libcurl
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/489aefc22af70996cae8d49694f5646be67d90bb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Building zabbix without libcurl enabled would lead to the following
error:

/usr/bin/ld: .../src/libs/zbxxml/xml.c:515:(.text+0x1c64): undefined reference to `zbx_vector_str_append'

This issue has been addressed in the upstream commit [1] and backported
as a patch in Buildroot.
For more information see the upstream issue [2].

This error is reproducible with the following defconfig:

cat >.config <<EOF
BR2_arm=y
BR2_cortex_a7=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_PHP=y
BR2_PACKAGE_ZABBIX=y
BR2_PACKAGE_ZABBIX_SERVER=y
BR2_PACKAGE_ZABBIX_SERVER_COPY_FRONTEND=y
EOF
make oldefconfig
make zabbix

[1] https://git.zabbix.com/projects/ZBX/repos/zabbix/commits/e8333ca2128
[2] https://support.zabbix.com/browse/ZBX-27635

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...ix-server-and-proxy-build-without-libcurl.patch | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/package/zabbix/0002-fixed-Zabbix-server-and-proxy-build-without-libcurl.patch b/package/zabbix/0002-fixed-Zabbix-server-and-proxy-build-without-libcurl.patch
new file mode 100644
index 0000000000..b90c7536da
--- /dev/null
+++ b/package/zabbix/0002-fixed-Zabbix-server-and-proxy-build-without-libcurl.patch
@@ -0,0 +1,69 @@
+From 0a29a6b4cfa608e0c2e393125f60f4bbb271e8b8 Mon Sep 17 00:00:00 2001
+From: Artjoms Rimdjonoks <artjoms.rimdjonoks@zabbix.com>
+Date: Mon, 27 Apr 2026 12:36:47 +0300
+Subject: [PATCH] .......PS. [ZBX-27635] fixed Zabbix server and proxy build
+ without libcurl
+
+Merge in ZBX/zabbix from feature/ZBX-27635-7.5 to master
+
+* commit '142cefe8703dd25afaf8c7f05379d61136e773fd':
+  .......PS. [ZBX-27635] fixed or includes
+  .......PS. [ZBX-27635] updated include
+  .......PS. [ZBX-27635] added Changelog
+  .......PS. [ZBX-27635] fixed Zabbix server and proxy build without libcurl
+
+(cherry picked from commit e8333ca2128bf9ac2ab50ee1ee06445766b6192c)
+Upstream: https://github.com/zabbix/zabbix/commit/0a29a6b4cfa608e0c2e393125f60f4bbb271e8b8.patch
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ ChangeLog.d/bugfix/ZBX-27635        | 1 +
+ src/libs/zbxsysinfo/simple/simple.c | 5 ++++-
+ src/zabbix_js/Makefile.am           | 2 +-
+ 3 files changed, 6 insertions(+), 2 deletions(-)
+ create mode 100644 ChangeLog.d/bugfix/ZBX-27635
+
+diff --git a/ChangeLog.d/bugfix/ZBX-27635 b/ChangeLog.d/bugfix/ZBX-27635
+new file mode 100644
+index 000000000000..a8b07470a37d
+--- /dev/null
++++ b/ChangeLog.d/bugfix/ZBX-27635
+@@ -0,0 +1 @@
++.......PS. [ZBX-27635] fixed Zabbix server and proxy build without libcurl (arimdjonoks)
+diff --git a/src/libs/zbxsysinfo/simple/simple.c b/src/libs/zbxsysinfo/simple/simple.c
+index 599816c517a1..3bc324a08b1a 100644
+--- a/src/libs/zbxsysinfo/simple/simple.c
++++ b/src/libs/zbxsysinfo/simple/simple.c
+@@ -25,9 +25,12 @@
+ #include "zbxcomms.h"
+ #include "zbx_discoverer_constants.h"
+ 
++#if defined(HAVE_LIBCURL) || defined(HAVE_LDAP)
++#	include "zbxip.h"
++#endif
++
+ #ifdef HAVE_LIBCURL
+ #	include "zbxcurl.h"
+-#	include "zbxip.h"
+ #endif
+ 
+ #ifdef HAVE_LDAP
+diff --git a/src/zabbix_js/Makefile.am b/src/zabbix_js/Makefile.am
+index 1e4fd93d9fd2..2ef20fb9f911 100644
+--- a/src/zabbix_js/Makefile.am
++++ b/src/zabbix_js/Makefile.am
+@@ -9,7 +9,6 @@ zabbix_js_LDADD = \
+ 	$(top_srcdir)/src/libs/zbxembed/libzbxembed.a \
+ 	$(top_srcdir)/src/libs/zbxjson/libzbxjson.a \
+ 	$(top_srcdir)/src/libs/zbxregexp/libzbxregexp.a \
+-	$(top_srcdir)/src/libs/zbxalgo/libzbxalgo.a \
+ 	$(top_srcdir)/src/libs/zbxthreads/libzbxthreads.a \
+ 	$(top_srcdir)/src/libs/zbxmutexs/libzbxmutexs.a \
+ 	$(top_srcdir)/src/libs/zbxprof/libzbxprof.a \
+@@ -23,6 +22,7 @@ zabbix_js_LDADD = \
+ 	$(top_srcdir)/src/libs/zbxhttp/libzbxhttp.a \
+ 	$(top_srcdir)/src/libs/zbxvariant/libzbxvariant.a \
+ 	$(top_srcdir)/src/libs/zbxxml/libzbxxml.a \
++	$(top_srcdir)/src/libs/zbxalgo/libzbxalgo.a \
+ 	$(top_srcdir)/src/libs/zbxstr/libzbxstr.a \
+ 	$(top_srcdir)/src/libs/zbxnum/libzbxnum.a \
+ 	$(top_srcdir)/src/libs/zbxtime/libzbxtime.a \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
