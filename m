Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0566AC5CFC1
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 14:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A574E40783;
	Fri, 14 Aug 2026 14:06:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mr8eH8AsV9AV; Fri, 14 Aug 2026 14:06:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3B1340DCF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786716383;
	bh=49eRWd5fStzGvGMQwTRQ6gbTyvSq2kBCHPxNfXqUWew=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=WlQz7ZD1ow83ZBXwsDGBKfufVDrkL2j0k08nOpUV+GQms4Lnm06vZIDUROCHkgLUK
	 dIkzNZiRalAxetx1B28K13+CiNcUX3kvY4vJ+GCN7by6uWpEVDapvzE1e4GOyYH1iT
	 aY5PeHyTrgv31pqqAnczLMdr894St43SVgDKm/+4FYTiC05oaKChbkph7eGGfi5hVV
	 iiGnCumMztL4/NauY058ITBYyQY6m0TFAyiAuFY9aTYaaECOpEOqpfMYdN2Y5zaX2w
	 TyHtU/FxWD3hCoasFQ9gbu+p10uWxyTs66CLSdqgEe3wk+DIoUPMBmHF/eyxya4uX1
	 5UBtv5D08ezAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3B1340DCF;
	Fri, 14 Aug 2026 14:06:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D3D95139A
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C48458146C
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:06:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Q7tNi-OhIm0 for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 14:06:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C46CB80EB6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C46CB80EB6
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C46CB80EB6
 for <buildroot@busybox.net>; Fri, 14 Aug 2026 14:06:20 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-47f6609c657so509504f8f.2
 for <buildroot@busybox.net>; Fri, 14 Aug 2026 07:06:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786716379; x=1787321179;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zqEXwwxoGcfTPLoi4/mJy1kV5es2408tN+LgL/WZkxM=;
 b=DwH8enr1LlQ7UzqsFLYjyAmG66dmIF0EJDagidx2fFBYvsxZqzi2I83A88xroE+wFD
 +mH0YrjHnHK4I0HZ4mjADtGYrSs+BkCD7Oj/PblRbLlZFSx7oZH1yCHkRBEPFP+gouw1
 sEXILkoO35diwrHCihNP1SiNjAnW8OIcZJHbhaXe8VLwFbcqOt/dKkGo+5nUYlNreXP2
 C333KsbSUiU2FpngWI2zrOYREDPvtRsHqcpDrEmf8GYQNTjoX2+tQjqLyFMol3/rpeqR
 /LBxWTaQ6MwnVIFZX6ffp2OMCxDJgeUGMq71orNj9JhC6lQdFbMmOrhaeBN3doDQIZnb
 DDdA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr38C0ZLwVc+h7HXB1MpttKKgQis9JZrHfMta9Wtvu32VmR69bSAtwVEp5+ETay+RVdDN7FvzXPQh8=@busybox.net
X-Gm-Message-State: AOJu0Yx7uNqS52hI+akkmLVYNaIDuP0+qdqbsLQiM48dL+lpsjVjGMXv
 CPGKuMDM0Lhu777zgmXqA+aoirZL3iymA9ufvXr2NWGPLQ5Q1DTg0nt/PDB+HHHDhdA=
X-Gm-Gg: AR+sD102PqHr4Yx8eMGuuGZDzB9gTo7/V//EQ0K561waxPT6Zwai6xwW2ZgNvIZN6FO
 ojMEboRJYhP9A4e9snvqMrS/36fGh14wSSsKW3PxlBiUxB7iApXXyHjHcXxQVpVVVRH9k7oJ+qs
 BYXzOcTgipxk9PC3WCx6+vkNqHAibYSTni17bNWEMVqAHE0YsIpQlM2PvTrB5nL7WL/xc5TreMY
 d5VLkSbUiteWOIbmraTQThb9YOtIWJ1TwFTr4Nu44XDnSb2v9Dz07uR0c/YMKgo0GGUcciNQCrc
 oPSY5OV6mDJjRligI4GJyfL2559W285XG56O88Y5jOpcKNEKhiXZqRPlcLmlwR4lRitb+a62xD7
 2UcEKKYIZ+w4XcC6LJS+IYWy43RxFVSW5+J1ggbXfBqKY+p6OxLMtWx0kyk+j99yQMNXorST7ZA
 jkmLXW1nvyocBxYHq+YibGAnGCx0XbuNa3bp1CR6eWoIaooLlGrjPIz1KEdK1zPf6TTlWA3KqAy
 LGPP66DWHzfl7jdu7hb+wDjOW14CyUr1T+nTtp5BWKb3sXv
X-Received: by 2002:a05:6000:240c:b0:47f:e9fd:80d8 with SMTP id
 ffacd0b85a97d-481607947e2mr7997631f8f.21.1786716378685; 
 Fri, 14 Aug 2026 07:06:18 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f2cc811sm8311864f8f.33.2026.08.14.07.06.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 07:06:18 -0700 (PDT)
Message-ID: <48224562-9a56-4d75-a2de-5375d5fdc895@mind.be>
Date: Fri, 14 Aug 2026 16:06:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Francois Perrad <francois.perrad.86@gmail.com>, buildroot@busybox.net
References: <20260803081917.391134-1-francois.perrad.86@gmail.com>
Content-Language: en-US
In-Reply-To: <20260803081917.391134-1-francois.perrad.86@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/perl: security bump to version
 5.42.3
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

On 3/08/26 10:19, Francois Perrad wrote:
> fix CVE-2026-8376 - Buffer overflow in Perl_study_chunk
> fix CVE-2026-57432 - Buffer overflow in S_measure_struct
> fix CVE-2026-13221 - Regex trie 16-bit field overflow
>
> For release notes, see:
> https://perldoc.perl.org/5.42.3/perl5423delta
>
> Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>

Applied to 2026.05.x, thanks !
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
