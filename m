Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADBBC5CFCF
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 14:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9748E40EA0;
	Fri, 14 Aug 2026 14:17:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7fzTroFBT4ER; Fri, 14 Aug 2026 14:17:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C727F40EA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786717033;
	bh=Wso5/aUTpe2k66DY5n5RXfSBFviBOlV9yEwzunbCJ1g=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MZUJck/c3s/USBqmWgdwQngFiuxqBVt/DPqk9ecGrEWR+xKwb2rhIva3OlvyelXwc
	 3t5y0eqjN+rdswZAHm+pgayu1u0r7zTpFNnvIaYUvefHE4SYgteiB3J9ju/T4tSvAR
	 X09Vh0s8Y1me24fgm900fH7pu4uv3L8jxCfE8hMDyZmpjI41CaXdaGZHa65hR6WQjg
	 Sw0PeDN+Jt/PCjsM7Bem6b3pOCyPfoCaR5Sr7XQmibJas0OV9B7lcVy1dw+glwlZ4S
	 sP053cbJKasRvLuShtiHqFQeZV/jQ//MaAGvyzDx9F4GXqR8X/S+OHvXgztY3CKzC+
	 iPGJV6XXTxEEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C727F40EA1;
	Fri, 14 Aug 2026 14:17:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B8C0723F
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA585813E7
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:17:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TSFCzo9tYM_K for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 14:17:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F3215811B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3215811B6
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F3215811B6
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:17:11 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-47f59f25ec4so428883f8f.2
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 07:17:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786717030; x=1787321830;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=dVkD8yIldfemO4DtGF8lhstMz1II6bYvpCjJ1OGMR9s=;
 b=tVv0opiC6Qt+o/KP4WjcNCAinh3cPL1mbd8EiiPRZp36yARet7OGCHaHHf3eh/xSAc
 p+aOrjidR9tlo3wk5ar6A/uD64njFhezegQ9KcJxxZCeztVscEOR2W3Wnl/wrEjt1qtE
 Bwn2Zrin6PKIi3Xz+wv6STC3sEGWrsy3mluEBpSRhuYaBtdVsL8RZEal8X9n/iW7EUeV
 gawHGvVEOVxjZbE/IV2q6duzPYVIAI2CJZUthsT/nmpeseET9ntJ5CMH1HoFvf7wI8n8
 MpXbU4lKycRaKd2guIZAys9FJwJhYqMyyd03u/0ytN0vqKuye2G6t3YcxHuCB4D4I5+M
 5wpQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq+G2q/ACyRSDKOFHi93bEYci3CD8C++VVUiBuF506rl63u3AHPvE10ffFsrn+tHx41Pemx6XPWeWU=@buildroot.org
X-Gm-Message-State: AOJu0YwCbIS6Fdkbf82PTzq/mV+AeQVVIcK/+oxL1npH1xvuWA4/K6di
 jES/JUGbkKDmRIn5C9iQvzGZtu5QlOd6+WS/6eBBRERODI/IOvfvFjMeh540OZdkwSA=
X-Gm-Gg: AR+sD11pZA4oekGFBffxaNfpkyBhS/7LMktTMCiWgac28dFTcvrJpaTEaW4em8VuDSz
 TogcKDKqcxjDPJwS1eVCFb9w1ycKjnLgPuGLT6qXblwS9unUun5tsBgmeM8VBZaFpBE9OPdfLFf
 5ESGDXAjZ1XjafVzqlHKxGm6GLlEn+onLuxqt2FqBYlpPnSsTfzX0cWCA+ve9uQusaxvZ8Osxe8
 8hEDfVcCPUy68TQsnUhg+veClOGtvDNwQbogAqA1rGSXkXwpDmnzs4e5mjGblMi7c0KeplU2Cak
 nITSR/l8x1O/Jfjh3ZC2pJWib7e1Q+tzW2PtLcTbmTa/A65Yz0Yt+2EXXIQ0ys9yCY99RtUJ34z
 SYFBx8StIYEAxoH5d+nviIrUeCEY9tSrRgFJkY2eSYvLpX1aRABHcyobLdZYSKBJXlFcYICvOyW
 HJwx89GCztGjLnU9LQPF6vG/WU7XAEZRGtLKG062M9tHpTOUvvsAfqBzc9oHeSTta9fYrqXG/yg
 mFSQZckqa2yYZu0mUNyUGuRon04q3z4SE0bZUwBGWgs3u1GqnYKY1ZuzO8=
X-Received: by 2002:a5d:63d0:0:b0:47f:673c:42cc with SMTP id
 ffacd0b85a97d-481607833d9mr6364178f8f.27.1786717029617; 
 Fri, 14 Aug 2026 07:17:09 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f2c1307sm8803166f8f.27.2026.08.14.07.17.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 07:17:09 -0700 (PDT)
Message-ID: <e21133dd-fd17-42d7-9bd3-50739e704450@mind.be>
Date: Fri, 14 Aug 2026 16:17:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
References: <20260730144541.1079191-1-fiona.klute@gmx.de>
Content-Language: en-US
In-Reply-To: <20260730144541.1079191-1-fiona.klute@gmx.de>
Subject: Re: [Buildroot] [PATCH 1/2] package/glibc: fix license information
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

On 30/07/26 16:45, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (Othermo GmbH)" <fiona.klute@gmx.de>
>
> The COPYINGv3 license file was added with upstream commit
> e067e53080386e93dcf8b07e25fb6656f2c8941e, it applies to scripts used
> during build.
>
> LGPL-3.0+ applies to sysdeps/htl/raise.c, which is used for the Hurd
> platform. Buildroot builds only Linux, so the file should not be
> compiled, but it is part of the downloaded (and possibly shared, if
> "make legal-info" is used) archive. The same applies to the manual.
>
> Checked against the copyright file of the Debian "libc6" package (as
> of 2.42-17 and 2.43-2), note that Debian excludes the manual.
>
> Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>

Applied to 2026.05.x, thanks !

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
