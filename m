Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A1DC369A1
	for <buildroot@archiver.kernel.org>; Sat, 12 Apr 2025 10:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 863584027B;
	Sat, 12 Apr 2025 10:57:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cj6DTxdBo_eI; Sat, 12 Apr 2025 10:57:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1AB04065D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1AB04065D;
	Sat, 12 Apr 2025 10:57:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A871108
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 10:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 402F581EEF
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 10:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JuUdmsbq2aBn for <buildroot@buildroot.org>;
 Sat, 12 Apr 2025 10:57:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F28148210D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F28148210D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F28148210D
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 10:57:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 2594A13F879;
 Sat, 12 Apr 2025 12:57:28 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 12 Apr 2025 12:57:28 +0200
MIME-Version: 1.0
Date: Sat, 12 Apr 2025 12:57:28 +0200
From: Julien Olivain <ju.o@free.fr>
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250320172543.2490556-1-aperez@igalia.com>
References: <20250320172543.2490556-1-aperez@igalia.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <c29cf2115e9b79b8d18a79af0bddbea6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744455450;
 bh=grsCPitz94rVDifCYTik5pRZlQQD/FjH2bnW0fczVEw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uKGXzFqD80O/5K0YSJlPPDM/iWacIy3cESTAClpNUmusKaM+bRron/upB239E1wKj
 P8ogjbluyPcNDNcIypheRlvJ01WcKelSo8Is5B8QU+2XKCNP0qSUxRyYGFT+vzOOBg
 k4fqy/+bsbvab6uGwIkSm7SzsxBWMUuOIVFDL357lBwQOWB7Esp0bGQvP5Us1welaV
 t64xa/nfxpHYekegBRUpCOONvaVCmIrYxZQb+JbcGPUXdEYVrC31TNOdd6+9bT5VJU
 7B7ZaKpD4n3wPIm5JNmz9uBfSR7JOq5Iraq6W6yRdurLvei0kvUiC6GjPFr+YQAG6C
 RZkQRPuqWSaNA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=uKGXzFqD
Subject: Re: [Buildroot] [PATCH 1/1] package/libmanette: bump to version
 0.2.11
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

Hi Adrian,

On 20/03/2025 18:25, Adrian Perez de Castro wrote:
> Bugfix release with a number of fixes, it also adds support for the
> Steam Deck gamepad. Release notes:
> 
>   
> https://gitlab.gnome.org/GNOME/libmanette/-/blob/1acb46943d4d970abe594b634a058c93b3021258/NEWS
> 
> This version introduces a dependency on the hidapi package.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

I applied this patch to master, thanks.
I also propagated the missing hidapi dependencies. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/3a3ab70fc2f4c26c4d943de01748b0fa2c0cdacd

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
