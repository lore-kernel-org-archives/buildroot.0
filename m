Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE76DC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 19:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 514CE60F48;
	Sat, 23 Jul 2022 19:11:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 514CE60F48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SPl7tcnZBhVS; Sat, 23 Jul 2022 19:11:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AB7360E62;
	Sat, 23 Jul 2022 19:11:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AB7360E62
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A7EFC1BF5A5
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81AF941696
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:11:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81AF941696
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 59l-80p4wn07 for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 19:11:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C03F64168B
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:11:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C03F64168B
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4F34884A59; Sat, 23 Jul 2022 18:57:32 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 21:10:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b8dbcf8c8fa8e532b2d73525f5b7e826022ccc3c
X-Git-Newrev: b4f8c41b5ecde0b5351042450cc41f9e24e316fc
X-Patchwork-Hint: ignore
Message-Id: <20220723185732.4F34884A59@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kvm-unit-tests: Completely disable
 the tests on big endian ARM
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

commit: https://git.buildroot.net/buildroot/commit/?id=b4f8c41b5ecde0b5351042450cc41f9e24e316fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Though the code compiles with a big endian toolchain, the kvm-unit-tests
do not work at all in big endian mode on ARM. Until someone steps up to
fix this, disable the package completely on big endian ARM targets.

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
