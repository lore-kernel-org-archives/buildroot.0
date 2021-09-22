Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86672C433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 19:28:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AB8E610A1
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 19:28:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4AB8E610A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23EC0614DA;
	Wed, 22 Sep 2021 19:28:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D-I92XQJgubf; Wed, 22 Sep 2021 19:28:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62C66614CB;
	Wed, 22 Sep 2021 19:28:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5F0F91BF321
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 19:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2C9A41596
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 19:28:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wbsAxF89etqu for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 19:28:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C405441594
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 19:28:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A35CD8C9E3; Wed, 22 Sep 2021 19:26:12 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 22 Sep 2021 21:14:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f0e204d99b1830cec4426ab28089777cb4ddedb8
X-Git-Newrev: 071eea24aa38f6d15de3041320c52784897183dc
X-Patchwork-Hint: ignore
Message-Id: <20210922192612.A35CD8C9E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iwd: fix build with uclibc-ng
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=071eea24aa38f6d15de3041320c52784897183dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with uclibc-ng raised since bump to
version 1.17 in commit 9badccc9d4887aa2365d7350e3b26bd4250dad48:

/home/giuliobenetti/autobuild/run/instance-3/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: src/sae.o: in function `sae_rx_authenticate':
sae.c:(.text+0xd74): undefined reference to `reallocarray'

Fixes:
 - http://autobuild.buildroot.org/results/c6d3f86282c44645b4f1c61882dc63ccfc8eb35a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-build-Add-reallocarray-to-missing-h.patch | 55 ++++++++++++++++++++++
 package/iwd/iwd.mk                                 |  2 +
 2 files changed, 57 insertions(+)

diff --git a/package/iwd/0001-build-Add-reallocarray-to-missing-h.patch b/package/iwd/0001-build-Add-reallocarray-to-missing-h.patch
new file mode 100644
index 0000000000..ef6114f1af
--- /dev/null
+++ b/package/iwd/0001-build-Add-reallocarray-to-missing-h.patch
@@ -0,0 +1,55 @@
+From ec1c348b4fd67619fa0c2f55ae644f6a8014d971 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 19 Sep 2021 21:17:44 +0200
+Subject: build: Add reallocarray to missing.h
+
+reallocarray has been added to glibc relatively recently (version 2.26,
+from 2017) and apparently not all users run new enough glibc. Moreover,
+reallocarray is not available with uclibc-ng. So use realloc if
+reallocarray is not available to avoid the following build failure
+raised since commit 891b78e9e892a3bcd800eb3a298e6380e9a15dd1:
+
+/home/giuliobenetti/autobuild/run/instance-3/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: src/sae.o: in function `sae_rx_authenticate':
+sae.c:(.text+0xd74): undefined reference to `reallocarray'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/c6d3f86282c44645b4f1c61882dc63ccfc8eb35a
+
+[Retrieved from:
+https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=ec1c348b4fd67619fa0c2f55ae644f6a8014d971]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac  | 1 +
+ src/missing.h | 7 +++++++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index c6250401..51d9da93 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -129,6 +129,7 @@ AC_DEFINE_UNQUOTED(WIRED_STORAGEDIR, "${wired_storagedir}",
+ 
+ AC_CHECK_FUNCS(explicit_bzero)
+ AC_CHECK_FUNCS(rawmemchr)
++AC_CHECK_FUNCS(reallocarray)
+ 
+ AC_CHECK_HEADERS(linux/types.h linux/if_alg.h)
+ 
+diff --git a/src/missing.h b/src/missing.h
+index 2cc80aee..a5b92952 100644
+--- a/src/missing.h
++++ b/src/missing.h
+@@ -37,3 +37,10 @@ _Pragma("GCC diagnostic ignored \"-Wstringop-overflow=\"")
+ _Pragma("GCC diagnostic pop")
+ }
+ #endif
++
++#ifndef HAVE_REALLOCARRAY
++static inline void *reallocarray(void *ptr, size_t nmemb, size_t size)
++{
++	return realloc(ptr, nmemb * size);
++}
++#endif
+-- 
+cgit 1.2.3-1.el7
+
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 9737f2c626..58535b1aa1 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -12,6 +12,8 @@ IWD_LICENSE_FILES = COPYING
 IWD_CPE_ID_VENDOR = intel
 IWD_CPE_ID_PRODUCT = inet_wireless_daemon
 IWD_SELINUX_MODULES = networkmanager
+# We're patching configure.ac
+IWD_AUTORECONF = YES
 
 IWD_CONF_OPTS = \
 	--disable-manual-pages \
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
