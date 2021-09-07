Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08EEFC433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 20:24:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24A9561163
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 20:24:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 24A9561163
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5C3B403C5;
	Tue,  7 Sep 2021 20:24:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QDZAw9Ses8e0; Tue,  7 Sep 2021 20:24:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A1C34031C;
	Tue,  7 Sep 2021 20:24:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AAB2B1BF332
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 20:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A759D80E49
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 20:24:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JdTKOGqQZeaB for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 20:24:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E6EC80BAD
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 20:24:47 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id v5so15616269edc.2
 for <buildroot@buildroot.org>; Tue, 07 Sep 2021 13:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=sTeF0KNvbwJilvxfc5lPwTySI8uunjwogXCkhPFha7o=;
 b=dOUpTISjx1BJhEB48zRYRlEX1mbWnTrOEHYdBJPcx2N606mT9oY5KmfdKpO5Y8WTFP
 C9KGT9v89CnERqIfYWmOavsXghA0lbOUWSWipGse/yrKN1FIe1EKRCR2h4Dt2jJSHCuH
 jI16KVxTpAUojgD1NnqkNhwjAkcMILMFlImCTEdJsq36+Nzdp7sY++6SzGvUSqV1uP86
 FJ4t/gxqbz3k+obHybhf7/1QKP0rO4/tv/3/GCsEUlSCo/e7R47Dt6nZWh6jdT9SqJcl
 7u7Pbh7QqP7IOOFxAfc6/93aV9FFqIptB+FZUwZsP2ocFMHcZmXXkbNSp14ZIKwAHZeL
 9ByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=sTeF0KNvbwJilvxfc5lPwTySI8uunjwogXCkhPFha7o=;
 b=rlS+XRWs4LQnWa6ww4bk/EANg8bqYkv4DMMgJLJ69VxwXXxkO/scfgIDzOhsnY6bxb
 iFwXVFRhdkSYSQxajWrAWE7CvtPNMcBnQN+Osj6yYuEM1C7AQ3/hpcVA+Gq85dqsPIAl
 WBtI6shjVFBtxcGNaraiqW3GkGqgPkq6wzb3sf6mK5Mq0f45oiK+8+5UfmWOpGNPPtZ8
 pN1/muz6uJXSa3OpRqLPpStjO7bqEAaLCFwf3LTtbpKNSXw/uWq0eFYKpE9oughLiDbJ
 ni/3oviFsC6W0dfoqF4tf0qThBsKX1FN4X2uvcB/Df8Eoj60Zhwi9bavyPWjRSIab8AN
 afuQ==
X-Gm-Message-State: AOAM531bzwrQRbrE/cPBq5j5QpAmGDxwjmF8DFclRymorfmx9r7KOQOb
 IlXmdT+h8RiSL8VwSjOPB6o=
X-Google-Smtp-Source: ABdhPJzV3FjkAC3Rm14EYzUiOuJw214HW7R9J7Hq4LqDdjIjnSSAsPwUNdQtSKbFhulZz64im7K49Q==
X-Received: by 2002:aa7:ca14:: with SMTP id y20mr99274eds.2.1631046285794;
 Tue, 07 Sep 2021 13:24:45 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 bm1sm6045177ejb.38.2021.09.07.13.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 13:24:45 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mNhe7-0004Dc-Dr; Tue, 07 Sep 2021 22:24:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20210828080446.492253-1-bernd.kuhls@t-online.de>
Date: Tue, 07 Sep 2021 22:24:43 +0200
In-Reply-To: <20210828080446.492253-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 28 Aug 2021 10:04:46 +0200")
Message-ID: <8735qgdth0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.14.7
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Release notes of this bugfix release:
 > https://www.samba.org/samba/history/samba-4.14.7.html

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
