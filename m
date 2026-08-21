Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3DBC5DF97
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 16:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EDCB60A81;
	Fri, 21 Aug 2026 16:20:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2UkcMlI69ml3; Fri, 21 Aug 2026 16:20:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787329248;
	bh=WkhMWWH4CPz0PqRAw3tiO8/cmxfpB8JLB8uOEkTPscY=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=ns491iBH4guroV4lfMA/JkpmPkU2J//LVqTElv/VWmdRpwigVPTohVl0v4hpTYn8v
	 C5cpf6UFiH0TOWCWXhO7gJzk9lVHEK8K1Ma99F24A85KwRYV2tCmB6iqjJtJ6JwWiF
	 VycOhiVB3g8hyAeVlB6D8+McytWA1lkCsZ2VQpH0eP2Tl9gKQS49XVI5q9z8tHEykP
	 W1rGXUvKx4iL5M7gGwL19sOYqmCdy+1YzeMxSfbdOK9ieaJvdyraPHC6Ym35CGXQGx
	 Vz/Z3kL5P3QXTFhjOYOozGwjIyI9jrUKWO4b3yMqt1AQO47cjOonc2fqakrQ23Qhac
	 /5/XSfoSwCELQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6351607D5;
	Fri, 21 Aug 2026 16:20:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AE7B263
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 16:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0754607D5
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 16:20:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2tnxe_GQLIBX for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 16:20:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E213060661
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 16:20:45 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id D47825FFBA;
 Fri, 21 Aug 2026 18:20:39 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Romain Naour <romain.naour@smile.fr>
Date: Fri, 21 Aug 2026 18:20:29 +0200
Message-ID: <20260821162029.1736114-1-ju.o@free.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] board/qemu/x86_64-efi/linux.config: enable
 CONFIG_EFI_STUB to fix with grub2 >= 2.14
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

Since Buildroot commit [1] (boot/grub2: bump to version 2.14), the
qemu_x86_64_efi_defconfig fails at boot time with the error:

    !!!! X64 Exception Type - 0E(#PF - Page-Fault)  CPU Apic ID - 00000000 !!!!
    ExceptionData - 0000000000000003  I:0 R:0 U:0 W:1 P:1 PK:0 SS:0 SGX:0

This issue happens because EDK2 and Grub 2.14 are enabling NX and the
kernel lacks the CONFIG_EFI_STUB configuration. For the full explanation
see the commit log of [2] (board/pc/linux.config: enable CONFIG_EFI_STUB).

This commit enables CONFIG_EFI_STUB=y.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/15969219375

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/da278ba1dab7e29369879c8a29cbd1b42dbe9ce0
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/1c1fa6ce67448ef8bab16d795623be730ff658ea

Reported-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/qemu/x86_64-efi/linux.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/qemu/x86_64-efi/linux.config b/board/qemu/x86_64-efi/linux.config
index 9362b7ecb5..4f5f0b386d 100644
--- a/board/qemu/x86_64-efi/linux.config
+++ b/board/qemu/x86_64-efi/linux.config
@@ -3,6 +3,7 @@ CONFIG_SMP=y
 CONFIG_HYPERVISOR_GUEST=y
 CONFIG_PARAVIRT=y
 CONFIG_EFI=y
+CONFIG_EFI_STUB=y
 # CONFIG_GCC_PLUGINS is not set
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
