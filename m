Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC4FC6FD19
	for <buildroot@archiver.kernel.org>; Mon,  6 Mar 2023 17:31:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F51A41684;
	Mon,  6 Mar 2023 17:31:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F51A41684
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id erUrEnJfE6pM; Mon,  6 Mar 2023 17:30:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B987B41619;
	Mon,  6 Mar 2023 17:30:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B987B41619
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B0A361BF296
 for <buildroot@lists.busybox.net>; Mon,  6 Mar 2023 17:30:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96423415E3
 for <buildroot@lists.busybox.net>; Mon,  6 Mar 2023 17:30:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96423415E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q1ggtNvm8-HV for <buildroot@lists.busybox.net>;
 Mon,  6 Mar 2023 17:30:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC3B841619
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC3B841619
 for <buildroot@buildroot.org>; Mon,  6 Mar 2023 17:30:55 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id l13so11425446qtv.3
 for <buildroot@buildroot.org>; Mon, 06 Mar 2023 09:30:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678123854;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aqqIlG2ZYP9RNQ20ki0sHpXJS7V8vUNtEIR0MFmNiiY=;
 b=seM9FC15tp1NPRAcD0YKYlpMKsblkOyclFnPJunw8cFjIlIq+qpm/pmIBKh24Tu65A
 btO1RVLcVz3jxQ/FdYTofc/T7sixjkFDmhvGn+8i6wfUgiKMD7h14steQ8pX3z6YbMca
 DNMjpNPgYZjn/DPXaOrbdpl3lcNX6L78B8qQFaNCc3/FyRBaWMyjoxyiUxqxF/B8RUNW
 OlSuX8G5EIdBNht9qtfjkjHvjYAA/r0honai5g9iNgCMKjyVUrFVKNM3LuGhtSWkenH0
 qLgzXXt0rm+CZUL/LodBb1j8VttOc4lOE+aT0S8azldvF1jaWPG/sUbRQWXNQSamOcKe
 VgdQ==
X-Gm-Message-State: AO0yUKX01H6fBCkhWjY5mK3PJQPKiYAmmAp6XUVJXtSjNK68U5VjB5JI
 kjfG0XK2/2kSeMT32Pu/cOA=
X-Google-Smtp-Source: AK7set+HWyT/tbPumytmfjBwxqYw+IZ5lh7Ow4QypHInofjoXM/J3K3vF78ZhuwEuQkM5j4T2Cp9YQ==
X-Received: by 2002:a05:622a:14c6:b0:3bf:c04a:8d47 with SMTP id
 u6-20020a05622a14c600b003bfc04a8d47mr15760753qtx.18.1678123854520; 
 Mon, 06 Mar 2023 09:30:54 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 g66-20020a37b645000000b00743049c2b15sm7829274qkf.66.2023.03.06.09.30.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 09:30:53 -0800 (PST)
Message-ID: <3fd8ea5a-d302-975c-b632-011ef6b26ccf@gmail.com>
Date: Mon, 6 Mar 2023 09:30:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Vincent Fazio <vfazio@xes-inc.com>, buildroot@buildroot.org
References: <20230306134528.1198076-1-vfazio@xes-inc.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230306134528.1198076-1-vfazio@xes-inc.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678123854;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aqqIlG2ZYP9RNQ20ki0sHpXJS7V8vUNtEIR0MFmNiiY=;
 b=B8cp+2q4TjbgUa3HGfO59VRPDb1JhlRgD7G3nkPuAdjLFT2EcGhFjFdNS4DJC2LN/T
 KYduITB+IvajP8BG22y58bSwaOIulJF5Auoctr/BpLnq/LQvUyFOTjQ0ODy47mG10NL/
 t/5mrZxZdndhZfglTa7Vigygimb2J+JH94OUS28Qk3CIPjicN9W7BcWVQsIrIPPhK0LK
 x0o4xPSekAvaXxNw4YqIHciG99E1jPfqWnKDOIx5pSVtdH48NduY+LW1NOGCLmPjHzqd
 Wm0aXYCshff1KzQL5Q1BAJutKBYY0eiwrixFISao2eMankRKxAjPSzSgRIjj5iU5CtCO
 5DOQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=B8cp+2q4
Subject: Re: [Buildroot] [PATCH 1/1] package/ethtool: bump to version 6.2
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

On 3/6/23 05:45, Vincent Fazio wrote:
> Drop our patches as they are included in the new version.
> 
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

Thanks Vincent!
-- 
Florian

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
