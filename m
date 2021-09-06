Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22976C433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 14:47:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDF3A60F21
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 14:47:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BDF3A60F21
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8ED8381AF6;
	Mon,  6 Sep 2021 14:47:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MA0shroe7XKp; Mon,  6 Sep 2021 14:47:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDA9881B98;
	Mon,  6 Sep 2021 14:47:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D3A231BF34D
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 14:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C279E6080C
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 14:47:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 37-LQ5qVuvyH for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 14:47:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7B0ED60607
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 14:47:22 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id me10so13933030ejb.11
 for <buildroot@buildroot.org>; Mon, 06 Sep 2021 07:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=SIwXLYl4KPrr1joCeU/7lxRUtgAXbJ67eGjKgK5e1SM=;
 b=MUFAln2TtabQVxqcxdbSDC5e/iG/BEDMyW4lL9AOoBgIO30bzbRrW2FFFqHwKXGV9l
 iixM+a6gsnDFYnEK4CtilzenS7jHsyeN/O6xukgKkvPRYvpizqUhfZCGtKdWL82zLmLM
 nL/2rG2SYiyEHISnhEtNuEGdaPDy45Ccfj9QM3ow/O9td5Wbkvs1709LS+YGiORXJY4L
 cMtWeQ4epDWzH4e72L6lt/Zsb5k51ZEejP6T3cLXC+8c8r8GGLkt+qkEwFivkMzjijCu
 38yCLH/GU/Lq9mjtJHRbRrNzGJXCZ9TD4ANRao3JdW41Zyy7QYhjDnpJMpsomMqUsZ6d
 fiFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=SIwXLYl4KPrr1joCeU/7lxRUtgAXbJ67eGjKgK5e1SM=;
 b=AXrbrSt7teLv52yVZYiVbAxc4LhaU5DxFOVHW41l8wOCrhYWtn9pGHaEiwit/E+a/d
 Nc10ls6RjbyYD93x9p0MC2HbeeslclKGAzSFgIJbaz3bNuew4IAdPyV/Ja092Viso9VW
 GoTxWBhRVznVRs2MFYSprywf+SOuqp7hsomDcb/2LYNcOvWG9hAdnapriJK353wsDiV+
 nEW/8S08fGoDuzwvJjAqRhZ+J7scNu8ckaw4+pAJU5MZBF+KRmMAv3U2LyZH+V9rjk1E
 4GcjPCwTs3t3OlapdnaCfXLOB5mqypOBOH5olxlkVZBce+aDH83pJ+VE+BTCgTqUzECJ
 vxuQ==
X-Gm-Message-State: AOAM53195tJiuaJgsRDAYnJbTSmlQEPyiDGEWaaLBA18L7HlMvVq8rWz
 eWy+BBaqRV8l4AM+duOVM08=
X-Google-Smtp-Source: ABdhPJwlmQj33GM+bT/oNg62huUdWRr00H+PLxyTnDPJWSIRqtTvVZiCoUcDwdzOhchIfFZYOOOVrQ==
X-Received: by 2002:a17:906:2c07:: with SMTP id
 e7mr14274702ejh.87.1630939640752; 
 Mon, 06 Sep 2021 07:47:20 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 s18sm4184517ejh.12.2021.09.06.07.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 07:47:20 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mNFu3-0006n5-KE; Mon, 06 Sep 2021 16:47:19 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210819205405.350DC8D5E8@busybox.osuosl.org>
Date: Mon, 06 Sep 2021 16:47:19 +0200
In-Reply-To: <20210819205405.350DC8D5E8@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Thu, 19 Aug 2021 22:54:40 +0200")
Message-ID: <87zgspiww8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] linux: bump CIP RT kernel to version
 4.19.198-cip54-rt21
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

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=835ea5b94cde2b297da88a1653cf517fcb1b0db9
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > This patch bumps Linux CIP RT to version 4.19.198-cip54-rt21

 > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
