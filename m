Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C10CD6E55
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 20:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBC9940A10;
	Mon,  1 Jun 2026 20:07:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tWgiB2t893oZ; Mon,  1 Jun 2026 20:07:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35FE4409FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780344444;
	bh=77ozWFv8RT9bLoOnSCahgDKLdo8GhPV3Io1bW1/jXLE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RqR4YtoYrcH5kKYZXGiy7yvSQDIgvNYbBsDOq9PIrGXkbFpJrbfgsRRvjajugvnHw
	 Sx/ahzD3mO7gwKWGBHC8l6zVFh+gPKvj6rqVKBOsNmo9Dh5LGqXxEMSqvYiyyFqrxP
	 /GByk3ubVUnWsd3UzqOMw4wGmDx1ZG/++K9Bnda7mkZHqWiIFuDS5JboEseaZFJRPs
	 E+xv1GXD5f6LBIAs4QJxX0mncsQL3K+dHXkQ2KEfk75V66/wKfGb3lz9Yqfg7LD8t8
	 330SAwXaDZWztKZTpGkpD9RUL70P5ZknmfJXGcm9Szm4x7dlF0hVwT/rW4RfyY4m94
	 +OGH5tQ8TfoyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35FE4409FB;
	Mon,  1 Jun 2026 20:07:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 142B6381
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3037E8103B
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:07:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yNXGgI2K4NRh for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 20:07:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5D86D810FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D86D810FA
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D86D810FA
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:07:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id C6F9619F576;
 Mon,  1 Jun 2026 22:07:16 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 01 Jun 2026 22:07:16 +0200
MIME-Version: 1.0
Date: Mon, 01 Jun 2026 22:07:16 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260531175756.1682979-1-bernd@kuhls.net>
References: <20260531175756.1682979-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <40c5a3449ab0a7e0e21473da46ad665e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1780344439;
 bh=1N8K5u+iCM4ZyMBXQmPZY/+gnTajK9YzFGs8fiEx7Qg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HnaPXAOqzosCG0Qz/KhH/MIdvRychtDbC5ntOPSPmbgQbjXgzKNmmAyJAiYq5DFOx
 /o4BuYSVmYwVYac+cSEMzrpErdpAN971qLvnfojnjShAiiTQ1MXcisZlde/pXmK+tk
 hr9M4SUaKZBRKG92IvnKTh20p5qDq65f8w2HHUUJWvwAhJtPxoGEVjZAZyFvhu0rRN
 433yOdcrAUE07oMWALe0kpRVCUAiAour1Dy6HgmB3OJwchfHirqTb1DXWwzgf3y5LK
 Lt7EQ30ltKrPJv+Pk1FdD0izJAdxLEcqfLC4lYUvVFQBLp2YseWn3eojzyLF7OCVBe
 d3h3WJ2JdMPIg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HnaPXAOq
Subject: Re: [Buildroot] [PATCH/next 1/1] package/weston: bump version to
 15.0.1
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

On 31/05/2026 19:57, Bernd Kuhls wrote:
> https://lore.freedesktop.org/wayland-devel/aespQ3LKAOy5O3Hx@xpredator/T/#u
> 
> Removed patch which is included in this release.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
