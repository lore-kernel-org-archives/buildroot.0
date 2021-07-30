Return-Path: <SRS0=Uqjv=MW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0CCDC4320A
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 14:07:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53ED060F94
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 14:07:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 53ED060F94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1229040226;
	Fri, 30 Jul 2021 14:07:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sYa6atRgSnPI; Fri, 30 Jul 2021 14:07:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F44A400E5;
	Fri, 30 Jul 2021 14:07:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E53ED1BF377
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 14:07:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4D6E8349A
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 14:07:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QiPvjwNDcqyr for <buildroot@lists.busybox.net>;
 Fri, 30 Jul 2021 14:07:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0FE258339C
 for <buildroot@busybox.net>; Fri, 30 Jul 2021 14:07:44 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id gn26so17054091ejc.3
 for <buildroot@busybox.net>; Fri, 30 Jul 2021 07:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=bGL+UCdd/Q99X2J3t1Rpijxjsy2wCPZELspHhQfmGdo=;
 b=pgU++CppJPtcNmjc6I0GsjReTI8oy7JO62TWOhP1c29AHV1CDcAFXdPjGigYPppMBc
 tpUpf618Zg1I/OVZwJmbJIGaK3Xwc7Vc+v1rdnauMbfUkzBA7lvz0O8Ntlz/kdbn5VCj
 Y4GeJaAZBHyIPWeaKhLvlg7Rx/UO3roZPdUK9BBWjcQlVsmQSU5MkRX/ss1ecsnSt2UY
 GD32KojMIzrw//mSkbXtd/J275s8OdGHEcsBGpI7WMZTIsZexk1UD1bG1D0H6vfDVLI/
 1bNnNLyHF2BpIkmixa1pEbXmn/Mcz/AMzEBo6zsbqcFH5wCEcCtlzQoAw4stXi0Gp6RC
 0PKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=bGL+UCdd/Q99X2J3t1Rpijxjsy2wCPZELspHhQfmGdo=;
 b=DRnWGb+98Lf+aVN4MRc07uQUFOADlYoykTs9cCu2du9gI1XzwRdziuJrpZZGj7Eyzi
 RhDnTa9xcZz79Fp/tN3MOm2u5udWpOgM8nI/dePqz5AEpQjRiClphRM92zL8AMWzL/B2
 cUqUkpumf1yDPtzvTTQ3QdPuYzBiyYXxDJjpLn7JP/f2LFyXeToypirx0ToPMeTGV/n3
 C0+2Rd54ah5+9RWMbXCCMN1rX/sYzCyrgbznftwGaCU7XGI22WqNm8QI0giMZVYM2hYl
 mcz8RiKBWHSqnYTwrRJmTB56SpQPEmox6q7305pmtW1LfAxU6ed6MZz2MODGG2WmlpOQ
 DlTQ==
X-Gm-Message-State: AOAM531SgnfCeX8tlqTKKmeM0aMtGj5Nmn1fO0lB7BgA7mZPViasrT+J
 lH6TZ8DByPjpSVb+IxKNR1k=
X-Google-Smtp-Source: ABdhPJx9cZvwWRFEQJ4Xhk+WzZPuPjO4iwnKRxh95xZpTx9eRsDuFWfLhVpcsOXhEX1U3bsq/WpODg==
X-Received: by 2002:a17:906:b104:: with SMTP id
 u4mr2569508ejy.201.1627654063304; 
 Fri, 30 Jul 2021 07:07:43 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 e17sm605086ejz.83.2021.07.30.07.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 07:07:42 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1m9TAr-0002ZG-Ts; Fri, 30 Jul 2021 16:07:41 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Francois Perrad <fperrad@gmail.com>
References: <20210710155838.76712-1-francois.perrad@gadz.org>
Date: Fri, 30 Jul 2021 16:07:41 +0200
In-Reply-To: <20210710155838.76712-1-francois.perrad@gadz.org> (Francois
 Perrad's message of "Sat, 10 Jul 2021 17:58:38 +0200")
Message-ID: <87lf5nzyhe.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libgtk3: bump to version 3.24.29
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
