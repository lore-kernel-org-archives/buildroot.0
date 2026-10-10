Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6487CCA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 17:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A43180935;
	Sat, 10 Oct 2026 17:17:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Psn8gqbL8KB5; Sat, 10 Oct 2026 17:17:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0AE7380970
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791652636;
	b=W+YMneMeDT2wuHGDSZ6jM46xnODlEZ1kzdVIlkqwgwIqppGdMB8PuMlwV54E2HXzwA/F
	 PXgwfbTCbOeTtjTwc//Ye9i13to2RdF12wRs5olzSDKXjdp7IMxcXPVOXQzgt0IRzVwmm
	 TCVjx+pkzSlSVwG+b4IQeyD4JF9Idk4oWC0VytB685eSOo/cSuSO0QjEBvp0UK57cmlB0
	 Ana85l88Rb0gMU6VwRXfOySfKsaTrWHtHWMw3aGBOe5stjhK/zupUTsTt2uXfewVG01XG
	 Cr790zrHb54P/afHMfKXW48n7BnPLuDB4V+fd6z8kxSR/ph/nBxH3g5aJL+RNHnklkA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791652636;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:References:
	 Content-Language:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=k8muWkdLyI3hIO5rQ6k2EgOcFvp5M4gzLKvNC+iZcMM=;
	b=k6EkaYoI/9+iKculGZLosO5L5GyCrTYOV3vTDGEEQAQaA+DJvB6xX1kzr3mQ0PtDDOaQ
	 7yy/eJFdw0l+Y74ecxOv2vElbBeJTqe/Vu7LM78DDI9HLhb/HOItwB4Tpgfl4/eotWPf0
	 z4hBpUzu5oK0rUG2mPBzKPinzITGIFmcQiLw+KV/CCmFFIu9pwkQEjG8o0OG+X39ECYAp
	 BzOvXBJgTLidNzbZ5tcOOvLoD5R0wlPMzA6/Yoe+Fx66MdArrx1BdJnu1qjPFI9spaJGR
	 IFDvkiBAqpUkG7Bgs0n+JKDt0YXvnEGwSuHFiAA8xpd0TApUdmCg0a9PvnfRxIVDG3A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791652636;
	bh=k8muWkdLyI3hIO5rQ6k2EgOcFvp5M4gzLKvNC+iZcMM=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=hQSEnEjlTuXpkqh4lRPRQ6RTF6HbSluBXWu6ev8NFSfo4S/h2kQ4QbwxWc2vomeeu
	 2PGXUCLXsbr1GT1JNRMnG8rBgdXr8b3uaQSAd6IZtLla76Qg2bR7YPlrIeqkuWgjCb
	 qBUCczaSzVPZIMfHrQVkNwa1CcRJATfpCTmSxN5h0+ydsXUaMaOpsXgFx8uePsWipF
	 aSscmYZCEz+lWE9ex3noCzHex6HJnoRQaV7ItKHyICyCNgwQ9rObiXSFxygPY5b49u
	 oAO/lqfAxvBicCLo23cMrN8WarXVLQOMzPCDkf44VjJeqEWf4WNOi840J05GHQ15rg
	 pawtgNMutXVag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AE7380970;
	Sat, 10 Oct 2026 17:17:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CD4E2105
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 17:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BEE6540899
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 17:17:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UsBRDpswrFqu for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 17:17:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0DD954080D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791652634;
 b=Ezh4UC7v5dfE73rf4/7rIzZhL5fI964QDIsx9qsI+aMMFBhFi6I7IPV2CL/o5nmCGjuT
 TUL8s7p26f5m0/j6kC1DCPmDeBf1PZdx/DEYPbF4QLNMiJ/SAR6MoksevodCXnGS4/Jyt
 yodsIF+4VK5PIpZpZR8ZYPxyj7JDMoChjXU9jitqvUzonJQN27d9ydJ0enMR9AI6CnOyT
 aTaXhi8GGQvU6kclJi8/sENo65Z1QcDTTq3Q4CYktzD+sA1PTc3da8SR/mNtGVadAvT28
 nW5OXamMsYqmfOewlbwIA63augtrURf23Dnlcc1ISlre8A/MjGfKg2MJFavTQrsyfJQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791652634;
 h=Received-SPF:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
 User-Agent:From:Subject:To:References:Content-Language:In-Reply-To:
 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=Xc8pFI7lCTvEaUcX3NsuL23TEN6Z5+YAhEy+Hv62C50=;
 b=oQIDc+N8joVyyqhfUvz6nvI9bnXzIQ5rg1QxSJT0D3U9NoDyow3fAKxCgd+HOFfQ62rM
 yIqdiRI6KpqtuOh3VopDfqOoB4owEnOCVTf9YOim+UiEvJ2EhOtTia4MXBXmYqCDkEkK+
 Q8Tg6wWiFABSA5sncAtkzUmMjT14ltR1x39ZAxXHQumIszBWqzr1rJqDxG2+nPeam849s
 iW9qOwT3TmusTPHs2CzhcHxCDOV8fG88GUUvyGA0EQugIrRNhpOL8XeCidN9BsZ4KoYbk
 wA4DXmRH6AG6LaieNyUo6uYFGO7TNQVQ9U7kdbo9Af8T/mnCec8yisJRIcZxwx1B7gg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=JGFW6jIp; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0DD954080D
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 17:17:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 87615B978F6F; Sat, 10 Oct 2026 19:17:09 +0200 (CEST)
Message-ID: <b0c47736-e84d-424d-aa1d-0164454693ce@rnout.be>
Date: Sat, 10 Oct 2026 19:17:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>,
 Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <20261010124237.92754-1-arnout@rnout.be>
 <87fqydtxjk.fsf@dell.be.48ers.dk>
Content-Language: en-GB, fr-BE
In-Reply-To: <87fqydtxjk.fsf@dell.be.48ers.dk>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] .b4-config: add patchwork configuration
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/10/2026 16:55, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:
> 
>   > This allows maintainers to use b4 to update patchwork.
>   > - Use git config --global b4.pw-key <key> to set the patchwork token.
> 
> NIT: Why globally?

  No good reason.

>> - Use git config b4.thanks-am-template <filename> to point to a template
>   >   for thank-you mails.
>   > - Use b4 shazam -s -k <patchwork URL> to apply a patch and set it to
>   >   "Under Review".
>   > - Use b4 ty -a to prepare (and optionally send with -S) the thank-you
>   >   mail, and update patchwork to "Accepted".
> 
> It would maybe have been worth mentioning that this is a new feature in
> b4 0.15 and ignored by earlier versions.
  It works with my 0.14.3 in Fedora...

  BTW a few additional things I discovered:

- it doesn't do the From: rewriting like patchwork does. I do an additional sed 
to handle that;

- for the same reason, you have to add -S to correctly handle Reviewed-by etc. 
tags, otherwise it gives an error when the tag doesn't match the From;

- if the patch is part of a series, shazam downloads the entire series unless 
you give --single-message;

- b4 ty gives only a single reply to a series. It does mark everything as 
accepted in patchwork.


  So a bit of a mixed bag :-(. Time to patch b4?


  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
