Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB3ADCD98E4
	for <buildroot@archiver.kernel.org>; Wed, 17 Jun 2026 13:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEB214EC74;
	Wed, 17 Jun 2026 13:20:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OHC1LAnkyH6q; Wed, 17 Jun 2026 13:20:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4E014EC6D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781702404;
	bh=TX0RCp5wbPk8S6/Qf5MhMXd243kKjJlAkE4lswIsR2w=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=sBgDin1wWAKLLR8UNJH/Nv0PBk5TiV+POHnOElXzIFwvXQ+1hHRTpPiMrVs7/7R85
	 qH0Q0xw2ezMiM0lbiCqXHa7o0tL7AkYHE6myuuR80KLeBwXwKv5lRLUxTxpP8UQDKy
	 7eX4rxPKWbb27J+aKrswx28cD2FRGYFwUbWcC+8ch+o5lvwOj/HhxSARGILBahjmMx
	 mKRKAlK1JVv8TWPnryIIs87jGkwwYNpkjzKYdMs2/iwbDfNWAoQzyhSdL6/cZrbtm6
	 sBc9q0Wnnhucp4QqIwhoSG6aHC4nUjotqirlvudQf7+cSv2lWxVY7zBSN9Yukp6i0z
	 rL/04hVsFK7oA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4E014EC6D;
	Wed, 17 Jun 2026 13:20:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 68D1F33C
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 13:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 57FD385B0F
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 13:20:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id snlDKQibenMq for <buildroot@buildroot.org>;
 Wed, 17 Jun 2026 13:20:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 22ACF85B0C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22ACF85B0C
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 22ACF85B0C
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 13:20:02 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 23B4B2C80C5F;
 Wed, 17 Jun 2026 15:20:00 +0200 (CEST)
Message-ID: <c728372b-fcb0-4c06-a8dc-db5dbe102114@bubu1.eu>
Date: Wed, 17 Jun 2026 15:19:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
References: <20260604155431.886607-1-fiona.klute@gmx.de>
Content-Language: en-US
In-Reply-To: <20260604155431.886607-1-fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1781702400; bh=W7ttITz/O9zmqW9atowG2fvBLz1Nsqu1zsSLiR1JGLU=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=hBurwEPTHForF8seXRXs/v3mIyFh2PF5pu7N1XnFM6V/Ycm7apb9Yvd67VELknbL9
 DnzbrrIJjrzeRS+ljNWk69zMgFLieqYRi6NHwwEJMN/+l2G3ZbCRaozaVBIH5cqCHd
 F7Ld1XEWX8hCciIxQOEiLa/eRuTq8xNbM1ZSY6nlXQtqRR5sDU3kF1RcbA5ovPRclS
 I+TO+Kn/DY0UWLhAQ6Em6pHqxMmr9VlK4RxPFO8+ze8CkLzHl5OaZuGFnsVdHSaGR8
 e7KNL9YzgbovvvJvyDhjzHn4GYuwnqMAkqBovO7dTEkE5oMvhQL3ff9CVyIPTfCSOi
 34VHG1iF9XBsg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=hBurwEPT
Subject: Re: [Buildroot] [PATCH next 1/2] package/iwd: install upstream
 main.conf
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fiona,

On 6/4/26 17:54, Fiona Klute via buildroot wrote:
> Note this changes EnableNetworkConfiguration from true to false
> according to the upstream default, users who want a standalone iwd
> setup which handles DHCP will need to adjust the config. 

Could you add a short note to the manual for that in "Migrating to 2026.08"?

> Adjusting
> NameResolvingService according to selected packages is unlikely to
> have unexpected effects, so keep that.
> 
> This makes iwd work as a drop-in replacement for wpa_supplicant with
> NetworkManager.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> ---
> Initially I considered setting EnableNetworkConfiguration the same way
> as NameResolvingService, with ifeq ($(BR2_PACKAGE_NETWORK_MANAGER),y),
> but I think that adds complexity for no real gain: It's unlikely
> anyone wants to use iwd in standalone mode together with NM, but there
> are enough other plausible scenarios where someone might want to use
> iwd and let something else handle DHCP or whatever other IP & DNS
> config.
> 
> So we can't reliably guess what users want (like for
> NameResolvingService: if someone installs systemd-resolved, they
> probably want to use it, likewise for openresolv), which means either
> way *someone* will have to adjust their configs, and in that case
> defaulting to the upstream config seems both the least confusing and
> easiest to maintain, and as a bonus it includes comments explaining
> the available options.
> 
> I still have the "ifeq ($(BR2_PACKAGE_NETWORK_MANAGER),y)" patch
> variant, so if that's preferred I can send it.
> 
I agree with this analysis/reasoning, so series applied to master, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
