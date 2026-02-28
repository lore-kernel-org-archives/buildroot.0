Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C780FEE4ED
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 12:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C01E83C8C;
	Sat, 28 Feb 2026 12:30:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9bMt_44Q4QXc; Sat, 28 Feb 2026 12:30:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C11E683C46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772281843;
	bh=kohuE8npylohupO0bZy1GYfC9Vv3jtWT6AP4lbdGMPs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WXAsNwHEnwBSiSbOB3FeON42IT912kUm0SopbNJsTsRGKSwO2HwockzJyqtcOHhVx
	 Z6KiEFFzPg2Qs9JKFjgsHdxF8pgQqDg66rcoyI4SzOoQQkBftL90S0phaPp2e4PO77
	 wB1HMT9cUGhTRs3vFlNQt1LCia1zdWUj36Dt7qjZO4MTUBagecd9F3c+bZcXA8XwpH
	 tiXOd4tk4nNuGXg7l4/EFzsfyKmIEYKTrFxAznIX7l2E5hbya0VtCkme2mxWbJPdF/
	 1R6S8Ck8X5VbvPU7RwATy/nqNmKcTxudFr4F9cgyrAAfcU8R61P3mpP1nO/9qZmzge
	 TmBiG1OxAIwFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C11E683C46;
	Sat, 28 Feb 2026 12:30:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D671F24E
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 12:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC4A14019A
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 12:30:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0fx0a9kBd15I for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 12:30:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A9EE74006B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9EE74006B
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A9EE74006B
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 12:30:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id E3EF1780368;
 Sat, 28 Feb 2026 13:30:38 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 28 Feb 2026 13:30:37 +0100
MIME-Version: 1.0
Date: Sat, 28 Feb 2026 13:30:37 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260228110619.2758404-1-bernd@kuhls.net>
References: <20260228110619.2758404-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <56ff04b297d182d1d17ceed522d7a1b1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772281840;
 bh=DAIlK/w8ArrhKeKPFzEr/UgUSS5WgafMGC5G36K+n6k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=R80Gz8HzV1l7OfYNsfnTnHUHI5FSXqOgb9ZP5lDZZcuEOZzYbA9nmFhJ5vON+7Ejy
 dqTq0Ugr+B1uefUHK4EL3L6jp0VpAc/4+yvWhWtOhJcXF9+NSBad4vOSSXXdPOCXWN
 dKh/n+t2dIB/76YN5Gwh5PQXnI+HDIk58hVqlGvSqu6X+WF7hWbvu+OD7zfQleLl63
 n4074nJqZj/VAl5NuWOz6L1KM+/0NNARovgKlDMY4IUQl1soZbM8Hq3/7+Gzrl2ky6
 UZr194+QTPms38f9mu+3nWYy+nFuplXxbdZ7F0ZuMc52ruaSsICwMEtzo22FYtjDlZ
 0cx0AVO2Mwo2g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=R80Gz8Hz
Subject: Re: [Buildroot] [PATCH/next 1/1] package/oath-toolkit: bump version
 to 2.6.14
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

On 28/02/2026 12:06, Bernd Kuhls wrote:
> https://codeberg.org/oath-toolkit/oath-toolkit/src/tag/v2.6.14/NEWS
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
