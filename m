Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D540FA373D
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 07:19:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E4DD80C06;
	Tue,  1 Nov 2022 07:19:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E4DD80C06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mRwjERh8FrOD; Tue,  1 Nov 2022 07:19:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EFC280BF8;
	Tue,  1 Nov 2022 07:19:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EFC280BF8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7C2CE1BF2BE
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 07:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56551400BB
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 07:18:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56551400BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ewi-ivV_Hm_T for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 07:18:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8747D400B8
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8747D400B8
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 07:18:57 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id d6so22473466lfs.10
 for <buildroot@buildroot.org>; Tue, 01 Nov 2022 00:18:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KVX9pnHfgQCakhwjY3ltI31onJt6nPthbwJKGkouYho=;
 b=UtIsf4ndILEgaJ71o144yB5ONuGuWCOHbh+u/g2SlXFxSr9n35pY00qPGLRqx66d8B
 KjCF/BnAt2VHcJylR0bNh67kWoGuIOjlexc9d4vH0KJRBO038tghAyXRuojyKLa1YwNE
 CS5P9n4mAV/UlmMPRLfoOaFTdfbBr+hEDfFDPwTWlVJbKVT+/edskp6uY1VaSj6eWp+W
 iPo6qf8aAr7T/BtcoOrUNyTFeqSh1TwgoLhLMx0YUA5Zc984PrueWDVxtSM5wFwy/oQ7
 5Ts76VpMUYQP2iG4mFe40MIiBXD68stiSgUkwJOMjTtW6AjFVLsTxWniQd+3TBqHsQ1P
 O8Fw==
X-Gm-Message-State: ACrzQf39lXO1xpiz+a0PLLUJd3ux7cnv2jd7KZiKfgPPy4e59JlgM6XC
 nm7zhOgTjvLSblnznPdFgMjqq0t00F+2EA==
X-Google-Smtp-Source: AMsMyM73q7qIFPzK6kAxVCC3XAoimTsLMPBFhP6kEnFQwtCxTBNOjLUxo8Awv8Z2FMDnsdvqSpz4Kw==
X-Received: by 2002:a05:6512:1196:b0:4a2:4ddb:8415 with SMTP id
 g22-20020a056512119600b004a24ddb8415mr7082477lfr.518.1667287134917; 
 Tue, 01 Nov 2022 00:18:54 -0700 (PDT)
Received: from luthien ([98.128.186.104]) by smtp.gmail.com with ESMTPSA id
 7-20020ac25f07000000b004a050ddc4ecsm1571209lfq.125.2022.11.01.00.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 00:18:54 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20221031214739.6b258cb3@windsurf>
References: <20221031174632.377586-1-troglobit@gmail.com>
 <20221031174632.377586-2-troglobit@gmail.com>
 <20221031214739.6b258cb3@windsurf>
Date: Tue, 01 Nov 2022 08:18:53 +0100
Message-ID: <875yfzf8gy.fsf@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=KVX9pnHfgQCakhwjY3ltI31onJt6nPthbwJKGkouYho=;
 b=q6Lfio9HYNKAU3jdyhBOWCFABIOLAEFnznBzxTtvpoe9smBBFAAR4qA9lAChVRp+8U
 kp0tM/FBconrorFxv/s8v2P5OxNKFJ+o8j7PTxK+XbuMIAcglrvw5tRECMxECYPkzG+x
 YWYgd/Q0qpAPG/XvBG1H/CoLmLGqo8PlWNA/g6rOFE/SUIlNP0JItc0OKz7hgHJsPF8m
 x/0811SbFv/y2YuOg+vDWUxy7mN9MYiwjxhIsjEtMW1sIe86VJlk5pcZ7cyGkc7GnWQv
 1wN/s/SY9IphKWQDnhem2aydDd4tOOrjxzI2925Ct1dFbWWbJBqVb6YtN3acUuqjjP8g
 JjrA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=q6Lfio9H
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


Hi Thomas!

On Mon, Oct 31, 2022 at 21:47, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> On Mon, 31 Oct 2022 18:46:30 +0100
> Joachim Wiberg <troglobit@gmail.com> wrote:
>> Changes:
>>  - Update copyright years (affects LICENSE file hash)
      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> -sha256  e17dc0bc91bf499d8cca5e016c22c6d2a4770e3cc1a43756a7973375a83ddb90  LICENSE
>> +sha256  68d6fdc22e337f725fe719bf9ae6d92b1d8d0ca4cff8219b303ab76706670a8d  LICENSE
> The hash of the license file is changed, this should be explained in
> the commit log (what are the changes, do they require changing the
> license information in the .mk file).

I tried to be as clear as possible about this, even when I did the
release upstream.  Maybe I should have been extra clear somehow?

> Silently changing the license file hashes defeats the entire purpose of
> having hashes for license files, which is precisely to carefully verify
> what has changed in the license file.

Yes, I fully understand.


Best regards
 /Joachim
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
