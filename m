Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51527F46C53
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 16:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C20B80EE0;
	Mon,  6 Apr 2026 16:17:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KFMHcRuzzAuh; Mon,  6 Apr 2026 16:17:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97AC580EC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775492276;
	bh=5KZfalk4YMzqxF69Vmb61gwyOdNMmwWYAZzoQIAxFOw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HxqmUgs9dFYt1BU4qaB/zZ5GwzzkdAD4m4SzZe5a+K3VYgpru8aeqwtncOpbalbJr
	 oY44azhYYL2fzrrO/DGQdfKPtpVkJhFE9jKAw+x1dtxbZDC90prH1+gk7xi3JOAT3M
	 QDctqHO+zY/oVAe+KLoPo0SPrO9WUJx1lAm0mY3+H7r7z73Jnj6rhfPBz6UsO+GJth
	 Dr4OKzjZyP8k4dwsgmimUG2741BgBN0o3IWJHc3AyFxS6aGnlCupBdngM2zffxFQe8
	 CwWW/ScvUIzEgRQP3lA3wKt3sZW8OytJtcXsBiaV8ijv2ioTNyolnJ7cN6D5dcv1mG
	 1pEWceeVgjy/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97AC580EC8;
	Mon,  6 Apr 2026 16:17:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 633DD2EF
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 16:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 486E280ECA
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 16:17:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BjxmYdB59TGK for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 16:17:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3A55580EA3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A55580EA3
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A55580EA3
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 16:17:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 2192D5FFBA;
 Mon,  6 Apr 2026 18:17:49 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 06 Apr 2026 18:17:49 +0200
MIME-Version: 1.0
Date: Mon, 06 Apr 2026 18:17:49 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Raphael Pavlidis <raphael.pavlidis@gmail.com>
In-Reply-To: <20260403182806.4087549-1-bernd@kuhls.net>
References: <20260403182806.4087549-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <5d9c0f2f680bf9f302421f3a633c791b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775492271;
 bh=MUNtsTBnJREwtlSIfDIhgtLhtcUGXAgoLwwCdGb3ERE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bOd6bdffLeMHw9NvKBUc5lT5/f8bhzf3WawBgccmqwU6wqqpz33zQ8VaJvI67WTrG
 l7l/g/Ibq8+3YJvr3dTy9tiG2CTKtcRA5NI/QCUJcmKw84mQQvJfJsYuMtpd8SmGrn
 aTCLSHQYWuVnw8zvQ5F4DqFizrn68iPLE3ONjUq3/oE9T4FuTInq3z1SomiXYXu8Ll
 jV1Q5LYBppQnPfh8S5JUElkmeLqlMlLJ3+xd0x85b4y5W20iXXNWiQ9m4glC6hNwoO
 cgn8FfZIlqHe4zPOBT+/SR8FBnlYx+E1r4XDphdavWbhjHGFGnxfPtcBVwpazoiXi2
 FPmsVfdP/uZMQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bOd6bdff
Subject: Re: [Buildroot] [PATCH 1/1] package/sway: needs pcre2 instead of
 pcre
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

On 03/04/2026 20:28, Bernd Kuhls wrote:
> Buildroot commit 0645cb39e0ce3af743190e587812a5bd4c1f4b24 bumped the
> package from 1.7 to 1.81.
> 
> Upstream included commit
> https://github.com/swaywm/sway/commit/f614f35e7354980bf4f0a66ca99be9b5f3a7ac90
> in version 1.8 to switch from pcre to pcre2 but the buildroot package
> was not updated accordingly.
> 
> Pcre2 was already selected by pango -> libglib2 -> pcre2 so this bug 
> was
> never noticed.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
