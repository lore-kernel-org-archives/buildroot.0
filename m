Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A824FCCF9E3
	for <buildroot@archiver.kernel.org>; Sat, 25 Oct 2025 17:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F4808128A;
	Sat, 25 Oct 2025 17:17:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6SSaQg80sseo; Sat, 25 Oct 2025 17:17:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 932538121F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 932538121F;
	Sat, 25 Oct 2025 17:17:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BB808D7
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 17:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD63A8121F
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 17:17:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eQuKyCkKSFGe for <buildroot@buildroot.org>;
 Sat, 25 Oct 2025 17:17:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AC4E581210
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC4E581210
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC4E581210
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 17:17:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 145B02003D3;
 Sat, 25 Oct 2025 19:17:31 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Oct 2025 19:17:30 +0200
MIME-Version: 1.0
Date: Sat, 25 Oct 2025 19:17:30 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251022163942.21604-1-dario.binacchi@amarulasolutions.com>
References: <20251022163942.21604-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <d8518ba2a946fac0f86df821005eb66d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761412652;
 bh=dLOVJcseQE/Ap02rL/BSaFhMYfmyBq89bdunivas5Jk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Vpra3xdN0LwAstYDLuKnf3la8yiv99hUXUW2uYcjBh2XJomriydYgJ9f19DQ4BPz7
 fzpV3EjySQhRXsUPxZ3M23AH/TLNOlo15NajNEzzROFmYOEpQetgIrNPPXQl4Klbb+
 VvB8z4snO9It7WhrrEBz8vjA9Pc/ni0dQ9l4KQC/BLRmG8XKU464KB7nJNtSIxu1tg
 G7RBPVMk6cnfuuEVhrCwYJgSW5xksLhmWYuHdB4k/vinaL3wERpHhU6a0EsPSnBtCB
 xkeLcwATjE+7pl7x2SOF751NvjtpPe/XQaK+C08k83SK+3akedXIJywl0+5b4BUhxY
 sEjFl70HCC9iA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Vpra3xdN
Subject: Re: [Buildroot] [PATCH 1/1] package/libevdev: bump to version 1.13.5
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

On 22/10/2025 18:39, Dario Binacchi wrote:
> Release notes since 1.13.2:
> https://lists.freedesktop.org/archives/input-tools/2024-May/001588.html
> https://lists.freedesktop.org/archives/input-tools/2024-September/001589.html
> https://lists.freedesktop.org/archives/input-tools/2025-March/001592.html
> https://lists.freedesktop.org/archives/input-tools/2025-October/001593.html
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
