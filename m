Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD46AC4338F
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 20:11:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F0B5611BF
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 20:11:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6F0B5611BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E352C834F1;
	Fri,  6 Aug 2021 20:11:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s3VZtTukhUee; Fri,  6 Aug 2021 20:11:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19E8183BF9;
	Fri,  6 Aug 2021 20:11:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 53F7A1BF3AF
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 20:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43A3B4059F
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 20:11:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BYcrFbfnpeTP for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 20:11:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 70B3F40538
 for <buildroot@buildroot.org>; Fri,  6 Aug 2021 20:11:13 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id go31so16946678ejc.6
 for <buildroot@buildroot.org>; Fri, 06 Aug 2021 13:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=pz0OZ5Mi/OSmtiQqphYtovImTyRWx2EU5lMLSfKLMzE=;
 b=Lf5MV7rFzkpwKrgGikru/fjDemGfR50AdaaCoWgVzAAkbQ53XvwsuMptuJ5s2+8w7u
 JVG7F6bSUX5azG1d4f9lg8RBawh2dv2HA1vcyutNWgWGV2+ER3OPBlp3O1zCUtZTW3Vj
 ZJdzViyxFF7vl7Avq2NLZvtmU950qX59QVV/5xMa6XZ4XlI/khWvMWvbk0VWZHqGbTT/
 MyVDgOsvIkbcjSQNsBtykNRTAgjGfxYWL7liRuyQoKikecljxqjfoxSjg4E7ixLAU7aY
 yRHvLqTdnutQ0gZM0EYqj2ICU27wPBhZ3HPoHnwp+RT8TrtUOoILvxB+5R3yuc5Af79C
 gixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=pz0OZ5Mi/OSmtiQqphYtovImTyRWx2EU5lMLSfKLMzE=;
 b=mhn5qrZdJPds5YVz3yBSdvkC0w8xUzvmNvgFjBjix9CmXEgsAaO8XJA7xFg5DRoAO7
 9g4VrAoSTbh7p4dTQPGevRep2lWqbSxQgHTCDzXX76QjoGy79xUM48J0Vn4mkOX9Ix86
 s2RMKp9bXBenQ0Yxq5lUUmQnEPcJ9datCa+2Dg1yiQy5vUR+WEYkkUtglFrNoqMl/+Mx
 nThny917Daz95uGrMScrhz8oki/4fIceF6tZ1sgkEl9uNO55F6QS0xri+esemb+0RkhF
 /6zmS3EPOhQEDrSlucQiYmE1BXiJP+FOIZaMAsPiIlYiO/pg9QdYQYxpuhLPG+WZj0eK
 qCBQ==
X-Gm-Message-State: AOAM531gJtgtZinOUp8Jy3IC7k9LrV1grZBF6RJArEkN7ddxz/pZccmi
 /nxSbDmPZkicpQoqVYQ8Ry0=
X-Google-Smtp-Source: ABdhPJwJ8xOU5ge4cDINnSxyBockNowBzt12XLI+IdbFgvxoPl2D5D78l4S3fX7ee7yCyiyPspTbaw==
X-Received: by 2002:a17:906:1e42:: with SMTP id
 i2mr11573697ejj.76.1628280671687; 
 Fri, 06 Aug 2021 13:11:11 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id ca4sm3173362ejb.1.2021.08.06.13.11.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 13:11:10 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mC6BR-0007TN-Qt; Fri, 06 Aug 2021 22:11:09 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210726212334.B7EAE89049@busybox.osuosl.org>
Date: Fri, 06 Aug 2021 22:11:09 +0200
In-Reply-To: <20210726212334.B7EAE89049@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Mon, 26 Jul 2021 23:57:45 +0200")
Message-ID: <874kc2ibaa.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/htop: fix sources location
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

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit:
 > https://git.buildroot.net/buildroot/commit/?id=7332bc6eb092a18c506e614fc950c5b697ba1114
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Change sources location from bintray to github since bintray doesn't
 > work anymore.
 > Use commit hash for version instead of git tag to avoid breaking
 > existing source caches.

 > Signed-off-by: Daniil Stas <daniil.stas@posteo.net>
 > Cc: Baruch Siach <baruch@tkos.co.il>
 > Cc: Yann E. MORIN <yann.morin.1998@free.fr>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
