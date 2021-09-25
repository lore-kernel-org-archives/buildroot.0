Return-Path: <SRS0=vewd=OP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03256C433F5
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 14:42:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C76D60249
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 14:42:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8C76D60249
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CF558266C;
	Sat, 25 Sep 2021 14:42:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HP6HJnHQ0SYX; Sat, 25 Sep 2021 14:41:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A339382425;
	Sat, 25 Sep 2021 14:41:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 850651BF868
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 14:41:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E24F6060C
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 14:41:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PLB004pdThIq for <buildroot@lists.busybox.net>;
 Sat, 25 Sep 2021 14:41:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABC5F60604
 for <buildroot@buildroot.org>; Sat, 25 Sep 2021 14:41:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 12FE78A3E4; Sat, 25 Sep 2021 14:39:45 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Sep 2021 16:40:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e7f084327335b569dd176d840809f545431e0dd2
X-Git-Newrev: 60f991e68cac30c3e9912e73258f7804e7021d5e
X-Patchwork-Hint: ignore
Message-Id: <20210925143945.12FE78A3E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/refpolicy: fix build with wireguard
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

commit: https://git.buildroot.net/buildroot/commit/?id=60f991e68cac30c3e9912e73258f7804e7021d5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with wireguard raised since bump to
version 2.20210908 in commit 78e0af476228ffacc83b4840d401a75eb5b625ff:

 Compiling targeted policy.33
 env LD_LIBRARY_PATH="/tmp/instance-0/output-1/host/lib:/tmp/instance-0/output-1/host/usr/lib" /tmp/instance-0/output-1/host/usr/bin/checkpolicy -c 33 -U deny -S -O -E policy.conf -o policy.33
 policy/modules/services/wireguard.te:66:ERROR 'type iptables_exec_t is not within scope' at token ';' on line 591892:
 #line 66
	allow wireguard_t iptables_exec_t:file { getattr open map read execute ioctl };
 checkpolicy:  error(s) encountered while parsing configuration
 make[1]: *** [Rules.monolithic:79: policy.33] Error 1

Fixes:
 - http://autobuild.buildroot.org/results/a4223accc6adb70b06fd4e74ca4f28484446b6fa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...les-services-wireguard.te-make-iptables-o.patch | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/package/refpolicy/0002-policy-modules-services-wireguard.te-make-iptables-o.patch b/package/refpolicy/0002-policy-modules-services-wireguard.te-make-iptables-o.patch
new file mode 100644
index 0000000000..4cd1f96558
--- /dev/null
+++ b/package/refpolicy/0002-policy-modules-services-wireguard.te-make-iptables-o.patch
@@ -0,0 +1,54 @@
+From 67394d078c2e1438293b25d08cf408b0b0d55755 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 22 Sep 2021 23:55:59 +0200
+Subject: [PATCH] policy/modules/services/wireguard.te: make iptables optional
+
+Make iptables optional to avoid the following build failure raised since
+version 2.20210908 and
+https://github.com/SELinuxProject/refpolicy/commit/7f1a7b1cacd5d211077ce62fbb4e91890e65c820:
+
+ Compiling targeted policy.33
+ env LD_LIBRARY_PATH="/tmp/instance-0/output-1/host/lib:/tmp/instance-0/output-1/host/usr/lib" /tmp/instance-0/output-1/host/usr/bin/checkpolicy -c 33 -U deny -S -O -E policy.conf -o policy.33
+ policy/modules/services/wireguard.te:66:ERROR 'type iptables_exec_t is not within scope' at token ';' on line 591892:
+ #line 66
+	allow wireguard_t iptables_exec_t:file { getattr open map read execute ioctl };
+ checkpolicy:  error(s) encountered while parsing configuration
+ make[1]: *** [Rules.monolithic:79: policy.33] Error 1
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a4223accc6adb70b06fd4e74ca4f28484446b6fa
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/SELinuxProject/refpolicy/pull/408]
+---
+ policy/modules/services/wireguard.te | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/policy/modules/services/wireguard.te b/policy/modules/services/wireguard.te
+index 7241f65e6..33fd3c55d 100644
+--- a/policy/modules/services/wireguard.te
++++ b/policy/modules/services/wireguard.te
+@@ -61,10 +61,6 @@ corecmd_exec_shell(wireguard_t)
+ 
+ domain_use_interactive_fds(wireguard_t)
+ 
+-# wg-quick can be configured to run iptables and other networking
+-# config tools when bringing up/down the wg interfaces
+-iptables_domtrans(wireguard_t)
+-
+ # wg-quick tries to read /proc/filesystem when running "stat" and "mv" commands
+ kernel_dontaudit_read_system_state(wireguard_t)
+ kernel_dontaudit_search_kernel_sysctl(wireguard_t)
+@@ -75,3 +71,9 @@ miscfiles_read_localization(wireguard_t)
+ sysnet_run_ifconfig(wireguard_t, wireguard_roles)
+ 
+ userdom_use_user_terminals(wireguard_t)
++
++# wg-quick can be configured to run iptables and other networking
++# config tools when bringing up/down the wg interfaces
++optional_policy(`
++	iptables_domtrans(wireguard_t)
++')
+-- 
+2.33.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
