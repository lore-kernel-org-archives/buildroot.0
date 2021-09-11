Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBE0AC433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 16:20:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60A966023B
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 16:20:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 60A966023B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E6EFD40CF3;
	Sat, 11 Sep 2021 16:20:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lo0P9BYlgu14; Sat, 11 Sep 2021 16:20:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35E3640487;
	Sat, 11 Sep 2021 16:20:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 050201BF304
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 16:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0220B81B36
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 16:20:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P7B64eB5CgIP for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 16:20:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BAED381B14
 for <buildroot@busybox.net>; Sat, 11 Sep 2021 16:20:06 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id v24so1047988eda.3
 for <buildroot@busybox.net>; Sat, 11 Sep 2021 09:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kccCKNH6Bkh6Pji53cMJBlbzPZzuZEfVde+pLbi+Er4=;
 b=DzExK3JO8y3ehWsPgGbONtViJeBki3qOhMgehaa1fRniCoXpCLTj/9VbRjtbYZfuVk
 r0mIKw6yUxbsrGozRbpGtAnIlR1qMumhUsNW4kYXOZPpVdA97sZKAnO68emfIw15INzS
 POZMrKy+CWJQvfeS0iiM5MvygGXQMdI6G3yqpkqVRQ05Tq/4hy3Gxla8z12cGkMNProm
 WxkNnAXqR/NrukMSj5cJTOmsg2P2bY49QnKHf6Qt5FJHYPc7rBvSNdTEv2AoJPQhg3aF
 6WuMy712qCPgpLTQ/1qZhLnyVFMAegYm4zPXehq2BupfWN5BkCYUwhmvgs+90NREDKH1
 uoYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=kccCKNH6Bkh6Pji53cMJBlbzPZzuZEfVde+pLbi+Er4=;
 b=SVCD/5lhe8lYLh3gCTvEqtnW3JrtFK7vipnM+VTpjvdE+sWprFOCP6EE14I0C0+snu
 5+s2w2F/gqLsxSJ7DJ1lHM6VjVlpgUjQNkvL6zTAHL5z0u46stYtj8cQSkNWvfCm1kbD
 cpEKy+jmAj1tIkfmwVkZ32jOYU/nGCIk2TNVR+O9lngBl2XM3xCOBfRDcbRhMK1gVCXO
 8NNUmFCytZJitKRmBv0p8Q4hkR+dEUEKmoUHM9Ft5i8xbISRnNig6NzFlxyNSWMcfAcd
 SJSUvp4zvkmML6as44vYVWi+jpw2vBM70I/ou0mayM8ShvwA4+wZ+IhzAo1NuUgAMsCF
 5gBQ==
X-Gm-Message-State: AOAM530HSYAYhM9QCKV5PG3Nz2wUm8h1Y6Faaq/WJK1oy9V9dhTjvl4A
 F7CzH+RZ3af5UfiIvmhd2/pgFTnNRJ0jCA==
X-Google-Smtp-Source: ABdhPJyqNxsgzEQyZDh+LMoEiI4YG5XSMS/AO5NO9Y8ycoOeYNrsKdh0h+UYUbDEvKj3t0InU7hMkQ==
X-Received: by 2002:a05:6402:48e:: with SMTP id
 k14mr3903077edv.212.1631377205061; 
 Sat, 11 Sep 2021 09:20:05 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id r22sm947953ejj.91.2021.09.11.09.20.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 09:20:04 -0700 (PDT)
To: Michael Fischer <mf@go-sys.de>, buildroot@busybox.net
References: <20210831073555.8157-1-mf@go-sys.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <8b046cf0-666d-7118-1d92-3b859cf5cbc6@mind.be>
Date: Sat, 11 Sep 2021 18:20:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210831073555.8157-1-mf@go-sys.de>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/gcc: bump version 11.x to 11.2.0
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 31/08/2021 09:35, Michael Fischer wrote:
> patch 0001: already applied upstream
> 
> Signed-off-by: Michael Fischer <mf@go-sys.de>

 Applied to master, thanks.

 Regards,
 Arnout

[snip]
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
