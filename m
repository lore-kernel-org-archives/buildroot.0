Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FF8FC433F5
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 19:20:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42FA06112F
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 19:20:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 42FA06112F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0157F406D5;
	Tue, 21 Sep 2021 19:20:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xfgdMisZtaLd; Tue, 21 Sep 2021 19:20:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D85E406D2;
	Tue, 21 Sep 2021 19:20:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D09A71BF578
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 19:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFE45403F9
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 19:20:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wXIk7wP4J2so for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 19:20:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D7102400CF
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 19:20:15 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id co2so426659edb.8
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 12:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=umeiKqOamHHAqkFRDyu67kHny4oO+95P8TRQSKSEBnA=;
 b=UjFFarFWpl0Rvvy9SU+uhf9XHajb7RtjjOXRruM6uNvGmIV/zv9MbSTgJiVaBYONHQ
 +XKK0y4XewGqK5dIsyfdZBSZOu7ucDpVp/EIThexKcm9fsfS4ar3y/Mj3E3sw6j1zSSg
 RydQiuUPhEvkV0ru39TEBP/l52kMZtDlW4Ry4fyw5wW8klLzsoi9W4vu0OgFA0FjeIo7
 bF/PBckkN3yFLAInuEnUsLJfvhuEAXFqPKJkWY/wXVGPnT8DNt4rq8135DV6rXLfYxDC
 9wj/bwFLn6luYqyZGX5IwHxA2R3lkbYFGvX9vE4FkdmqRPcCiu44G1mQuq7i4rxUuday
 ANng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=umeiKqOamHHAqkFRDyu67kHny4oO+95P8TRQSKSEBnA=;
 b=3ZtrENxpccxwi/ERTS5xRKQP6vBLZM1GG1NFwXC3Wn0DcwyQActYl+DNtlKWTJIiTO
 WMM7ivbbedTR/nNHm/0p7Z4f8EKC6cZ5eINEQI1p9yNqymlEC89i7+y7F5occ9WiVDAW
 0cYwHmGvHbMu2ByZvqZEsUKjhOgpf3BubOclcYqXPjH0PsAB9R9NqT5BcKxcfjWYpzOq
 du8XqE6Vl1rvmr696w8qM494a/ENAEWp/2dMkuqmzD0UM46Sg3eRavBP9lzZrkxXWkjA
 1o0+adJqFaQDmNYpA5Hrhi9n65CKyr3mk4cKsHB9zfMD7RDkzH770cplHxtt5aq4GSeg
 QeCg==
X-Gm-Message-State: AOAM533oLDOBWrULy6fyLYrSYOI051gkSEAQHP7KDhjlhaVCmSZD/g24
 pXxMO5tYGc5js3cLWD2SHvqgnO3M0q9Ozw==
X-Google-Smtp-Source: ABdhPJzg7Rf4PlZTCDtCAoAn4PH3bjky/jxYUO9iyYpfNMlQ4GvKUle7ktvJZONnJNR+k1Qg5TkJXg==
X-Received: by 2002:a17:906:318c:: with SMTP id
 12mr37821721ejy.28.1632252013827; 
 Tue, 21 Sep 2021 12:20:13 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id a12sm7942134eje.27.2021.09.21.12.20.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 12:20:13 -0700 (PDT)
Message-ID: <d7fb641c-cd3f-2651-093a-40b4fefb5de5@mind.be>
Date: Tue, 21 Sep 2021 21:20:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Marcin Niestroj <m.niestroj@grinn-global.com>, buildroot@buildroot.org
References: <20210910185456.2688031-1-m.niestroj@grinn-global.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210910185456.2688031-1-m.niestroj@grinn-global.com>
Subject: Re: [Buildroot] [PATCH 0/2] package/python-{pytest,
 pluggy}: bump to newest
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 10/09/2021 20:54, Marcin Niestroj wrote:
> python-pytest needs to be updated first, as it adds support for newest pluggy
> (keeping support for older versions).
> 
> Marcin Niestroj (2):
>    package/python-pytest: bump to version 6.2.5
>    package/python-pluggy: bump to version 1.0.0

  Both applied to master, thanks.

  Regards,
  Arnout

> 
>   package/python-pluggy/python-pluggy.hash | 4 ++--
>   package/python-pluggy/python-pluggy.mk   | 4 ++--
>   package/python-pytest/python-pytest.hash | 4 ++--
>   package/python-pytest/python-pytest.mk   | 4 ++--
>   4 files changed, 8 insertions(+), 8 deletions(-)
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
