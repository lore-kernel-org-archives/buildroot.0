Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFC9C001DB
	for <buildroot@archiver.kernel.org>; Sun, 13 Aug 2023 07:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCEA6813F5;
	Sun, 13 Aug 2023 07:23:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCEA6813F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bH0HqW96jkTf; Sun, 13 Aug 2023 07:23:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A36D813C6;
	Sun, 13 Aug 2023 07:23:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A36D813C6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 26D711BF470
 for <buildroot@lists.busybox.net>; Sun, 13 Aug 2023 07:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E717A60B1B
 for <buildroot@lists.busybox.net>; Sun, 13 Aug 2023 07:23:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E717A60B1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UkSXYDso4gVT for <buildroot@lists.busybox.net>;
 Sun, 13 Aug 2023 07:23:47 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E3D0260808
 for <buildroot@buildroot.org>; Sun, 13 Aug 2023 07:23:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3D0260808
Received: by helium.openadk.org (Postfix, from userid 1000)
 id CF292352BD3A; Sun, 13 Aug 2023 09:23:44 +0200 (CEST)
Date: Sun, 13 Aug 2023 09:23:44 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZNiFAM4q72gwMume@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1691911424; bh=B7A9iAQxHwL+ZfAPfXf5XsfskB84T+LEBmCVT4TKZEM=;
 h=Date:From:To:Cc:Subject:From;
 b=GnJeJ2MsAt6p2tEFYHL5Px1hJF/q+OK1ee3f/Kg9iZMoEIcyW/7r/9K/Tm0pjLtL+
 0kpjJ+oRMv8SxsS5L6LBpWjaG2l6YbCd9kRo755tH2uVLpdA9cYNCz1mm2M3XfEEnm
 GWmDrkwVJ9lA8fMLQe1rt2A8sO93fDEewxgUE+8p+tCfABLMxhCTkJq+ilP3En5t33
 Kd4s2KVXMI/EJpYu+KhUXKXYB55MXkHh05R0vWX2Oopzbr83GclMSx9DiRTehm6g5Z
 gJCqIRiPVhDHMQd9RJ5dskJnLrpbzgcxx6ep+JywrVqi7AOg2cTvT21tHl37Qf3t+d
 RnTksUjMXniJA==
Subject: [Buildroot] [PATCH 2/2] package/tcf-agent: fix uClibc-ng compile on
 ARM
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

When a static build is used, we need to override, as uClibc-ng only
supports getauxval for shared case.

Fixes:
 - http://autobuild.buildroot.net/results/3b5/3b5c5519a3e5ee490308bc1a1b9579ce13417235

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 .../0001-fix-uClibc-ng-compile.patch          | 27 +++++++++++++++++++
 package/tcf-agent/tcf-agent.mk                |  6 +++++
 2 files changed, 33 insertions(+)
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
index 2b8a61b66f..7859d0ed43 100644
--- a/package/tcf-agent/tcf-agent.mk
+++ b/package/tcf-agent/tcf-agent.mk
@@ -21,6 +21,12 @@ TCF_AGENT_CONF_OPTS = \
 	-DBUILD_SHARED_LIBS=OFF \
 	-DTCF_MACHINE=$(call qstrip,$(BR2_PACKAGE_TCF_AGENT_ARCH))
 
+ifeq ($(BR2_STATIC_LIBS),y)
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+TCF_AGENT_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -marm"
+endif
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
