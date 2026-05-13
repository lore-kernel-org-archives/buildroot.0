Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3114CD4F21
	for <buildroot@archiver.kernel.org>; Wed, 13 May 2026 19:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76B7760758;
	Wed, 13 May 2026 19:03:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id evVFikssGLbu; Wed, 13 May 2026 19:03:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F35B060749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778698999;
	bh=E0eHeE/9B1y25X3M+/iTtiXlLiPgf4aC5PrIoLU2hto=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=D1teGszPVy9U7Yp9j1HIiLsqKDYJI/iWLSsJaE6iK88h7ghDUc3MUJ84PkUflhB1F
	 c27QhI0yTwSjnyk+snZMp+d8gb1jdkzvhs+8IJpgj+ZmWcNgdhRkCqcHnDQuF7sPsX
	 4oNiKIhzWyIoyXBBsfwhrL2hCjB/GP4ULdOXEPpMfM+EqlBQ47fDVMeerCd4xbYG4u
	 Spl3sfmpwPe3ES8cWqznUeMcEEwjrI3U4CTGV+ynvjuB6OnR3yjEXjat1BBobfSOGH
	 KLX8R2CWQNHzqreH+R8LEs85dM1ryBM498ih68kVMkpd2EVuEHHMeRrHLOHZYHyUwF
	 o818tpuHskbpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F35B060749;
	Wed, 13 May 2026 19:03:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A5D45270
 for <buildroot@buildroot.org>; Wed, 13 May 2026 19:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95C4880AA0
 for <buildroot@buildroot.org>; Wed, 13 May 2026 19:03:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WnwxLGfuTn9k for <buildroot@buildroot.org>;
 Wed, 13 May 2026 19:03:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C148980805
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C148980805
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C148980805
 for <buildroot@buildroot.org>; Wed, 13 May 2026 19:03:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 779605FFAA;
 Wed, 13 May 2026 21:03:13 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 13 May 2026 21:03:13 +0200
MIME-Version: 1.0
Date: Wed, 13 May 2026 21:03:13 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260513142307.902102-1-romain.naour@smile.fr>
References: <20260513142307.902102-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.14
Message-ID: <7c7b1f492128b5c875e910c22d938906@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778698994;
 bh=P2pW8qGE5j/Bm8JtpyNwY5UGdE0ja7YIQkNq7E/sPNk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=asAG3ALyxOb93yVoWIC3mNVWRf78VrffDggbnubkMDOHgz3Gc80ZaMHV6P/k1Lsap
 AWcNi7WTXTSZTWn5m3TGkOQnRx/zdrvtRuOlhFFsBx+pBqy8yKKoRqYdtEt1UU0LCA
 b1iveaXIpHK09PftAwUl8ecknblpUlYesUi9iGHqmZM3YExAfniBH4rz3ZAjy+6mUU
 NsmuLc0wOpdQ6kKycWsX/FmijOD8+MiMRwxErO123fAAe1KxVKmO+Is+bjPzRhCb4A
 8sDc/a3VXT4pt1p+1OztYl8GZb6P4tkNijLaqWdaE6NJHrUOYQVWEepgUQ/63xrPBu
 n736E9CqWQWkA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=asAG3ALy
Subject: Re: [Buildroot] [PATCH] package/python-sdbus-modemmanager: fix
 sdbus-modemmanager intall path
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

On 13/05/2026 16:23, Romain Naour via buildroot wrote:
> Since the last version bump in commit [1] python-sdbus-modemmanager
> install step miss-behave following the switch to poetry (as reported
> by [2]).
> 
> The sdbus-modemmanager python module is intalled in a second
> "modemmanager" subdirectory:
> 
>   
> $(TARGET_DIR)/lib/python3.14/site-packages/sdbus_block/modemmanager/modemmanager/
> 
> This break existing python script using:
> 
>   from sdbus_block.modemmanager import MMBearer
> 
> Fix tool.poetry install step by removing one "modemmanager".
> 
> [1] 7c30b1e522988ffe5d4b300b2447f912b83558ad
> [2] https://github.com/zhanglongqi/python-sdbus-modemmanager/issues/24
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/13904075359
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
