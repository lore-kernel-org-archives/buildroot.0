Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E8AC982DA
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBE0940BB6;
	Fri, 18 Sep 2026 13:06:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZAnTRG6pmfSR; Fri, 18 Sep 2026 13:06:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 12BB240BC4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736793;
	b=EDdhfmN0PWw4OddAyHLmi+Utg9yhGcYoLv6XtWHbnZs0QC5O3pZ2ah4/xa7/2gKWciLm
	 ugc2Cyt7Pxaf7kChSctD8ukgX2UbWAAhjfh/bsY+MpnimvBVCxmquQEBhZlwUwwEDae5l
	 ehPy5tryVxbPCTerBZQBAz0CAd4UxlYq14/oJbAf8XyOMaQig09PFDpDTavUFW7rehPp0
	 4qlrbY80UTB1bEtTVzuS8SvyGeHtLmdWTXEkjaYntz3MTAiTI5SRM7wXawhcA8ttLLzle
	 glPrVuD3/cWvlhCpD55+F41se8U4tq3S3Lr886+d3FyLfELVjNgQe5OYpcY9rMo80Mg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736793;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ch4QVQT4NXBSs99oObZ+P904+i7NLl4tZFMcoggnyyA=;
	b=kauYZ0NMUS1xK3O3Q6y3pvrP6CAIwj01+YkJ5W7F+LLapkuS9hi4aEQ8UWq5G6ub9/NY
	 OsGhWzYFRcHJlKvpfLwZe7y3u6v3u1lOE/mJuP9BfBymA40XWUGxkhTYPwW4x10awk+G4
	 u2A4FMLPTOexMGyqeCcTHcNG7YuBWdbVbYINMpKnDHudBNiAtlPm7OtSJHkF13SdTbPLQ
	 uVA85ldzQJAIJ2Q+ljHlIhPtTP6VXAE/7lyDGHjVhGhL2Ns0OK3LWb7wQxZm7AJSkJwAm
	 4qGHGwJDgIQDhATuo8kIPhYSlATHhE0RWff7jV1JEClsFi++sBP8WnpVJ9evd77QqWA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736793;
	bh=ch4QVQT4NXBSs99oObZ+P904+i7NLl4tZFMcoggnyyA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YiREHRZu1v1991MRhHbNmPI2FPxnsvDIWn8GcqofkF2bD3Lo5+z0yOOKambtQVz7z
	 gB5AkMF9nV3oyvXedbZRWwRGKry2uCj5dCA+uo8OCgo7ZHhAlwxwIRdP81bkWic2gz
	 s5LyeU97TJnDveQ/20I3PKeETYXAuO7M6pq6p3cIoOwvGenx0d8TPw7DbYsMV9xY1u
	 hMNiARSL+LbMSOi/ab0elOaHqaEvd6WcWofjbLXV0nxTSu+5zy20XikW94iJdFiEja
	 dSJeasOL8NeglXy+pp1r+QxkBR3JgOrxCNWJgay1VQYmoY2hBqI9CyvlOxgd+XnqbK
	 iEd/d9G9H+pSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12BB240BC4;
	Fri, 18 Sep 2026 13:06:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 334A143A
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2566840B70
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8m0lUYz2JWPz for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:05:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2999440B92
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736748;
 b=pYMuJsPSVfBs7xmbI8iOnTLWlvaHiupWAUjfWtXuUoe+sdRSYBuiGwqvnxHhjTCCnj6p
 5H154o0YwQoXs/gJvOuKofQsC7kxi06vH3zdduKh/NZam9p4wH5txYzX1SPJcQlOuQfrI
 TAqQ81238Vlwmq3ZJhxS4HdW1sUda4yq7ectmXhPe7+VFA9t6s01X7aelRP0qhujtRW88
 +NtPNEb9U0t5moksKnlMEiiLvX5mQI9RsJM5dRm/7fd69AfjG1m1BZkhBxGZpzZgjhywR
 roaqRPBxJLU80dZAuoR+rqUi5RD6FgBX5amcoJG6SGiJniLCDGD4P24zzR1hkJ2nb7A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736748;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=13OUAFXo9Q2dET5FBD0KwuJFMNTsPRkuVij7VVy8H84=;
 b=AjD4HFJEsbyXUit6qwySjPBmckCa3lXwW3YIohwi83lthIy5cPTPiGOwIPg0IAXo78j7
 87tmytRQRzMHa3VcV4xjImp9qRd0lfjQV37BodVh+1fiVIiM6QNDtQzg4y2/ItOmt2K2r
 +rUoOugI2L7xjYzd5vmw6n24A7u4ze6pusTKJgNbcvVPgCnG45XWuSfILwVUBEU1dKK1+
 G2nHR67gr/t8kmUf99uGIjXR5bUrFed+tUqgTnKWn4bTG+IgTPo2/UHDHZ+VjSu3gPNlS
 BnMWliSCAFzTHYjjvE2EsB5AvPRlDq7UBr2sKwy+AVqSbXUkEAm42yVcFpqKvcuw8pw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2999440B92
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D6E8997698; Fri, 18 Sep 2026 13:04:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 11:19:38 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d667e4e7a6065e5d9a364bfc3c3b226d4f2ee690
X-Git-Newrev: 51a16f40def0504bec8a8ded1701136db7bc69eb
X-Patchwork-Hint: ignore
Message-Id: <20260918130440.D6E8997698@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/clamav: add
 missing BR2_TOOLCHAIN_HAS_SYNC_4 dependency
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/51a16f40def0504bec8a8ded1701136db7bc69eb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

In commit 203725a46bc6b61ed7e4fdb3d76f62327d3e47fa ("package/clamav:
bump version to 1.0.1"), select BR2_PACKAGE_JSON_C was added to
BR2_PACKAGE_CLAMAV without propagating the BR2_TOOLCHAIN_HAS_SYNC_4
dependency from BR2_PACKAGE_JSON_C.

Since at the same time a dependency on
BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS was added to clamav and
Rust is not supported on the few architectures that don't have 4-byte
sync intrinsics, this has basically no effect, but ensure a correct
propagation of dependencies.

Fixes: 203725a46bc6b61ed7e4fdb3d76f62327d3e47fa ("package/clamav: bump version to 1.0.1")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 39b840beef568ab7e671e9145d186b5c993a1b07)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/clamav/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/clamav/Config.in b/package/clamav/Config.in
index ae5cad036a..482e64a542 100644
--- a/package/clamav/Config.in
+++ b/package/clamav/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_CLAMAV
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # dlopen
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_HOST_RUSTC
 	select BR2_PACKAGE_JSON_C
@@ -28,3 +29,4 @@ comment "clamav needs a toolchain w/ C++, dynamic library, threads, wchar"
 		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
