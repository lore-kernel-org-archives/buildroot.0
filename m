Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40864C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 19:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5AAE811CB;
	Fri, 12 Jul 2024 19:53:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OmNR32oOxxJ6; Fri, 12 Jul 2024 19:53:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF23080F3F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF23080F3F;
	Fri, 12 Jul 2024 19:53:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CCDD61BF279
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3463406D4
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:53:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ETojUdC9bnNn for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 19:53:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4632940733
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4632940733
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 19:53:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 330A586168; Fri, 12 Jul 2024 19:53:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 21:53:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a5327724686a1ba719d37caff5986f241993b500
X-Git-Newrev: 408352207c18084c331b23aa739cde98cd52d000
X-Patchwork-Hint: ignore
Message-Id: <20240712195345.330A586168@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tcf-agent: fix uClibc-ng compile
 on ARM
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=408352207c18084c331b23aa739cde98cd52d000
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When a shared build is used, we can use getauxval and no ARM only
instuctions are in use.

When a static build is used, we need to override CFLAGS to use
arm instructions, as uClibc-ng only supports getauxval for shared case.

Fixes:
 - http://autobuild.buildroot.net/results/3b5/3b5c5519a3e5ee490308bc1a1b9579ce13417235

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/tcf-agent/0001-fix-uClibc-ng-compile.patch | 27 ++++++++++++++++++++++
 package/tcf-agent/tcf-agent.mk                     |  7 ++++++
 2 files changed, 34 insertions(+)

diff --git a/package/tcf-agent/0001-fix-uClibc-ng-compile.patch b/package/tcf-agent/0001-fix-uClibc-ng-compile.patch
new file mode 100644
index 0000000000..b8f46f3c48
--- /dev/null
+++ b/package/tcf-agent/0001-fix-uClibc-ng-compile.patch
@@ -0,0 +1,27 @@
+From a78007cd139e1dea3d893f5fe1d1c3a47503e6a2 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Sat, 12 Aug 2023 18:27:02 +0200
+Subject: [PATCH] fix uClibc-ng compile
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: N/A only mail available
+---
+ agent/machine/arm/tcf/cpudefs-mdep.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/agent/machine/arm/tcf/cpudefs-mdep.c b/agent/machine/arm/tcf/cpudefs-mdep.c
+index 051631a0..7c4fbf3e 100644
+--- a/agent/machine/arm/tcf/cpudefs-mdep.c
++++ b/agent/machine/arm/tcf/cpudefs-mdep.c
+@@ -21,7 +21,7 @@
+ 
+ #ifndef USE_getauxval
+ #  include <features.h>
+-#  define USE_getauxval (defined(__GLIBC__) && (__GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 16)))
++#  define USE_getauxval (defined(__GLIBC__) && (__GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 16)) || (defined(__UCLIBC__) && defined(__HAVE_SHARED__)))
+ #endif
+ 
+ #include <stddef.h>
+-- 
+2.39.2
+
diff --git a/package/tcf-agent/tcf-agent.mk b/package/tcf-agent/tcf-agent.mk
index 9d955d4b6f..cc998d82d6 100644
--- a/package/tcf-agent/tcf-agent.mk
+++ b/package/tcf-agent/tcf-agent.mk
@@ -20,6 +20,13 @@ TCF_AGENT_CONF_OPTS = \
 	-DBUILD_SHARED_LIBS=OFF \
 	-DTCF_MACHINE=$(call qstrip,$(BR2_PACKAGE_TCF_AGENT_ARCH))
 
+# tcf-agent uses some arm instructions in case getauxval is not available.
+# unfortunately the uClibc-ng implementation of getauxval uses some features
+# of ld.so to work
+ifeq ($(BR2_STATIC_LIBS)$(BR2_TOOLCHAIN_USES_UCLIBC)$(BR2_ARM_INSTRUCTIONS_THUMB),yyy)
+TCF_AGENT_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -marm"
+endif
+
 define TCF_AGENT_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/tcf-agent/tcf-agent.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/tcf-agent.service
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
