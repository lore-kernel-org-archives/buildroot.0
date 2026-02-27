Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF159104891E
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 21:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EEF8417BD;
	Fri, 27 Feb 2026 21:57:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7pZhjChFYGF5; Fri, 27 Feb 2026 21:57:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F9AA41889
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772229453;
	bh=m2fXC0XoBDhFiO6EZK5QMvCZl38g67C+ZY0YtsnfT9M=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eM28Qd37Uy2kfJ7T2zk7toc7qb9HgEO9MkfgoBbfHS76ybXV6s4hd2Mte9G32V1t4
	 E/aB0Fg0OE/IDahGg0FJFOyBQpz7UfCI0yxdBWwQLDa6io0uERac3KZqtTRJBb6dew
	 tMlNGpfucUXtQ/pIrVrtosGSdFHyYTja5PO6kMPeXotPLFAO7esKfLXYzFebXQT9iK
	 MVjlVynTkJOhZeBWjMZmtgraTdnJa7jIBGa96eqr9m1gO0XUBty7FYIr2g/WkZ4F4n
	 nxjR3dvUT67e6YI7kDwCcUuBFkJqX+YMrHyE1XNC21W9w1AeFRv00EJseGBZpVTZB5
	 pIwOjls4/xreA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F9AA41889;
	Fri, 27 Feb 2026 21:57:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CCF81F3
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 21:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3EAD7821DF
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 21:57:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HA4o_TiWUAdU for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 21:57:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5AE98821DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AE98821DE
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5AE98821DE
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 21:57:29 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 875D419F58A;
 Fri, 27 Feb 2026 22:57:23 +0100 (CET)
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>,
	Julien Olivain <ju.o@free.fr>
Date: Fri, 27 Feb 2026 22:57:10 +0100
Message-ID: <20260227215711.1232099-2-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227215711.1232099-1-ju.o@free.fr>
References: <20260227215711.1232099-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772229447;
 bh=kVfPv6zMY+5f0GTGWHyBlyFYJCZJbKoF1+0QsGfEvYQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=U2KjCfVdivZx3/+q3WUPoVEidAuopMQWWDQ33QZ4fYCjiI91i+6IVsCKQwudAyzUh
 /TqgJ36zmeaW6YWjXjx7xEx/9KtU07cx62F1dHe7Bd7k066rZ7KR/6vHjVMngZdLdP
 O/h9dkKvWEuzQhGuU5Mixf4/JJDoTIrCXEfW1F8QU8OkHluGPjMgbwF7U7/JFj86J7
 12rIQZIe6/btNafVtiI45JFp2lNcpfBTx/MtLtrbwOFIww/L1GTTZle9W7g0uM9mfU
 v1tyVYmlNWgT+P83slFQX7wbtQOUz/mr3yhNypRuCbvSWZmYiXo6xGMQrNVWlGVQbS
 SN/1xumY0ZElA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=U2KjCfVd
Subject: [Buildroot] [PATCH next 2/3] configs/aarch64_efi: bump kernel to
 6.18.13
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

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/aarch64-efi/patches/linux/linux.hash | 2 +-
 configs/aarch64_efi_defconfig              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/aarch64-efi/patches/linux/linux.hash b/board/aarch64-efi/patches/linux/linux.hash
index 50983eb42b..7cc4ece4bc 100644
--- a/board/aarch64-efi/patches/linux/linux.hash
+++ b/board/aarch64-efi/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  62148e7e17f54c4a5ab5e75ad4882682c54bee818948be61a5963234fc0849fc  linux-6.11.11.tar.xz
+sha256  8d1934a72a185f1be6b56e3ad8ea31fd9a381ffec0346c69f06c90d776da7cb8  linux-6.18.14.tar.xz
diff --git a/configs/aarch64_efi_defconfig b/configs/aarch64_efi_defconfig
index 2bc6740eaf..390f3fc6ac 100644
--- a/configs/aarch64_efi_defconfig
+++ b/configs/aarch64_efi_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/aarch64-efi/post-image.sh support/scripts/ge
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/aarch64-efi/genimage-efi.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.11.11"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.14"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3=y
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
