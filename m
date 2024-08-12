Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80983C52D7C
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 19:29:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F40F60759;
	Mon, 12 Aug 2024 19:29:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HdsYYTU0SDSi; Mon, 12 Aug 2024 19:28:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5041D60703
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5041D60703;
	Mon, 12 Aug 2024 19:28:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5D1A11BF59A
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 19:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47EBD60763
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 19:28:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uc7zJkHg1P5z for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 19:28:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65CF560703
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65CF560703
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 19:28:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E00B8531C; Mon, 12 Aug 2024 19:28:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 12 Aug 2024 21:27:50 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ab92eaa04bf8ec29dced04063ba1dc626b7d5789
X-Git-Newrev: 25ef4c7d708b882d0433fe1e82ae470135479469
X-Patchwork-Hint: ignore
Message-Id: <20240812192857.4E00B8531C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/uclibc: fix ARC build
 with 4.x kernel headers
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

commit: https://git.buildroot.net/buildroot/commit/?id=25ef4c7d708b882d0433fe1e82ae470135479469
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Provide correct grouping for preprocessor conditions to avoid building
ld.so with undefined macroses which are in use. This is a fix for
package/uclibc/0002-Fix-compilation-with-4.x-kernel-headers.patch.

Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...004-Fix-arc-build-with-4.x-kernel-headers.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/uclibc/0004-Fix-arc-build-with-4.x-kernel-headers.patch b/package/uclibc/0004-Fix-arc-build-with-4.x-kernel-headers.patch
new file mode 100644
index 0000000000..02a04a42dc
--- /dev/null
+++ b/package/uclibc/0004-Fix-arc-build-with-4.x-kernel-headers.patch
@@ -0,0 +1,35 @@
+From 1afc19eb6a7948afbcf3dd19091ce127a355ebcb Mon Sep 17 00:00:00 2001
+From: Dmitry Chestnykh <dm.chestnykh@gmail.com>
+Date: Sun, 28 Jul 2024 14:12:39 +0300
+Subject: [PATCH] [ldso] Group conditions after `&&`
+
+If the conditions are not grouped we can reach
+this block even if `__NR_stat` is not defined.
+
+`defined __NR_stat && ((!defined(__UCLIBC_USE_TIME64__) || defined(__sparc__))`
+gives us false but `LINUX_VERSION_CODE <= KERNEL_VERSION(5,1,0))`
+may give us true. So if linux headers version is below 5.1.0 and
+__NR_stat is not defined we can have compilation error
+
+Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>
+Upstream: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=841d0729883ee0de606de161c1d6a5c37cedf575
+---
+ ldso/include/dl-syscall.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ldso/include/dl-syscall.h b/ldso/include/dl-syscall.h
+index 9ec0eac60..180d03012 100644
+--- a/ldso/include/dl-syscall.h
++++ b/ldso/include/dl-syscall.h
+@@ -141,7 +141,7 @@ static __always_inline int _dl_stat(const char *file_name,
+ {
+ 	return _dl_newfstatat(AT_FDCWD, file_name, buf, 0);
+ }
+-#elif defined __NR_stat && (!defined(__UCLIBC_USE_TIME64__) || defined(__sparc__)) || (LINUX_VERSION_CODE <= KERNEL_VERSION(5,1,0))
++#elif defined __NR_stat && (!defined(__UCLIBC_USE_TIME64__) || defined(__sparc__) || (LINUX_VERSION_CODE <= KERNEL_VERSION(5,1,0)))
+ # define __NR__dl_stat __NR_stat
+ static __always_inline _syscall2(int, _dl_stat, const char *, file_name,
+                         struct stat *, buf)
+-- 
+2.45.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
