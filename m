Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF14C433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 19:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69FF282CD3;
	Thu, 14 Apr 2022 19:15:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1npk4oPYQ13q; Thu, 14 Apr 2022 19:15:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D3DE832DB;
	Thu, 14 Apr 2022 19:15:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 563701BF319
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3FB144175F
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:15:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pS_iUWFIa0dv for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 19:15:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B0DFF415B7
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 19:15:40 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id r13so11859385ejd.5
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 12:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=TZOfimLz44S61bHDlantPXlPIBAkc9wZ4ebCE+/rnvc=;
 b=J3BJagAWFyBBblvh0rChVHKpbAp62MYkt+8A5VfPRQQirIrEAeICtHm84qwQCkti4T
 6cAFe39HtEflhoTKS9s5Qrquc+816uEf5Zz8JSmX4SbvYmpHYv+foM5JF1TyEPzBl13q
 XGKl0rdhMDxUhv8wThUQGRmuGg1puBS14LRT0duilpgWTCU20I7kJFM+lmox1b/suR9g
 K6Uow8D75q9vlbmKThOzC+uGJR1u5BXPxmzV1ir1ZXJEJqAeiZVKtDOvheth9sauS85/
 Oq7VoS/1Gljar5wdX2au09jOs2CApu+4ovZPsi7G8SQo3apHZSnoT5y+HDwrHjv3pOQh
 E7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=TZOfimLz44S61bHDlantPXlPIBAkc9wZ4ebCE+/rnvc=;
 b=OuVADZw9QrT9OtQVKU6CagjeMIJVrIoq71KEBK2ZbWxUUUCMTp9n6n5k3rap/xquG1
 JMIIAEEceBRkkYasLJE9LG67TlzVvArLlNMY8ULjAWhJ08HPoGRFaQPfW6EkWNSivhNO
 dOH0Ege7Q088h6H9o2+CAbM78jdyO7L8KoGOJjCrTwNgKNAy9UsWktEm58L4YLN2jfpZ
 1kEnvzdKffKhwTrsP31o0mctUb9kgnN5hcbYrrtRJYGHqePJ2KHb/iuMSCvnz/I1uExA
 NblR9wiZbgYQAcPthbuFWla/Nq5rId9Hcrhc5e5gFFwT2Z2z+q9AqQGpAdLQscs7XZZl
 FsCA==
X-Gm-Message-State: AOAM531lWk0QvMqYQ60NEIUsMzLUZMLLSpCE4bBaJgHngoaOWaeYTaST
 cswcmE9bXwvSPuEBnPfVUL8P+Fpm7N1bYA==
X-Google-Smtp-Source: ABdhPJzwCD6lab8BH02yj6vV6VqqrQYyoCuw7SELO3iJdkeMg8h8LaEQpT8ASowOBNM5j2zHdypMFw==
X-Received: by 2002:a17:906:3283:b0:6ce:78f9:fafd with SMTP id
 3-20020a170906328300b006ce78f9fafdmr3701836ejw.534.1649963738814; 
 Thu, 14 Apr 2022 12:15:38 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a50eb8d000000b0041f112a63c4sm1465159edr.52.2022.04.14.12.15.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 12:15:37 -0700 (PDT)
Message-ID: <73baff5b-2b45-446f-e910-be5a21e74c4e@mind.be>
Date: Thu, 14 Apr 2022 21:15:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Peter Korsgaard <peter@korsgaard.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220405185320.319C18361B@busybox.osuosl.org>
 <9ca9a86e-917a-ea5a-04bf-b9cd0e15aff5@othermo.de>
 <07cb544d-bc42-d774-08aa-67cecc96c1b0@mind.be>
 <87bkx7h299.fsf@dell.be.48ers.dk> <874k2zgxzk.fsf@dell.be.48ers.dk>
 <4fead5f8-95e6-6f88-6a8c-f62a32fcec9f@mind.be>
 <87ilrefy9b.fsf@dell.be.48ers.dk>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <87ilrefy9b.fsf@dell.be.48ers.dk>
Subject: Re: [Buildroot] [git commit] package/containerd: security bump to
 version 1.5.11
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/04/2022 11:26, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
> Hi,
> 
>   >> In any case, I've pushed a commit to 2022.02.x to adjust the hash to
>   >> what Github is now serving.
> 
>   >  As I've written in the mail that went concurrently with yours, this
>   >  may change again at any time. Therefore, please make sure that you
>   > update the tarball on sources.buildroot.org so there's a fallback when
>   > the hash changes again.
> 
> It should happen automatically now that the hash matches, but I have
> triggered a manual sync for containerd and cleared the negative cache
> in cloudflare.
> 
> On a related note, the go/rust vendoring stuff isn't great for the
> source mirror, where we basically run make foo-source for all packages -
> And which now builds an internal toolchain and host-go / host-rust
> before doing the download :/ I guess I'll need to rework the mirroring
> logic a bit.

  Just don't delete the output directory?

  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
