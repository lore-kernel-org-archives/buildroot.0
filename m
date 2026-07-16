Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA73C4450A
	for <buildroot@archiver.kernel.org>; Thu, 16 Jul 2026 07:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C21D780C87;
	Thu, 16 Jul 2026 07:06:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zRPAeBy-BVO6; Thu, 16 Jul 2026 07:06:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF80980C9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784185601;
	bh=yEbyGR6/wkkbe3etde01+WcXFz9DJn1QWjfLwEnoL8E=;
	h=In-Reply-To:References:Date:Cc:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rMh9EK3nBw31nUbwfaE+bQiY2boPmDWPfjtfULgebt3uB7zCJIGpZv55X/LuzlALN
	 7krWI1LX0nQfeFmgBRL1wJ2ibT2HWoyePAbAc430tohe/wd9nQLznGOqWwpJEXmaeP
	 AWpunlSuJwam9ie/Pl3i0EHMUPnnSZOmcWph9Z1iuzbNFmoeVTvinLaWwn7hr60Fzy
	 WlxO8bJddeoFM19OE5TxjMaKbyti3xnuZqQIKgSTavvSLvaJfkqO2TErwuRl6nSRxO
	 Sgr8oD0ZU1tsbZenS14gClq7N+wDqYzahaCPUe84g06A7cIKvoLqcUYzfds4S7Pn4K
	 5k12zAT/fvx5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF80980C9F;
	Thu, 16 Jul 2026 07:06:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D61DE320
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 07:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7CAF4025A
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 07:06:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bgo7HFQUSwjK for <buildroot@buildroot.org>;
 Thu, 16 Jul 2026 07:06:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1128540254
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1128540254
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1128540254
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 07:06:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id 7E1551814BE; Thu, 16 Jul 2026 09:06:33 +0200 (CEST)
In-Reply-To: <20260715193512.46B9288999@busybox.osuosl.org>
References: <20260715193512.46B9288999@busybox.osuosl.org>
Date: Thu, 16 Jul 2026 09:06:33 +0200
Cc: buildroot@buildroot.org
To: "Arnout Vandecappelle" <arnout@rnout.be>
MIME-Version: 1.0
Message-ID: <d69f1972-f7e5-a606-5ec3-9c82324726f8@heine.tech>
User-Agent: SOGoMail 5.12.8
X-Last-TLS-Session-Version: None
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1784185595; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=CTAQ9Sahp7NwSqbhTUj+LGZ2lqdx6FpVtQxU7PzqWkc=;
 b=FhMqyTc96JwB/MaIG0bjOv+l3Yn1Qf3uT//Ls39rsOEX7BQ7wAwVWw/W1TD+bdHLWxPs6F
 EaJfJELqs7nZEL6IWV480iKFsnaVENL/rJIo2NxATzU6hRpfz4+5AsCZq+DJEMUy2q9wLj
 C7DL5L5JBHoZPEyqsvfJC+c5LSs6reQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=FhMqyTc9
Subject: Re: [Buildroot] 
 =?utf-8?q?=5Bgit_commit=5D_docs/website/download=2Eh?=
 =?utf-8?q?tml=3A_remove_old_stable?=
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

I'm a bit confused. Was there a change to the policy described in [0] that "The first release of each year is a long term support release, LTS"?
I couldn't find any announcement related to this. Can you enlighten me here?

Regards,
Michael


[0] https://buildroot.org/downloads/manual/manual.html#_releases

On Wednesday, July 15, 2026 21:33 CEST, Arnout Vandecappelle via buildroot <buildroot@buildroot.org> wrote:

> commit: https://gitlab.com/buildroot.org/buildroot/-/commit/931803d24d37243af45c76fb8087e77141caa544
> branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master
> 
> Now 2026.05.1 is released, we no longer need to advertise the EOL old
> stable.
> 
> Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
> ---
>  docs/website/download.html | 26 --------------------------
>  1 file changed, 26 deletions(-)
> 
> diff --git a/docs/website/download.html b/docs/website/download.html
> index 57183da23c..35d8c28dae 100644
> --- a/docs/website/download.html
> +++ b/docs/website/download.html
> @@ -70,32 +70,6 @@
>              <a href="/downloads/buildroot-2026.05.1.tar.xz.sign">[PGP sig]</a>
>            </td>
>          </tr>
> -        <tr>
> -          <th>Old stable (EOL)</th>
> -          <th>2026.02.x</th>
> -          <td>June 2026</td>
> -          <td>
> -            2026.02.3<br/>
> -            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02.3/CHANGES">
> -              Changelog
> -            </a>
> -          </td>
> -          <td>2026-06-16</td>
> -          <td>
> -            <a href="/downloads/buildroot-2026.02.3.tar.gz">
> -              <img src="images/zip.png" width="24" alt="">
> -              .tar.gz
> -            </a><br/>
> -            <a href="/downloads/buildroot-2026.02.3.tar.gz.sign">[PGP sig]</a>
> -          </td>
> -          <td>
> -            <a href="/downloads/buildroot-2026.02.3.tar.xz">
> -              <img src="images/package.png" width="24" alt="">
> -              .tar.xz
> -            </a><br/>
> -            <a href="/downloads/buildroot-2026.02.3.tar.xz.sign">[PGP sig]</a>
> -          </td>
> -        </tr>
>          <tr>
>            <th>Long-term support</th>
>            <th>2025.02.x</th>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
