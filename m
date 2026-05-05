Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2234CD3427
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 21:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5151760BB0;
	Tue,  5 May 2026 21:36:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ls0tymHUhbAc; Tue,  5 May 2026 21:36:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B74760B9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778016985;
	bh=DzwtkV6cLPtlUbNRjug+i7p4+MDs4FfPFhudHzdnmPc=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=KUPkkAdI/DjH1RfSJisqO6RnLAdyI9OMuvsW2zkq2KJR4I/O+4mlqIvDfQl4uiP79
	 MBrViu31Rem2ONzbVK2SA5hy3s1o+OF4rZUylADRHBKfMflY+CbsOIySiXr0/oXglk
	 MIc/Mchg+4ucseODf2UkeuaAzG7r0608UrNIllqPcnAW3SLgZky2tPREk2vJhwVqo9
	 rapz3J91UAJWQxj+2jWeqdFGIJrShSKbaRPPooBU7lUqPH6pp4UaXqNFB7JwJAV0tD
	 SzP+8LAxoTaBA8CK/vKZuNPX33kda8Rk72vGPuLz/M0Bk7S6cz/CJfCDNQK+vItyEe
	 Ro3dUVqUHi4IA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B74760B9F;
	Tue,  5 May 2026 21:36:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FC8D280
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A8C440451
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:36:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XogHHgSPgl32 for <buildroot@buildroot.org>;
 Tue,  5 May 2026 21:36:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8AD3840297
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AD3840297
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8AD3840297
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:36:21 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 3564D5FFB1;
 Tue,  5 May 2026 23:36:14 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Tue,  5 May 2026 23:36:04 +0200
Message-ID: <20260505213606.3873472-1-ju.o@free.fr>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778016979;
 bh=MuNkOR0w35JocdvYWgBJR897UNTXsKjv4q7APK7cyGk=;
 h=From:To:Cc:Subject:Date:From;
 b=fzBmBOg/gZIC6UHqE+R4iDhRimOFoBWNDo3w5JDwlbXHoiadzbUKSEPmc/ofsqbCp
 HO/qV4hXoc6WywiVmEs22A6loAA+x+qthmitbCIhREDWqNypwTpJKS9DsuEMySeYMO
 76cIs2n+CulpF+8eXkNcYKtnXBzEZf6Ov/z8IwTF6YicC3brYd+5EdS3lWOe9rO960
 2I7YNgYjP9ODNTpLg6IJDH8x1CAirBlIqBv3d4s8/SUYqKc3eTQYX7m/yi3kxPsTCH
 vkAEeQ150uNjsBOONz19MP8CVxVpI0JB8KFhcSrYZqmcP5rvJUe35bmwq3XxavpDi8
 4Yva1nuXVLxcA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fzBmBOg/
Subject: [Buildroot] [PATCH 1/2] board/pc/linux.config: enable
 CONFIG_EFI_STUB
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When the Linux Kernel image does not include the EFI stub [1],
Grub2 EFI linux loader fallback to the legacy i386 loading.
See [2] [3]. Grub 2.14 enabled the NX compatible for the EFI
image in [4].

When booting a Linux Kernel without the EFI stub with Grub 2.14 with
NX flag, the boot fails before starting the kernel with a EDK2 page
fault error [5]:

!!!! X64 Exception Type - 0E(#PF - Page-Fault)  CPU Apic ID - 00000000 !!!!
ExceptionData - 0000000000000003  I:0 R:0 U:0 W:1 P:1 PK:0 SS:0 SGX:0

This commit adds CONFIG_EFI_STUB to board/pc/linux.config to make sure
grub will load the Kernel using its efi loading code.

This commit is needed with EDK2 with NX protection enabled and
Grub 2.14 also enabling NX.

[1] https://docs.kernel.org/admin-guide/efi-stub.html
[2] https://gitlab.freedesktop.org/gnu-grub/grub/-/blob/grub-2.14/grub-core/loader/efi/linux.c#L532
[3] https://gitlab.freedesktop.org/gnu-grub/grub/-/blob/grub-2.14/grub-core/loader/i386/linux.c#L675
[4] https://gitlab.freedesktop.org/gnu-grub/grub/-/commit/f5bb766e688b1180e0ace3417d4947a934957a31
[5] https://github.com/tianocore/edk2/blob/edk2-stable202602/UefiCpuPkg/Library/CpuExceptionHandlerLib/X64/ArchExceptionHandler.c#L273

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/pc/linux.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/pc/linux.config b/board/pc/linux.config
index 43b15c94be..cbc4f5a6b0 100644
--- a/board/pc/linux.config
+++ b/board/pc/linux.config
@@ -5,6 +5,7 @@ CONFIG_SMP=y
 CONFIG_HYPERVISOR_GUEST=y
 CONFIG_PARAVIRT=y
 CONFIG_EFI=y
+CONFIG_EFI_STUB=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
