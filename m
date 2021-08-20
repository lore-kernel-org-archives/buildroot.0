Return-Path: <SRS0=3r6m=NL=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D70B5C4338F
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 12:47:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66623610CF
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 12:47:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 66623610CF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2693F4048C;
	Fri, 20 Aug 2021 12:47:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NVtVyTmMBiKx; Fri, 20 Aug 2021 12:47:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 919ED4048F;
	Fri, 20 Aug 2021 12:47:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 60F9A1BF35D
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 12:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 500BC4048F
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 12:47:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mj-4RVRhoLZS for <buildroot@lists.busybox.net>;
 Fri, 20 Aug 2021 12:47:28 +0000 (UTC)
X-Greylist: delayed 00:07:07 by SQLgrey-1.8.0
Received: from secvs04.rockwellcollins.com (secvs04.rockwellcollins.com
 [205.175.225.130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B00094048C
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 12:47:28 +0000 (UTC)
IronPort-SDR: I+NbcwlddUharVyxOG6VeeJEmF+85aNr9P+bxwVaXTSNxY4YOEdAxFofCyD/Nt/SLiuh1t9/tY
 OqbGgZ82r5gJCrvvScxnRHgHeIVywvwc01XuFja3Pyczp8+Vc4BMnDhv24DOIFuk0fmyyKOQqR
 eXEkCLSyfT0jxOOM8q8XD+CWzOgP9ARn19cLEob3QRZi723tJ+H7Blwb4ZRo6Z1SeTwAEhqoxF
 oct1hNIjoS90eqzA6hy59ZAXsidiVyR7WaU12oEOhs/Ygj2pUlbl7J/C04LFdibfJnWeu7lGDr
 i0U=
Received: from ofwgwc03.rockwellcollins.com (HELO
 dtulimr01.rockwellcollins.com) ([205.175.225.12])
 by secvs04.rockwellcollins.com with ESMTP; 20 Aug 2021 07:40:20 -0500
X-Received: from biscuits.rockwellcollins.com (biscuits.rockwellcollins.lab
 [10.148.119.137])
 by dtulimr01.rockwellcollins.com (Postfix) with ESMTP id 313F5602F6;
 Fri, 20 Aug 2021 07:40:20 -0500 (CDT)
To: buildroot@buildroot.org
Date: Fri, 20 Aug 2021 07:40:18 -0500
Message-Id: <20210820124018.23297-1-matthew.weber@collins.com>
X-Mailer: git-send-email 2.17.1
Subject: [Buildroot] [PATCH] package/kvm-unit-tests: fix powerpc64 PHDR seg
 err
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

Upstream comment: "Let's introduce some fake PHDRs
to the linker script to get this working again."

Fixes:
(next) http://autobuild.buildroot.net/results/ae091dbcb155e63c208ce5adb289807cee83e28d/
(master) http://autobuild.buildroot.net/results/ef0/ef0b044802c54a697d8bffb28eba08cf9ce44f4c/
(2021.02.x) http://autobuild.buildroot.net/results/044/04495aa23ce51c48b9b850890453abded85dc477/
(2021.05.x) http://autobuild.buildroot.net/results/0fa/0fa94f1f930aa16cec3bc96e64bc57b460238a0a/

[Cherry-picked upstream]
5126732d73aa75a0bc84f898042bfe35640624b8

Signed-off-by: Matthew Weber <matthew.weber@collins.com>
---
 ...issue-with-the-linker-from-Fedora-32.patch | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 package/kvm-unit-tests/0004-Fix-powerpc-issue-with-the-linker-from-Fedora-32.patch

diff --git a/package/kvm-unit-tests/0004-Fix-powerpc-issue-with-the-linker-from-Fedora-32.patch b/package/kvm-unit-tests/0004-Fix-powerpc-issue-with-the-linker-from-Fedora-32.patch
new file mode 100644
index 0000000000..1768c668b7
--- /dev/null
+++ b/package/kvm-unit-tests/0004-Fix-powerpc-issue-with-the-linker-from-Fedora-32.patch
@@ -0,0 +1,61 @@
+From 5126732d73aa75a0bc84f898042bfe35640624b8 Mon Sep 17 00:00:00 2001
+From: Thomas Huth <thuth@redhat.com>
+Date: Wed, 13 May 2020 13:14:46 +0200
+Subject: [PATCH] Fix powerpc issue with the linker from Fedora 32
+
+The linker from Fedora 32 complains:
+
+powerpc64-linux-gnu-ld: powerpc/selftest.elf: error: PHDR segment not
+ covered by LOAD segment
+
+Let's introduce some fake PHDRs to the linker script to get this
+working again.
+
+Message-Id: <20200514192626.9950-7-thuth@redhat.com>
+Signed-off-by: Thomas Huth <thuth@redhat.com>
+Signed-off-by: Matthew Weber <matthew.weber@collins.com>
+---
+ powerpc/flat.lds | 19 ++++++++++++++++---
+ 1 file changed, 16 insertions(+), 3 deletions(-)
+
+diff --git a/powerpc/flat.lds b/powerpc/flat.lds
+index 53221e8..5eed368 100644
+--- a/powerpc/flat.lds
++++ b/powerpc/flat.lds
+@@ -1,7 +1,17 @@
+ 
++PHDRS
++{
++    text PT_LOAD FLAGS(5);
++    data PT_LOAD FLAGS(6);
++}
++
+ SECTIONS
+ {
+-    .text : { *(.init) *(.text) *(.text.*) }
++    .text : {
++        *(.init)
++        *(.text)
++        *(.text.*)
++    } :text
+     . = ALIGN(64K);
+     etext = .;
+     .opd : { *(.opd) }
+@@ -19,9 +29,12 @@ SECTIONS
+     .data : {
+         *(.data)
+         *(.data.rel*)
+-    }
++    } :data
+     . = ALIGN(16);
+-    .rodata : { *(.rodata) *(.rodata.*) }
++    .rodata : {
++        *(.rodata)
++        *(.rodata.*)
++    } :data
+     . = ALIGN(16);
+     .bss : { *(.bss) }
+     . = ALIGN(256);
+-- 
+2.17.1
+
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
