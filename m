Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB7FAC5CFC1
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 14:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B917440E05;
	Fri, 14 Aug 2026 14:07:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kK1p9fnAjhx4; Fri, 14 Aug 2026 14:07:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32E7C4096F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786716459;
	bh=s32Ft8EiWIhQZMznl+TogZDOKYpTbEA9b22o3v9rx8w=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=SDNFhUZpV3HEqDSAL03zpFcVukBrMvBaIVKy0bJNbn7F02fjFGM4XCTUaXJv6+zqS
	 +qw3FjwTCF5rSdAaElpn3eo7JehjrvpLPAZooO4BKi1hnD8GIlh2x1qz74oL1jRm9I
	 AX6roUTk8pSjGr7QFdpxFdMaerjFR/2Rj1X5saosjHkBQUaTn052CQutv8q4H7+ZFR
	 VxLsDtXLsnmY7EL2QOaIbkmRviyOb9z+6XGaTlNKdoOjMGyr+K+xNfxQ6A3J3zhRhN
	 cqRtsjjcGrlTutknx85bKc/dkIg2fLMjU69YN2F51jC403A9kcdW0HYtmm8lKtcu9Z
	 jXhU27hWKt9sQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32E7C4096F;
	Fri, 14 Aug 2026 14:07:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BFA1323F
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B19774011F
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:07:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 47De5AitMJVn for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 14:07:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E3CE2400A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3CE2400A4
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E3CE2400A4
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:07:36 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-49558ce01afso8629505e9.1
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 07:07:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786716455; x=1787321255;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=x5hyzqy9BtKpVPKDpItLPb/q3RocjrLm2q8R1tTvV/Q=;
 b=ob57riucSeblK1HDlWDMc9AkaQM2sD60M2ijRt22gc26lp5t3bp+usNopGtkCOMikF
 52Siei/9BjvOI0EWutoalM5p1D4sg3PzWDY+M2beH4IPtWwCBEds5jt2Jo9odF5sml+H
 jPkLgd/nJZS8AzSLBpBuaaJ92NU8UeSg+wjQ9OrA8B3W1wJ5jRaejd1yGcM+6BEmNrQO
 g2tdk7s0LGmZ/SbsKMsHmoCjaPZsGVx/yyKskmmTMvLWIDP/9b+A//MB56qxD9XuVAA3
 3mzeh/NjrWeeg2PvdTKKqImyiNB+6qWs1Qdv5bjI4dHsB1lO7IGninRCMKMRnMegoxpk
 BGnw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpHp3wmNNAfjpc523LqBSc7MS9zWFvvgO0Bc0wv9ygfJFfLjwc+HGzyew33H8k2u3mjZhyQoMoAbp8=@buildroot.org
X-Gm-Message-State: AOJu0Ywh5p/qsMQb8Efih5MAZQVmaDw6s6E9S1YdigKJDGy0z6/g3ORM
 jIR7O+Z6cYSsm2QLxO82isOLb4Er0qQxNFDmKqqQWDq2RNcFguAL3Qy5evb6yziMrOQ=
X-Gm-Gg: AR+sD13qAHjsMupzpCxijE2MnVHnJ09cvQkr2x/07zLEG/+9xSLBtMmy5cMmPZLDnCm
 I/ohGLwjVCt3vlM4sx1QIXr67TnxjQditcjOgZGn5nwFQjz15rWuvclMlRMDwzbql6T8m6u6u26
 Z513OUyDJn355Me46q5STnNSsu/QO56Ts/SqOLMTmj5/SBdTJIcbFObpiBtt0XBb5xkujUStumj
 B6xrXtXlggdln3l50U2HnnrFVfCH/lP/hbxsKKrea3xwpIgHfa7qLW1LKlLyYve/VpAbPADTV8H
 rXn9xjT3VecwG4Qx1NmPjinK5+4jifyThUUdEqfilcRyGoH6PRpuaqjQlWYujRinBAWY71LjL8T
 X0lF0e1zQntNJxSgA46r44m/WZtcy8SpMtuuOfqVsAiCZMHv6rRd3YseLiUc8po74ceON6WENkP
 d1j+rlnU5/rwon2iqZIGeNLZ9A3GdXZKGqyqHzS/v7bOHiKh1fLTmNFVE/8a6e3FX6/wM5kBcyW
 ntrNJHgbbwMUMR/Fty3QlHaSesJcDYWd8j/c/rR5SJcnpkB
X-Received: by 2002:a05:600c:4fca:b0:499:7024:9d4a with SMTP id
 5b1f17b1804b1-499879549a7mr86202345e9.8.1786716454921; 
 Fri, 14 Aug 2026 07:07:34 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49988aa2273sm51595005e9.0.2026.08.14.07.07.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 07:07:34 -0700 (PDT)
Message-ID: <109a480c-aa0d-467c-88e1-7d9af894e956@mind.be>
Date: Fri, 14 Aug 2026 16:07:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alsey Coleman Miller <alseycmiller@gmail.com>, buildroot@buildroot.org
References: <20260804104730.433500-1-alseycmiller@gmail.com>
Content-Language: en-US
In-Reply-To: <20260804104730.433500-1-alseycmiller@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libgtk4: enable introspection
 when gobject-introspection is enabled
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

On 4/08/26 12:47, Alsey Coleman Miller wrote:
> libgtk4 passes -Dintrospection=disabled unconditionally, so Gtk-4.0.gir is
> never installed. webkitgtk depends on gobject-introspection and generates
> WebKit-6.0.gir, which includes Gtk-4.0.gir, so building both fails:
>
>    FAILED: WebKit-6.0.gir
>    Couldn't find include 'Gtk-4.0.gir' (search path:
>    '['.../usr/share/gir-1.0', ...]')
>
> Tie the option to BR2_PACKAGE_GOBJECT_INTROSPECTION and add the dependency,
> the way package/libgtk3 already does. Systems without introspection keep the
> previous behaviour.
>
> Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>

Applied to 2025.02.x and 2026.05.x, thanks !
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
