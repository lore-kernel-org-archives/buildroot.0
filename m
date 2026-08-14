Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17F6C5CFCF
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 14:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B985840E6F;
	Fri, 14 Aug 2026 14:19:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ul6s-A5k7b38; Fri, 14 Aug 2026 14:19:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB72840EDC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786717142;
	bh=FMKy9vG1iNnpK7IJ/Enws3ChS052FKvuNm9bL5qp49A=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=FKgyaFga4X8FGNcAYCP2rZmY0qivu/It+j6L/nliTYCUGTw3BcBVP4I+kk+XBmG0m
	 k4vugA4na6jvWM+MKVTyHvVNMz+o3+m/hc8copKf/tsu3PwjtzXWOPmXiGr0yNVedI
	 XjJIDqBm2rdtOUQ/wPL89ABrNu8v0xXqoKaoqv8VwlHJtFddRpnQ9fissgcgvJb3G6
	 0fVnaL6uTeI+mxlc2aciC0sJAx5UTizFAYBRGwK1KLdZvgYLASod4ajXbTs7CsZxcQ
	 zrwrtX6hXMS0iNPjWy5Ob+HkZ6KT3uPtISzaST0DmSbA2T4CibzYnP0YCA2tq5WImu
	 MXk8pFObc67xA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB72840EDC;
	Fri, 14 Aug 2026 14:19:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8430C23F
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75E7840EDC
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:19:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 02VtSVp3pmFV for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 14:19:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 723D040EDB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 723D040EDB
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 723D040EDB
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:19:00 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-47fe377a217so673284f8f.1
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 07:19:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786717138; x=1787321938;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=sn0boKzbSI7PsLjppmAQlHWI5ZBKzDY6QFBE/vdLedM=;
 b=EaX4FAmDYJwuCMZ+QELFp72XSqtdBZmO3iURNcqtzhwHNgyNuA91XB/nQ2ZSN5qoWc
 Q4CBy0wlLDwzwCFRHI7SS1OSVLxcH9kybljz3KDqu8esLa0skYjPQIa9b1se8bw75rKn
 WhsboTjM6Gy3M6swrPXay3B83Jv6STzG0BqedzaMxjlVrM1iU9UzTR6TkCJReM0sD1ku
 Nds0zsFXfpuXoyjFO/TZO9Xu1ecLylvzVWpxEF8wGjWugJhFeGVH6+iBvBLy1n6TtI5W
 B+bkfWXGpRMTWWmymR+y5ZNuBBeuzuMIQzGZInxRyM670xtcQ7khQ4P+44EazKswy0PM
 WrGA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoSAfwsL09aQpWUUFHrXSCTsQ8u6ravtntboCSykl8o/SFWimjqE2aH8Xgr8S+3qlYqTWYU2IbBbcE=@buildroot.org
X-Gm-Message-State: AOJu0Yzw0Dlh81Ho9rHbOrKfMhAvFm/MnBk+H8L2Xl5y8Q8EbJds8gUZ
 S+eSi9z2cbnpQW6LjBYHM2zBtq1TbCrf2SMR1HdLdfLEate8mDUF3MhrkeL65UJxslE=
X-Gm-Gg: AR+sD10YTV/yi7uIn98qUZHgVhVO2BV2Pr4rKlPo1qqA0Q5nppdVQdXWxcaqCHM+nzA
 xTHQoqCZTvac9KPFmU4D/Eqf3/Ozw7QWTlb2Jxv6a3ue18PcTbQCcsstgJQo2ei0poWKT4rObWl
 6Ycb3sht9clITOLTo8E3SkEJ73xnxe/yZKmUJQzucTVg3o5XTQ/S/Zf9I8G5FLktFqtMkOcwW4c
 JXd8ZpH2zo6+GfKUbxJLuoU7E1+/cQz9ob1L3WXAfeCy7moL+kmJBsgTJcvUM/T/vDAHyNOEDK3
 Oi9CRjdarNI77mrnV8FmHEjTPlay+IO8UqoPh5C2MxRS6PYqXU1ku25B8ObYkTbatoQudTgQhZo
 hb+QRNTwGmJdy7guvKso3yfm3Y6rdyWMnbAqjuf8AO+qyWSnVF8mhXjaH8Q6+yI5N/+TgbLxcBJ
 opLtbEsVaCTcUlw+JCSE1f5b7EVYpNpuPXkmwaxFTofq226hRZARG3JVK8lgAFnAljxM2k3VAvV
 kyZ4VqOIAhmwO03axwzl2FZJKK4Lgcgqi3xVn+zLv/PRVQN
X-Received: by 2002:a05:6000:2c0c:b0:481:5003:c654 with SMTP id
 ffacd0b85a97d-4816072a83amr8322060f8f.7.1786717138372; 
 Fri, 14 Aug 2026 07:18:58 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f2c6115sm8398385f8f.32.2026.08.14.07.18.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 07:18:58 -0700 (PDT)
Message-ID: <78d15a99-a82e-40a3-ab49-c1d4b6d500fc@mind.be>
Date: Fri, 14 Aug 2026 16:18:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Michael Nosthoff <buildroot@heine.tech>, buildroot@buildroot.org
References: <20260204151412.2337672-1-buildroot@heine.tech>
Content-Language: en-US
In-Reply-To: <20260204151412.2337672-1-buildroot@heine.tech>
Subject: Re: [Buildroot] [PATCH] package/botan: cleanup boost dependencies
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

On 4/02/26 16:14, Michael Nosthoff via buildroot wrote:
> - botan dropped the usage of Boost.Filesystem in 2.10.0 [0]
> - botan never actively searched for Boost.System, as it is header-only
>    the dependecy can be dropped too
>
> The only part of boost botan currently uses is asio. So use --with-boost option
> when boost is selected.
>
> [0] https://github.com/randombit/botan/commit/aff8cc8a7a5e22e3fedeae7ca82b63d4744ac82c
>
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to 2025.02.x and 2026.05.x, thanks !
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
