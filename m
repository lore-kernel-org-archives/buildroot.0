Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2246010854AA
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 22:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D000460FEF;
	Sat, 14 Mar 2026 22:26:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gurUf8ZDU58c; Sat, 14 Mar 2026 22:26:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8898460F8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773527160;
	bh=jq+phIpDBlUrX1L85sZGPQWpvBHV2OZW5CGjBLVQTVM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fgeB+Im1e37Vzqf5UGA6siIEfK8JDIjfTVAnRm+Ol239bQLLOGUGF2iIiNJYVcmB9
	 vZBSIF+nR2iV+pXTvqyKjjay3b3qO5D62x3S5OCM/E7aumUXJtxFrLXyDAUJRvuPdo
	 RwObq9a+ZPtP+ZVeQeGnDKwRd6K92/xyItTnVFUm6lj2c7x3rOcDgkZoasU6KE3pJ7
	 inSdTD36HgWi9ABHP531O/yepI9dXbYK7SrCqXJZf0fx5Vt9461G+RccaTzZkYF025
	 /iokc6opz6ZPRhHZpP65F30KLJcK2RshElK04Hzp7kJsbOUVpw0kGu9TefbPTeEWbu
	 1lw5PPdcVKDmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8898460F8B;
	Sat, 14 Mar 2026 22:26:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A648118
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 22:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 106ED4052B
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 22:26:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bLS_JD2qfLkW for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 22:25:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 39E73404B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39E73404B8
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 39E73404B8
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 22:25:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 71BF319F59C;
 Sat, 14 Mar 2026 23:25:55 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 14 Mar 2026 23:25:55 +0100
MIME-Version: 1.0
Date: Sat, 14 Mar 2026 23:25:55 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260314123229.1234005-1-bernd@kuhls.net>
References: <20260314123229.1234005-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <ef06c512b2efb557424ceceff8c5c297@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773527156;
 bh=taoTHObgtz3Dp5IhbBsVHDpymgWXJ7BqWq5VFX8O+io=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=haB1FUQ6+7uoPKdcduGRd3ZLX0uMgTU8twtC9A6xhlhnD7Xuq1fxqrKFR/Fhic24w
 gbmixFTgVQlolwQvyxN8R8eP70H5B1ILoT9hqVIoJCcjLmE7BqxJ3D3LRLVR3c62ZH
 tO6yeYYwXH3BH2b9nWGxY6bEBCr8uSm6WMTsX7pKy/kcyMeKt+6mN3DHnZp8BmiBlv
 aBI0Ec8Nb4+ELFqb28Ys9PCj88ewRU6UR4vxCHF43xnr54l3Qvkf0eqxxubUEg23be
 Wrrn3WKGvEjSWx4Xqv+fjYmx3EpF6a1EzcHuoFkByr+6O+NYkSpwWWHpuMY+ew8tX2
 cYMU9AU+/3KAQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=haB1FUQ6
Subject: Re: [Buildroot] [PATCH 1/1] package/xz: bump version to 5.8.2
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

On 14/03/2026 13:32, Bernd Kuhls wrote:
> https://github.com/tukaani-project/xz/releases/tag/v5.8.2
> "- Fix the build on ARM64 on glibc versions older than
>    2.24 (2016). They don't have HWCAP_CRC32 in <sys/auxv.h>."
> 
> Updated license hashes due to upstream commit
> https://github.com/tukaani-project/xz/commit/6d287a3ae90e1b990294f3d5264003d81e853c5e
> 
> Fixes:
> https://autobuild.buildroot.net/results/b0d/b0dbae7b2c884f5fef0017755b28932a83921a5a/
> "check/crc32_arm64.h:27:25: fatal error: sys/auxv.h: No such file or 
> directory
>    27 | #               include <sys/auxv.h>"
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
