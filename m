Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F314FD88C6
	for <buildroot@archiver.kernel.org>; Tue, 10 Mar 2026 22:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F00641918;
	Tue, 10 Mar 2026 22:45:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hM8VcgKcRN0u; Tue, 10 Mar 2026 22:45:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 125F040BD6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773182714;
	bh=qhkthsPoPWbAvcIqjH9GtduOYf/VFVhcJ7kJoxkVd/M=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=A3BzEH2sZ4RIlYZhD5aSPEwmhfMVmXmWd6Pgjf7VFuuMKLuh+Fj2fIVTRFYDT1cXb
	 QiE6wR1o9spq/6pz56ZRiqW7rasGdWUGFVfpE94hF2XRFZyMn0Cr0b47+GqxB3+Sk+
	 a3PQV2o985uNvCLlpvoqNlU774P6+UrwSKU4nvWDCrTdh8Wngvct+1p6N2GB6pNy6R
	 CD2iyC77g1Cb7kxC3OI2oAGq07Oi27OR3Gzd2XeKfWmVK1QsjYh4klxICgTOf0Lq72
	 98wIx5RUq4EcAT4qeZM1QqPQAC1omfQekRUBdl709jJXEx1joslHtSWMVOTHXc0Sln
	 MCvCtNixiVXtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 125F040BD6;
	Tue, 10 Mar 2026 22:45:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 66111149
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 580F340210
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:45:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sgIQIn0YN0jX for <buildroot@buildroot.org>;
 Tue, 10 Mar 2026 22:45:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 00C3C40176
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00C3C40176
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 00C3C40176
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:45:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 14C0A2003C8;
 Tue, 10 Mar 2026 23:45:08 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 10 Mar 2026 23:45:07 +0100
MIME-Version: 1.0
Date: Tue, 10 Mar 2026 23:45:07 +0100
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260304213528.1380898-1-romain.naour@smile.fr>
References: <20260304213528.1380898-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.13
Message-ID: <e34f413546e5e8bc832dcb74e7793681@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773182709;
 bh=4QYMeKLmKsmt01qQ4rRpaCkTjJWyEYXNmgx58C+PlOU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SusIB9RtfCY8m45Is7NoMyU9xL48gkvgqJl8C93YnpG3qG/y7MtHA6zeo5e2hNY0B
 XbJ6MVzbiyV5NIUnkzqeJW+AveGeRtVNJocSMyFewOpNrWTyGSXXVh0UhXcUAzx/5I
 cF6zApNedD9lEXmLe9JWyP8/ANB4sdMWETuhCpy4sKMbRRWChLJFTpfrilLyWyBVWl
 zyBPwv45wbvur7P1R1romkl/4y+5SgbY/HSNt8H112/XZRuMiYELy/cVj7Jmtt/iB2
 oW3oKhDztWRDdR5NRdDeEVIrq00V+tznrZaaDCh3II2b17GrpV3TevEgMH98j+7JIA
 pIyG28fcZmiOQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=SusIB9Rt
Subject: Re: [Buildroot] [PATCH 1/3] boot/uboot: improve U-Boot OP-TEE TEE
 format options help text
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

On 04/03/2026 22:35, Romain Naour via buildroot wrote:
> OP-TEE generates a few binaries that can be used by u-boot on some
> platforms (Rockchip, Texas Instruments K3) using TEE variable.
> 
> Add a link to the OP-TEE documentation were we can find easily the
> desciption for each TEE format that can be used by u-boot.
> 
> For convenience, copy tee.elf and tee.bin description in each option
> choice help text.
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
