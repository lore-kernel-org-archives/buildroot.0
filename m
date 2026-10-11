Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9952CA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 17:15:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57D9F80DB5;
	Sun, 11 Oct 2026 17:15:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TBAFKMdBhgNH; Sun, 11 Oct 2026 17:15:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3F99B80DAE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791738957;
	b=BEEyoEDQks+4vhedrzzLbT/FqykB1llT7IUVY4ItjjlQDrt4CE13OD01qcPvJA+nm2mm
	 33csDpwWM1mUvgb7SPx7daTZyr/R3ATeUOrclsZtO+cxtDwb7irBxf3whnMgfnNUvboZ4
	 lDBI5zxvl5635dybU2qDbJ7pDkCb/z0xxzCdocHg+Kcad1NZud1K029csGHgB0QlWfQ/L
	 qpzf9kfGB1qhxY64UqzAsPXJ2nNWb7egut4RkNkRQeeO2RAC2+Knto/H0lsd5h7+ORnlp
	 IxVihvoN5LM56CgPsXMyaJwew17KpxTZBA1BEhQjqT68TCtd8uX2XRU6ehGVvZp/4ng==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791738957;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=3SNba2+CVJZ3M4hG4pbnm89Helz2VhYLp18GlooN5jk=;
	b=mR1+SUbDMzMTg1f96hgvqSg1KY/MXLEJSDncy/VXrCFDMDOnWaW/ZdB8+vMOJgPS5OKB
	 ZZ4S9OIKmLt7Fimh6ht0KjbCWLeSmRPxifm1Yxp4fGzH2m7uh7nYV5JDz0Oy02yZ0EDqg
	 SpW0+rtvUtImbmVWfbnRJVA6HPKoHRwWBw3RseylYLMYrNTgaijlCzdNJesyZdInDSRfg
	 +zpQvm3GcWhr5i/4Q+gX8r/LSecd/oc7vJwlvhN67OyBBrfGERbTJk/RqWyNkvtSsgoJ2
	 5DqIEYWWps/yYfwowdYbJ+x73Qg+97rQOX8rVbu4vjk9S+jKx3EGpS+c2fvU1zT7s/g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791738957;
	bh=3SNba2+CVJZ3M4hG4pbnm89Helz2VhYLp18GlooN5jk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iH6Hifu68WN5m9ZeEtjOkxXhD5O5OX9icDT1ylpPozrHZ4pGqGtO54rVIvHPh/BBk
	 g4SO0jjXC4QaW/E727HzrQmBqUYsB6mOIb4a0dmVyqTI8Cak6rxM87gPMjJRMjyYu2
	 EiuhGvejL3fyHQigbDmGH/RVCwSWELmurr69N5h6f0HH4wn2Y2ncmoHVo5OYXDdELk
	 eIiRPaZfruMGu36xmR0TiTP/G38aMIQm2sglo6hfSwfIRD2i/+sRfGlPVr8I6udYFi
	 ekCXV9X/DnkWv0lD2f/iW29OkWVECJa1GKz5NMegF4N0S0R6SI5RLnQJPeVWbecRN0
	 Mxe20aRrE2sfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F99B80DAE;
	Sun, 11 Oct 2026 17:15:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 81640380
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 17:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6797A40076
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 17:15:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IpaKIXmVCp9X for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 17:15:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D512640061
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791738954;
 b=H/iKrlFNOwRvojRbG5bt/3n0inVE50RzTk+wF0oOBcuaPUXcigRd6ed9Hnfycdn+dhDK
 XYOMHdGn7/MCFSzLaDSpvelSyOxZjHkQN/0AYokFdW/nhs8ONDKmVUAVRc85MbJbTmvdO
 efqWwqU/IGItYzcm7X0saaK1IQd3F/dV2fWFyxzE7PApoyRb8TFaAGzn+47st4Z6HktOv
 pPbaHOOoE/vE2JZzcRoHAgWa5M+3qWjpThCzZJuIzIfvb282qWMca6yYmyTa4NC7f3ZC0
 tjt4onaA0TIGGPrjsBGRY3H/ub4CO08z7hujZIJSphW2Y2wGH4uM3c+hMYroohIo2LQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791738954;
 h=Received-SPF:Received:DKIM-Signature:Received:Date:From:To:Cc:
 Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To;
 bh=8HU3VRLlVj5bJH4xywWDFM00aSSrRDzbC93CBmDo5Mo=;
 b=roHAwPqlyxiewiQMuj/fdCOLMvuIMN4P/uyD86GnQf+dFX1654ujgZR+Dk3Ll56ib4sp
 Or5h04tOciioKdI07XaypoPAKVBjIIESh0hvpX1Fkr2rK0lZ33REVfuY1sK0Q8F29rTYg
 sOR104XBc/yfRMfyoCwpnQKeVwk79bZEpgndEbPNupoy1Oqi676z7iDVGMwE/6bR9VolG
 FF9jI/jNEDwJKzzrMTYuykuMKjKkjKmcdLOq4jOcS6+KEG8to7lQcF8+reKADey+OOIg7
 KWrBowzyFLWPkB6APK51EFe8mHNrhouzpEOJc8MF3TfN0W38EtEJASoDlI3/d8tAi7A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=psUXouwg; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D512640061
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 17:15:52 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:93aa:5000:c1b2:c247:1f34:4379])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 2D06660132;
 Sun, 11 Oct 2026 19:15:43 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 11 Oct 2026 19:15:18 +0200
Date: Sun, 11 Oct 2026 19:15:18 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>,
 Fiona Klute <fiona.klute@gmx.de>, Arnout Vandecappelle <arnout@rnout.be>,
 Brandon Maier <brandon.maier@collins.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Message-ID: <asvEJkjI2oqP4NOQ@landeda>
References: <20260405185608.1357633-1-fiona.klute@gmx.de>
 <179172462322.180911.14758630260298969085.b4-ty@b4>
 <87o6d05j5c.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87o6d05j5c.fsf@dell.be.48ers.dk>
Subject: Re: [Buildroot] [PATCH v5 1/1] utils/docker-run: mount and pass
 BR2_EXTERNAL dirs
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2026-10-11 17:52 +0200, Peter Korsgaard spake thusly:
> >>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:
>  >> +    for br2_ext in ${BR2_EXTERNAL//:/ }; do
> NIT: ${var//} is also a bashism.

This script is a bash script:  #!/usr/bin/env bash

It also already uses bashims, like indexed arrays for the 'docker_opts'
and 'mountpoints' variables.

So, it is fine to use ${foo//} too, I believe...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
