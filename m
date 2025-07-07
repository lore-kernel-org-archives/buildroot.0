Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDBCC71130
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 20:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67623412FF;
	Mon,  7 Jul 2025 20:31:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d0Gho2BPPLJ6; Mon,  7 Jul 2025 20:31:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4CA141530
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4CA141530;
	Mon,  7 Jul 2025 20:31:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E1F4A1BF
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 20:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4C8B8408B
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 20:31:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id atBaow8KoMBP for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 20:31:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 050B98406A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 050B98406A
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 050B98406A
 for <buildroot@busybox.net>; Mon,  7 Jul 2025 20:31:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 6153219F593;
 Mon,  7 Jul 2025 22:31:13 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 07 Jul 2025 22:31:13 +0200
MIME-Version: 1.0
Date: Mon, 07 Jul 2025 22:31:13 +0200
To: Michael Fischer <mf@go-sys.de>
Cc: buildroot@busybox.net
In-Reply-To: <20250707130522.27119-1-mf@go-sys.de>
References: <20250707130522.27119-1-mf@go-sys.de>
User-Agent: Webmail Free/1.6.11
Message-ID: <88bbaf2aaf86183b9d2d05ed1e841156@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751920274;
 bh=OYWpf+ei45FELuCXiF48v2k+YGFuwsypVhR5Hg+2cYM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LJYIKGLZHU2FFm/t9maR+CCT5FNI2B47FlMxiKbcFUt/2qf/io41P7yQA9PrK0wPu
 JvKTVI0zfRGwpR9o2MiL5OA4CUAj7zB8PnurjGhUdDloEEc7lCe49QKJCaM7etvaUn
 HMVdYlS75oPFx+3Kwhue8Cic++I2G4Sg3zvGwkauk19tvPRoZjAdItEMhmwLuqzxxR
 P4+5Qz1yxALSep5Am2XZsTVAEgWZ/yqYbVv2DZtr9xon1HHEKm72A3mP31HUcD+GES
 wXZN/tQWAoDvxerEQobkaZIcXFmgmxD31hMM9WSWtkgWTM8kCbSjAt64g5YLw/In62
 nw0uuGTe6Ob/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LJYIKGLZ
Subject: Re: [Buildroot] [PATCH] package/sdl2: bump version to 2.32.8
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

On 07/07/2025 15:05, Michael Fischer wrote:
> Bugfix release, fixing various minor issues:
> https://github.com/libsdl-org/SDL/releases/tag/release-2.32.8
> 
> Signed-off-by: Michael Fischer <mf@go-sys.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
