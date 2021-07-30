Return-Path: <SRS0=Uqjv=MW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB6CFC4338F
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 13:28:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42DBB60EFF
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 13:28:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 42DBB60EFF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F14B240574;
	Fri, 30 Jul 2021 13:28:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LoTUNsqXbmdU; Fri, 30 Jul 2021 13:28:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50DEB405A9;
	Fri, 30 Jul 2021 13:28:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8ED6F1BF390
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 13:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C102405A9
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 13:28:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FKlFip3THjp0 for <buildroot@lists.busybox.net>;
 Fri, 30 Jul 2021 13:28:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 85BD240574
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 13:28:01 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id x14so13152833edr.12
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 06:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=3oWfGLMgY5CCIHsue0xax60UFqMdBPtBRsKgt9gbHj8=;
 b=GzqdbAhouhJO4bsz2yU1O/mXrYSH2RJQQuSvCB2Zlw6o42DlybxCam/PZXJVRjF9YM
 pxdXTVxT2JwiUGqPubp5NCf9L0m3RLU3SS3zp2iJPRBg7rob5xGNUj4VqMS3Tg4Uh30F
 NmxSxwVREhyoVR7590WHTGln3B5dG27tekehAxOVf8/d9HDxc7VGyXhh4Ngti6FjMO/Y
 iZDyLHH3ayWch24aL1+FgTETeUh23NKUW1d7d/q/RsVw4p7EkYrMvU2KHHxTnYMuE4Sb
 z2z3Uh941D3NTAGHVHNgTRVdrclbuz8xTzIawnxSenLyQhuXQSckbBx7+Oc+YGdOqjP5
 HVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=3oWfGLMgY5CCIHsue0xax60UFqMdBPtBRsKgt9gbHj8=;
 b=iIQ+LhcF7AguuAoLtVvnFsZRHXNI2M05pnBPGwHrQie5q0K+vecAR0BRcSU/E/cwvQ
 VryI6WjJpAVCmUlu3EASQCnRrtb6xlVaHX+1gXdLWA1PXaD7G7EwEYZsvaK9V1fJmiAZ
 hhWrTwMM+JHocwuvANjQNEBoHVG6J43GOhN9rI+/1HGCV9YcgYFEBjE2aiq+NksNs/by
 8boWHnCDHZAKF4bA0smNqLeUiMFCfke+6uyljh36PKzNiRfXRBhkQNleXRzBCtuoVZPW
 dXFE7jItCK81e+Wbsj7Bz8Fh9wPx2s+UUf1lQtGZq20WUECKhsa8Q+ieFm+lIInsEHzq
 +Mxw==
X-Gm-Message-State: AOAM5331a8cpSXx/h9vtYCJ7bnsZaFHPYWo/a9qkaCbuln+7PRyEsRHV
 afimr1IUmmUyXaklL+Pg2kSQwj77Kc4=
X-Google-Smtp-Source: ABdhPJydQ7DvJ5rAmNeAm8WHo1oLqzjhGZeJO0NThIn/ufAp6AlmaztfDmq6UEAdkQ34zaQp7J0AYg==
X-Received: by 2002:a50:fb05:: with SMTP id d5mr2717048edq.5.1627651679711;
 Fri, 30 Jul 2021 06:27:59 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 p23sm714188edw.94.2021.07.30.06.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 06:27:59 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1m9SYQ-0001g6-H4; Fri, 30 Jul 2021 15:27:58 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210714085044.2455236-1-fontaine.fabrice@gmail.com>
Date: Fri, 30 Jul 2021 15:27:58 +0200
In-Reply-To: <20210714085044.2455236-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 14 Jul 2021 10:50:44 +0200")
Message-ID: <87y29oylr5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-django: security bump to
 version 3.2.5
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Oli Vogt <oli.vogt.pub01@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2021-35042: Django 3.1.x before 3.1.13 and 3.2.x before 3.2.5
 > allows QuerySet.order_by SQL injection if order_by is untrusted input
 > from a client of a web application.

 > https://www.djangoproject.com/weblog/2021/jul/01/security-releases
 > https://docs.djangoproject.com/en/dev/releases/3.2.5

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
