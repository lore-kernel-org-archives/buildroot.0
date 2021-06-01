Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F960C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:37:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B8FC604AC
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5B8FC604AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BB6B4010B;
	Tue,  3 Aug 2021 21:37:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0kwX-AMOXKHJ; Tue,  3 Aug 2021 21:37:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01A1F40001;
	Tue,  3 Aug 2021 21:37:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2BC6F1BF9C1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1AF3D60862
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dpZGFm65lf_b for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A43E60868
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B45F1864A8; Tue,  3 Aug 2021 21:09:46 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 1 Jun 2021 21:47:51 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 93b8d601bc208f7f3ac6a2c496590bcc25cc7b46
X-Git-Newrev: 6b4b63a571d7e12042d661852f034ff413ec25a7
X-Patchwork-Hint: ignore
Message-Id: <20210803210946.B45F1864A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] Config.in: disable PIC/PIE for
 Nios2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=6b4b63a571d7e12042d661852f034ff413ec25a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Recently in Buildroot the option BR2_PIC_PIE has been enabled by default along
with other hardening features [1]. Since then the nios2 defconfig
qemu_nios2_10m50_defconfig is failing to boot due to a segfault in init program:

Run /init as init process
  with arguments:
    /init
  with environment:
    HOME=/
    TERM=linux
Failed to execute /init (error -12)

See Buildroot build log and Qemu runtime test log in build artifacts [2].

Analyzing one of the binary with strace show that the problem occur
very early when starting the new process:

 # strace ./busybox
 execve("./busybox", ["./busybox"], 0x7f91ce90 /* 10 vars */) = -1 ENOMEM
(Cannot allocate memory)
 +++ killed by SIGSEGV +++

Several binutils/glibc/gcc version has been tested without any success.

The issue has been reported to the glibc mailing list but it can be a linker
or kernel bug [3].

For the Buildroot 2021.05 release, disable BR2_PIC_PIE until the problem is
found and fixed.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1285145889

[1] https://git.buildroot.net/buildroot/commit/?id=810ba387bec3c5b6904e8893fb4cb6f9d3717466
[2] https://gitlab.com/buildroot.org/buildroot/-/jobs/1285145889
[3] https://sourceware.org/pipermail/libc-alpha/2021-May/126912.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Config.in b/Config.in
index c65e34bd5e..d9be677c21 100644
--- a/Config.in
+++ b/Config.in
@@ -716,6 +716,8 @@ comment "Security Hardening Options"
 config BR2_PIC_PIE
 	bool "Build code with PIC/PIE"
 	default y
+	# Nios2 toolchains produce non working binaries with -fPIC
+	depends on !BR2_nios2
 	depends on BR2_SHARED_LIBS
 	depends on BR2_TOOLCHAIN_SUPPORTS_PIE
 	help
@@ -723,6 +725,7 @@ config BR2_PIC_PIE
 	  Position-Independent Executables (PIE).
 
 comment "PIC/PIE needs a toolchain w/ PIE"
+	depends on !BR2_nios2
 	depends on BR2_SHARED_LIBS
 	depends on !BR2_TOOLCHAIN_SUPPORTS_PIE
 
@@ -813,6 +816,7 @@ config BR2_RELRO_PARTIAL
 
 config BR2_RELRO_FULL
 	bool "Full"
+	depends on !BR2_nios2 # BR2_PIC_PIE
 	depends on BR2_TOOLCHAIN_SUPPORTS_PIE
 	select BR2_PIC_PIE
 	help
@@ -821,6 +825,7 @@ config BR2_RELRO_FULL
 	  program loading, i.e every time an executable is started.
 
 comment "RELRO Full needs a toolchain w/ PIE"
+	depends on !BR2_nios2
 	depends on !BR2_TOOLCHAIN_SUPPORTS_PIE
 
 endchoice
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
