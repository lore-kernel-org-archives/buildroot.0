Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32722C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 17:53:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEC47611F0
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 17:53:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AEC47611F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A238607C8;
	Mon,  4 Oct 2021 17:53:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lDG2V6_8k2KO; Mon,  4 Oct 2021 17:53:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D08B56075A;
	Mon,  4 Oct 2021 17:53:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3DFB11BF308
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 17:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C6966075A
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 17:53:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yg7EIlmEGDSJ for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 17:53:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2969E6074B
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 17:53:43 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id r18so4919287wrg.6
 for <buildroot@buildroot.org>; Mon, 04 Oct 2021 10:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=cA3yetCD8m0Ng1lVb4NxWPgMjsEpgPfsO9DSwGhD1hs=;
 b=CPpT2BnuxZYnYPlq9Vu5ZEAYJ0uNSvWUdft7iTfn0ZYu2//7cwxUh37zpzsJrKynzI
 NV/GeBt6HBroHw7dBILINiBTLuvIQ6xlQPynBi4qkNGrez8olRiUuAGe+ginj/WC1D0d
 zB30kySvAgwBbKVI1eb+ARuGX4PYkeIiPMaeaAqnULzmP7wOUh7NYGxQZg3APk08edUn
 NeoUSANkmcC+zUyRDrIWVmbSHyrW/watj7o5YcJVjxj1Ani8hviIILIRUcnZ/8vcnFj3
 DTD+nDOKyh4Y85F8fvYo1W8hSFu7CvYNVlrkNYxJg2SdE1Lgxtyu6cwT8qfya9Zm0iTd
 Bc0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=cA3yetCD8m0Ng1lVb4NxWPgMjsEpgPfsO9DSwGhD1hs=;
 b=5zKk3aiLQG95kDYsUb1P9Km7pgjEeDTw492aMz7tn1PWLR+46zhbmLa9YtCdkpXmtd
 qUs0bNQyzRJbg1uSeLrgp2+v/OQxp1dDwJGw6gP1HyHzeraCJEunlneJOk+DUO3eiu+L
 L9dqt/yJP8VtPrUFO/3rm4ypZOJFguP93wpUceyoJ9Zth9ZFiyEqgk4Nk6CLs6/ICLvt
 XU0YfO9oljXkqqSKpAD29YO7542Jei2otetKAu4IB86OZVcM2r/5Bw7EWTNVfi7hLE7E
 SiGBvjaccHdZoIs/pC4CgJ07Yw2XplZtM7EYrSxg8QRqgzn1887/WnP7vei3Z8WJopIB
 Fw1Q==
X-Gm-Message-State: AOAM530HpC6JzuG/H08YeQVdDcpkip/+WUHF45wcfnIIohK76SnHFYP3
 3zJFW8K5i9poh+1NZpSO0opQDETMQ3I=
X-Google-Smtp-Source: ABdhPJz+WRZdVLyZfowQ4NBl3LZ6hB5uV0tYFCNLr6jGeIPv7D5fZAusYszP7rAV4w3KTC4tDeuRxg==
X-Received: by 2002:adf:b1c5:: with SMTP id r5mr4106726wra.357.1633370021317; 
 Mon, 04 Oct 2021 10:53:41 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id d7sm15203306wrh.13.2021.10.04.10.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 10:53:40 -0700 (PDT)
Date: Mon, 4 Oct 2021 19:53:38 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <YVs/ojRTzGIi7ix9@pevik>
References: <20210930190035.25090-1-petr.vorel@gmail.com>
 <20211003222323.001b6200@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211003222323.001b6200@windsurf>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/ltp-testsuite: bump version
 to 20210927
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

...
> > NOTE: would it be possible to get updated toolchains? I have to carry
> > downstream patch
> > 0001-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch (the only
> > motivation for me to fix it in kernel was to fix buildroot, but
> > buildroot does not take this fix in toolchain).

> Which toolchains ?

Hi Thomas,

Kernel headers in all musl versions
$ grep LINUX_VERSION_CODE br-test-pkg/*musl*/host/*/sysroot/usr/include/linux/version.h

* bootlin-x86-64-musl [1/4]: FAILED
* bootlin-armv7-musl [2/4]: FAILED
br-test-pkg/bootlin-armv7-musl/host/arm-buildroot-linux-musleabihf/sysroot/usr/include/linux/version.h:#define LINUX_VERSION_CODE 264682
br-test-pkg/bootlin-x86-64-musl/host/x86_64-buildroot-linux-musl/sysroot/usr/include/linux/version.h:#define LINUX_VERSION_CODE 264682
=> 4.9.234
current stable is 4.9.284
fix a85cbe6159ff ("uapi: move constants from <linux/kernel.h> to <linux/const.h>")
was backported as 834d8b96cd85 in v4.9.250.

* bootlin-riscv64-musl [3/4]: FAILED
br-test-pkg/bootlin-riscv64-musl/host/riscv64-buildroot-linux-musl/sysroot/usr/include/linux/version.h:#define LINUX_VERSION_CODE 328765
=> 5.4.61
current stable is 5.4.150
fix a85cbe6159ff ("uapi: move constants from <linux/kernel.h> to <linux/const.h>")
was backported as 376c3111413c in v5.4.99

* br-i386-pentium-mmx-musl [4/4]: OK
br-test-pkg/br-i386-pentium-mmx-musl/host/i586-buildroot-linux-musl/sysroot/usr/include/linux/version.h:#define LINUX_VERSION_CODE 264701
=> 4.9.253 => the only fixed version

> > changes v1->v2:
> > * nit: remove */5 from patch subject

> Except that you did not. So I did it when applying :-)

Thanks! I'm sorry, I forget to amend the commit before sending.

Kind regards,
Petr

> Applied to master, thanks!

> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
