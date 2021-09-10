Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CBDBC433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 11:20:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A49FF61100
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 11:20:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A49FF61100
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7442C60BD7;
	Fri, 10 Sep 2021 11:20:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dVEsUVgp7Enz; Fri, 10 Sep 2021 11:20:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E60A660BB8;
	Fri, 10 Sep 2021 11:20:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 40E3A1BF23C
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 11:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FDAD84998
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 11:20:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M0eGm20fiAt1 for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 11:20:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 93CE384996
 for <buildroot@busybox.net>; Fri, 10 Sep 2021 11:20:51 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id g21so1973770edw.4
 for <buildroot@busybox.net>; Fri, 10 Sep 2021 04:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=8138Vje6StpWA5KQDogoOdVCZugK3Dykh8gSjaAAZHY=;
 b=c+oDuZhsL/P/sWt0EoOSa8jDn/Dn2Rp7xLlIhf5PVy+zmKUIto7cgLbQhbw86gyU1s
 605KlH2g+ji8QySPdax1vWTTg57DP3FCT22o/VJAY+uzdk8PD8c75vTAkAbbUFpWlR/4
 dD1RNodf3UeIDlIgS6LW1iGUr+lMQQs71gFu9FtvYJ3jFIL6+IXHDsrxcKyDQp8uLJzu
 jX+EhnCh1Xj4tvHXjVO1aiENVPoa/0CR2UWzXeFQ+oPsh+lVuyCR5vuXgsKWMhxMGULK
 qAv7K5Dti9tgT9Bxa/b0pAj7yiKYgLj2BLQZw0Gv9pLpxdtYBeadeJ2klpdOdpYQm4De
 6uMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=8138Vje6StpWA5KQDogoOdVCZugK3Dykh8gSjaAAZHY=;
 b=5LzDFerkwXj15jkCbs61D3icfFGcOYQtB0bYONJJRb836RZPez8h5T3hcNHmaeRj8+
 SVEwyHmWcaquKilh5aSGlN0FA5qGRfFNfl29OUpSMhmhMC9dRVKdZ9f8Vcw0VlykfYoO
 1SUcrRDtUf8dIRsVpTfwUUTe5vVPnSsdgUrxoizVxKZ9eS/sWWgZ/GPlLJmQSgc6wKWr
 K9uhi2tZKRfr9SxfP72kdFZvistiqkbK2dEy9LMpQls6RyOclPcyddCApJ7lm3XSLugl
 cz2pT/h2ODgcHNM/uKiqn9YUDn+azVrb9gCiE+XgilMQwwTAuT8v6OhC6LEPihD3TvB2
 WeJA==
X-Gm-Message-State: AOAM5322nKpe2yL+HZArZhuB7IN48Mm1iMS/bPcON/7llF7eNlTZYIvx
 +64wMFQgIYXkKPrM/m94oTdDvhNvWzk=
X-Google-Smtp-Source: ABdhPJwAo9XRJAFTyWuKfLxP3HlzGR8/03AE4TBsfaiKXY18lMIi9HGd26GLOd4H+25Xv4XyFPOa3g==
X-Received: by 2002:a05:6402:1455:: with SMTP id
 d21mr8520527edx.161.1631272849843; 
 Fri, 10 Sep 2021 04:20:49 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 ck4sm2569517edb.67.2021.09.10.04.20.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 04:20:49 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mOeaO-0008MU-Dk; Fri, 10 Sep 2021 13:20:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Francois Perrad <fperrad@gmail.com>
References: <20210905065723.1828689-1-francois.perrad@gadz.org>
Date: Fri, 10 Sep 2021 13:20:48 +0200
In-Reply-To: <20210905065723.1828689-1-francois.perrad@gadz.org> (Francois
 Perrad's message of "Sun, 5 Sep 2021 08:57:23 +0200")
Message-ID: <87mtokad7z.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/vsftpd: bump to 3.0.5
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Looks to be purely bugfixes, so committed to 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
