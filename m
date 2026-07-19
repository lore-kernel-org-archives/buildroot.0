Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771C5C44512
	for <buildroot@archiver.kernel.org>; Sun, 19 Jul 2026 11:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D8AE808C7;
	Sun, 19 Jul 2026 11:35:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lYVzJaJqgHHg; Sun, 19 Jul 2026 11:35:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44D9580906
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784460904;
	bh=OU0xk6IZ5t6PeLnBzp7S56gsaqq//zGqtsvtDDlT8to=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ilueesBZCTbhbMheSaYjq7ovMbUj/aNOUl0fOzDgUdzBbuKGsRQGKjJJC1S+D8z0o
	 kec57JIlcRf6Q4FTOTMmrufBKyg5zvwfyiBko5GfgxW+hFUj8syxsl0vvS4gaw9Coq
	 sLQpgscU3Hm0wFnQ15L5mgSMM82CeBoLLPnDf3UvTkAZ07S2vu3USibbZg0CnE6vx/
	 7nAOIskMRXz9P0C2YR0WwgjyT769yfE0jImgLaTKAi97P4Er3qvt3e9T2GpLX44kIh
	 QnJQcwm16itYej0MwSAPVfo11bwnPxDeyZTfICi39Vmra7SkmH79EUOZkMqsBP4dYy
	 XpkIzcnyfcz3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44D9580906;
	Sun, 19 Jul 2026 11:35:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 646561F6
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 11:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61F9540560
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 11:35:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZU4lcXH0S1Hx for <buildroot@buildroot.org>;
 Sun, 19 Jul 2026 11:35:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6E4FE40553
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E4FE40553
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6E4FE40553
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 11:35:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 05E9D13F8B9;
 Sun, 19 Jul 2026 13:34:54 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Jul 2026 13:34:54 +0200
MIME-Version: 1.0
Date: Sun, 19 Jul 2026 13:34:54 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Dick Olsson <hi@senzilla.io>, Fabio Urquiza
 <fabiorush@gmail.com>
In-Reply-To: <20260718065215.928877-1-bernd@kuhls.net>
References: <20260718065215.928877-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <bc1bca259632eed8b37c4ed0c13416f4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784460898;
 bh=pH+fvdO+IFKaZQEIXruYMiOccB/bG+KXDLsw9UCcv00=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ei9UC1qRXFXvquKogeBiLrqAJOAT8/A8lVHiVm3RbMRAhDY6UTBU98xhp1z4N+nb/
 7WfML2HfsHgJ5Q9G6l/0HHpk66H7zJf3dE2PqjLC5+58R6hM0U6ZfC50MqwOC+NUp0
 Zr40pI+tbhFoa3uGtW5g5BCwHSDJ7VmME7MttoZmLyV2nP/IWRCI+8Tg7T0Wm2H/rw
 c+nG486d8zkVmTYArbL+U16AIkUNELz9uj4o5A37dTc1r4hb9tnBN9dnipIJp1SnEF
 plPXCf1r2FqDZpQWV1stHx4bF5ZVUMnBwa+QUvhnfegvakwgQFUuFqmyj8V9MkSlXr
 y9skZ9KhRsfpQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Ei9UC1qR
Subject: Re: [Buildroot] [PATCH 1/3] package/bitcoin: Fix static link of
 libevent
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

On 18/07/2026 08:52, Bernd Kuhls wrote:
> Buildroot commit fabcd7c8cc44e7e03c68bfcd2b4e2d10331a93f6 bumped the
> package from 28.0 to 30.0 which includes upstream commit
> https://github.com/bitcoin/bitcoin/commit/b619bdc3303217f4415342fe60e586e18fa48308
> that was first included in version 29.0 and changed the linking of
> libevent libraries.
> 
> This causes build errors when linked statically due to the wrong order
> of libraries. To fix the problem we add a patch to change the order of
> the libevent libraries.
> 
> The patch was not sent upstream because libevent support was removed
> from the master branch with upstream commit:
> https://github.com/bitcoin/bitcoin/commit/35d2d0679782581cbbf05babc59f0f28858a9b72
> 
> Fixes:
> https://autobuild.buildroot.org/results/80e05370b6542ba2f5d2908bad7f420f76dc6831/
> 
> The oldest build error of this kind dates back to Dec 2025:
> https://autobuild.buildroot.net/results/6bb/6bbd822d55dfcf3862e8b713323e0f34f65990ee/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
