Return-Path: <SRS0=3r6m=NL=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B39FC4338F
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 13:32:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 258D261131
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 13:32:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 258D261131
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB92F613FB;
	Fri, 20 Aug 2021 13:32:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Aua2PnmtMtOc; Fri, 20 Aug 2021 13:32:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F35E6613F0;
	Fri, 20 Aug 2021 13:32:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E881F1BF35C
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 13:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3D4A613F0
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 13:32:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0rwl1fcax25s for <buildroot@lists.busybox.net>;
 Fri, 20 Aug 2021 13:32:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from ch3vs05.rockwellcollins.com (ch3vs05.rockwellcollins.com
 [205.175.226.130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 238DB60034
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 13:32:34 +0000 (UTC)
IronPort-SDR: MBjuckM7Ld+nFx8Y3yK7uJ/eYHSQpxMsxfBOanCsjyLKisZD5kl3abFC9rq9QvoM94UM8sBOYc
 1o4jsx+2Qv5Oj4L7QrtxGbzalErSqRzeay4sAW8f/HQA4DfT7X3BAjQoXDNoEjp/VBUfiCLhND
 c5WAL3ISRS0B/QCGRXaEic/zvrv2z9mo2uAdHmibOQSYHMF+OLSzHfJ8aQW64msdGHU1s8uO2q
 hyTAWrEPFeDhlH6aN5xx8A2m9iVM7Vti5d8eeD7fd8/TiBgfsG/oprzsR+sjYiucqX8i/KxCnI
 npA=
Received: from ofwch3n02.rockwellcollins.com (HELO
 crulimr01.rockwellcollins.com) ([205.175.226.14])
 by ch3vs05.rockwellcollins.com with ESMTP; 20 Aug 2021 08:32:33 -0500
X-Received: from biscuits.rockwellcollins.com (biscuits.rockwellcollins.lab
 [10.148.119.137])
 by crulimr01.rockwellcollins.com (Postfix) with ESMTP id AFCBF60290;
 Fri, 20 Aug 2021 08:32:33 -0500 (CDT)
To: buildroot@buildroot.org
Date: Fri, 20 Aug 2021 08:32:32 -0500
Message-Id: <20210820133232.40519-1-matthew.weber@collins.com>
X-Mailer: git-send-email 2.17.1
Subject: [Buildroot] [PATCH] package/kvm-unit-tests: disable SSP
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
From: Matthew Weber via buildroot <buildroot@busybox.net>
Reply-To: Matthew Weber <matthew.weber@collins.com>
Cc: Matthew Weber <matthew.weber@collins.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

kvm-unit-tests shouldn't use stack-protector as the test suite is
building free standing binaries to test QEMU. There is no guarantee
that GCC has set a spec to filter out stack protector enabling with
-ffreestanding so disabling explicitly to prevent a series of build
failures.

Fixes:
http://autobuild.buildroot.net/results/780/780c8c70ea7015113714cbd3841d96b08bd2f2aa/

Signed-off-by: Matthew Weber <matthew.weber@collins.com>
---
 package/kvm-unit-tests/kvm-unit-tests.mk | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
index 2637066701..23241b453a 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.mk
+++ b/package/kvm-unit-tests/kvm-unit-tests.mk
@@ -35,15 +35,14 @@ KVM_UNIT_TESTS_CONF_OPTS =\
 # compiler. However, for x86-64, we use the host compiler, as
 # kvm-unit-tests builds 32 bit code, which Buildroot toolchains for
 # x86-64 cannot do.
-ifeq ($(BR2_x86_64),y)
-# Arch Linux adds -fstack-protector even when building with -ffreestanding, but
-# it doesn't link with the stack-protector library when -nostdlib is passed,
-# which leads to a link error. Therefore, disable it explicitly to work around
-# this bug in Arch Linux. https://bugs.archlinux.org/task/64270
-KVM_UNIT_TESTS_MAKE_OPTS += EXTRA_CFLAGS=-fno-stack-protector
-else
+ifneq ($(BR2_x86_64),y)
 KVM_UNIT_TESTS_CONF_OPTS += --cross-prefix="$(TARGET_CROSS)"
 endif
+# kvm-unit-tests shouldn't use stack-protector as the test suite is building
+# free standing binaries to test QEMU. There is no guarantee that GCC has
+# set a spec to filter out stack protector enabling with -ffreestanding so
+# disabling explicitly to prevent a series of build failures.
+KVM_UNIT_TESTS_MAKE_OPTS += EXTRA_CFLAGS=-fno-stack-protector
 
 define KVM_UNIT_TESTS_CONFIGURE_CMDS
 	cd $(@D) && ./configure $(KVM_UNIT_TESTS_CONF_OPTS)
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
