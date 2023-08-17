Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA9DC3062E
	for <buildroot@archiver.kernel.org>; Thu, 17 Aug 2023 14:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7FD340272;
	Thu, 17 Aug 2023 14:51:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7FD340272
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LXzUJW-zbksj; Thu, 17 Aug 2023 14:51:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFF4A418BD;
	Thu, 17 Aug 2023 14:51:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFF4A418BD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 194EE1BF3BC
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 14:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4BE9418BD
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 14:51:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4BE9418BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K6vm0GKN-URM for <buildroot@lists.busybox.net>;
 Thu, 17 Aug 2023 14:51:41 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4FA7240272
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 14:51:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FA7240272
Received: by helium.openadk.org (Postfix, from userid 1000)
 id CD933352BDB7; Thu, 17 Aug 2023 16:51:38 +0200 (CEST)
Date: Thu, 17 Aug 2023 16:51:38 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZN4z+n37WMFvHgsF@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1692283898; bh=W2lCJhuajJBTkFheSBicMO4V8A4azYRnqpARJDJoTvo=;
 h=Date:From:To:Cc:Subject:From;
 b=SF0fELA2lOlUYizcD7TFRNHBk8Ju87fsmLSoWG0cnX4eRTzKqH9GfyE0pxgGQg4J9
 RA4k7jlP3NtlajAEIYFCxj1CuKKUWrY3P2XI2mQ/MrH83z8wRZoozufUw5udUO2tPZ
 OxWByMrwSEYDgDMfrMUlWWRMr2n/KhFX5Ndn8os9aOK13OSziUDekLaYRg0agn9jVW
 QPFplqkNHXMtCebZqaLaVj16p5dJEc0tmi6V0Y/BrP7DtS959Jj74rGwiWECiEFZqF
 X5R64QxHE2qnud45cVzWZmsd9ZUc0W5b2yCq1aMgbiuW9JfaMXLix64nTrX3nljxh/
 gKaS/pr1V+8KQ==
Subject: [Buildroot] [PATCHv2 2/2] package/tcf-agent: fix uClibc-ng compile
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
Cc: Eugene Tarassov <eugene@largest.net>, Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When a shared build is used, we can use getauxval and no ARM only
instuctions are in use.

When a static build is used, we need to override CFLAGS to use
arm instructions, as uClibc-ng only supports getauxval for shared case.

Fixes:
 - http://autobuild.buildroot.net/results/3b5/3b5c5519a3e5ee490308bc1a1b9579ce13417235

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1 -> v2:
  - musl is not affected, change requested by Thomas Petazzoni

---
 .../0001-fix-uClibc-ng-compile.patch          | 27 +++++++++++++++++++
 package/tcf-agent/tcf-agent.mk                |  7 +++++
 2 files changed, 34 insertions(+)
 create mode 100644 package/tcf-agent/0001-fix-uClibc-ng-compile.patch

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
index 2b8a61b66f..7c25df864a 100644
--- a/package/tcf-agent/tcf-agent.mk
+++ b/package/tcf-agent/tcf-agent.mk
@@ -21,6 +21,13 @@ TCF_AGENT_CONF_OPTS = \
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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
