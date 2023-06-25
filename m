Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE7AEB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 13:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE4A460BFE;
	Sun, 25 Jun 2023 13:26:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE4A460BFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ezr7LAophpmo; Sun, 25 Jun 2023 13:26:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1E3260BD8;
	Sun, 25 Jun 2023 13:26:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1E3260BD8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EE30D1BF3BA
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 13:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D509081B17
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 13:26:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D509081B17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FqmwC67IKb7h for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 13:26:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCD4A81AAB
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DCD4A81AAB
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 13:26:38 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-991b7a4d2e8so8137066b.1
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 06:26:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687699597; x=1690291597;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uxltnLBCEG5yIPg7lAAHH9L28cllEM703XnGNSmyokc=;
 b=BDMHxo5K8yE4oFqozF/jktiF3sb4FbbEBq2pQIv4yZCWhFQCwM35Shcz5RER8qUvV2
 kznaZ4upxY4DgB26i86HHb0etzTfFi83SHdK/jh2v0Egg0Qy22eCudHut3El8xzJylYS
 LsPwWFbI8VktWfA2yhZNoOj70081venRI2TPTnJGrT5TVBie3QYj2JJjJ3S/FDlkhHVq
 tuG6tepm9/CnQ8rS20TyVMmmvqUeB1AjrLgqkxgCbQygVyJ2KeO+ZH+z1EuP5RmNdzHv
 fBr5t4sNc6bJnTo0ekq+F4IKT7mJGIzwvtNdyFwikXhbk4xkKlvPs0zHVjVDsEEUhUwa
 IMTg==
X-Gm-Message-State: AC+VfDwRlRMbqV8RLiCjxilRbIP/R0qU1jkaRbTYc1bHwodWT1ZdV6Il
 yFEndBGtZbiF09ab7yqrxw4g/A==
X-Google-Smtp-Source: ACHHUZ42+K0bUC4vJser8DWLC8Y695enoCt2m0B/YvznS+A6PhvsYPMDj09GS0U8Sy4xKlVIqxqbOA==
X-Received: by 2002:a17:907:16a1:b0:988:d1d5:cd5b with SMTP id
 hc33-20020a17090716a100b00988d1d5cd5bmr17301375ejc.75.1687699596979; 
 Sun, 25 Jun 2023 06:26:36 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 us3-20020a170906bfc300b00991bba473e2sm27750ejb.85.2023.06.25.06.26.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jun 2023 06:26:36 -0700 (PDT)
Message-ID: <700d3a40-9e91-40fe-1b89-8852c005b2a8@mind.be>
Date: Sun, 25 Jun 2023 15:26:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Andreas Dannenberg <dannenberg@ti.com>
References: <20230622160212.2063472-1-dannenberg@ti.com>
 <20230622160212.2063472-8-dannenberg@ti.com>
 <CAEg67Gn7OeVDCwthzRTBdKj=QeYFku1JT3t=Rm9hUf59k52+4A@mail.gmail.com>
 <20230623145350.265zxot3uvidzur5@dasso> <20230625075550.GI24952@scaer>
In-Reply-To: <20230625075550.GI24952@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687699597; x=1690291597;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uxltnLBCEG5yIPg7lAAHH9L28cllEM703XnGNSmyokc=;
 b=WUGNsusR1IbEVxBMK3UdbYPtmdstoIJ8o+cH9sDTNY3HgmDXS++WmgYHAJULD1gfTh
 QmmgCDSls9QrYd4nsjJJWwRE1mMIczKDfnIQUJX2+d3xUc0bwQnFCeyAP2h1qeEVFSAv
 XBxyPe8bpgmqjbEL+2mO5A3GKj0hCpC0gxAz/82LQonCCWoKUNXy3bDL02wXiruMWAhv
 9dktIsepSo/jORcZaFpaDPXCQIdG3tXZ0Zua0C29RopEy/qAgsZXxt/Ko35yQ7N4o8nL
 SGaRIDeurKqQZ5NmRxRUqPay1wZ53CMIvpdaqXnlnqxP9FLmOQQoJ0FVKPETkXjdyI3z
 9thQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WUGNsusR
Subject: Re: [Buildroot] [PATCH v9 07/11] package/ti-core-secdev-k3: new
 package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Patrick Oppenlander <patrick.oppenlander@gmail.com>,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/06/2023 09:55, Yann E. MORIN wrote:
> Andreas, Patrick, All,
> 
> On 2023-06-23 09:53 -0500, Andreas Dannenberg via buildroot spake thusly:
>> On Fri, Jun 23, 2023 at 01:48:30PM +1000, Patrick Oppenlander wrote:
> [--SNIP--]
>>>> diff --git a/package/ti-core-secdev-k3/ti-core-secdev-k3.mk b/package/ti-core-secdev-k3/ti-core-secdev-k3.mk
>>>> new file mode 100644
>>>> index 0000000000..c388af2865
>>>> --- /dev/null
>>>> +++ b/package/ti-core-secdev-k3/ti-core-secdev-k3.mk
>>>> @@ -0,0 +1,31 @@
>>>> +################################################################################
>>>> +#
>>>> +# ti-core-secdev-k3
>>>> +#
>>>> +################################################################################
>>>> +
>>>> +TI_CORE_SECDEV_K3_VERSION = 08.06.00.007
> 
> I see this version present (either used or referenced) in multiple
> packages. Would it be possible, and would it make sense to share a
> it in a single location?
> 
> This is going to be a bit tricky, because the variable must be set
> _before_ any package that uses it gets parsed. WE usually ensure this by
> having all packages in a common directory (like the Qt5 stuff in
> package/qt5/), but here we have packages in package/ and in boot/, so I
> can see a little issue...

  Well, package/ is parsed before boot/ is, so the order is implicitly 
guaranteed. It's a bit meh to rely on that though.

  Regards,
  Arnout

[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
