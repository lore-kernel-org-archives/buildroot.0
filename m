Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E71AC636CC
	for <buildroot@archiver.kernel.org>; Mon, 13 Feb 2023 18:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C28EC81BCB;
	Mon, 13 Feb 2023 18:47:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C28EC81BCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O7BU24dFMXSf; Mon, 13 Feb 2023 18:47:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F1FA81BA9;
	Mon, 13 Feb 2023 18:47:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F1FA81BA9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 137811BF289
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 18:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E12A3409EF
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 18:46:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E12A3409EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CJoHR_9uvq_1 for <buildroot@lists.busybox.net>;
 Mon, 13 Feb 2023 18:46:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8380140949
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8380140949
 for <buildroot@buildroot.org>; Mon, 13 Feb 2023 18:46:56 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id s11so6537580edd.10
 for <buildroot@buildroot.org>; Mon, 13 Feb 2023 10:46:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LJcHzrzN4wKrKm14bt5D11vyd8lZNa5AIEZE1wZU6k8=;
 b=izm9fPXgVmdAj9oQvEuQkpy3oSA7SviDCV6OHt90aVJvBnSHCM30fpeZYfmH9C6Ech
 /ImwYp5c4bz96ayir2Co+KENC1LgMaeWsCD4QqRLQJE2wGx3uHLWUiCVcrz4PxNHXRmW
 tPQVzvT6WrUQ/spe4WL+bfjtwqgyUmJ7Um3BNmBLIxgYbbYXgvIsgz4AwsUMwqk8cOJt
 JVMMhb49cuigMymtEamWEVh7CnFWKoDIJ7AnjrPJ0EruTkLFkR2uaugptV7I5Xc1FHzw
 XmTbXwxxo59EZZ0WJnAm+/YIIKQWknfVysSSCE0DwpjNk9hqHWtlUFXkflQdEqY35wa+
 /3FQ==
X-Gm-Message-State: AO0yUKUh64epFzHehhcg19MoR5cFOyWZfbsTiDTOyh4qZAwKzlllqhkj
 KMqT1lxcnd/wU/DHBG+W+6E=
X-Google-Smtp-Source: AK7set+qUqPN6shHmkWYljsIJfCkjZoxMAhQGEbS6RM3oqTdl4NyxonMA80v+GHZO9MzikrbmW4uHw==
X-Received: by 2002:a50:cd50:0:b0:4ab:4be9:5dcf with SMTP id
 d16-20020a50cd50000000b004ab4be95dcfmr12721586edj.4.1676314014740; 
 Mon, 13 Feb 2023 10:46:54 -0800 (PST)
Received: from ?IPV6:2a02:8070:4182:37a0:64cb:8203:42ee:ef04?
 ([2a02:8070:4182:37a0:64cb:8203:42ee:ef04])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a50d6c6000000b004ab0e9e396bsm7022251edj.87.2023.02.13.10.46.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 10:46:54 -0800 (PST)
Message-ID: <13e96c75-2880-9631-0ae6-92be1e36c219@gmail.com>
Date: Mon, 13 Feb 2023 19:46:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
To: Peter Korsgaard <peter@korsgaard.com>
References: <20221031124625.21172-1-raphael.pavlidis@gmail.com>
 <87h6vw5l2r.fsf@dell.be.48ers.dk>
 <7f57a607-bf3c-0250-ed23-c6fbf73961a3@gmail.com>
 <87r0uwcjgp.fsf@dell.be.48ers.dk>
Content-Language: en-US
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
In-Reply-To: <87r0uwcjgp.fsf@dell.be.48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LJcHzrzN4wKrKm14bt5D11vyd8lZNa5AIEZE1wZU6k8=;
 b=NV/QTMgWRfvxzxAZK2XgKNMT3HwvazGk6MqWIEt3kC/hJOwAghwSt7I8nq0cRPZMrD
 sy+MuyDkId01q/PWfkUhYuRoNiVeYWesMqnnLssbIA42jmfBrtMdt44RQ3ULsvQpkCm+
 CmH7TcQpD5WWxRiMTD9N+7tYRydpxyHOb4S46bzZ/Awf/vLC+fbeUz/2vwtxMSlOujpE
 keKMnjMVPeI7qrXu5F/Dsdx1L59acwzLQLtV/d3UapkREtmNE5ygkmYN1GShztm8AAfK
 vAVSp1et53yN/+7Fc1KPKHZAuExgM0XPsu3v+FcYSysA8AGJcW7Vd524Tz4qHhtFDnJ6
 LEhg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NV/QTMgW
Subject: Re: [Buildroot] [PATCH v1 1/1] package/sway: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11.02.23 16:25, Peter Korsgaard wrote:
>>>>>> "Raphael" == Raphael Pavlidis <raphael.pavlidis@gmail.com> writes:
> 
>   > Hi Peter,
>   > On 08.02.23 14:43, Peter Korsgaard wrote:
>   > [--SNIP--]
>   >> How did you test this? Here wlroots with x11 support doesn't build
>   >> as we
>   >> don't have an Xwayland .pc file or binary in Buildroot.
>   >>
>   > I create a xwayland package, which build the xserver binary, but did
>   > not send the patch yet. (This will fix the problems with weston, too)
> 
> Ok, thanks - Will you submit the xwayland package?
> 

Yes, but I have to do some cleanups. Should I add you to CC then?
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
