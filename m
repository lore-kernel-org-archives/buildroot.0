Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CEFAC4167B
	for <buildroot@archiver.kernel.org>; Wed, 29 Nov 2023 09:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 184A4812CC;
	Wed, 29 Nov 2023 09:01:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 184A4812CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I4d5v6ocOQnL; Wed, 29 Nov 2023 09:01:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 693C1819F5;
	Wed, 29 Nov 2023 09:01:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 693C1819F5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 96EF11BF276
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 09:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D71160B89
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 09:01:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D71160B89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wIkZxON0nIrM for <buildroot@lists.busybox.net>;
 Wed, 29 Nov 2023 09:01:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC9F160B7C
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 09:01:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC9F160B7C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 98D838755D; Wed, 29 Nov 2023 09:01:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 29 Nov 2023 09:59:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a82ff22698e4e4ffecfd2b07ba0e00cd8a0d4a85
X-Git-Newrev: e88823d667cf0a459242da7cdb7f71269b69e536
X-Patchwork-Hint: ignore
Message-Id: <20231129090117.98D838755D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/refpolicy: fix build with
 smartmontools
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

commit: https://git.buildroot.net/buildroot/commit/?id=e88823d667cf0a459242da7cdb7f71269b69e536
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with smartmontools raised since bump to
version 2.20231002 in commit 68de45491ba7d4b7aeff6f869934745440f88c00:

 Compiling targeted policy.33
 env LD_LIBRARY_PATH="/home/thomas/autobuild/instance-2/output-1/host/lib:/home/thomas/autobuild/instance-2/output-1/host/usr/lib" /home/thomas/autobuild/instance-2/output-1/host/usr/bin/checkpolicy -c 33 -U deny -S -O -E policy.conf -o policy.33
 policy/modules/services/smartmon.te:146:ERROR 'type fsadm_exec_t is not within scope' at token ';' on line 237472:
 	allow smartmon_update_drivedb_t fsadm_exec_t:file { { getattr open map read execute ioctl } ioctl lock execute_no_trans };
 #line 146
 checkpolicy:  error(s) encountered while parsing configuration
 make[1]: *** [Rules.monolithic:80: policy.33] Error 1

Fixes:
 - http://autobuild.buildroot.org/results/a01123de9a8c1927060e7e4748666bebfc82ea44

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...les-services-smartmon.te-make-fstools-opt.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/package/refpolicy/0001-policy-modules-services-smartmon.te-make-fstools-opt.patch b/package/refpolicy/0001-policy-modules-services-smartmon.te-make-fstools-opt.patch
new file mode 100644
index 0000000000..ddf2943bfa
--- /dev/null
+++ b/package/refpolicy/0001-policy-modules-services-smartmon.te-make-fstools-opt.patch
@@ -0,0 +1,44 @@
+From c6d1345732c463cb45d8ba490081ad92936bfd69 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 28 Nov 2023 22:30:01 +0100
+Subject: [PATCH] policy/modules/services/smartmon.te: make fstools optional
+
+Make fstools optional to avoid the following build failure raised since
+version 2.20231002 and
+https://github.com/SELinuxProject/refpolicy/commit/cb068f09d224f90a97fa63a574fb423bbe1ceeda:
+
+ Compiling targeted policy.33
+ env LD_LIBRARY_PATH="/home/thomas/autobuild/instance-2/output-1/host/lib:/home/thomas/autobuild/instance-2/output-1/host/usr/lib" /home/thomas/autobuild/instance-2/output-1/host/usr/bin/checkpolicy -c 33 -U deny -S -O -E policy.conf -o policy.33
+ policy/modules/services/smartmon.te:146:ERROR 'type fsadm_exec_t is not within scope' at token ';' on line 237472:
+ 	allow smartmon_update_drivedb_t fsadm_exec_t:file { { getattr open map read execute ioctl } ioctl lock execute_no_trans };
+ #line 146
+ checkpolicy:  error(s) encountered while parsing configuration
+ make[1]: *** [Rules.monolithic:80: policy.33] Error 1
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a01123de9a8c1927060e7e4748666bebfc82ea44
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/SELinuxProject/refpolicy/pull/738
+---
+ policy/modules/services/smartmon.te | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/policy/modules/services/smartmon.te b/policy/modules/services/smartmon.te
+index 32c80f712..761280c11 100644
+--- a/policy/modules/services/smartmon.te
++++ b/policy/modules/services/smartmon.te
+@@ -143,7 +143,9 @@ corenet_tcp_connect_http_port(smartmon_update_drivedb_t)
+ 
+ files_read_etc_files(smartmon_update_drivedb_t)
+ 
+-fstools_exec(smartmon_update_drivedb_t)
++optional_policy(`
++	fstools_exec(smartmon_update_drivedb_t)
++')
+ 
+ kernel_dontaudit_read_system_state(smartmon_update_drivedb_t)
+ 
+-- 
+2.42.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
