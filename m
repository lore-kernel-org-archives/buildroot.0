Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397E4C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4CCD42AA9;
	Mon, 20 Feb 2023 21:08:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4CCD42AA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EJvnCMeBrwES; Mon, 20 Feb 2023 21:08:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4137C42AB2;
	Mon, 20 Feb 2023 21:08:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4137C42AB2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2BF831BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 298C640C31
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 298C640C31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AfprcIahq-BS for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0A0C40C1B
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0A0C40C1B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD37286494; Mon, 20 Feb 2023 20:51:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 11 Nov 2022 23:50:53 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: dfbdb72103dff293fc7688872de91aaa9469d559
X-Git-Newrev: a378178cdd93a7b8d2c83d091b61478440f331a0
X-Patchwork-Hint: ignore
Message-Id: <20230220205149.CD37286494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lxc: fix systemd build
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

commit: https://git.buildroot.net/buildroot/commit/?id=a378178cdd93a7b8d2c83d091b61478440f331a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix the following systemd build failure raised since bump to version
5.0.1 in commit db19998035701d08bf1b5fd366e0b5aa9adb8e57:

../src/lxc/cgroups/cgfsng.c: In function 'unpriv_systemd_create_scope':
../src/lxc/cgroups/cgfsng.c:1234:104: error: incompatible type for argument 10 of 'sd_bus_call_method_asyncv'
 r = sd_bus_call_method_asyncv(bus, NULL, DESTINATION, PATH, INTERFACE, "Subscribe", NULL, NULL, NULL, NULL);
                                                                                                       ^~~~

Fixes:
 - https://gitlab.com/buildroot.org/buildroot/-/jobs/3282261449

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ll_method_async-to-replace-the-asyncv-one.patch | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/package/lxc/0002-use-sd_bus_call_method_async-to-replace-the-asyncv-one.patch b/package/lxc/0002-use-sd_bus_call_method_async-to-replace-the-asyncv-one.patch
new file mode 100644
index 0000000000..22013cb363
--- /dev/null
+++ b/package/lxc/0002-use-sd_bus_call_method_async-to-replace-the-asyncv-one.patch
@@ -0,0 +1,47 @@
+From b0abedf60b40adf0f2fb3cf9dfee4bc601f7b39f Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Thu, 25 Aug 2022 05:45:53 -0700
+Subject: [PATCH] use sd_bus_call_method_async to replace the asyncv one
+
+The sd_bus_call_method_asyncv's 10th parameter is of type
+va_list and supplying NULL when invoking it causes compilation
+error. Just replace it with the async one.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+[Retrieved from:
+https://github.com/lxc/lxc/commit/b0abedf60b40adf0f2fb3cf9dfee4bc601f7b39f]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ meson.build              | 4 ++--
+ src/lxc/cgroups/cgfsng.c | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 21955a0504..f8bdcf4e83 100644
+--- a/meson.build
++++ b/meson.build
+@@ -295,9 +295,9 @@ if not want_sd_bus.disabled()
+         has_sd_bus = false
+     endif
+ 
+-    if not cc.has_function('sd_bus_call_method_asyncv', prefix: '#include <systemd/sd-bus.h>', dependencies: libsystemd) 
++    if not cc.has_function('sd_bus_call_method_async', prefix: '#include <systemd/sd-bus.h>', dependencies: libsystemd) 
+         if not sd_bus_optional
+-            error('libsystemd misses required sd_bus_call_method_asyncv function')
++            error('libsystemd misses required sd_bus_call_method_async function')
+         endif
+ 
+         has_sd_bus = false
+diff --git a/src/lxc/cgroups/cgfsng.c b/src/lxc/cgroups/cgfsng.c
+index 8a3615893f..d90e5385e1 100644
+--- a/src/lxc/cgroups/cgfsng.c
++++ b/src/lxc/cgroups/cgfsng.c
+@@ -1232,7 +1232,7 @@ static int unpriv_systemd_create_scope(struct cgroup_ops *ops, struct lxc_conf *
+ 	if (r < 0)
+ 		return log_error(SYSTEMD_SCOPE_FAILED, "Failed to connect to user bus: %s", strerror(-r));
+ 
+-	r = sd_bus_call_method_asyncv(bus, NULL, DESTINATION, PATH, INTERFACE, "Subscribe", NULL, NULL, NULL, NULL);
++	r = sd_bus_call_method_async(bus, NULL, DESTINATION, PATH, INTERFACE, "Subscribe", NULL, NULL, NULL);
+ 	if (r < 0)
+ 		return log_error(SYSTEMD_SCOPE_FAILED, "Failed to subscribe to signals: %s", strerror(-r));
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
