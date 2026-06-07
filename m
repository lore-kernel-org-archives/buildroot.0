Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01012CD8C8C
	for <buildroot@archiver.kernel.org>; Sun,  7 Jun 2026 20:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B44406089D;
	Sun,  7 Jun 2026 20:16:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y1Y0pmCbNqIW; Sun,  7 Jun 2026 20:16:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC3B86081F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780863367;
	bh=P+Wr/eJ86/EQxC4kzEynohibgpsugWC+O+QIcN1TVsk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LjU5aWRufXRVQlB3+bmb9K0xsWVKb/1VbEnothEW1hHCEsbo0PrGGtoL6Sqiq1R1s
	 vip4Wrdye3ImGParvhN3QOHpTBjjW2E4bA952EW+LwbqlXomtmGbbtxwSVbFgPBEDF
	 Y+uM5BrnTHkcuXjaZUe7UTigSiTq1amxiboktLsghQhuuaE59Si8sy3YWEWq20FcxW
	 93UkguBfV2KmzypqUd5AI5avpZYRxWWw8vdBFKFwycdEpmgvQCwJe0VK6AJxCwDnlN
	 Ta8w1KIM23hpIvlvZGHBWbibJYvGN/0IKiDz/ylE/vtuf64dQdLW7oxDFSzcZn7epC
	 o+7mjyv3tNXKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC3B86081F;
	Sun,  7 Jun 2026 20:16:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A3E96345
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 20:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89CAC4075A
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 20:16:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jtE4SLTNjShW for <buildroot@buildroot.org>;
 Sun,  7 Jun 2026 20:16:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 697FF40381
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 697FF40381
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 697FF40381
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 20:16:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id D8613780333;
 Sun,  7 Jun 2026 22:16:00 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 07 Jun 2026 22:16:00 +0200
MIME-Version: 1.0
Date: Sun, 07 Jun 2026 22:16:00 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org, Michael Durrant <mdurrant@arcturusnetworks.com>
In-Reply-To: <20260606225120.409046-7-romain.naour@smile.fr>
References: <20260606225120.409046-1-romain.naour@smile.fr>
 <20260606225120.409046-7-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.16
Message-ID: <a477d131ceb14f5c746ae398bef3efb6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1780863363;
 bh=xnguLqY1eTqAsXn2JPDKQ3w1NpSSFP+dBlMbETzAl0c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ilrJDrlnbK+8V+rA1h4JpoNocwfHNuaHbC1GDyrKk9kJG1n62mJkTH6klwlNIU1EF
 N/FftSfhHCA4NWwc8p0PHkYTCJbV9EMhdvxkG2inQT7shdD/Q1ZhIr7y6O3lDD3qYF
 zvHFjeTthD1TwbD6ftL777gC56eDpO36/r83/YKyQC9vbaGQZVXzWnYlXoEPLoyzZ+
 dplVL80IibsWE3ugWyPcluLDcH0ENq4oIr9RLNITd0XVVMvYOcsBFrDAeQRZY8kjOz
 X8fYropd6XS4HkdHoYC+f+/ZlIOnvKUY2M0EVBh5OUzPQ+rVI+dfhecGcBfJkuOjZi
 Ao435s8vAXWDQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ilrJDrln
Subject: Re: [Buildroot] [PATCH 7/7] configs/arcturus_ucp1020: specify Linux
 license file
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

On 07/06/2026 00:51, Romain Naour via buildroot wrote:
> The used Linux kernel (4.4.144) does not contain the default license
> files as those were only added in 4.16 with commit e00a844aca
> ("LICENSES: Add Linux syscall note exception"), so specify the correct
> license file to fix:
> 
> make legal-info
> ..
> cp: cannot stat 
> '/path/to/output/build/linux-headers-custom/LICENSES/preferred/GPL-2.0': 
> No such file or directory
> 
> And add the sha256sum to the .hash file.
> Enable BR2_DOWNLOAD_FORCE_CHECK_HASHES.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/14728913808 
> (arcturus_ucp1020_defconfig)
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Michael Durrant <mdurrant@ArcturusNetworks.com>

Since this patch is fixing a build issue, I applied it on master.
I also fixed a check-package error (by removing the .checkpackageignore 
entry).
I'm giving more time to the rest of the series, in case a defconfig 
maintainer
would like to comment.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
