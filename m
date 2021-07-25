Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E889C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:50:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B1C16056B
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:50:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B1C16056B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1284E82A26;
	Sun, 25 Jul 2021 21:50:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4RJXGjeEiIc1; Sun, 25 Jul 2021 21:50:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B3CE82909;
	Sun, 25 Jul 2021 21:50:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 01E481BF312
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF8DF605C3
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:50:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MK_tfziccS8t for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 21:50:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3C3FC605B3
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 21:50:52 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id q13so7998047edr.6
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 14:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=0bfJVbg2Qs5vM4X51xGW1qwi5JBkZPmHMeRnKd0ORq4=;
 b=BQ4gEra5z55D5E0H6igMWG+Ab67U7x68f1C1yPT1k44NwV6FGaqgxRqV/vgOqdk0ph
 9h+n8ZlhKstvIWEZKoIYdaB+XTSFwPAJEifckHajXyynwTWQqI9umfdq79MNzFvAslMz
 ZdKHotVeE1Ybx6i/26PxL+jeNz3JwRfOOQY0AlZUDRgkUX1/NM+t7vz3yl2jFQhfL+Bg
 uxGOjeyjl8In2AXhvepg61EV0xfZJGbUuYDoLNhI+txkWKSlhCoNQr+eBkTXrKcxgo0d
 cKqGCc9m4/vUQ2PLYh9wX6XJ4aNjluAqgmoaB6RtuKup4wDp9EjU/lLd/G60Xauh3KAy
 IeSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=0bfJVbg2Qs5vM4X51xGW1qwi5JBkZPmHMeRnKd0ORq4=;
 b=MdYI2c2WkCoEhXASh+SxPrJTcpU1zGB8q++qWzV7u+4J5KTy7ZdHaDE9sc0JxXJhpq
 onMa5SoWirR9OgQFc4xc2O58XQbOMtQ6nD0pfW9PVD+rGstvayVxtPmmXQCzmbz4HX5y
 Vt/We0rgMr4/z5I9OQeDNEQQPkLA5shoE/yaw+D5szW3Rf8nwSJQ30cScH5URfdC2Gcz
 mMRAjkCa1U08XuEp9N1mHsY6evhoXa13eV75k+8j3Misdf3MvUCBvbBVpeHDDlBaLCda
 I/A0iCORHobXhvgqAwcn8VUslMLYB0EB7EXWpE9rrw/UKcVpTv+T1W8BzLGho5guS5bH
 4cXQ==
X-Gm-Message-State: AOAM5332mAlEluXWWE8tBZ/E1rBgqYEh2Kg5TeTxi31V6toe7Hqb0wmw
 sw8hEYd5EsVRsTEzQE0daec=
X-Google-Smtp-Source: ABdhPJwFmKGQx+bv18t7tx5OXGSfiBsPIQX126GIylI3RDi1xynaPS2gz1hiBHbpZqUzD5AVX1C8Tg==
X-Received: by 2002:a05:6402:3507:: with SMTP id
 b7mr18301667edd.254.1627249850471; 
 Sun, 25 Jul 2021 14:50:50 -0700 (PDT)
Received: from pevik (gw.ms-free.net. [95.85.240.250])
 by smtp.gmail.com with ESMTPSA id b5sm12144705ejq.56.2021.07.25.14.50.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 14:50:50 -0700 (PDT)
Date: Sun, 25 Jul 2021 23:50:48 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <YP3cuLCUIfQmVq6j@pevik>
References: <20210725213942.1622634-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210725213942.1622634-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/nfs-utils: add dynamic library
 comment for NFSv4/NFSv4.1
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi James,

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
