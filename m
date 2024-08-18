Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B505CC5320E
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 09:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 671B280DD8;
	Sun, 18 Aug 2024 09:56:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p32JvYXuLvgf; Sun, 18 Aug 2024 09:56:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7399680DE4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7399680DE4;
	Sun, 18 Aug 2024 09:56:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DAC211BF479
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 09:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C75DE80DE4
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 09:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MGtPY9YkW70g for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 09:56:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F421180DD8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F421180DD8
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F421180DD8
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 09:56:53 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id D8D3D3521185; Sun, 18 Aug 2024 11:56:51 +0200 (CEST)
Date: Sun, 18 Aug 2024 11:56:51 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZsHFY4nLrUaZgEDD@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723975011; bh=L5itxkPKBeGo2VH49wstby5CodwNLubeGznhMGcpISY=;
 h=Date:From:To:Subject:From;
 b=QI3Sz/XlDjqSYklT37lB0NQN4NiQNV8KQpuJx3y1nJi76OumCKLTQ1sX3F5pext5F
 QtVWwwkhnx3UyYSfdfotyMBdUTU238UNISBVMmddbJApJvlL4AypPsXq5upF3qFcX3
 IEtQKLXy9yOi/KSmB9U33pVGbsFQD68w6cfnEugdXR1tOxcpTpEUCBIhf/wlem0BJ7
 jL8iS6tjyYa5T5TVaiozm2TDnCVW09bXiA8Trjhrw6pHPX1AVVdLHQyUb+GAZwOszO
 cu9LoctDwcKo0LKDT8bw3Pv48tzlvU9bL8b51IuqvruMtXJzGiPy7NlSFe7BZDAZY5
 T95WAqPo3T3BA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=QI3Sz/Xl
Subject: [Buildroot] [PATCH next] package/e2fsprogs: allow uclibc toolchains
 for e4defrag
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since 2014 e4defrag was only available for musl/glibc
toolchains in commit d770abad335a85884cfc2ec7574a331c29522810.

I believe sync_file_range() was already available in 2015 in the uClibc time.

So enable e4defrag. Tested in Qemu on a ext4 filesystem.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/e2fsprogs/Config.in | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index 23c4ef30b3..a45767d506 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -47,14 +47,9 @@ comment "e2scrub needs bash, coreutils, lvm2, and util-linux"
 config BR2_PACKAGE_E2FSPROGS_E4DEFRAG
 	bool "e4defrag"
 	depends on !BR2_nios2 # fallocate not implemented
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC # sync_file_range not impl
 	help
 	  Online defragmenter for ext4 filesystem
 
-comment "e4defrag needs a glibc or musl toolchain"
-	depends on !BR2_nios2
-	depends on BR2_TOOLCHAIN_USES_UCLIBC
-
 config BR2_PACKAGE_E2FSPROGS_FSCK
 	bool "fsck"
 	default y
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
