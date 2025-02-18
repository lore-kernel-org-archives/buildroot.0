Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902A7C021AA
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 20:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52A9283ADB;
	Tue, 18 Feb 2025 20:31:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gE24l3fHelkH; Tue, 18 Feb 2025 20:31:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C49C83AE2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C49C83AE2;
	Tue, 18 Feb 2025 20:31:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B092C8
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 20:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79C5040D5F
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 20:31:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cy8-PHggcbkf for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 20:31:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 093A540D4A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 093A540D4A
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 093A540D4A
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 20:31:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id D99665FF88;
 Tue, 18 Feb 2025 21:31:32 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 18 Feb 2025 21:31:32 +0100
MIME-Version: 1.0
Date: Tue, 18 Feb 2025 21:31:32 +0100
From: Julien Olivain <ju.o@free.fr>
To: Gilles Talis <gilles.talis@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250218092816.971472-1-gilles.talis@gmail.com>
References: <20250218092816.971472-1-gilles.talis@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <96e612b771c5e9bdd80a59fb02cdcf9d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739910694;
 bh=k9WmioPDdImijwxfCXqcVYfZMHCeAtXPRTcPFtRiT4I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qoQP45mSMTqFk5DXhQr1zS43o771MMVUgOnod7cH7A7tQI7NNVfgPQHFFI8wu261I
 5HoLr19PSuHLzzlRWB6f3UALC26nEawnX6Nw/pYtWlVcRXzwXBLMHDH/OXB5zVz+91
 w2WnhhqQ/stOw/MRoFoTAAj9xw3VBRk3DStniw/4faHKhtJgikcZB2lSkwrH6lsCUh
 F6sDkUftDVa3yD15i4pf9Dk+hL1dyN1C8pL1/5VQEqyf2fT3BuTOo44Dw/UGqx0tV8
 wTz/irKuia4zG2kKdCcLsy45GH/KZWpRKd4ICQG7L3/7X4nWS3u8N2CVsXXJ/5D1GP
 QOjqyv0mlVmYA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=qoQP45mS
Subject: Re: [Buildroot] [PATCH v3] configs/polyhex_debix_model_a_defconfig:
 new defconfig
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

On 18/02/2025 10:28, Gilles Talis wrote:
> This configuration builds an image for the Polyhex Debix Model A SBC
> 
> DEBIX Model A is an industrial grade single board computer
> powered by NXP i.MX 8M Plus applications processor
> 
> https://www.debix.io/hardware/model-a.html
> 
> - Linux Kernel: Upstream version 6.12.14
> - U-boot: Upstream version 2025.01
> - ATF: Upstream version 2.12
> 
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
