Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9916D2A532
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 21:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7290D60AB2;
	Thu,  4 Dec 2025 21:19:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xaHUs9mPJovi; Thu,  4 Dec 2025 21:19:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C20F60876
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764883195;
	bh=m3JM59dkk/QNgyVMaQdhn4RhNYjpxN0c4QqPXX6Cdvo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Wel8U7z8wmlajrBY0sAPaWrsKjKH1f+KV9i6WVCHwIZbElYBtyXS08isg/IDl17AT
	 HaEnVE9qKZZtqWwNGIHC89yj5b25rpsDSQi677thtuq3k49bFBwi/t5F0VOxMzr/3n
	 PMGcwRZPJQP0+rqap1iUUmyQQGVb+sk1+2Vef1kSD+hf6ynU7vqiGqIsiwt7WF7umE
	 KRShZsUvVZDSmvzbjsTcFIDDE9ezPJKyGzJGX+hddeUikfiIYXw1J1KdtgMvo/eB4q
	 1BFrs+PD0Q1zfj3FkYCNj9JUJUf+2SgN9WwJIBoVPquVv+D6lRDQ/5iJqZ/Q/Lc2PW
	 OuAOy8yQKczYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C20F60876;
	Thu,  4 Dec 2025 21:19:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BDDB199
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 21:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0DDBD40156
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 21:19:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ASjQSE0GWtCJ for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 21:19:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2949640189
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2949640189
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2949640189
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 21:19:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id CAEA919F5A5;
 Thu,  4 Dec 2025 22:19:47 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 04 Dec 2025 22:19:47 +0100
MIME-Version: 1.0
Date: Thu, 04 Dec 2025 22:19:47 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>
In-Reply-To: <20251204200215.2861920-1-bernd@kuhls.net>
References: <20251204200215.2861920-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <881b67fd57af656a22639391a55687f4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764883190;
 bh=8dUagimYa3QMTpXHPFDQd72KiyqoPBmOmPmfiKixEGE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dfERu9K7AzMNNBPe+OzB7zzjEV2wWL7XmOcJRnPIb+zGeyLelQYXCM0WOUValxua2
 HD9j84f4feyVEKME3+R89giTUpywiaV/goWh/0RnLYjStmR+ihDgbVwkst9P04clFO
 Vt51++BSZbj5Ue8xFiRpOAKgQd5fRA21EAu0aC04PeQoYSWQezQD1Ft5+jwt4wr6Gm
 AMY4fzHCyzgtckyoFwmJujywtfLy1o6OTfoEzlDAYn8DCHptPYCs/u9aW+O3boW9jj
 wsXFbtHDewnBGath+eP0EgDjGEaizMhvf5riFcceNGhv8D+GShtEnC9e6P9ORmZWmp
 /9gmC1JqG5How==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dfERu9K7
Subject: Re: [Buildroot] [PATCH/next 1/1] package/llama-cpp: bump version to
 b7271
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

On 04/12/2025 21:02, Bernd Kuhls wrote:
> Release notes: https://github.com/ggml-org/llama.cpp/releases
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
