Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D8FC43219
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 20:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B47AF405D4;
	Fri, 28 Jan 2022 20:09:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CfNry8koZuv3; Fri, 28 Jan 2022 20:09:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D21B405D0;
	Fri, 28 Jan 2022 20:09:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C8F6D1C1162
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 20:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B854F82883
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 20:08:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6n59pefQ9j5Y for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 20:08:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFDED828DE
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 20:08:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3524682B2E; Fri, 28 Jan 2022 20:01:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 21:05:18 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 15e3def173ba2013e50ab731560df57d48564e83
X-Git-Newrev: 62cdd112374c7a7bf5c83e5872811e5e3d53722c
X-Patchwork-Hint: ignore
Message-Id: <20220128200136.3524682B2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/gcc: define
 _REENTRANT for OpenRISC when -pthread is passed
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

commit: https://git.buildroot.net/buildroot/commit/?id=62cdd112374c7a7bf5c83e5872811e5e3d53722c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Patch added by commit eee96b0f0ad224b3e09a9b98c26d056e18f17fd5 on gcc
9.3.0 must also be applied on gcc 10 and 11 to avoid the following build
failure on numerous packages (babeltrace2, pcsc-lite, tpm2-pkcs11,
etc.):

configure:13774: checking whether pthreads work with -pthread
configure:13868: /home/giuliobenetti/autobuild/run/instance-0/output-1/host/bin/or1k-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g2  -std=gnu99 -pthread -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c   >&5
conftest.c:27:26: error: #error "_REENTRANT must be defined"
   27 | #                        error "_REENTRANT must be defined"
      |                          ^~~~~

It should be noted that external bootlins will have to be rebuilt.

Fixes:
 - http://autobuild.buildroot.org/results/cb58d4fbaeb08d188c2f8bf05ef1604789fa8766
 - http://autobuild.buildroot.org/results/7af9d4b68bd46ed260ed66ba2cc3c9c21482e741
 - http://autobuild.buildroot.org/results/6f926bec146752873f8032b593f0de1cb222ea46

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 98e39dc80ee81a166df90b4ff3232038a63b759c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ..._REENTRANT-for-OpenRISC-when-pthread-is-p.patch | 31 ++++++++++++++++++++++
 ..._REENTRANT-for-OpenRISC-when-pthread-is-p.patch | 31 ++++++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/package/gcc/10.3.0/0005-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch b/package/gcc/10.3.0/0005-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch
new file mode 100644
index 0000000000..5ac03d7c0c
--- /dev/null
+++ b/package/gcc/10.3.0/0005-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch
@@ -0,0 +1,31 @@
+From f80e9941739fb3973b61fc6a5abddef5ad2faf73 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Fri, 27 Mar 2020 21:23:53 +0100
+Subject: [PATCH] gcc: define _REENTRANT for OpenRISC when -pthread is passed
+
+The detection of pthread support fails on OpenRISC unless _REENTRANT
+is defined. Added the CPP_SPEC definition to correct this.
+
+Patch sent upstream: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=94372
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ gcc/config/or1k/linux.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/gcc/config/or1k/linux.h b/gcc/config/or1k/linux.h
+index cbdc781418f..36303af892c 100644
+--- a/gcc/config/or1k/linux.h
++++ b/gcc/config/or1k/linux.h
+@@ -32,6 +32,8 @@
+ #undef MUSL_DYNAMIC_LINKER
+ #define MUSL_DYNAMIC_LINKER  "/lib/ld-musl-or1k.so.1"
+ 
++#define CPP_SPEC "%{pthread:-D_REENTRANT}"
++
+ #undef LINK_SPEC
+ #define LINK_SPEC "%{h*}			\
+    %{static:-Bstatic}				\
+-- 
+2.31.1
+
diff --git a/package/gcc/11.2.0/0003-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch b/package/gcc/11.2.0/0003-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch
new file mode 100644
index 0000000000..5ac03d7c0c
--- /dev/null
+++ b/package/gcc/11.2.0/0003-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch
@@ -0,0 +1,31 @@
+From f80e9941739fb3973b61fc6a5abddef5ad2faf73 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Fri, 27 Mar 2020 21:23:53 +0100
+Subject: [PATCH] gcc: define _REENTRANT for OpenRISC when -pthread is passed
+
+The detection of pthread support fails on OpenRISC unless _REENTRANT
+is defined. Added the CPP_SPEC definition to correct this.
+
+Patch sent upstream: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=94372
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ gcc/config/or1k/linux.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/gcc/config/or1k/linux.h b/gcc/config/or1k/linux.h
+index cbdc781418f..36303af892c 100644
+--- a/gcc/config/or1k/linux.h
++++ b/gcc/config/or1k/linux.h
+@@ -32,6 +32,8 @@
+ #undef MUSL_DYNAMIC_LINKER
+ #define MUSL_DYNAMIC_LINKER  "/lib/ld-musl-or1k.so.1"
+ 
++#define CPP_SPEC "%{pthread:-D_REENTRANT}"
++
+ #undef LINK_SPEC
+ #define LINK_SPEC "%{h*}			\
+    %{static:-Bstatic}				\
+-- 
+2.31.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
