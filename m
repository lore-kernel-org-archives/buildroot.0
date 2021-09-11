Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB5FCC433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 13:32:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5741361152
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 13:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5741361152
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A5DE607DA;
	Sat, 11 Sep 2021 13:32:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xPE8x14dNg5a; Sat, 11 Sep 2021 13:32:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CD9C607D7;
	Sat, 11 Sep 2021 13:32:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0A2161BF2B0
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 13:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDA6C84A6A
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 13:32:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hHtvORUV68vn for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 13:32:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B188849D4
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 13:32:12 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id i6so6807190edu.1
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 06:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=N9vCrW4i4uWbL8hUrIbhJvl7KHVkzYNvfA5xl57WKag=;
 b=gZq2Q9fTf3rZ0k+yBb4SaDibyD6VM/vxIFdZAuUOBVA9Oo29qz6MaUQOepmMybiM/V
 VqGXulzBnY5IJfAIIRqMoDK24+14QRSZeeOIGffeZfjumFK8Um6LQjSznpIo+99ifdod
 o3seGVtsl3gS/xruDThxKtWMO1N7AsnwIwyTfjPGvcXtJ9JnfFfG4FzHsRYcb6TF73Aq
 qmJpUp+ch+cYmaD+0yEzVLP0KOJdNpFUOUtL3V50fHbfMm4fbaIYs+YZRAy+dZNIfq6s
 h3dGnJPxteHGx6vmeZkDWNTcbFhR1DjHZe0fzdqUc6KxVOYi/z3drGWRpXAGB6a3lkyy
 Y70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=N9vCrW4i4uWbL8hUrIbhJvl7KHVkzYNvfA5xl57WKag=;
 b=zKasOuActHseP7O6+dMrGbuycTe6hP2t8AldhdOlZj0vl2aeAaMikXVkILiG+LsTIe
 rROYDu7Q1t4kAPPNdDdbvxJeJhhDDbTvjCFnKhwGLcAfRc2v+2Z6GDbBzx4q5U0zFy55
 CXkahcQEMZtcSKnNDwbKc6xNjebXJD1ZDyExura7h3Zyb89OLQRC/ioBddq2WHoFIBOz
 MpjjpoTzcE+M9CiLl4WNRKGvwDEfdTT2UL6Tnbk7/xgUoalTYDuUwgo8Ozmw/YivOiNc
 KJCH8st7IzOSSODSWBnN0GJ4eUomw6P/Mem52BWOFejr37iPEQf6p37t4GGwYHUD2y3n
 vhlA==
X-Gm-Message-State: AOAM533lzsahBKWwxdk6AdW+lqeEhXXFB1HcBI7VwhdjHOZN2MMZ9wzB
 ywq80/N+IrsHdTWsfMRQe5c=
X-Google-Smtp-Source: ABdhPJyEtyVYdwzbY91m1MuTE9p4XliCkqjSZ79vkZAF65OQ+Z7c/isMLBmFqHG9s2s9YcZrhk8Ygw==
X-Received: by 2002:aa7:d3d1:: with SMTP id o17mr3259976edr.272.1631367130716; 
 Sat, 11 Sep 2021 06:32:10 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 d16sm949283edu.8.2021.09.11.06.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 06:32:10 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mP373-0007C4-AR; Sat, 11 Sep 2021 15:32:09 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Michael Walle <michael@walle.cc>
References: <20210906155526.2196605-1-michael@walle.cc>
 <20210906155526.2196605-2-michael@walle.cc>
Date: Sat, 11 Sep 2021 15:32:09 +0200
In-Reply-To: <20210906155526.2196605-2-michael@walle.cc> (Michael Walle's
 message of "Mon, 6 Sep 2021 17:55:26 +0200")
Message-ID: <87fsub5jc6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] configs/kontron_smarc_sal28: use kernel
 5.14
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
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Michael" == Michael Walle <michael@walle.cc> writes:

 > Signed-off-by: Michael Walle <michael@walle.cc>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
