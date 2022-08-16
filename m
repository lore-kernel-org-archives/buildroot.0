Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65ABDC2BB41
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 08:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1792660F48;
	Tue, 16 Aug 2022 08:35:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1792660F48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MIPrDjS5XbzN; Tue, 16 Aug 2022 08:35:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C44260E72;
	Tue, 16 Aug 2022 08:35:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C44260E72
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0CE311BF9C2
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 08:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E92EB40641
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 08:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E92EB40641
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VTKJg3-2EnZK for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 08:35:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A1184063E
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 08:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A1184063E
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1F619876B8; Tue, 16 Aug 2022 08:20:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 16 Aug 2022 10:32:05 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 64273340d024a9c2c70a501248e5961b5cff1dd6
X-Git-Newrev: e0893d5b381e02ceeefb15f7c9e88d5fac13f54c
X-Patchwork-Hint: ignore
Message-Id: <20220816082039.1F619876B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/kvm-unit-tests:
 Completely disable the tests on big endian ARM
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

commit: https://git.buildroot.net/buildroot/commit/?id=e0893d5b381e02ceeefb15f7c9e88d5fac13f54c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Though the code compiles with a big endian toolchain, the kvm-unit-tests
do not work at all in big endian mode on ARM. Until someone steps up to
fix this, disable the package completely on big endian ARM targets.

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit b4f8c41b5ecde0b5351042450cc41f9e24e316fc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kvm-unit-tests/Config.in | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/kvm-unit-tests/Config.in b/package/kvm-unit-tests/Config.in
index 2b797e13b4..7658877ce9 100644
--- a/package/kvm-unit-tests/Config.in
+++ b/package/kvm-unit-tests/Config.in
@@ -1,12 +1,13 @@
 config BR2_PACKAGE_KVM_UNIT_TESTS_ARCH_SUPPORTS
 	bool
-	# On ARM, it uses virtualization extensions
-	default y if BR2_cortex_a7 || BR2_cortex_a12 || \
+	# On ARM, it needs virtualization extensions and little endian CPUs
+	default y if (BR2_arm || BR2_aarch64) && \
+		(BR2_cortex_a7 || BR2_cortex_a12 || \
 		BR2_cortex_a15 || BR2_cortex_a15_a7 || \
 		BR2_cortex_a17 || BR2_cortex_a17_a7 || \
 		BR2_cortex_a55 || BR2_cortex_a75 || \
 		BR2_cortex_a75_a55 || BR2_cortex_a76 || \
-		BR2_cortex_a76_a55
+		BR2_cortex_a76_a55)
 	default y if BR2_i386 || BR2_x86_64
 	default y if BR2_powerpc64 || BR2_powerpc64le
 	default y if BR2_s390x
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
