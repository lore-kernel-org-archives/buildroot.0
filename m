Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0277D103E16B
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 12:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70DC060A58;
	Wed, 18 Mar 2026 12:21:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id li3gWsdrQ0op; Wed, 18 Mar 2026 12:21:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32A1460A38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773836478;
	bh=azZwqNzhKWsGQeji8of86h9ByAVXggWuwd4qia+B7mw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jOySSLXhooQgVXangFuASlf0OROPqeI/JAkrY7+x5rmUtsVSPwluEBha5c58eHevG
	 58aj0Au0C2x4fHMAa3bEsE0iyreAl2y+hiXK0Qja0V1yNX0bQRCy6PVFgBEW0DXYlQ
	 Ma7fGcGaYLT0pzGI6lAusSmfvIyfub19FX7F3YiebmfuRJAyifBMbF4i/qMZzVhGTy
	 xO7915YKslUzd/rp1GnLb2o2V0f+OKrvHTPClNnLZEsh/+UMlHO9LklOcqaOXlUMr1
	 XLdMBNLy7GlMV/rxHtlXwB/csgo1gAU7Puitft1R7THIVajP6RLen163iOcWIRqF6C
	 ArTHx/O2QfKWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32A1460A38;
	Wed, 18 Mar 2026 12:21:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C8C31AD
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 12:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06A77403A4
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 12:21:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ckbioCY6RBFl for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 12:21:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5EE54403B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EE54403B0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5EE54403B0
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 12:21:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 3C9DF78035E;
 Wed, 18 Mar 2026 13:21:06 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 18 Mar 2026 13:21:06 +0100
MIME-Version: 1.0
Date: Wed, 18 Mar 2026 13:21:06 +0100
To: Dong Wang <wangdong115@foxmail.com>
Cc: buildroot@buildroot.org, Gilles Talis <gilles.talis@gmail.com>, "Yann E
 . MORIN" <yann.morin.1998@free.fr>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <tencent_050C53AA1542B502959C63391A9BC01BC208@qq.com>
References: <20260317161759.36050-1-wangdong115@foxmail.com>
 <tencent_050C53AA1542B502959C63391A9BC01BC208@qq.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <b61cf12529bb7e8a109089686adbbb74@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773836471;
 bh=0UygEHO5WlVO3Upaz75XgPf+W7y57FPLuc39s4yYWls=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kUpbhDN+MRThHt5pTkyEQAROE/yXqFUo36Qgihxrz0fxIUFU1TG/FYDj2if0UVJSF
 8Zj1mk3XTKOiOmLlPpkeRac5qIS33nXjRlxrueHDP4hl11sSHlz2XtEZ3U4YEdHlLF
 722ChiUiB6Fq+NO2fz49E32sGPIImQBsMBh00Y3FN1EZJiQkRQnZl4vyW0GVQowKgt
 YWrW5jOV8pPrVrUgfLyHd0qbhD6lrAmUMT+v+e7OtX+sED+qTQxA/MwIwe3UNLac08
 THyzhJLBn4VtaYeVYxeqchD5GT7YhBqTO9wwhZJaywI5RhWFVZUEs3/hUakfMFf3Si
 LzzO8ttzeFAsw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=kUpbhDN+
Subject: Re: [Buildroot] [PATCH 1/2] configs/friendlyarm_nanopi_neo: bump to
 kernel 6.18.18 and U-Boot 2026.01
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

On 17/03/2026 17:17, Dong Wang wrote:
> This commit:
> - bumps the Linux kernel to 6.18.18
> - bumps the U-Boot to 2026.01
> - switches to a stable glibc Bootlin external toolchain
> 
> The updated U-Boot should also fix the CI build of the board.
> 
> Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/13458392712
> 
> Run-tested on the board.
> 
> Signed-off-by: Dong Wang <wangdong115@foxmail.com>

Applied to master, thanks. For info, I made few minor corrections. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/916331b9172a9aca28edf8492f323bbcf1996c30
https://gitlab.com/buildroot.org/buildroot/-/commit/367e9bb04bc301fced2846f0f81b0440cc10b317

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
