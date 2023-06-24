Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D127EB64DA
	for <buildroot@archiver.kernel.org>; Sat, 24 Jun 2023 07:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CE71415C9;
	Sat, 24 Jun 2023 07:52:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CE71415C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id enYM7Bpr5pnH; Sat, 24 Jun 2023 07:52:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF843418E2;
	Sat, 24 Jun 2023 07:52:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF843418E2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 14ACE1BF2C8
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 07:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E209082053
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 07:52:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E209082053
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rvwWdFo9pZO1 for <buildroot@lists.busybox.net>;
 Sat, 24 Jun 2023 07:52:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C166E82071
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C166E82071
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 07:52:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 73C69A4C0A07;
 Sat, 24 Jun 2023 09:52:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48236)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qCy3z-0006mL-0D;
 Sat, 24 Jun 2023 09:52:07 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 24 Jun 2023 09:52:07 +0200
Message-Id: <20230624075207.403264-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1687593127;
 bh=f5l9WVWSFHIaDd76Iz4VCN9TUuilaRaHbvS+DpwU+14=;
 h=From:To:Cc:Subject:Date:From;
 b=S+B3SFfKQGNyyDPlYDkqgKPc3j4Exi2zAEb31LqV9DMpUcMQNN5XTJK48Rh1UxGZQ
 v0EPlCqdp8ULS13ClvarOHSON1haLQ5nad7vBqdvf8W56ONFKaNkZlqNxsimkodv1H
 1iuUDzPnbENYx0VtXAWQQqEe19ZjmyGbwzMPXuSm9bUAfF63uuhhVw1MSPjKDNWUyo
 lfZfXNt4NigSK5d5j8UAMg12wfH8j81OgIVhlXQN2XE1CfmciXN8YniEjcrdi3Ov+s
 adMfngeAJA6Ycy8YRvU0UVtYy4i6vj4UgnOs4nFBHNGkcP3vzH8k1lf8sqzixcnr8h
 jJM+ybOjAjTDA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=S+B3SFfK
Subject: [Buildroot] [PATCH 1/1] package/dahdi-linux: fix build with kernel
 >= 6.3
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/2bb/2bb8a38b12cb3a7650162f1f7f65b56b20711d64/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...rivers-dahdi-fix-build-with-clang-16.patch | 106 ++++++++++++++++++
 1 file changed, 106 insertions(+)
 create mode 100644 package/dahdi-linux/0005-drivers-dahdi-fix-build-with-clang-16.patch

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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
