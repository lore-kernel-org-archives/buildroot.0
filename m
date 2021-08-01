Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 216D1C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 04:58:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9C6661078
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 04:58:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B9C6661078
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=paral.in
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 783E9415B0;
	Sun,  1 Aug 2021 04:58:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cZM0flCEIrtO; Sun,  1 Aug 2021 04:58:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5D94415A8;
	Sun,  1 Aug 2021 04:58:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 054E71BF3CD
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 04:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00407402ED
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 04:58:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=paral-in.20150623.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y9NpjJMUH_YJ for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 04:58:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DAA2A402E8
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 04:58:29 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id x15so19845406oic.9
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 21:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral-in.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QYMET/HciGPlc3S9WqxJisWmkXItyhk9HWIEjhMbBNA=;
 b=NIzRgtCVfe47tZqPFukuweMiBC/ZDAmPHS4SFjQrc1RnKl9xjEMfJhTXIIUuY5ix0i
 SibiBkHciN0tLQR9CIp3w0tmfIXqskvebL5S8lebJu5p/pz1vN6sRVdwqLPzKYp/2XMp
 SWWCmmdLMM0DNOh2SlPCfIepLr2H+zf6BqIKFCTMpNOxK4kfjsHw0PEavFXYihXiFPTK
 d8wtnhX9MVk2vRNp0rzGtRRvohCActb7arFTQHUYhEhYBuabSul/wbFarRk/+47bDmhF
 ie7bBWWUvoQAl3s7G+ji5sb5JBlmehtCBEfONT8qQTBWQ2TtwKqHwd4rzxzZbft6Km9e
 K3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QYMET/HciGPlc3S9WqxJisWmkXItyhk9HWIEjhMbBNA=;
 b=NbI2RPXAlJWZ7YR5d5uLDY7LZbucirQUHBop6Z4C4nL4b0eSkPM6sOdYez1ssJeJbQ
 I3IVjuc7qJ+N7w0kGU4LY9UXele6c0Lk6ggcB5r4ruJx0pac4ST7cH8hNEc/xo9suRu4
 xX3YRJqPIchRoreCs2QLJnui/T7GElj0wALwHimBRpIe1O+eDel/1O6UJZt2B6lEhubf
 6hoc1Yr8CgRhqqSoqYyolO80rTmIl5qs7xTr5A7D1bTY6wGz4FdW1YRRmM88ywlBt09w
 AKA0/Ao0tYffsiZdrsO1iHS1iFTIyv1yATB+mTqfzJQ7uwYubgzcMWKgAHEXngJ3I1uE
 ZC9w==
X-Gm-Message-State: AOAM5321KpNs+/X1zv/8yVWnqPuiIP8bHS535eL/ZaWPAD0YjhVWgs33
 6+5S3Qx/eax2Ud+1MbhZhcpxD13bxCaDGQ==
X-Google-Smtp-Source: ABdhPJwN7VBDr7A02Rz1O9pUr3wP1FBaIaaJrRWC14wVoOCgUkkQWMgDXFpD92l0QLov6HGBxtcqLQ==
X-Received: by 2002:a05:6808:2208:: with SMTP id
 bd8mr845858oib.110.1627793908390; 
 Sat, 31 Jul 2021 21:58:28 -0700 (PDT)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com.
 [209.85.161.53])
 by smtp.gmail.com with ESMTPSA id t144sm1154717oih.57.2021.07.31.21.58.27
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 31 Jul 2021 21:58:27 -0700 (PDT)
Received: by mail-oo1-f53.google.com with SMTP id
 f33-20020a4a89240000b029027c19426fbeso1157763ooi.8
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 21:58:27 -0700 (PDT)
X-Received: by 2002:a4a:9cd7:: with SMTP id d23mr6799682ook.12.1627793907529; 
 Sat, 31 Jul 2021 21:58:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210801045636.2174812-1-christian@paral.in>
In-Reply-To: <20210801045636.2174812-1-christian@paral.in>
From: Christian Stewart <christian@paral.in>
Date: Sat, 31 Jul 2021 21:58:16 -0700
X-Gmail-Original-Message-ID: <CA+h8R2oEQ9c2sSx5=GDYuRu+hJozGEJ7Ygs1tfW4rMS6kmBdzA@mail.gmail.com>
Message-ID: <CA+h8R2oEQ9c2sSx5=GDYuRu+hJozGEJ7Ygs1tfW4rMS6kmBdzA@mail.gmail.com>
To: Buildroot Mailing List <buildroot@buildroot.org>
Subject: Re: [Buildroot] [PATCH 1/1] package/embiggen-disk: new package
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
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

All,

On Sat, Jul 31, 2021 at 9:56 PM Christian Stewart <christian@paral.in> wrote:
>
> embiggen-disk is a tool to automatically resize disks to fill available space.
>
> Patch submitted upstream: https://github.com/bradfitz/embiggen-disk/pull/13
>
> Adds support for /dev/mmcblk0pN type paths.

The following patch is meant to be marked [RFC]. I updated the
patchwork as such.

There are 1-2 spots with TODOs remaining before merge.

Submitting because this was an example case for Go hashes inconsistent
between machines.

Thanks & best regards,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
