Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 215F4C433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 13:27:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B648661167
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 13:27:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B648661167
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 823BF84A8A;
	Fri, 10 Sep 2021 13:27:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0TJcwkNRzbIN; Fri, 10 Sep 2021 13:27:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6E2D849A3;
	Fri, 10 Sep 2021 13:27:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B60021BF317
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 13:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B180140532
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 13:27:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pN72V6UYflcN for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 13:27:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6485740285
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 13:27:02 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id me10so4224003ejb.11
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 06:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=bfSnog+sEuuSSGZs0qyhNFSR7hTA/oSf/9I+ytdaPTU=;
 b=GTfrK68OFbh1EGUFewcEn8nHlQ7j2a9QSUlBJ02PgmG7IvrbZJhGASJPJJ4u6xTkcG
 pUkhpEI+/n/Edn0nAsnS0iZg23lJs8r1G7meFQjwSrGzkOE27YCv4/mSjV/0/W+vFVfr
 EZ9WoSVoxHC0CuquMvS0wwsSWFB3b/UUpnsyC6Y8TwJfqdCIrJZSfU00+Uhten0es0uZ
 caUGCwV0PMRNw3lb8Hs7PMD/BHk3bu0bUve74EO84de+BYNJ+Qj+N9Z/P2UPRWudb3XF
 PUJMVkjuwreIGOaepcrCg5NaxiQM15aQYubfqChmY65ekgsUAd0glP+oIX7KxwmL+FDQ
 O67Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=bfSnog+sEuuSSGZs0qyhNFSR7hTA/oSf/9I+ytdaPTU=;
 b=p6WfTafss6kHN0NLjFWQL7+pAWXDYghjr51v1Lsv/7tnPeCvNM3EZmYu1Lrk7+Z6GS
 JLEovMfvDxbSlAjp3tDksufKIlcLnga0VNjzqAV5//egNFbqV8ITeTR/yO277CMX75UP
 w5Hxg51v0ozr9ZXwMMaF9l4lzVKfmp//o+I6CgNR4FSIkHUz/hYybuwTj2fPkr74J2bW
 CTmmdzDefw1IBnYtl3Q2Z3NFsrdRzTTOZtPSrjozSvRxbaS6lKgWEJf37UkAooXdF1lh
 HvmC+kBa8SgqYyGuRqr8ThwmOcH3aIDpnrcwtyPFLyUmPb6K54vSMXzkTfycFVSpVuu8
 mtGw==
X-Gm-Message-State: AOAM532PrNFTe38u0+Ka1PU48eC2X7HKUj97J9hxfqKPxC15BuDdircw
 16bPYrFWQK0YuED6DtkN7Xk=
X-Google-Smtp-Source: ABdhPJxu/gnSJ6iLC+TKgsavPYVCOePY9UQzWQfuVelZ3x/Qo+epi5NehcX5lQvYZOjNVKWp1rf1JA==
X-Received: by 2002:a17:907:d09:: with SMTP id
 gn9mr9426763ejc.447.1631280420608; 
 Fri, 10 Sep 2021 06:27:00 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 v1sm2804425edq.0.2021.09.10.06.26.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 06:26:59 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mOgYV-0002oN-22; Fri, 10 Sep 2021 15:26:59 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Christian Stewart <christian@paral.in>
References: <20210910104545.518321-1-christian@paral.in>
Date: Fri, 10 Sep 2021 15:26:59 +0200
In-Reply-To: <20210910104545.518321-1-christian@paral.in> (Christian Stewart's
 message of "Fri, 10 Sep 2021 03:45:45 -0700")
Message-ID: <87mtok8st8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/go: security bump version to
 1.16.8
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Anisse Astier <anisse@astier.eu>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > go1.16.8 (released 2021-09-09) includes a security fix to the archive/zip
 > package, as well as bug fixes to the archive/zip, go/internal/gccgoimporter,
 > html/template, net/http, and runtime/pprof packages.

 > https://golang.org/doc/devel/release#go1.16.minor

 > Signed-off-by: Christian Stewart <christian@paral.in>

Committed to 2021.08.x and 2021.05.x, thanks. I guess we'll need to move
2021.02.x to 1.16.x as well?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
