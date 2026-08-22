Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3EC3C5B572
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 12:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73FDD80DC5;
	Sat, 22 Aug 2026 12:12:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uy_a9Xnq7lhS; Sat, 22 Aug 2026 12:12:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787400756;
	bh=ZdkUiVMA0sH5+nO3c1hkKyJ3eKcJENlaG3utGrHtEps=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bkYcGLfcAASsOHAJ6FHSnpj90WPoFPN4Cuxt6tO7C/cAe4hxBk5ogsDp9GdpR8jYW
	 gfU06qnl5N3FOKU7WK+OaGUihkGhWckGQhZydoI+UHntZuSSY3G8RpuF1SxOmSICRH
	 ULYvQ+4iuxshAG5V+ztbU2PFMOlGLBqUJ93VPAG1TtScs/jV8NDEXaOWA9oHlMDuD0
	 zqVXQFeS/yeHzIV7DAdr0WmK4nYmrZNHZby0+r56iIB5+WBbrv75IqywjlVV+rAUG1
	 nwGAuplSBt8Z+T3J+ujwvrQatGYlLn62syKzU2BnkvLqIoJBlKsgUGhmUp1FT2BmHS
	 vW9tk+M3SUquQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DB1780C09;
	Sat, 22 Aug 2026 12:12:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 67A8D29B
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58F70605DA
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:12:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0JZDt9YorRvt for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 12:12:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 54EA8605D7
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:12:33 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6a157f90752so3334343a12.3
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 05:12:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787400752; x=1788005552;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=HBIn7d04KjbxYQWRoPfNYIWw2yZe4N6qPtNLqcwDctk=;
 b=OetUMGj2ZTkNmV7soDVQioiArvKMZjqPUUTe6GTWZDNMceNjYskkbBWq+h02HiDukP
 jF+2Pha1Qd2gphEjm1ReUZM6dWA7RKbZnKDBKw7lolQX9wXP/nK+p+WqR6NAFLcfKOVO
 3p7PDhJQ10OXXyd/nApHqaeisu5l5nTDj3UvItuAlFvWtIhT/vTtgYla6KOrVBCkW64Z
 +f4eNQwcjHvQUikYQ0cbkShAlIG0aOBhL30Vq6s9QzvA+3bsZYl/Cm/+XUuOZ4vzxBda
 SLPHpmLxaq1z+2qxd6mxj+7K1pAxcEMt7HlBfBlPlV0Um7901xs4iKeoNaO8qitXGIKY
 q09Q==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpe8M4GE5xOz167vDpQTps/qe5jgXazUi2oRxn1EG+kg6ON2S2Hr2gC8XkF99Kkt/JVI3bJPqtq0wA=@buildroot.org
X-Gm-Message-State: AFuF++kI+M708bFtKxpqd/j1glwluMfPqgXFtZ+dC1pOvxFTk5Rz2GDP
 BE8vJpr15dk5qzNi/4yHELVIZv1g53MoEUd4Ha2FoWK6c1BNytstJAoW5Qzrl7b6FkxSXqE48rY
 xLmNc
X-Gm-Gg: AR+sD12ySAdvm3GFf82DoAsdx1EiNgheAdra7F2SmD7B/jNH/3qarg5AXPe1UJVgJVU
 SIy1mzMY1eFR/7oYeG2aUxSkNDTAZpWCCn8hMsEdkf5VbRlMobVvIX/75LojcY2Kp1XyIuqLMf0
 FMqRAgT31Ac30J/kRxqoL9mAK5/cQ+FSdxUL/R8nA1DIAqoADgnbHdTJfUnenTcmXiellZlW3Co
 dtBG+BOzly9RsHK0qC0JaDScXvXCRSSu3+7plfOY8z8uXqAG4unaKODjIXGui2LwcRyet9DySU0
 fCQBI66Jd8KyRwKUKkjF5YmYIluv2/PQG58r9bT5KlPxjhQ53t5/RNacU/tzmKYy4MTSoS0Rm20
 GqnN400sIx/fx/JBlkHuKzLMcnWLRgxT0YdV/DypuDXmfEG+jfsGGNqTf4F0wl/g/YqW+lu7G4B
 N3fxaCLHTHUnj8sZPhTAodhlXX9Eel4TaD25c9+iBLlozPnur8pBwSOnqO/UZgS0orqI7B24Q0d
 lw1GDUXt0fr673VgIuSE4L26oaY+tLKADaJQF/+IdVHm5P1
X-Received: by 2002:a17:907:a604:b0:c24:457b:86fc with SMTP id
 a640c23a62f3a-c246a66adb3mr1497758766b.21.1787400751774; 
 Sat, 22 Aug 2026 05:12:31 -0700 (PDT)
Received: from [192.168.129.33] (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c249606b683sm345156066b.5.2026.08.22.05.12.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Aug 2026 05:12:31 -0700 (PDT)
Message-ID: <4fe260f2-41ea-4feb-88fb-1c3c2c95de3a@mind.be>
Date: Sat, 22 Aug 2026 14:12:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20260812143235.386341-1-thomas.perale@mind.be>
Content-Language: en-US
In-Reply-To: <20260812143235.386341-1-thomas.perale@mind.be>
Subject: Re: [Buildroot] [PATCH] package/vim: security bump to v9.2.0943
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 12/08/26 16:32, Thomas Perale via buildroot wrote:
> See the release announcement:
>
> - https://www.vim.org/vim-9.2-released.php
>
> It fixes the following vulnerabilities:
>
> - CVE-2026-28417
> - CVE-2026-28418
> - CVE-2026-28419
> - CVE-2026-28420
> - CVE-2026-28421
> - CVE-2026-28422
> - CVE-2026-32249
> - CVE-2026-33412
> - CVE-2026-34714
> - CVE-2026-34982
> - CVE-2026-35177
> - CVE-2026-39881
> - CVE-2026-41411
> - CVE-2026-42307
> - CVE-2026-44656
> - CVE-2026-45130
> - CVE-2026-46483
> - CVE-2026-47162
> - CVE-2026-47167
> - CVE-2026-52858
> - CVE-2026-52859
> - CVE-2026-52860
> - CVE-2026-55693
> - CVE-2026-55892
> - CVE-2026-55895
> - CVE-2026-57451
> - CVE-2026-57452
> - CVE-2026-57453
> - CVE-2026-57455
> - CVE-2026-57456
> - CVE-2026-59856
> - CVE-2026-59857
> - CVE-2026-59858
>
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x and 2026.05.x, thanks !

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
