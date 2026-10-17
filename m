Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED8DCCF2C9
	for <buildroot@archiver.kernel.org>; Sat, 17 Oct 2026 19:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0A5C4082B;
	Sat, 17 Oct 2026 19:44:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3u-AeMKG5XLk; Sat, 17 Oct 2026 19:44:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EF8034081F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792266252;
	b=AkGYmMvGJxaIqGRwByG7X0a1fqXAjU2U/8i911IGDzEZfuWYPaNFHZ/iix+i93O4tjRV
	 f6mR4wlbhBh8L/oirwWYHw/UHGsljw4s9l+Ey04zReZKerxkdA/m2cHBuPEjkSCaMTS5a
	 iGfv+WDrgvKXYPWdDLsh0F4imi7PC2V23XLmN1sTEmhY2Ptm57njNbBnQ80/hjtFjr86R
	 y8zU84wCUP7vH0TaSRQm80IPHDoMifZPihgdktsDCt5kl4Vl4lsV7KnJGiZxWV3aDPukQ
	 CJBzWcV7apwZ76atYh23C0xEQrmcTKZ6PGtDrl/teR1xBwfozDUW0sw2Sr7vsj6S/JQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792266252;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=FrMbxAl683NxPjSafZvnGibquJaG74/CTL/6G61nieU=;
	b=IHN4Sk0mQS91JcsGbtsoJhPNm+wWwA5622MxBMrQEcUVetygp5O+zPJxm60sLwJ2zRAV
	 62Z6WPFkMsFevHFfiCphJsKccD3nc4MZKO7q6KO2RTfxhtkolwDdThUDyRksPIlmiC+Vi
	 0aEd5iLgASdNtpZN3Zb8o+odwD4YuC+HQXP3pybPbv01U0CCXEC7IDaKcDdrM2jJYr15k
	 mSmPXzcocOoFp2hNykmaI8WlDDSvfflNvaDwgKvsSiY9BVFtYdI0QHg+38aCHvVfjMsso
	 ArwCzvW6bwoDcF/qBMZgBoiDbJzBZ/MZt5if1IK54DHggIY91ZUhj5XmleJRsXPqkNg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792266252;
	bh=FrMbxAl683NxPjSafZvnGibquJaG74/CTL/6G61nieU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KBnompBrPpxZn2Q4WRcX8uHNdGE2ilt1psJbEq+wWXAYb30KqgJ3gA2yBbyaXkWWF
	 ISLAfdRW1mhB5b5xbp5WF6EtsXXB/8JYZrp/UPAbnm0uFOq9DWeXTw7s4SJFF1pGN7
	 zlp2EZ48TgEOOswDKE3H1nzLMHkUChUKXKr1Uc4t3hoIITyvXMSDlLZikNwu3wENxu
	 8UgMQYUW16e2pj9PrPdYPEvFlXVrue/Q0TwnJ3F7xRCMtNMNRjxUk9LRe/SZLmOAo1
	 1LujaSMJ3x17rzGBNh8irPjLDpgnIrEN5noLIFailhB4PBl7MwtmxaxW7xxyLN4xKS
	 N/cAS2f7iKLpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF8034081F;
	Sat, 17 Oct 2026 19:44:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DEB0561
 for <buildroot@buildroot.org>; Sat, 17 Oct 2026 19:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D084C4081F
 for <buildroot@buildroot.org>; Sat, 17 Oct 2026 19:44:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ozRhNph7lm_Y for <buildroot@buildroot.org>;
 Sat, 17 Oct 2026 19:44:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E2A5D4081B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792266247;
 b=P277TyAZVYLtAAbHkYJhZRvEjrUWg0SA56/UTzcKwV3H3840VjDej0bHv11VKEQUBbro
 rs+fmHoVWyBDgPVfkKIcNDLlto84EWF8WZBNZPaq50uTKVjf8vN9DcF39EGJ8iVTkEanm
 2BcpNrpNvEOeVjSmHFG4ohsV9JgC3YkMHFucLmfNizebvbyC7V+oiruyB8UvZz4DQkd97
 m7TMooHTOEe7MQLOtIS3VVqHtq9AydmFrppbgnqn9Grsg4CKbzGidYXeXOJmctRlXP5uL
 FuaevzQfhJkhhZ8T4Wz+FyvImeeGl+Ug/ynv6WZYZvfFG9f8ViPP2uZKKqNQkSgzREg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792266247;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=1dAgbBEFtIZKqlBWkxC+dH73cftOF9jlayUDr/Xyssk=;
 b=eGmD4lMzlU3Ua8ybsHE6pXYfO9JwCFO16yvSlIOvHgm1crcjw4tQH7fkjI+nry2+9Fl8
 9+PWoijy26q/d/BQdD+bvuzSMnWjPJZQ8SiquLGqeix7SbgTJlc0hWQ4JkEG+ktDqPBTV
 egFUJShXyY63wKGC9d1JIvPUhON5nMqgaKzwhIbln/lbre8H1GfV+7L7E6Y+MaGHxIACy
 rCjkqoZVSqpRShUkiG8Lae+6T8P5TvHBRU5J01yHOt7/p8/LYqW+OastcyrZzISqeXZs7
 G4YJa7acpgGjBPdGQf39Ebahx9BshtYKMZ9NsVM7P4pIY36+b1Rat0Ja/qDeXaWlRYQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2A5D4081B
 for <buildroot@buildroot.org>; Sat, 17 Oct 2026 19:44:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2445996145; Sat, 17 Oct 2026 19:42:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 17 Oct 2026 21:19:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d6243220d771684129a8db85add129fee4a61712
X-Git-Newrev: 37ef3af415a830a2eb136704816b3d9735d2945d
X-Patchwork-Hint: ignore
Message-Id: <20261017194246.2445996145@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/librecomputer/lafrite/readme.txt:
 document SPI flash dependency
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/37ef3af415a830a2eb136704816b3d9735d2945d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Running a modern kernel with old A-TF/U-Boot leads to various issues.  Add a
note about updating the bootloader in the SPI flash.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 board/librecomputer/lafrite/readme.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/board/librecomputer/lafrite/readme.txt b/board/librecomputer/lafrite/readme.txt
index 86afa855e6..8747a9a23f 100644
--- a/board/librecomputer/lafrite/readme.txt
+++ b/board/librecomputer/lafrite/readme.txt
@@ -6,6 +6,14 @@ s805x SoC (quad A53), 512MB/1GB DDR4 and a 16MB SPI NOR flash:
 
 https://libre.computer/products/boards/aml-s805x-ac/
 
+Ensure the the bootloader in the SPI flash is up-to-date. Updates are
+available at:
+
+https://boot.libre.computer/release/aml-s805x-ac/
+
+To update, write aml-s805x-ac-spiflash.img to a USB flash drive and
+boot it as described below.
+
 How to build it
 ===============
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
