Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60256E784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 22:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 316A180E3D;
	Sun, 28 Dec 2025 22:36:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wgb90vYTATF7; Sun, 28 Dec 2025 22:36:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5178680C30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766961376;
	bh=gflMNLjVWqMHdJ0icVK4baSuZdIuXOoN5bnjJLMTVRs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UklMMCSnYgmyum5OfX9C95ul3HONhaWMpGtLmEi/lkUKMjuC5owNs5EaF/D16KSNf
	 spOYpQIAvaZBek9Ynd6NBv7Ib9jk0VwpTxoZb+Sfpy8diJ616/eYuRMcANcyoDNPju
	 m4jAVI7obDqY39/nfvCNqLIEARlX+nhJbsFtHNb1OK253VMoDg78EHAiZR1idYYM6x
	 x1EDsEl4U6enuIokclAzItriL4+fnCRCIpf4aYtOWXfNvUIiPrGACntWYNFKEfkSsG
	 +AvTPEr0Z/4MvkijgRfmnP1RDU0e8MP39YY4CCe4pSMzeE6JMh+9XIKVkL64e4d/9N
	 hv6ssSwSFNE8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5178680C30;
	Sun, 28 Dec 2025 22:36:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DAB8D8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E5BE40215
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:36:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1JORxydF0YHL for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 22:36:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7A8514016B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A8514016B
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A8514016B
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:36:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 870BA2003AE;
 Sun, 28 Dec 2025 23:36:09 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 28 Dec 2025 23:36:09 +0100
MIME-Version: 1.0
Date: Sun, 28 Dec 2025 23:36:09 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>
In-Reply-To: <20251228192344.3025431-1-thomas.petazzoni@bootlin.com>
References: <20251228192344.3025431-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <813bfefdeab114084e0b2634fdb5ae48@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766961371;
 bh=oe/3CeRR2xyrQcIdJ6b1OoXEZkX5nP4wILPSZ4QwmmI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iTNqErppTw94vgcDXI1XS/0UF/QbJQeed0ohq9E34/tcW4kcx1BhwCS3u/VIHz/21
 zreo6ZuTiJOidn/ksDwCkzUmgzcCRnmo1HLEGV/CwwYQ1R8VN+6m4I1sPrdxuaWQBI
 /qQouDxZPnnVGzLDPkrUHNAbchEO7MN0ep0kjHyvhu2qt2SbEcLOkCy/RXqSGQp1ok
 8gbv0PmFaomMs3ozCkC+zGr3fExyN17v2XdLgSjQQemk2Vo8jDYMXS8LTfeb3HjcjS
 31b9jpK8xhTOVElCKwBmrv7XRpKus21o/7m1FLEEZrg6fRRFtnVurmt+IcsFogDstW
 65ly7b8nNeHOg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=iTNqErpp
Subject: Re: [Buildroot] [PATCH] package/vim: fix reinstallation with a patch
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

On 28/12/2025 20:23, Thomas Petazzoni via buildroot wrote:
> In commit 67e84345c156170fa01103289f1d255a74ad830d ("package/vim: fix
> reinstallation"), we fixed the reinstallation of vim for the target
> package by removing symlinks before calling "make installlinks".
> 
> However, this didn't fix the same problem for the host-vim package.
> 
> So instead, this commit adds a patch, accepted upstream, that uses "ln
> -sf" instead of "ln -s" to create the symlinks, allowing them to be
> overwriten on reinstallation.
> 
> Fixes:
> 
> ln: failed to create symbolic link 'view': File exists
> 
> on reinstallation of host-vim.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
