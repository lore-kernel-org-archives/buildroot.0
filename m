Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD3BC47074
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 21:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9362561B2F;
	Thu,  4 Jan 2024 21:45:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9362561B2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OlPlpJloSlCV; Thu,  4 Jan 2024 21:45:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBB5C61AED;
	Thu,  4 Jan 2024 21:45:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBB5C61AED
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8F8341BF859
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 686F642C8D
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:45:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 686F642C8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T8_C7FYRjiNt for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 21:45:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D5AE42C7D
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 21:45:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D5AE42C7D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 652F984188; Thu,  4 Jan 2024 21:45:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jan 2024 22:43:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e6ef64d955f34db773addad52c7af17e111d7f13
X-Git-Newrev: f5eba2ef3a5930cd05ad33741b83af02c1dbf42e
X-Patchwork-Hint: ignore
Message-Id: <20240104214527.652F984188@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cryptodev-linux: fix build with
 linux >= 6.4
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
Content-Type: multipart/mixed; boundary="===============0750528236569991003=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0750528236569991003==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f5eba2ef3a5930cd05ad33741b83af02c1dbf42e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with linux >= 6.4:

/home/autobuild/autobuild/instance-15/output-1/build/cryptodev-linux-1.13/./ioctl.c:1249:18: error: ‘struct ctl_table’ has no member named ‘child’
 1249 |                 .child          = verbosity_ctl_dir,
      |                  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/ecbf426f6b0ff920a51c1674b080c35edf5db859

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-zero-copy-Fix-build-for-Linux-6-4.patch   | 37 ++++++++++++++++++
 ...yptodev_verbosity-Fix-build-for-Linux-6-4.patch | 44 ++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/package/cryptodev-linux/0001-zero-copy-Fix-build-for-Linux-6-4.patch b/package/cryptodev-linux/0001-zero-copy-Fix-build-for-Linux-6-4.patch
new file mode 100644
index 0000000000..4bea55311c
--- /dev/null
+++ b/package/cryptodev-linux/0001-zero-copy-Fix-build-for-Linux-6-4.patch
@@ -0,0 +1,37 @@
+From 592017c3a910a3905b1925aee88c4674e9a596b7 Mon Sep 17 00:00:00 2001
+From: Gaurav Jain <gaurav.jain@nxp.com>
+Date: Tue, 30 May 2023 17:09:42 +0530
+Subject: [PATCH] zero copy: Fix build for Linux 6.4
+
+get_user_pages_remote api prototype is changed in kernel.
+struct vm_area_struct **vmas argument is removed.
+Migrate to the new API.
+
+Signed-off-by: Gaurav Jain <gaurav.jain@nxp.com>
+
+Upstream: https://github.com/cryptodev-linux/cryptodev-linux/commit/592017c3a910a3905b1925aee88c4674e9a596b7
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ zc.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/zc.c b/zc.c
+index fdf7da17..6637945a 100644
+--- a/zc.c
++++ b/zc.c
+@@ -80,10 +80,14 @@ int __get_userbuf(uint8_t __user *addr, uint32_t len, int write,
+ 	ret = get_user_pages_remote(task, mm,
+ 			(unsigned long)addr, pgcount, write ? FOLL_WRITE : 0,
+ 			pg, NULL, NULL);
+-#else
++#elif (LINUX_VERSION_CODE < KERNEL_VERSION(6, 4, 0))
+ 	ret = get_user_pages_remote(mm,
+ 			(unsigned long)addr, pgcount, write ? FOLL_WRITE : 0,
+ 			pg, NULL, NULL);
++#else
++	ret = get_user_pages_remote(mm,
++			(unsigned long)addr, pgcount, write ? FOLL_WRITE : 0,
++			pg, NULL);
+ #endif
+ #if (LINUX_VERSION_CODE < KERNEL_VERSION(5, 8, 0))
+ 	up_read(&mm->mmap_sem);
diff --git a/package/cryptodev-linux/0002-cryptodev_verbosity-Fix-build-for-Linux-6-4.patch b/package/cryptodev-linux/0002-cryptodev_verbosity-Fix-build-for-Linux-6-4.patch
new file mode 100644
index 0000000000..e6022c686f
--- /dev/null
+++ b/package/cryptodev-linux/0002-cryptodev_verbosity-Fix-build-for-Linux-6-4.patch
@@ -0,0 +1,44 @@
+From 99ae2a39ddc3f89c66d9f09783b591c0f2dbf2e9 Mon Sep 17 00:00:00 2001
+From: Gaurav Jain <gaurav.jain@nxp.com>
+Date: Wed, 28 Jun 2023 12:44:32 +0530
+Subject: [PATCH] cryptodev_verbosity: Fix build for Linux 6.4
+
+register_sysctl_table api is removed in kernel.
+migrate to the new api register_sysctl.
+
+child is also removed in linux 6.4 ctl_table struct.
+
+Signed-off-by: Gaurav Jain <gaurav.jain@nxp.com>
+
+Upstream: https://github.com/cryptodev-linux/cryptodev-linux/commit/99ae2a39ddc3f89c66d9f09783b591c0f2dbf2e9
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ ioctl.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/ioctl.c b/ioctl.c
+index 8f241b86..4262bbd5 100644
+--- a/ioctl.c
++++ b/ioctl.c
+@@ -1246,7 +1246,9 @@ static struct ctl_table verbosity_ctl_root[] = {
+ 	{
+ 		.procname       = "ioctl",
+ 		.mode           = 0555,
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(6, 4, 0))
+ 		.child          = verbosity_ctl_dir,
++#endif
+ 	},
+ 	{},
+ };
+@@ -1267,7 +1269,11 @@ static int __init init_cryptodev(void)
+ 		return rc;
+ 	}
+ 
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(6, 4, 0))
+ 	verbosity_sysctl_header = register_sysctl_table(verbosity_ctl_root);
++#else
++	verbosity_sysctl_header = register_sysctl(verbosity_ctl_root->procname, verbosity_ctl_dir);
++#endif
+ 
+ 	pr_info(PFX "driver %s loaded.\n", VERSION);
+ 

--===============0750528236569991003==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0750528236569991003==--
