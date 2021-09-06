Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B80CC433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 15:12:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 248B560E77
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 15:12:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 248B560E77
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB683404CD;
	Mon,  6 Sep 2021 15:12:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1sQJMUPIVA50; Mon,  6 Sep 2021 15:12:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 400E4404BA;
	Mon,  6 Sep 2021 15:12:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 519C41BF3E0
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 15:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40E17404A9
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 15:12:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LW4a4GviTN0K for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 15:12:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75541404C2
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 15:12:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DBBF0886C1; Mon,  6 Sep 2021 15:10:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Sep 2021 17:09:58 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 94bd3fa36cb57131461e5e457fbb345c00c9c4ea
X-Git-Newrev: d9f5419d80e72e625f42cc957d0c717c61cca026
X-Patchwork-Hint: ignore
Message-Id: <20210906151041.DBBF0886C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/kvm-unit-tests:
 fix powerpc64 PHDR seg err
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

commit: https://git.buildroot.net/buildroot/commit/?id=d9f5419d80e72e625f42cc957d0c717c61cca026
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5cfaf5e23ea63291b1fb0debfec9204a10e1451b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...erpc-issue-with-the-linker-from-Fedora-32.patch | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
