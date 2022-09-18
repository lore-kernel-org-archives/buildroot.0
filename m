Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D85C6FA82
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 21:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AF2F83E7E;
	Sun, 18 Sep 2022 21:04:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AF2F83E7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mPIDA0mTVAe9; Sun, 18 Sep 2022 21:04:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4105B83E75;
	Sun, 18 Sep 2022 21:04:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4105B83E75
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 093721BF3C4
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 21:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7DB060B2C
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 21:04:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7DB060B2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MkwnVKYcPayW for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 21:04:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA2C060AE6
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA2C060AE6
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 21:04:23 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id r18so60354115eja.11
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 14:04:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=b5BNCcKhO9Ta5LM7VwBY0lyw/HKBy7cLZ7+1gEE7kEQ=;
 b=umQEySOzz4me60N/frN7mZ4wauefYobpBT7tAOQeQy/xSTrxHq/nVq7eJXNjhquHUQ
 D9MAa23n4JcJ42ptaZvBimRbYtlyuLd0j77+iWfFeoa4KksnDy4GHbNW5JLqLQNlIlKw
 /PyTYQs6LLIPeG2+HINAs7xtMUHdvtKcMYfWYGUMuLQSvDQsuTzWOMOVYuS0bHD9BYof
 dLB+IvQvqn+iLZI1PujbfMf5XSqQnPoeP+lzccLo44okr0YfPbTYkryRFkKIvwaEdBFW
 G4q5cwU3DN3qXxo68hy4At8VK6TIOzhg19SZOvmeP7ZEBAvAQ+SpS8EdxofqCBHCf60i
 XlXg==
X-Gm-Message-State: ACrzQf36UhxKDQRocXHNvnf5XHBNYv/bjxv+m7S+VFNxHtok0wRGYIr0
 BOBkm4F1y0Icp1ODsBefPs6SvlF+dc4p1LeO
X-Google-Smtp-Source: AMsMyM7GUEyEp/SxoCAWwPAilh9MoV3WrJnzx3M1W4AWRhI6U0+GZFRQKNeTqY1lV0srBgL4N33LhA==
X-Received: by 2002:a17:907:9482:b0:780:ed1f:8d40 with SMTP id
 dm2-20020a170907948200b00780ed1f8d40mr5573144ejc.745.1663535061835; 
 Sun, 18 Sep 2022 14:04:21 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com.
 [209.85.218.52]) by smtp.gmail.com with ESMTPSA id
 hw19-20020a170907a0d300b0078167cb4536sm101494ejc.118.2022.09.18.14.04.20
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 14:04:20 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a26so31633561ejc.4
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 14:04:20 -0700 (PDT)
X-Received: by 2002:a17:907:760d:b0:77b:1d8d:7700 with SMTP id
 jx13-20020a170907760d00b0077b1d8d7700mr10299543ejc.195.1663535060490; Sun, 18
 Sep 2022 14:04:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220821050119.578342-1-christian@paral.in>
In-Reply-To: <20220821050119.578342-1-christian@paral.in>
Date: Sun, 18 Sep 2022 14:04:08 -0700
X-Gmail-Original-Message-ID: <CA+h8R2or7KY0dFzJFV-zbdx8wjhu6r=9YGNG1PLvPpoth27gTA@mail.gmail.com>
Message-ID: <CA+h8R2or7KY0dFzJFV-zbdx8wjhu6r=9YGNG1PLvPpoth27gTA@mail.gmail.com>
To: Christian Stewart <christian@paral.in>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=b5BNCcKhO9Ta5LM7VwBY0lyw/HKBy7cLZ7+1gEE7kEQ=;
 b=hW41OFMzqPkEDXktTubwLo8+B1OFDHMe8IMcM7dh90PTwPFZ5G8E8FdvEcZ99mJ2n6
 jfTcdBtTgzcSYMTzgZ+ngg8KCsb1ZRXHMTAlZlvOMq4hUGqbyz/KS1nQmJCxd/nIllJc
 FRp+CMHcGOh7wqY8iKJIARJ1n2ONXhVmrlX80F0bXqp1w15lQYSKbx5BH0Jy1thx0F0Y
 b5jcftbGw/8PDf4GfMoRMUR5jMvwFQr4g2woAcH/dxi1R0SzUbCIO+MkXcJdg05JN3RY
 DKfcAidtcFpv9D0Mi/QHT/j1WSGEsAgAvcKBkU0Tynaft3nd8ohy5LCMBmfUU+j6cA41
 ioqA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=hW41OFMz
Subject: Re: [Buildroot] [PATCH v1 1/1] package/conmon: new package
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi All,

On Sat, Aug 20, 2022 at 10:01 PM Christian Stewart <christian@paral.in> wrote:
>
> Conmon is an OCI container runtime monitor.
>
> https://github.com/containers/conmon
>
> Dependency of podman.
>
> Signed-off-by: Christian Stewart <christian@paral.in>

This package requires a dependency on host-pkgconf and libglib2

I will include this in the next revision.

Best regards,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
