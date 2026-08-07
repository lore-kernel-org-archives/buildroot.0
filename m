Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CF4C5AC7C
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 11:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2422460A64;
	Fri,  7 Aug 2026 11:54:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ojdK3YtThe4P; Fri,  7 Aug 2026 11:54:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D8B860A3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786103669;
	bh=YbRo8TbhGLyr1VGdin63gn3vniFbkUL+svbZKtEpHOU=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=pf5G3DjgC6xjpZCU99FxAOpLrUZ24/3kfcU4EjrllmVBVRcgB1PVheqMl9xmbN0qe
	 nDy8Lu1J8VKXD4/r/4KcPZKVHzGXXkRhjdkil9ww379bBJzaudKZqdYlKuk7jfugps
	 BMCL2ysMCRvQE+BJXWL7T8D0LIQfGI2OvvMlpiywr0OJ49InkVKuoXWXplYsXiEZ5F
	 +Ksl8mzq43nGJxF7/OCXxMr0QPP59gA0ksHisggvEsj5Qb0co3p4T5218PEN0EIOM2
	 DEh+Qk7EocjYnWquxcaKGaufSagl4EwhyhG74mnSPviPUjOI1BujDyqGhTFGkBbO8P
	 tyM7kVSN/xVXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D8B860A3E;
	Fri,  7 Aug 2026 11:54:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 24899D3
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21BD58116D
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:54:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3uYyFgHbrg8B for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 11:54:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 20EF3811A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20EF3811A1
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 20EF3811A1
 for <buildroot@busybox.net>; Fri,  7 Aug 2026 11:54:26 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-47f3b39f2a1so2535165f8f.2
 for <buildroot@busybox.net>; Fri, 07 Aug 2026 04:54:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786103665; x=1786708465;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xTMfj70Fc91IbXHMccYAKJE84wViMTuiFBtPC2njnhU=;
 b=AMYVk85s+lhi5on8PyNMA74X3pc+iJH6dAyvtfTv4NrC8na7rytdqTXEyczCpYe8PI
 GV54UDgVnlrqaJkjH1Yo6DqCT//UYp2GZODvUeo3K0mvb4R/rcxcbTV2IO/PMLMBhNM5
 z29HPKPqRLUWK12a5peA4lrh0mxpXd3w/vo0sRrQL3aBmRJeNWtWFkMfJbBp7WgglmR3
 iTjZXhCXnNbN6KEPngg20X71TGSkbOaj7uhHUFmHhNkGzEjE/9cFo9Az5GUagL+acZhp
 Gqk545iC44ttJ0PXhrU8iZ2oKwEm+2uSk/DkizFf8r4xc+Nlq+FJmeOWqCSi9Y2LsLcc
 pBxw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrXG1HwRgXX9Fpb1nmKpugs0RZnN8M63mv4cm0cmYk4QbcvJVaaDW9hSWf2PSFonUUaoFchwkb+37M=@busybox.net
X-Gm-Message-State: AOJu0YxwVovgO0kmfVbdo508N8TS5Z3JktJc3ftEdELCs8ZyYgcxnjSy
 1Rg1I2A1RYl0c0lZxZFGQ2aIQTnrfZ0wGvs0mDM1tjgMkMesoKGAPgPUeIQyox3C0xU=
X-Gm-Gg: AR+sD13c0VGrzLlZEW5Wcfc9Fm8/pz52/wwizv6ryoB+K6kbnL9p+yAJVHj5C9qMI4S
 7N2Kn1YU7Cyv8IWs9CBqde7EDZiXYOmiJgdiaBhLfSjZkufA/DmKw8q6yVfSltmPAmGYP8QwhoU
 MU9r0Ujsj1rBI3nR5RXLqfq09GqCoKCiD33G+yH1x0qzzbS+zh0rgR9/WHCWiVvZn9uBtNwjsMO
 wfgF5UfmPRW4K7t6npk5eJwtqBCohBmRnxuJPH+8JgoKcCDIGiFrqCP4xErP2wFVttDU/WHACIB
 mGtHSU42kQ9iWUP4mGZMp4g5Rts134/XM7F4tP2H5Gb6QIaDJjt11tNUQNyV6WwpRcWqn9XazAU
 Cu2gPZ6wGXT0wsCr8dgxmTkji4aen5A5upSkii4Vca+7V2eWsv0GZ5xsJJ4/1dHY0oFOnczsE8g
 PYBNislTtJ6oMi/Mq0DTDyuznGjQ02lZZm1LENJ+4S+Jm2vtYEhvEXY0RIrU4wouKYIUkeJMXmk
 l6PV2n/2Lc/d7EVU5f1FAbZEDNEbNqjuNXsAQEAOR1Bui1w
X-Received: by 2002:a5d:62c5:0:b0:47f:8fb6:c32f with SMTP id
 ffacd0b85a97d-47fec52a71cmr26994012f8f.24.1786103665054; 
 Fri, 07 Aug 2026 04:54:25 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-480021501bcsm5165881f8f.9.2026.08.07.04.54.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2026 04:54:24 -0700 (PDT)
Message-ID: <2cce28c3-f4d4-4ee5-86bf-9355bbb126c3@mind.be>
Date: Fri, 7 Aug 2026 13:54:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Francois Perrad <francois.perrad.86@gmail.com>, buildroot@busybox.net
References: <20260803081951.391172-1-francois.perrad.86@gmail.com>
Content-Language: en-US
In-Reply-To: <20260803081951.391172-1-francois.perrad.86@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786103665; x=1786708465; darn=busybox.net;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=xTMfj70Fc91IbXHMccYAKJE84wViMTuiFBtPC2njnhU=;
 b=KPsaBN34fEuOHEkuzJsCKnglJhkupdw6F/fjrv0l6AjlBOeYAt7mlJI9L15UfKY5cE
 WlTRZ7IVzOp8BrwXbBkxJFTmjO2W5vg6BF5HI1BuFhZQpGioQKtHyrHB89aIfMjao1Dp
 ygly7Ua1DefbLk+jsXzkWa0xVEvlPoG7mrrFri9+GEnj2Uavv/sw8cZY0k3H/BRvSRbw
 I0VJGUgkJ/X/lzL2cu13/OcOJtKEgtlVO8ZTAUq2ICw6QhVgjIjw/yPb72/Lycr0oJ2Y
 SeM7TtD81RQv6GqlaYj2H+o7imFfE1pBGt2g0PHQn4gX2Gcov3zChs+6fezKFFPaa4ng
 PryQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KPsaBN34
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/perl: security bump
 to version 5.40.5
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
> https://perldoc.perl.org/5.40.5/perl5405delta
>
> Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Applied to 2025.02.x, thanks

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
