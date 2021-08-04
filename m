Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D79C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 17:46:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7392F60E78
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 17:46:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7392F60E78
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16FD440239;
	Wed,  4 Aug 2021 17:46:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hUdPgOlRkM0z; Wed,  4 Aug 2021 17:45:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E510F40137;
	Wed,  4 Aug 2021 17:45:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5BDC41BF41B
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 17:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58B9E83033
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 17:45:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3H94Xl6CmlIR for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 17:45:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 91E8082FE4
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 17:45:56 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id k4so1675462wms.3
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 10:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=Wykk63WhFIARPnzvUvs1bp1M7QJ2IE5G0qyYl/tYjQg=;
 b=XmM1sPXYEbNyFdBi5O+rN32dtsPbI6LILMJr2em5BUVPsfIIAFUTEoWjnuEMXzC+PZ
 GN5ebHNwqpoEkZLMszabCENd23d+Ru+wgJovDG66X7hheWrwwHdgqanR8FVSIcSkBIZS
 NDD3p9SZcQxz9dDNkRpJjeVaeDdhsxU36LOQ5V2VHp2FOm258OpgomwZAADziZcU/isH
 r4LyCK6mRAR6AGNeUWV6qitc5AxFxGuXvO3VMYsdPbDybBml+eZN4SKtKF5BBA2en2rH
 9P70y6fIi8RzhGcMx8pAhRvkzEsOUyaBsBLv3/Bf3kQGCrb1pLxnyAu4jGWSu+ifX+kX
 Q1Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=Wykk63WhFIARPnzvUvs1bp1M7QJ2IE5G0qyYl/tYjQg=;
 b=a17bW4AZIa7icG/yjcv2uH8+lyWK9FEldCQK21kpU+7pbxdjJ+YTGhGsbz7zfFIKT9
 5U/NF0C0MSaOypNl/kM9NZzKCi4YJx3xUTr+b62r5sHzpdseZRovpZHpoqYXhLHhlp7A
 1cs9MvOx452MBS0nXlYnX2PRz1qjXJ1jU9weWC0/gQrBzkRVGe1NPZKs0jCKXPaXXlho
 S8wulmuYpvxuH43xj07NuHo/pGYBqrZmGbEk1vyzANEVq6TfNLdT+GC/ZUqi9bXOV5+T
 UKGNiJ5CMYtoaw4L45aFG/T4IhG3/H/jJVMzIXJcQpe3AH4vvLoMWOvZ9TWs4TKZ4ezq
 kCVg==
X-Gm-Message-State: AOAM531xzBo7Nygxc/q9R5U055H3H3kWm52x3xnRP3irPUtI83ghq3Av
 mlrtpm8Q+65coJyFFayz/iSlbBCXRco=
X-Google-Smtp-Source: ABdhPJzDXm/W99TyEw1G8ZexM68gV5Qj95MqyQXbYkLicOQPpyU4ru++LnFObYGjDUOHYh3OMtxZBg==
X-Received: by 2002:a1c:ed0a:: with SMTP id l10mr697839wmh.151.1628099154792; 
 Wed, 04 Aug 2021 10:45:54 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id o17sm3372832wru.11.2021.08.04.10.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 10:45:53 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBKxk-0005Tr-JW; Wed, 04 Aug 2021 19:45:52 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210603184145.349794-1-fontaine.fabrice@gmail.com>
Date: Wed, 04 Aug 2021 19:45:52 +0200
In-Reply-To: <20210603184145.349794-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 3 Jun 2021 20:41:45 +0200")
Message-ID: <878s1hqf1r.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/bird: add SELinux module
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
Cc: Adrien =?utf-8?Q?Gallou=C3=ABt?= <adrien@gallouet.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Support for bird is added by the services/bird module in the SELinux
 > refpolicy.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
