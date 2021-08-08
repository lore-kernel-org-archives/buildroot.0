Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77631C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 09:53:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BA8860FD8
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 09:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1BA8860FD8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE43C4041F;
	Sun,  8 Aug 2021 09:53:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7ISIbQh3XFpg; Sun,  8 Aug 2021 09:53:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12B5440415;
	Sun,  8 Aug 2021 09:53:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A763D1BF408
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 09:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1A6E60801
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 09:53:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ndiW_DZGAza6 for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 09:53:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1AA6B607FD
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 09:53:16 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id h9so2749561ejs.4
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 02:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=BLx39iAyURtYx61uxbgEU9iQONld5pbBCEWyk3941qQ=;
 b=CTKZyqLh4EP2RPpiqYWxl96n9yMIbzAGCqnzjCyRdmaThH7QONiReHfUjGoh699VNb
 f/tvyIW2fy3NQQNvTZqrlFkxwBPagPAKA5K4GvBbeVt9QRj5k94KDkvfutgdnfVeMXXm
 opBjq21zxbKiQlmiwpfxvVxiLV8xO455BYVortoj/6OSAnEXuGMOTWyaBGyr1CALOs7r
 O571HkjzNAQhChNtEj5yQqkGcU8NPiYZCfPO0g4dAZW0RHfOnTeDXh5iNNCXufrHzI5p
 ECabdEp+vgaWge5Al7Xt7z/VSuEtXjDSfad9WjlpGxKRBQR3SMEdsfOvhHLipkfJESRu
 o3ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=BLx39iAyURtYx61uxbgEU9iQONld5pbBCEWyk3941qQ=;
 b=gJQBnuiWz+9wEfBCCUtqk+kKadu1m1jfzeyfxbpg0cnpORTogy360ULZuvzyX6v7U/
 z+dLUiuKnoopd6SVtpTTn5TA7VZnPQN74RpnJykEVXJziqhf4MEF+f3eZLyKSISk/82Y
 FI5n5VWIXXsu15tpBpQlHkUtUP0hMVvVAqEwbchJsb+JBSQosspUYSsE3IzuaJJt40zN
 seVxfK5PVyzVGR+hp6oz6mI2gNS9UnbacYU4r4Jk73Yhd5buOT8a2Ycc0qRAzaJTAiHs
 meD7C85pcVqKjkoViCzU2Ll1Uopz9cZi7twTliK8L9Q2Dmo+87j02s/BCtGs6dQMBy9w
 lYMQ==
X-Gm-Message-State: AOAM531EZFukgzfBarZjkPn8p978oKRg5wPoKHMJ+rsG8dMm3fSdpqyY
 3LqOAWT8tWvESR1wjRUbUdbcHWpx03qdkA==
X-Google-Smtp-Source: ABdhPJz6XyymszElnlbpdoxVOAE60EpxOPBIYBsWqAQfrcUkUlGok5q6epX1UWpAwO5xeDcMyU2XgQ==
X-Received: by 2002:a17:906:7691:: with SMTP id
 o17mr362927ejm.485.1628416395171; 
 Sun, 08 Aug 2021 02:53:15 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id ck3sm6562204edb.80.2021.08.08.02.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 02:53:14 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mCfUY-0003YA-3B; Sun, 08 Aug 2021 11:53:14 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20210805173439.4172080-1-giulio.benetti@benettiengineering.com>
Date: Sun, 08 Aug 2021 11:53:14 +0200
In-Reply-To: <20210805173439.4172080-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Thu, 5 Aug 2021 19:34:39 +0200")
Message-ID: <87o8a8b6ut.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add Giulio Benetti to libfuse3
 package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > Add myself as libfuse3 package maintainer.
 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
