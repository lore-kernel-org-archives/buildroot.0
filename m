Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E3BC02185
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 18:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB56F83BC8;
	Fri, 17 Jan 2025 18:31:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fxiyXvDCYllp; Fri, 17 Jan 2025 18:31:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 090B083BD8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 090B083BD8;
	Fri, 17 Jan 2025 18:31:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E2B994B
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 18:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F81983C0B
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 18:31:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7O3E_g3xiFF6 for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 18:31:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1697083BC8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1697083BC8
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1697083BC8
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 18:31:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id E448AB0051E;
 Fri, 17 Jan 2025 19:31:07 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:58398])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 17 Jan 2025 19:31:07 +0100
MIME-Version: 1.0
Date: Fri, 17 Jan 2025 19:31:07 +0100
From: Julien Olivain <ju.o@free.fr>
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250109075957.758942-1-nemaakhilesh@gmail.com>
References: <20250109075957.758942-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <6b06bc423eee34020c8c29b9d1ee08da@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737138669;
 bh=ZfyYuf6OKvhubJdPdmKh2rjeiffVv37NqCHffJo9MDo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CYleLyjOo/ssvD8pcjQdVxvVKsKp8zK9AF/N2NN6ohio9Xq3BALHr4HaUeR7a179A
 GcG/lyzvLhuv5rnnwpYCUTC0h8QbAoL2NXx0+pW0fBEciRd6mhni1o2x94tfKzNs1R
 hEKv3eIJLY+7/i7Y/RK5Tu0OMRxUbSk7eSDyZ+lq37eq748ZVTkcoutEAGClMWHR8u
 uVedmxcm/h7YaUoIXAdjz0aZxx+V1Gdm9X8rPFhM42AZRgxwNXqRSksmWblDqZJhKD
 avpFsCck83YXyR2t4B9TgzHcEYGkGrYMpC72hKWCNQbqthYRBk19UwqG0Ji3Basstv
 7gXl5ep3biOIA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=CYleLyjO
Subject: Re: [Buildroot] [PATCH 1/1] boot/uboot: bump to version 2025.01
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 09/01/2025 08:59, Akhilesh Nema wrote:
> Release announcement:
> https://lists.denx.de/pipermail/u-boot/2025-January/576668.html
> 
> Changelog:
> https://github.com/u-boot/u-boot/compare/v2024.10...v2025.01
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
