Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9695DC4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 11:13:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B9BB60C51
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 11:13:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5B9BB60C51
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17028403B1;
	Sun, 25 Jul 2021 11:13:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y7X00FTbLU28; Sun, 25 Jul 2021 11:13:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A0DC403AC;
	Sun, 25 Jul 2021 11:13:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 902F61BF48B
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 11:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F1364011D
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 11:13:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id njdRbRXsYdNX for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 11:13:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA43D400EE
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 11:13:42 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id gn26so4897778ejc.3
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 04:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:from:to:cc:references:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tb6J2KXkUSOyS/m5iffNd9Yu2R31tW8gOdco20LMD7k=;
 b=g194PPZzy1Z0/uhs8jhHY8PM0sL1vlb31dV04y/p2JmjGnKAffx8OoD/VTv0d1nPka
 l90QoE7Gjxhv7EsAhyqs8paUfrkPNbkEXfVMpJQEZ8jhCLWynTTN43p5Njpn12Akuwfj
 qL7eX88egXP8GeYEVf/FWSz8QxvVO2o3z+ZL64IjZORpR60T3e0TIndB4/yjxbcjk47n
 J9fHLE3GefXmOVizs3pPTrRLaSKa4AzfLAsW67wW7QkXMhyKxzEX5iWVucO+qgoUQhII
 wOxaRuXbkU/25vorxfaoP1UsnNYv7Rni2xhjjuLKPBvfzPy0aCNO8m0tqflxalrPFwJA
 Ds/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=tb6J2KXkUSOyS/m5iffNd9Yu2R31tW8gOdco20LMD7k=;
 b=toKa2zuXvZiicYLRO4uoN84a2DXmdJz8A0k7rmTR1sBdzIWRcWf3fIYtxJ3Vk+x6sY
 phKNyw0WKHJ+YkeoPARSazsnAj0K2v18KIAcGQ5QO94sanLPCUJziLdAGDlhCt0pwN+7
 yaF5aG5ipWiOq3YrJqplcdhUR9hUv7Ws0mI+ppXLya6mQ/gO7w8ENX7NFt7FFoRISgKs
 irvhuaCH1OhPPjCpzwgGmwSfVF2Nhq1orTzTxzTe/qAWCUFv3huozUw+H4ks/xj+lYK+
 zbYQTBzLjmAp5nJ4SavBZuzNfwvp1jMGLPDNdt6qr+t31pYc7aKqcWHNKRgxAPVs8x54
 kmyA==
X-Gm-Message-State: AOAM533GCwIgRTsFRoxmh+DIXzH6CjSvLMzKaVPu3mpgeN35KZk7Ppv3
 OR+dSZ96Kt0ux+leEKj5DSW/bWKacLGEs3Um
X-Google-Smtp-Source: ABdhPJzfO45Mvkp8m1QIHC/NP0tIXGk1cgvXLGJ6YiU0Q0RVM74FXCkjmxHgJiivR4zL4fCPQwuuOw==
X-Received: by 2002:aa7:cb19:: with SMTP id s25mr15913944edt.194.1627211621180; 
 Sun, 25 Jul 2021 04:13:41 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id q26sm8969803ejs.115.2021.07.25.04.13.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jul 2021 04:13:40 -0700 (PDT)
From: Arnout Vandecappelle <arnout@mind.be>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20210724214526.47637-1-arnout@mind.be>
 <20210724214526.47637-3-arnout@mind.be> <20210725075725.GP2382418@scaer>
 <f3776222-ad4d-2d73-9bf7-a79b335d10f3@mind.be>
Organization: Essensium/Mind
Message-ID: <4e793690-349c-af33-e16c-b54489fdd1ff@mind.be>
Date: Sun, 25 Jul 2021 13:13:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f3776222-ad4d-2d73-9bf7-a79b335d10f3@mind.be>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v4 3/3] package/armadillo: allows to select
 between clapack, lapack or openblas
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 25/07/2021 11:36, Arnout Vandecappelle wrote:
>  I'll send a v5 which fixes it. I still want Gwenhael to confirm that it's good
> in this shape though.

 There won't be a v5 coming because I can't overcome the circular dependency.

 I think, actually, that we should just drop the clapack package. It's dead (the
lapack maintainers no longer generate clapack based on new lapack releases,
probably because f2c is unmaintained).

 I remember Romain and I were banging our heads against lapack, clapack and
openblas a couple of years ago on a Buildroot developer meeting - I believe it
was in the context of numpy at the time. I don't remember exactly what the
conclusion was, but IIRC there was no good solution at the time either.

 Well, in the end I went ahead and sent a v5 which removes clapack and
re-introduces the choice for BLAS provider. The "choice" for LAPACK provider is
automatic though (it's just yes or no anyway).

 Gwenhael, what do you think?


 Regards,
 Arnout
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
