Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 752EFCD4851
	for <buildroot@archiver.kernel.org>; Thu, 14 May 2026 08:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B79C40CF2;
	Thu, 14 May 2026 08:25:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id phf7gzpEO-XJ; Thu, 14 May 2026 08:25:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68D0040C52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778747130;
	bh=LGUcjoPFp/PoA1tBjiNKpkA6RIH296Y0tz+zN1m4GZU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GNvyUU8E9Yy41895k/UyGeFVsA54IJzKfscMVtrigQxHDFfJ2ChiGBI5rSVDwhUqc
	 Q0JvEPouVfu/VJ+aw1fApVOD9MVQE0IGx3kJYFGdWoGuZ95tr1jdH+SUvrtRpRF4F4
	 CIkIa5/v0Ag7UhABqgBHG5oSQ0ZJpKk/DNZXAm1kuA8zh7GylIJG/WEpJ8gLPLFtkm
	 NfNb4fLgJq7T+hXKcQyejB5cGAjLzsxnMNeam/0VS6Wo57FLEG+xTk7TuZfOivd1LU
	 E92qO6fxFI0bSKrGJhNHkVBMlX3HHEH1owimY5P9Wld3x+yzL90ECdvYSCwGL/2UM7
	 UZuHITROMp3Nw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68D0040C52;
	Thu, 14 May 2026 08:25:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F2B836F
 for <buildroot@buildroot.org>; Thu, 14 May 2026 08:25:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90A0A8227D
 for <buildroot@buildroot.org>; Thu, 14 May 2026 08:25:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zp1cSE-ky5As for <buildroot@buildroot.org>;
 Thu, 14 May 2026 08:25:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2EA6282273
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EA6282273
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2EA6282273
 for <buildroot@buildroot.org>; Thu, 14 May 2026 08:25:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id D501F13F8B8;
 Thu, 14 May 2026 10:25:23 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 14 May 2026 10:25:23 +0200
MIME-Version: 1.0
Date: Thu, 14 May 2026 10:25:23 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260514062942.20224-1-bernd@kuhls.net>
References: <20260514062942.20224-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <fbe402647c20641da9ef9aa6df26e382@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778747125;
 bh=RtafJs/XfmWDJ2V0aYnV8XpjbZLhXWeaBCcqXtQlQvc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iVkUIWjUL6TBjZszCKy3lWVdaStJyRJfWeUkCxXr3S58bxVpq1lAx/P8rzJ+aH+uG
 1+EgrsdYG2FB5lmYLxBjUyU7la4ATXU/BAwLD64aQCEfKgeUhwSRb8kQtZNq1/sj7N
 K2NogwB6nTpQVRyyilklViYW8jSXUUNMmAUs5WH1uJuJsSW08eNC9ya+pIZgcZXxdi
 /xDx3UYVsb5VbZH/FaCLCRZDTbks/3rtyC/Z2r83fcX0OKLURUKuxiiqf55MUpeHlM
 n0oka8ydqzPwIyROygLMNFPR6tx5mLfK24WXDXnrHCX5ViAXR7m5/oGepWE0VQbp99
 IzhGeUKyFczzg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=iVkUIWjU
Subject: Re: [Buildroot] [PATCH 1/1] package/intel-microcode: security bump
 version to 20260512
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

On 14/05/2026 08:29, Bernd Kuhls wrote:
> https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20260512
> 
> Fixes CVE-2025-35979:
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01420.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
