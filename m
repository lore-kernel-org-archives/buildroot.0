Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FADC4332F
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 08:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3AA7840223;
	Sun,  6 Nov 2022 08:47:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AA7840223
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PJxfSvMV2oUy; Sun,  6 Nov 2022 08:47:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75E704013F;
	Sun,  6 Nov 2022 08:47:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75E704013F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B04731BF3E9
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 08:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98AFB4013F
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 08:47:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98AFB4013F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NlvNXg3EpKbX for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 08:47:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACFBE400BB
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ACFBE400BB
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 08:47:03 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id r12so12973356lfp.1
 for <buildroot@buildroot.org>; Sun, 06 Nov 2022 01:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tCWgTXku0pPBP1bMGmF5VP0dAh0m4OZejMC22/pJQYA=;
 b=dlJYY31KNC6Ip3sNIXwBcwGA8W7NHUgK/ZP4H9AAPjt5KkndDTx2BMMuNe+fFrtMxa
 z2EsH6WFTT4Bkla4u4+7Ycm9xvr63rNRWcwq3ZiDhs29nlRCJ6dHjsY+2F/OTnW//30F
 GStpKqWgRXl7hK0Rtq//cTUO3FH+QRl3GBgHK29Du92kVCMFmk4Y3xUsqQ6PxZC5YlX8
 OFnBHikIGb+w2Jf1WJffpR42SLTpZ6shnPdnc96gArB4X6lubeX8aCu92bj47ZFcXlke
 BFEIOgLZMd5Lanz+E3xY5ddFyRs+sHYxjqR69QyVj9XtWcuJfpSTgfQtioqvg5qJVWeG
 fwEQ==
X-Gm-Message-State: ACrzQf1Ff1FXWgjaVgegvSMZCHX6z/W9sW7tZoPn6D/JXTln9fmQR/se
 01As4xwncRdHcFyxSR6fgiqoApeuIuU=
X-Google-Smtp-Source: AMsMyM4/sz1/63A8wfoPAQYwoDHkYlQhU2vTlZ1MOXXQJn+W+tHYrsPgOACb5aOBK8W4FULABu2Vew==
X-Received: by 2002:ac2:5e9d:0:b0:4a0:5828:6cf8 with SMTP id
 b29-20020ac25e9d000000b004a058286cf8mr15081339lfq.567.1667724421162; 
 Sun, 06 Nov 2022 01:47:01 -0700 (PDT)
Received: from gimli ([2001:9b0:21f:cc00::af3])
 by smtp.gmail.com with ESMTPSA id
 c15-20020a056512074f00b0049476667228sm617798lfs.65.2022.11.06.01.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 01:47:00 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
In-Reply-To: <20221105184810.GO3918838@scaer>
References: <20221031174632.377586-1-troglobit@gmail.com>
 <20221031174632.377586-2-troglobit@gmail.com>
 <20221105184555.GM3918838@scaer> <20221105184810.GO3918838@scaer>
Date: Sun, 06 Nov 2022 09:47:00 +0100
Message-ID: <86bkpkjwqj.fsf@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=tCWgTXku0pPBP1bMGmF5VP0dAh0m4OZejMC22/pJQYA=;
 b=BpBrgJNVkU2+zOj/s4otwfnptyT8a0qJFoEGC6/x0zt9DPXyU1bgSWTToaOAIs8+b5
 75WrMP1HJ9eRyWqPIa1h3RQGRHbwm0zCmmdW+4yTa6YWhmmjuP4waiC23XZdV9j+1WMm
 sIjGfwttMHR2MZAchqpQswVzxI5VLoN7Sr18pJMso4Vary0Ob32aJfYFfAsLwy2CQ6Pc
 U8EUblV1MgREfpDJRTQ8b0PDEte17Xrfu78tHXvQV2gXS/O50gWdPdIVpIHTZ2VCg0w8
 nhnKGMBT+u7VIgzsefNNMl3JiSFFFxhmvrHC+CnCI4lEcl8c1UPmX5u3JWl9/rNsMtL6
 N5zQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BpBrgJNV
Subject: Re: [Buildroot] [PATCH 1/3] package/ssdp-responder: bump to version
 1.9
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Nov 05, 2022 at 19:48, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> On 2022-11-05 19:45 +0100, Yann E. MORIN spake thusly:
>> Applied to master, thanks.
> s/master/next/
> Also, sorry for the typo in your name in my previous reply... :-/

Absolutely no problem, thank you! <3

 /J
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
