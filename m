Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C72C61DA4
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 20:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D81A60F41;
	Thu,  9 Feb 2023 20:27:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D81A60F41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AcVDIhGRkdAK; Thu,  9 Feb 2023 20:27:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54CAD60E68;
	Thu,  9 Feb 2023 20:27:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54CAD60E68
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 127341BF57B
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 20:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E07AC408AE
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 20:27:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E07AC408AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F_s5Fq3MiHzO for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 20:27:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A601408AA
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9A601408AA
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 20:27:17 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id c26so5260937ejz.10
 for <buildroot@buildroot.org>; Thu, 09 Feb 2023 12:27:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qEALyU5EV7ylzVMhoUpQlEL/wKddDK6XCXjgoHqa0GQ=;
 b=S9ART5Ofc8kkI6FMBY+5nVG0jcH0ssSB5qwLoLp0tAWV7X1gk1oGuCtTqDydCHvgfn
 8+KgTR29bCf9MtsVqDjulKpMOOgLmF4i6Ht4Nj9Grvw1kqL4RbzYsMEHioQ0kYA4crCn
 ULK+oNdcqo1n4WM64Qp/qfKGABFXUSEJjH2+l4+Tm3zr/qGe6Srm9hBerNQw+SxjfQT9
 mhAmQkwo1BG6hqYYd+xGyPduMX2NkKfVYp+u13GV6ivf4/J/qM/TrBve3zR/Gt+EpBNJ
 wEEe0NilukLi3yk54wNQQVZygpCP2Ehj/YDrzMhIn/QSuXWGxEVg3q1ENm6z0i2vHzoE
 dUYg==
X-Gm-Message-State: AO0yUKVpOaawX++IRbdcJcCXuMbPZgY5RJf/bn/vCA82woDTm2X0yR7O
 tApMstWdp5Z6BmyxDzWuNJeVrw==
X-Google-Smtp-Source: AK7set8gPSV4WH7n2FCjZr2MvGml9wtJwglPw9Ivt/MmC1HbLpPIKWh/8ldjL8QXQyDpVhZjPk1mbg==
X-Received: by 2002:a17:907:6e1f:b0:8aa:502c:44d3 with SMTP id
 sd31-20020a1709076e1f00b008aa502c44d3mr15054781ejc.41.1675974435834; 
 Thu, 09 Feb 2023 12:27:15 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 kt5-20020a170906aac500b007c1633cea13sm1339028ejb.12.2023.02.09.12.27.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 12:27:13 -0800 (PST)
Message-ID: <1750a14f-36a1-fe51-1452-3a72b84979c5@mind.be>
Date: Thu, 9 Feb 2023 21:27:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Shahab Vahedi <Shahab.Vahedi@synopsys.com>
References: <97ea44bb-58fe-d6cb-6c79-9be0b245f2c6@synopsys.com>
 <29d2a8c7-44cd-da42-5fed-f17ec0f8ccf2@synopsys.com>
 <fce2f167-bd7a-8b93-41ec-c7c339ec070f@mind.be>
 <b98c7a16-ea21-c398-4045-0edbf46caa40@synopsys.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <b98c7a16-ea21-c398-4045-0edbf46caa40@synopsys.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qEALyU5EV7ylzVMhoUpQlEL/wKddDK6XCXjgoHqa0GQ=;
 b=ied3T99VQUAeM07nAKuUTDRK1pC3x1ciw+ml7lbI4KTLs4ZJiCsmQr29h8eyUrl0on
 KOG4IRg4rqykYzA3HVBqFZWCluWzQRNmj08OL6UjyKUj8ohCVLHEqOa+URneD7xt2Lo7
 AEwLIE6j8Z9Gxu7PwGhm07D4LTp77j7aRGe3dIHQAsLKrxsYBep3U7aioFCywpgdE5Zy
 QLUsT9IpP5YGOl8yNJotp55kmHqQOCnEUJx7m4yDSVn0EyEou0D9y3QO9NH4Vk1A76+P
 BRz+NqSrqBT6lBdG18/lky/RdxAQv71WNOUmJKUHkEci8w8axNt+4p6HqV2k6V2FP+rG
 z7UA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ied3T99V
Subject: Re: [Buildroot] [PATCH v4 1/1] package/bpftool: revert bpf_cookie
 patch to allow building
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/02/2023 13:23, Shahab Vahedi wrote:
> Hi Arnout,
> 
> On 2/8/23 17:36, Arnout Vandecappelle wrote:
>>
>> It's not clear to me why you did a revert of the cookie feature rather than
>> using those patches. I think the first two or three should be sufficient to
>> fix your issue?
> 
> Ideally, the correct way would be applying that pending series. But since
> there were comments that some of the patches might need reworking [1], I did

  I don't see anything in that thread about rework being needed, only some 
complaints about some mail gateway encrypting messages so they can't be read by 
some recipients...

> not feel confident to add them. Therefore, I tried to keep my solution minimal
> and solve it by eliminating the problem. I know, it is not appealing.

  The problem with your patch is that it is very difficult to decide if it 
should be kept or not when bumping the version. Plus, some people (or other 
packages) may rely on the feature that you remove.

  Regards,
  Arnout

> 
>> For the time being, I marked this as Changes Requested. If the upstream
>> patches are not sufficient, please send a mail upstream (as a reply to that
>> series) explaining the problem (again), and re-send this patch to
>> Buildroot. If it does fix things, please send a mail upstream to ask to
>> move the series forward (explaining the issue you have), and send a patch
>> to Buildroot that adds the needed patches.
> 
> They (re)confirmed the issue to me in the past [2] and are aware that its
> solution is missing from all the releases onward (see the first point of
> "Known bugs" in the release page [3]).
> 
> [1]
> https://lore.kernel.org/bpf/20220421003152.339542-3-alobakin@pm.me/T/#rb9ce86e9f25b2d097b88d87af8ffdfa401d63c68
> 
> [2]
> https://lore.kernel.org/bpf/b1a604e1-be09-ac0b-ff22-b194ae9ce886@isovalent.com/
> 
> [3]
> https://github.com/libbpf/bpftool/releases
> 
> --
> Shahab
> 
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
