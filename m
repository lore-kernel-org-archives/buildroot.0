Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F57C43217
	for <buildroot@archiver.kernel.org>; Mon, 28 Nov 2022 10:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 032AD4094D;
	Mon, 28 Nov 2022 10:33:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 032AD4094D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id stkmZ8m_UpRH; Mon, 28 Nov 2022 10:33:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDCFB4095F;
	Mon, 28 Nov 2022 10:33:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDCFB4095F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0E22E1BF3BE
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 10:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA5834018E
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 10:33:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA5834018E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BBvmOzfer5Cp for <buildroot@lists.busybox.net>;
 Mon, 28 Nov 2022 10:33:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91DA9400D9
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 91DA9400D9
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 10:33:03 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id b2so8314306eja.7
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 02:33:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DYOtsHMA6yeRh8MEAKs7BkyeWrPtnvsIGigs1n3mKZQ=;
 b=kY1Uy24hyfPX/7e7mneAA4Qzy59JpMyKJizmZCs5OCBjNJsbq/e4WxvaRRjBqWle22
 FO49Va2f8SBfJnevSjukDi514WZtWkJs28icHglXfsKmFw0KrHn2kxmikuLZH6Jmd/Ud
 QwjqHOv59CKNgqc3lieoS2i915UQH173euh4+5zkdG8+3acDfaLeX93zn0M7qoD4iJmH
 qwLt5dUmuzkceDpfM0zhp/f4za1LoBAuIgDE1R09a3lni4AHB1QI0uVFEr5ZZN9p732Z
 0BYvl0acSZ4GFSUzlMQelIe8Ftdpum4cnjWe5HMqHEFtwCLoBHF1tNJvgbuTkeT596wb
 Al4Q==
X-Gm-Message-State: ANoB5pmp8BTDsMLxysOrgcl2OV/0nEt4nfrXjCsS7NEkfa3RGpXE7kYD
 Qb7c5Y37XPp+5gYjVezTDhU9+A==
X-Google-Smtp-Source: AA0mqf6h5q9nYp/6XxwuFi7lkB44tuMgzbI5Ln4+VP9AiS4COosPtjaM2dCBlKaLs4k2nN+0kzB4mA==
X-Received: by 2002:a17:907:d006:b0:7bc:ad2d:879d with SMTP id
 va6-20020a170907d00600b007bcad2d879dmr12391199ejc.603.1669631581589; 
 Mon, 28 Nov 2022 02:33:01 -0800 (PST)
Received: from [10.1.0.161] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 kx20-20020a170907775400b00788c622fa2csm4753118ejc.135.2022.11.28.02.33.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Nov 2022 02:33:01 -0800 (PST)
Message-ID: <ffa0513e-e898-2b20-13c1-c221fdd9c333@mind.be>
Date: Mon, 28 Nov 2022 11:32:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-GB
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org,
 Frank Vanbever <frank.vanbever@mind.be>
References: <87ilj97chz.fsf@dell.be.48ers.dk>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <87ilj97chz.fsf@dell.be.48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DYOtsHMA6yeRh8MEAKs7BkyeWrPtnvsIGigs1n3mKZQ=;
 b=fZ3g4UWYc3wUNSez7u6bsZ/TiNO2e4a1+rvEHZlTTg/bHfq/iLOC7Q7rvGeYOMrvbN
 jI48XYfsxkj+fWrx01/0zCvPvlpSwjLX0FuiwJLrE7Nt3QExwU3Z/Jmpz1X9tYZnQg4s
 71E8m0jEUcqWSN83rq1Sv04RIYBxN1RDIxlFI2ZRo6uy09xWMYG9hP5cnJEjsCuhm+b3
 L2vpTQ8IygH1OOVxJPULsNwXgaKy1BztrD8w4k2g/uSlIerTLaQ9iRExDkIVPUBDciTQ
 P0CSPKdHhFpY9bSLGH7lVrqnn3vW43JDs6oLgrvuQxTcddW1PqTsZppx/8gXFtiEvIzJ
 cVGg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fZ3g4UWY
Subject: Re: [Buildroot] rabbitmq-server support in Buildroot
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 20/11/2022 18:38, Peter Korsgaard wrote:
> Hi Frank,

  Sending to the right Frank now...

  Regards,
  Arnout

> 
> You are listed in the Buildroot DEVELOPERS file for rabbitmq-server, but
> it has not seen any updates since:
> 
> commit 27df8b7b0d7c6c331d2e4fe7b6ea2bd1596acd75
> Author: Frank Vanbever <frank.vanbever@essensium.com>
> Date:   Thu Feb 13 16:14:14 2020 +0100
> 
>      package/rabbitmq-server: bump version to 3.8.2
> 
> Are you still interested in maintaining it? If not, are anybody else?
> Otherwise I suggest we remove it before the 2022.11 release.
> 
> The 3.8.x series looks to still be maintained upstream, and 3.8.2 is
> vulnerable to a number of security issues, E.G.:
> 
> https://nvd.nist.gov/vuln/detail/CVE-2020-5419 (Windows only)
> https://tanzu.vmware.com/security/cve-2021-22116
> https://tanzu.vmware.com/security/cve-2021-22117 (Windows only)
> https://github.com/rabbitmq/rabbitmq-server/security/advisories
> 
> rabbitmq-server >= 3.8.16 unfortunately requires erlang 23, so udating
> is not trivial:
> 
> https://github.com/rabbitmq/rabbitmq-server/releases/tag/v3.8.16
> 
> What do you say?
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
