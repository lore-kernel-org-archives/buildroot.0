Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E34EFC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 14:27:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7EA760BD3
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 14:27:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A7EA760BD3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69C7E404DD;
	Tue,  3 Aug 2021 14:27:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0HgzrzGUS6QC; Tue,  3 Aug 2021 14:27:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9111404BC;
	Tue,  3 Aug 2021 14:27:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7FE781BF35A
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 14:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F46283807
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 14:27:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ysc4rvGWbcEe for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 14:27:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EBD948380E
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 14:27:07 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 e25-20020a05600c4b99b0290253418ba0fbso2261519wmp.1
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 07:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=NAxdiHikX5vA66VBGqGXTD9/WRybuESwxxx7Y7egglk=;
 b=LCXkVRh5lDZVkK7Lg6we1jX9AGw0twGgdh5TtTWeWlLXwEbaLh5a4giqhQWiYK+0dt
 JPzksGCsbxV1XIUDphSIrAJPADE5VdQxbe4nh9QVM5UdWS/1jZXMeWFE+jLoN3ovy0DM
 umPH8wR02LAeId5nt3fwjzevrzAZ6uDZLfcDxNMsgIkdOSQDPrr9AD3aDZYXDla8RuvF
 xLG6UH9RDIXZN5giwTnA7Ue208aql8D8C9LaqLTy5arD74dXlhrAn2HVHCp7559bZ2jC
 ZTsGbg8g748sbYgqq2+An6JZowPYqwT2C03HKSTTSUg35GetjC1XqeDHsSedmDsKgKFM
 Pehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=NAxdiHikX5vA66VBGqGXTD9/WRybuESwxxx7Y7egglk=;
 b=Y27WuRrFOFf/gx6inu1Ug0R66JczrBmrWLQPlfWket4im1tbIWqPbyMMkWF0dC9LBl
 iVu7HnWzy8/f1maDeSleguzhltEM4y8P74K5190+5wK8/pNX/6g4hum5k+9W8wBNDV2Z
 dPQbfJYTeIvi3Rch5z88QU7L30q0vsO0D7zRea3b3A32/PYBomVHYePuTYAQml2P1f5/
 zU1HFnBs8w1Gwfjf4IvLfd6hQPWzf+BUrKpl5aVlS9i1kBevimztGzT9PslrYYGu/b36
 4RN1Ix7UpgtyvwNsIhyn5YmMr9MVBrWAlhZxceqZuECenuDAZ8BUvVtD2yEYVNJ4kSns
 bD4A==
X-Gm-Message-State: AOAM530EFkM0jP/4REK2Ef5N0ZoWi21cSxIpUuo7UOtepkATujCHHKv4
 2Dzh0cZ47SBzkCg+bSRG2GyZZfqrQxHkfg==
X-Google-Smtp-Source: ABdhPJzQPcmbB8FbrMphalMWkK0VfFi/b8SS37l0xM5AeQb1Som0YXiw4Q+MaFyLr07rgjoArp2pIw==
X-Received: by 2002:a05:600c:2242:: with SMTP id
 a2mr22498837wmm.180.1628000826048; 
 Tue, 03 Aug 2021 07:27:06 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id x9sm2784351wmj.41.2021.08.03.07.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 07:27:05 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mAvNo-0001qr-38; Tue, 03 Aug 2021 16:27:04 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210707192348.3918095-1-fontaine.fabrice@gmail.com>
Date: Tue, 03 Aug 2021 16:27:04 +0200
In-Reply-To: <20210707192348.3918095-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 7 Jul 2021 21:23:48 +0200")
Message-ID: <877dh2y56v.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/mbedtls: security bump to
 version 2.16.11
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > https://tls.mbed.org/tech-updates/security-advisories/mbedtls-security-advisory-2021-07-1
 > https://tls.mbed.org/tech-updates/security-advisories/mbedtls-security-advisory-2021-07-2

 > https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.11

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
