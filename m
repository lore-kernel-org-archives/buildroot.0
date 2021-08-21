Return-Path: <SRS0=Fkjy=NM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87E13C4338F
	for <buildroot@archiver.kernel.org>; Sat, 21 Aug 2021 17:30:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C3EE6103D
	for <buildroot@archiver.kernel.org>; Sat, 21 Aug 2021 17:30:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C3EE6103D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E205F606B4;
	Sat, 21 Aug 2021 17:30:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jwb4VZypbAvw; Sat, 21 Aug 2021 17:30:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D40360633;
	Sat, 21 Aug 2021 17:30:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9E0131BF299
 for <buildroot@lists.busybox.net>; Sat, 21 Aug 2021 17:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DD9640331
 for <buildroot@lists.busybox.net>; Sat, 21 Aug 2021 17:30:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UVKtmrFAhYEO for <buildroot@lists.busybox.net>;
 Sat, 21 Aug 2021 17:30:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4CC274031D
 for <buildroot@buildroot.org>; Sat, 21 Aug 2021 17:30:50 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id k5so27700069lfu.4
 for <buildroot@buildroot.org>; Sat, 21 Aug 2021 10:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=9BHeIwkg/DVK7kGzJgneeVCq7bouVgQYR8GgYjTnCQs=;
 b=oe1gvB9moRskmIwWJlWS6JMwgocHayHwBEX4EVqBtXkkDNSnGy2GaKUtXXA2IBGV9A
 JEteqwumJbkLJQJtl0s1gzcuWlslDC+UGnfrwi7tJejmAlPx3LG/2jByMVucIZGCZl7/
 mENfjEpgXWa+Cg39Eu2GTarlBM217uUCQk4WbX5NWJZZ0mdSg2Tz7Pqym6TbTkM3ycns
 fuAcvO6MXOJC62j0L8lrG+2QHLcRgKpTfGxYxswbMntfXWvt8G70HAZQc9SpBumk8Xlt
 2vSBZIIJV+8zxIv7xNKd/Fp1Qz4Ei6oGYeMkb7dfZJP3O6epTBZg7ZXrxCX4p7e4EfO9
 SngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=9BHeIwkg/DVK7kGzJgneeVCq7bouVgQYR8GgYjTnCQs=;
 b=aZnJxGeQ0ck0pDsQaUy/F7u3hFipPoaNF6qm5tOU3EbRG2Pxk7t4ah8a0IklOKky3i
 CyurIHR3dS/KGd/vADw/wL5J74J1u562NlhvG2vtxadYefJC0bbIPUabky6Al7/F9C5/
 PLSk9eM8YxYYjaFRmZpOnvXAjgIVNYZI+KRL5eAfqsLpxwggBM3R3oWqYZ31TwfWU+qb
 cNgJEKiVQ8PnGBeLy26mvmdO3KGHSXJFzEYelWYdzjijffOyzBbKLRmHzuubzHiq4WxB
 oMBix9PLJpIkCrYKB5GjM0jeYklnTjkxfBaFRqBWYcASFtOfSfo1UFNiUIPEPIIdcICk
 Olwg==
X-Gm-Message-State: AOAM531N5JtTp35L65Ap+EFD0uTkHgD+BtFpJvDGYPMFSj0s830pe9qu
 LX/DbWlOTLteK3FRk+5eDTA=
X-Google-Smtp-Source: ABdhPJxE9OKQqrLoVGx9Sw28Po+/ycdGELoWST4/cktKawcLMsQ+eF1g5lzUnNh1WMmG74Hdg0t1lw==
X-Received: by 2002:a19:48cc:: with SMTP id
 v195mr16251820lfa.335.1629567048116; 
 Sat, 21 Aug 2021 10:30:48 -0700 (PDT)
Received: from wbg (h-155-4-221-58.NA.cust.bahnhof.se. [155.4.221.58])
 by smtp.gmail.com with ESMTPSA id i30sm860778ljb.48.2021.08.21.10.30.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 10:30:47 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20210820233226.677ff169@windsurf>
References: <20210820054419.439633-1-troglobit@gmail.com>
 <20210820233226.677ff169@windsurf>
Date: Sat, 21 Aug 2021 19:30:46 +0200
Message-ID: <87y28upuwp.fsf@gmail.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/smcroute: bump version to v2.5.0
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>


Hi Thomas!

On Fri, Aug 20, 2021 at 23:32, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> On Fri, 20 Aug 2021 07:44:19 +0200 Joachim Wiberg <troglobit@gmail.com> wrote:
>> -SMCROUTE_MAKE_ENV = $(TARGET_CONFIGURE_OPTS)
>> +SMCROUTE_CONF_OPTS = --enable-mrdisc CFLAGS=-std=gnu99
> Thanks for the update. However, passing CFLAGS=-std=gnu99 is not
> correct, as it means other Buildroot CFLAGS are no longer passed.

Ouch, that's obviously not what I intended.  Sorry about that,
and thank you for taking the time to review!

> Instead, it should be:
> SMCROUTE_CONF_ENV = CFLAGS="$(TARGET_CFLAGS -std=gnu99"
> could you see if that works for you, and send an updated version?

Thanks, it was a dirty hack.  I'm going to do a new release upstream
instead, but I'll keep this for next time I run into something simiar.

Also, do you think it would be OK to add an init start script and add
the systemd unit file shipped with SMCRoute?  I belive most users would
appreciate an easy way to start the daemon.  They don't need any .conf
file set up, and we can have everything passive by default.


Best regards
 /Joachim
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
