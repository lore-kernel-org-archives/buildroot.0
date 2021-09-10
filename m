Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80E31C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 10:01:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23DB961153
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 10:01:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 23DB961153
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2D6640615;
	Fri, 10 Sep 2021 10:01:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B2k606vz03aq; Fri, 10 Sep 2021 10:01:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16B0440608;
	Fri, 10 Sep 2021 10:01:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7EED81BF2F5
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 10:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7BD3184A34
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 10:00:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8iF8I_YMKF4T for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 10:00:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF7C384A2C
 for <buildroot@busybox.net>; Fri, 10 Sep 2021 10:00:58 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id e21so3061577ejz.12
 for <buildroot@busybox.net>; Fri, 10 Sep 2021 03:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=HMzTEo2ZDJZg+h9qG/1pWg9Jy/El9FdCR2Wgpigv1sA=;
 b=mm7C29gwpoRK7OwkO4dvkjVWcggeZZ5nqFER6D3wfJa5f3K4M0poqVQ8rK0/vS37Tu
 zW0cFhFZZ8E7VQfUTjzFv5bWO1UjTQpjOPf8K3A7cJL6lmAy3QUhYXaSEEYX/oVNm+KI
 Eh+c7PluW5xMOfqnvUyBQ4BeeZKb+bvyWAj0+wOTzLkYGUD24d4H+rJMMgQ8drmHsIYy
 ywvrt+sZY4qYQAWC++ixF3S7WEFKRVsqYRiSDOz9FuZN8/wwgBx1Bw/lXs7G8oltv/qE
 1kgg5MlP5iyj3LF2Ntohea2n8fpCAmvJwAMnbQi/RDAp/jAOCxD9HhB+5LzOjhNZvgCP
 Xp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=HMzTEo2ZDJZg+h9qG/1pWg9Jy/El9FdCR2Wgpigv1sA=;
 b=omLgFqvAvF4hJEZXUazFbp0MimH3qR76ZfjzTzbEUGoapLABFbae06fmSqWWe6XgWK
 x2ukVHnGl2Z9urGQ3Arv2Kyqelr/dc2Dj5gT2cltbvB433eORp7JjAGx3KDJdZTr71PW
 BEk5i6XzZ3v74EAaBd1iWlCqS0287rJwoCrBfIta8QBbxcb6tXHmMD3Ca6BNs3sOYWpZ
 +k+KP0SiDxmxnzDieh9SfkSF0VWH1QlMnXa/6AYLM9RvjUoVJZ2ulvoEPbgHkT0e5mYl
 s1IbVQmyNg96aqLOd+2rJ/Qjxu8GIWEqTWwm8WbmCOgf+lyk5HNd8vjb+E3iREQpZMKK
 auag==
X-Gm-Message-State: AOAM531hmWX6zrC34BRVl/AMbHJ3hGuPWbkwwpX7OpU+CukyfAkqtKYi
 AkFTtcx3PlAOn4otRnsQ7sE=
X-Google-Smtp-Source: ABdhPJx6NwB0xwrGbSTKF4A4PnEXU9bMd7rvjqJ+jEXBCTrk0X41vMW3Sm/Y+orPaJaINGZqI/rbWw==
X-Received: by 2002:a17:906:640f:: with SMTP id
 d15mr8712170ejm.419.1631268057227; 
 Fri, 10 Sep 2021 03:00:57 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 e3sm2213509ejr.118.2021.09.10.03.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 03:00:56 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mOdL5-00063j-UD; Fri, 10 Sep 2021 12:00:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Baruch Siach <baruch@tkos.co.il>
References: <eb6c1c71663811f27493ec0b7f32f9bdb88a8820.1630643968.git.baruch@tkos.co.il>
 <87lf4dr5wq.fsf@dell.be.48ers.dk>
Date: Fri, 10 Sep 2021 12:00:55 +0200
In-Reply-To: <87lf4dr5wq.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Fri, 03 Sep 2021 18:16:21 +0200")
Message-ID: <874kasbvhk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/netsniff-ng: fix static build of
 mausezahn
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
Cc: buildroot@busybox.net, Joris Lijssens <joris.lijssens@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
 >> The configure script fails to detect libpcap in static build because it
 >> does not take into account the libnl dependency on link. As a result the
 >> configure script silently disables mausezahn build even when
 >> BR2_PACKAGE_NETSNIFF_NG_MAUSEZAHN is enabled. Add upstream patch to use
 >> pkg-config for libpcap link flags.

 >> Cc: Joris Lijssens <joris.lijssens@gmail.com>
 >> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

 > Hmm, we currently don't have host-pkgconf as a dependency of
 > netsniff-ng, so I've amended the commit to do that.

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
