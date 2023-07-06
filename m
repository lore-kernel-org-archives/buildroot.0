Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC0BFEB64D9
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 11:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B8BC40A6B;
	Thu,  6 Jul 2023 11:52:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B8BC40A6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kBFzYol8u68j; Thu,  6 Jul 2023 11:52:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61AC241558;
	Thu,  6 Jul 2023 11:52:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61AC241558
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1634E1BF345
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 11:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E49A660B9A
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 11:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E49A660B9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tEK0PrlQVkDg for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 11:51:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9CD860B45
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 11:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9CD860B45
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA57A868F0; Thu,  6 Jul 2023 11:51:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Jul 2023 13:48:52 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 1d030119fc6571b615fb8bf7b65d286ff7e56df2
X-Git-Newrev: 3e7f940caa89b26ea69d3067b0de23bf57681b58
X-Patchwork-Hint: ignore
Message-Id: <20230706115153.DA57A868F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/dahdi-linux: fix
 build with kernel >= 6.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=3e7f940caa89b26ea69d3067b0de23bf57681b58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Fixes:
http://autobuild.buildroot.net/results/2bb/2bb8a38b12cb3a7650162f1f7f65b56b20711d64/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 840b5527466502f02b86c95f9bf95557d35c8571)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...005-drivers-dahdi-fix-build-with-clang-16.patch | 106 +++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/package/dahdi-linux/0005-drivers-dahdi-fix-build-with-clang-16.patch b/package/dahdi-linux/0005-drivers-dahdi-fix-build-with-clang-16.patch
new file mode 100644
index 0000000000..535e1628c9
--- /dev/null
+++ b/package/dahdi-linux/0005-drivers-dahdi-fix-build-with-clang-16.patch
@@ -0,0 +1,106 @@
+From d51c10dae5a06709983b929fc6f9fb18eec41951 Mon Sep 17 00:00:00 2001
+From: Brahmajit Das <brahmajit.xyz@gmail.com>
+Date: Thu, 22 Jun 2023 15:52:18 +0000
+Subject: [PATCH] drivers/dahdi: fix build with clang-16
+
+clang-16 enables -Werror=incompatible-pointer-types (along with buch of
+other warnings) by default, thus resulting in errors such as:
+
+/var/tmp/portage/net-misc/dahdi-3.2.0/work/dahdi-linux-3.2.0/drivers/dahdi/dahdi-sysfs.c:272:20: error: incompatible function
+      pointer types initializing 'int (*)(const struct device *, struct kobj_uevent_env *)' with an expression of type
+      'int (struct device *, struct kobj_uevent_env *)' [-Wincompatible-function-pointer-types]
+        .uevent         = span_uevent,
+                          ^~~~~~~~~~~
+/var/tmp/portage/net-misc/dahdi-3.2.0/work/dahdi-linux-3.2.0/drivers/dahdi/dahdi-sysfs.c:709:20: error: incompatible function
+      pointer types initializing 'int (*)(const struct device *, struct kobj_uevent_env *)' with an expression of type
+      'int (struct device *, struct kobj_uevent_env *)' [-Wincompatible-function-pointer-types]
+        .uevent         = device_uevent,
+                          ^~~~~~~~~~~~~
+2 errors generated.
+
+This is due the change in bus_type strcut made in upstream commit
+https://github.com/torvalds/linux/commit/2a81ada32f0e584fc0c943e0d3a8c9f4fae411d6.
+Where they make uevent take a const *, as the strcut should not be
+modifying the device that is passed into it.
+
+This patch modifes some of the fucntions parameter types, making dahdi
+possible to be built with clang-16.
+
+Bug: https://bugs.gentoo.org/906179
+Signed-off-by: Brahmajit Das <brahmajit.xyz@gmail.com>
+
+Upstream: https://github.com/asterisk/dahdi-linux/pull/21
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ drivers/dahdi/dahdi-sysfs.c    | 8 ++++----
+ drivers/dahdi/wctc4xxp/base.c  | 2 +-
+ drivers/dahdi/xpp/xbus-sysfs.c | 2 +-
+ 3 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/drivers/dahdi/dahdi-sysfs.c b/drivers/dahdi/dahdi-sysfs.c
+index ca29ddba..0c5bd982 100644
+--- a/drivers/dahdi/dahdi-sysfs.c
++++ b/drivers/dahdi/dahdi-sysfs.c
+@@ -47,7 +47,7 @@ static int span_match(struct device *dev, struct device_driver *driver)
+ 	return 1;
+ }
+ 
+-static inline struct dahdi_span *dev_to_span(struct device *dev)
++static inline struct dahdi_span *dev_to_span(const struct device *dev)
+ {
+ 	return dev_get_drvdata(dev);
+ }
+@@ -68,7 +68,7 @@ static inline struct dahdi_span *dev_to_span(struct device *dev)
+ 			return err;				\
+ 	} while (0)
+ 
+-static int span_uevent(struct device *dev, struct kobj_uevent_env *kenv)
++static int span_uevent(const struct device *dev, struct kobj_uevent_env *kenv)
+ {
+ 	struct dahdi_span *span;
+ 
+@@ -415,7 +415,7 @@ static struct {
+ 	unsigned int clean_chardev:1;
+ } should_cleanup;
+ 
+-static inline struct dahdi_device *to_ddev(struct device *dev)
++static inline struct dahdi_device *to_ddev(const struct device *dev)
+ {
+ 	return container_of(dev, struct dahdi_device, dev);
+ }
+@@ -438,7 +438,7 @@ static inline struct dahdi_device *to_ddev(struct device *dev)
+ 			return err;				\
+ 	} while (0)
+ 
+-static int device_uevent(struct device *dev, struct kobj_uevent_env *kenv)
++static int device_uevent(const struct device *dev, struct kobj_uevent_env *kenv)
+ {
+ 	struct dahdi_device *ddev;
+ 
+diff --git a/drivers/dahdi/wctc4xxp/base.c b/drivers/dahdi/wctc4xxp/base.c
+index ec6fc436..db70ea7e 100644
+--- a/drivers/dahdi/wctc4xxp/base.c
++++ b/drivers/dahdi/wctc4xxp/base.c
+@@ -643,7 +643,7 @@ wctc4xxp_net_register(struct wcdte *wc)
+ 		return -ENOMEM;
+ 	priv = netdev_priv(netdev);
+ 	priv->wc = wc;
+-	memcpy(netdev->dev_addr, our_mac, sizeof(our_mac));
++	memcpy((void *)netdev->dev_addr, our_mac, sizeof(our_mac));
+ 
+ #	ifdef HAVE_NET_DEVICE_OPS
+ 	netdev->netdev_ops = &wctc4xxp_netdev_ops;
+diff --git a/drivers/dahdi/xpp/xbus-sysfs.c b/drivers/dahdi/xpp/xbus-sysfs.c
+index d8c11dc3..29ad3619 100644
+--- a/drivers/dahdi/xpp/xbus-sysfs.c
++++ b/drivers/dahdi/xpp/xbus-sysfs.c
+@@ -418,7 +418,7 @@ static int astribank_match(struct device *dev, struct device_driver *driver)
+ 			return err;				\
+ 	} while (0)
+ 
+-static int astribank_uevent(struct device *dev, struct kobj_uevent_env *kenv)
++static int astribank_uevent(const struct device *dev, struct kobj_uevent_env *kenv)
+ {
+ 	xbus_t *xbus;
+ 	extern char *initdir;
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
