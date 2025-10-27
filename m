Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A733CCCF9EA
	for <buildroot@archiver.kernel.org>; Mon, 27 Oct 2025 21:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 692AC4160F;
	Mon, 27 Oct 2025 21:19:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m4gFMbUranqo; Mon, 27 Oct 2025 21:19:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98D12415FD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98D12415FD;
	Mon, 27 Oct 2025 21:19:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9834F70B
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 21:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E33861421
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 21:19:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K0WJuQwdwmDu for <buildroot@buildroot.org>;
 Mon, 27 Oct 2025 21:19:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7BC0961420
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BC0961420
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7BC0961420
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 21:19:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 4B1B719F5A5;
 Mon, 27 Oct 2025 22:19:42 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 27 Oct 2025 22:19:42 +0100
MIME-Version: 1.0
Date: Mon, 27 Oct 2025 22:19:42 +0100
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Sergey Matyukevich <geomatsi@gmail.com>
In-Reply-To: <20251027131539.11774-1-titouan.christophe@mind.be>
References: <20251027131539.11774-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <69dfa5eb3c26753e01c16ddee5205821@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761599984;
 bh=sTz2hrU8MuCxArilS/jSnPWoeB3Hme3qUQrOOKb11Wg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MZcJoH2CtKFNbpeKVmEbACq411Q8Yg/JpOp1evuvKm59JYz3m9C7602PmZdktZrj2
 J8UGm+fqt7/FI/BcMF/+yEaC8fC5StASIj8XeXrCLBAJPjm/r9/zBjtinmJ9RQUB5P
 walOlzU56S0g6Iau/wImbFMxYwbk6Jptre49gIoYWvmbTkOqsg4631Kq5ZpubInvDQ
 UO4WbMjFI1BfBYpgjP0UWhTMg91WbS9kjiS8To0AuMfsM6k0efkIA98FaaOtyGZvl/
 KiD1Y3XKj/l5r1o4vRsrpLIaWhF+mskt1HmPyR/1rNawCbov4Yfcy0UBRNw2JlAGfs
 wZD7sUKIXlrFw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MZcJoH2C
Subject: Re: [Buildroot] [PATCH] package/hostapd: add patches for
 CVE-2025-24912
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

On 27/10/2025 14:15, Titouan Christophe via buildroot wrote:
> See https://jvn.jp/en/jp/JVN19358384/
> 
> This fixes the following vulnerability:
> - CVE-2025-24912:
>     hostapd fails to process crafted RADIUS packets properly. When 
> hostapd
>     authenticates wi-fi devices with RADIUS authentication, an attacker 
> in
>     the position between the hostapd and the RADIUS server may inject
>     crafted RADIUS packets and force RADIUS authentications to fail.
>     https://www.cve.org/CVERecord?id=CVE-2025-24912
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
