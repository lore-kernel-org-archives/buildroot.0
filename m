Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C5FCA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8A9081373;
	Sat,  3 Oct 2026 13:14:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cf2QvGc5Qxzd; Sat,  3 Oct 2026 13:14:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7FCA881340
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791033265;
	b=B6tAoxv5uCDLTRIj+j7uJDPVGmtH/gC2pNUN22Pmq51zfTm42A+2WHkg0OTUgZxIcEyC
	 DoFAuFMeYb2jSOtcMRNW06tJcoZLMyhtfZ5/PjoBYLTgqcx7MtRgopTRcWH2lAQUvqW/U
	 Y9EuG2cOChQa86Fil5UGoM0imipma22MtSblt46FWILNMzySImwrnWaaj0bIjzdU5QS0k
	 Nq82JK2lRYqzxMP21Z2dz5A07BxAyOzryKdEGdxX2TCrjV2dAUEdTqhSskjCzGZ2CGiXr
	 GNHUfD91MnCIac+bKgpUTktoF47P0YgcNyNCfDW1pa6puw8DtIxgb5wK6KFnv/qwn+g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791033265;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=MzLvqBOo/lWx6oX7ITQUoqJGhtR/pprrDVHHHrgGYSs=;
	b=KvxecTJKoUCu4uOvQh02/oqfiOl2i8Guhggr4rElm5KaoTstINbtWJzAMP7aa7uW8J4E
	 mjmtiw/kxpsnwHeq69eUx1+s2DDu1ZDn8WV23CfWo4GW5wd/3l8DrJTNnZXOSfIRI7tBA
	 nf+mNVZjL9ohHgXk/J4Znq3qEn51zBSJsmodX0v1cjg5Lb6oDwUyg476pA27hCjMdZRut
	 nuWSOl78Z+fsPemUEHjVr9h7PWA8OSMgBNndAKHAYp9mXH6grssj3UifyDCAMCxMKiX2Y
	 8ELnl6PzmCPFe1nGUdqaBHw2s04ZsnH6/B4LZlEp+EgYVtGErWsoD+28uvejE8fZqhg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791033265;
	bh=MzLvqBOo/lWx6oX7ITQUoqJGhtR/pprrDVHHHrgGYSs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ak9Mf5FO3c04FSqt1SGdoudLBUZSbtDfuQzcMRf5gbZ9EEBOB69OtbF2Hu6eKnGC3
	 TSHD2WxRG/zYDai9nnLcDqP7VEpQhcyhKJBHT3XrqxmnWY/6ARD6I4iUH15fnfmie6
	 H0qOLSykPLd+rg2g90kRZOkkCZcD1/Nvu5tFGU8qyv0gLWdevGnbAguc0/c7XidnhN
	 6eWrqXDk4utaJyQ+SKdEX7XlhyqKvaIKMqqFIIw/Wb6u2t1ScNIelZwYP40KELbAIY
	 wb7JfVq2HAZgfpWg2HVvxC6OZQXoVqfIbKLnLooYr9MBumHyD4pGjhQymVj4MB+0mt
	 7/IXji4fdLONA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FCA881340;
	Sat,  3 Oct 2026 13:14:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 26659179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 167B46067E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:14:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jmigQ7Kii9QQ for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:14:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5F80A6064D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791033262;
 b=mc5FJbY3tZLtu9pbxnRnKOoeZRhehjGv5YXbMoCtpGUs0T7tz9JfLYzDt+GwSePHY0iT
 aHEJuaW+m3A9+lK/vcMd0o6h5odZ7ErcKd/fTFpU1j1zTp4IyfhG5F4AkYKc025LrDOqQ
 Z8DimuCyLh3BHJfg7rfQ/q5AgblkY2jYv2FdgE7MDAqLKKdYt4Rbw2X3fj9OiStFyRVHC
 YCnr0P5fzaNZi+93XR9I5JCb4iaVFSGzY3HzCxeD+BoYk0BoxsPg6xjEM/tIkPnGu3XQZ
 ReKHqWJhCUAOS3+bILnKGjngTCfkIt65jnCk2+tnAw0xffrkdIRK5ZuYG96g4ZkAxIQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791033262;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=c0C2trc6hroW1j+/Cs5hP8a1BE1kYOW75G5LoRlHefI=;
 b=Q8D5tFfWOADWUC/VH6lL6nnnWes6VVFssUmcT4LkW1OA8OHtALGWZ3nywJBv87uVy1mr
 nzpkPNJ88Rtf6FIVem0uXNfyJPOGlbVby9pJ7awjFAeBcCFPZrviJOfXQaRzF2SeSP7Ut
 5+UXetmKS/OOC7idwg00XPX+O6AsQyLehn0T5RZlvsVu2I4hQXeqcotFwmDQxRKLoDMIp
 PxJVW4b1bHGRg1AH5uC3W0JXV8GsZLuib7UiroXVeYUIY6GyH0bDScJCOPXlKEERqBMcf
 jXOZkFTK/e88gBVK9oFVs1DuDUfa76R2FsDCZ8neCrDh+pcyZ7lPDEgqeRgLiT3Lq3w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=CZGJVXhV; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F80A6064D
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:14:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C35081A10E3
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:14:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7AA6D604FF;
 Sat,  3 Oct 2026 13:14:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 80EC5103282A8; 
 Sat,  3 Oct 2026 15:14:17 +0200 (CEST)
Date: Sat, 3 Oct 2026 15:14:16 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <asD_YLI0NTgSRYAy@windsurf>
References: <20260929183607.1849293-1-bernd@kuhls.net>
 <20260929183607.1849293-23-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260929183607.1849293-23-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v7 22/66] package/dovecot{-pigeonhole}:
 security bump version to 2.4.5
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Sep 29, 2026 at 08:35:21PM +0200, Bernd Kuhls wrote:
> 2.4.0:
> https://dovecot.org/mailman3/archives/list/dovecot-news@dovecot.org/thread/UYNR6GBP25XEGFCS633SWPR4HXV3NSS3/
> "Pigeonhole versioning has been changed to match Dovecot versioning."
> 
> "New 2.4 packages are not compatible with old 2.3 configuration, please
>  carefully review https://doc.dovecot.org/2.4.0/installation/upgrade/2.3-to-2.4.html
>  before installing the new packages."

[...]

Thanks, I've applied. To be honest, I'm still not entirely happy with
the patch marked:

> +Upstream: n/a (buildroot specific)

as I believe if there's an issue affecting us, it should be reported
upstream and discussed. Nevertheless, OK it's a one-liner, so let's
move on with your patch series, but it'd be good if you can bring it
up with upstream.

Thanks!

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
