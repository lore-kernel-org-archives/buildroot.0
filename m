Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C10E4C5AD48
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 23:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E7FB80AFE;
	Sat,  8 Aug 2026 23:06:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DncUSsdA4ipc; Sat,  8 Aug 2026 23:06:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 201BB80AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786230377;
	bh=+TnTLR3V/BbCWHPyZILHTpSoBCnA5+pUgvCu1RQX2hQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mxsGjn6Mzl9MFoIhOHmfdtm+I3ylwUH9sQUYe6jxprCFNXFYhyysc91rBDhR/2lvJ
	 dz+kM2OJUUOsJ3B1AhTtZVx+ZfXEAVzYBjV6/H89gnDxKd0nmT+IncF+vjd/mE89qB
	 IGfm0Joe7HuM6bPR3rBN7mD99V4NXzpnVTbtn5GyDUgEVUTWozi/IuLFHO4IWSsJj2
	 qyECBYpm4heIo4C/nAbs5w8IacdYnUa9SzktQpo6N80QxF0Y5wl1s+dLrd5CKYd73+
	 pU7bpAHm0kdt/JYjb6WAlWN/nclDRgyabJaCMYFZqO/LlDVmb+nrd1RaXWRpfIMBNb
	 vQhc+fpG3tt7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 201BB80AEA;
	Sat,  8 Aug 2026 23:06:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BBF0282
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 23:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C02B605ED
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 23:06:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xx1qLDt4QgXW for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 23:06:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E6243605CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6243605CE
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E6243605CE
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 23:06:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id AD5E75FF88;
 Sun,  9 Aug 2026 01:06:10 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 09 Aug 2026 01:06:10 +0200
MIME-Version: 1.0
Date: Sun, 09 Aug 2026 01:06:10 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260808162715.1331483-1-thomas.petazzoni@bootlin.com>
References: <20260808162715.1331483-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <91f531fe2432d10a9ec8b32a39fc93bc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1786230371;
 bh=RO4tn8AL2lik0tRNG0Q0o8JBhRsyUqCC06sK5PT/dLI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ym/HP5iDy4EwqHC39n9F6KFaqF/uE8ViyOs2MxcpKID1U5tH0eo48Ooj8Lxnj6lAS
 Jx69MwipfnvW2YKM+WY9OEw5qPy1ve2LxRCvEY2oJJkyKwcncJXZkfBXp9T5LkTssJ
 9KPRiCq3SlM7kVq0iWJUVD0nTYPD1lCQYrIcAjyI5TwW8BNjwwfrxY0a8x1kNpX7lV
 oQPZvTZvieRzIiZKzjB8tN+xS33DoB0/p8MWjH5o4aPPoaxPgCYSqUjUcrQuDvw+Ww
 d/ljQQmmLovlM+hVcWg8r2ThRvuwCuxt2FFGjERy5vgKgmfpozmliXVjLI+eNHH82W
 Nz6IzUXZAxNsg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ym/HP5iD
Subject: Re: [Buildroot] [PATCH] package/genext2fs: bump version to 1.6.2
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 08/08/2026 18:27, Thomas Petazzoni via buildroot wrote:
> Upstream doesn't provide any useful changelog, but the number of
> 1.5.0..1.6.2 commits is reasonable:
> 
> bfc28c7 Define {MAX_,}RESERVED_BLOCKS as floats
> 5b93731 Recover automatic block number calculation
> d6e659d Correct message for minimum block count
> 1b2a30e Correct also commented code to take into account reserved 
> blocks
> 944a4fd Indirect blocks must be taken into account for stats
> 3e2fce1 Restore (MAX_)RESERVED_BLOCKS to integer division
> b571221 Add missing newlines on error messages.
> cd4ff51 don't call ftruncate() on stdout
> 6909cde Enable system locale - change from the standard (C) to system 
> locale.
> 9651f5d Fix alignment issues for strict architectures
> 4a99c22 Hardcode length of hardcoded char array instead of sizeof(long)
> 1f38ba4 Add ordered directory traversal
> 84c2d01 Add ordered directory traversal test
> 467ebe5 Fix formatting of man page references
> 810c12e Fix auto-block calculation from PR #5 merge
> 28988bd Skip device table entry when parent path is not a directory 
> (from PR #33)
> 45191ab Fix ordered directory traversal from PR #34 merge
> b615521 configure.ac: teach autoreconf to detect and install macros in 
> m4
> 81028ca configure.ac: upgrade ancient snprintf macro to modern 
> autoconf-archive edition
> 67661a1 Fix EXTRA_DIST: reference new ax_func_snprintf.m4 instead of 
> deleted ac_func_snprintf.m4
> 907737e Remove incorrect address
> 4c4343d Add licensing information
> cb5f584 Add license information
> a60ccd9 Use strrchr to split path:dest so host paths may contain colons 
> (fixes #23)
> 44ff03d Implement sparse_super feature with superblock/GDT backups 
> (fixes #29)
> 8b8f2d1 Add extended attributes (xattr) support (fixes #9)
> d0a9274 Optimize block/inode allocation for large filesystems (fixes 
> #31)
> b69c34e Fix -d dir:/path destination: restore colon after stats pass, 
> auto-create intermediate dirs
> 2c38700 Add 9 functional tests for previously untested features
> 3d3bcb6 remove useless NEWS file
> 03dee74 Bump version to 1.6.0 (fixes #28)
> c8f41b9 Make xattr copying opt-in with -X/--xattrs flag (fixes #40)
> 3324695 Bump version to 1.6.1
> 4e5d8ae Update README: add -X/--xattrs, SOURCE_DATE_EPOCH, and missing 
> device table types
> bf5b1a0 Bump version to 1.6.2
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
For info, I fixed the license hash.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
