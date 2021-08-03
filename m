Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8BA8C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 20:11:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 508A3601FD
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 20:11:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 508A3601FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D99A6063A;
	Tue,  3 Aug 2021 20:11:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O1NIgusimOps; Tue,  3 Aug 2021 20:11:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F7A8605D8;
	Tue,  3 Aug 2021 20:11:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5118A1BF83C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 20:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D97C82998
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 20:11:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yeQ3lwmA8OGk for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 20:11:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A8CA98274E
 for <buildroot@busybox.net>; Tue,  3 Aug 2021 20:11:10 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id k4so15760837wrc.0
 for <buildroot@busybox.net>; Tue, 03 Aug 2021 13:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=DujgPHFrndzoa+3iBdHUXkj0OOUQ5C2lVv0uWeGwsEw=;
 b=uglAi+bdi9UurK54EQ/T+lyM/bKMOuNWof9RJLNA5l2xEnIvQgqzQgl/Y2och0bpb6
 zB2ZyejP3XD+/UgLne8axoQ/wgGF80k9OGfuEEZWDL0VIjcLo7fFnAsh/oPf+o71SMHa
 j8SL/7nfS3Qm4t76JGbFIKNqPgTaC2P+emSf3DrDs51H8JlTQXRQKNVseXhN42v29P7h
 KJ/kThg+7xkU798XyN4XRp1QaVTmo5g8fh7kOuMxMTHzN3Evw9iVgMm5RnWdxTZkC5cb
 vLNBxo66h0DdUg6T6Q4mWATMdJwDYTu60QQ3kCSNfsKh/K4/ks5mClUnBEU525/lEWpO
 riZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=DujgPHFrndzoa+3iBdHUXkj0OOUQ5C2lVv0uWeGwsEw=;
 b=hKtk0x60V0OBcKV/na50OcEy3xjCtlI5MfzagfvjyrB7i/tjwEgftv7Z5bIxmlzQT9
 ChYz/LFl3LBmGuNd7fkZVgwHjt+5YrbCejY581pSmojr0CcaKTloJQJc4bQ9Euf6qtXi
 bZkjhgTJBbGlu0bMRAVLEAeQ4CAbWoR90RITyvMQrkoMEB3StnJZFcy+lSglmETOBoP0
 /LvTZU0nQVDCp4x9wjdTbt7fVrpF5JxzK7cFh07Rf3myaMfVFGfErUHuM8cw/oS+w8UF
 oPSIpMM59PO7FCY/m1SzJGtv2+AxWxqWpvRgDtPfOwWG3Bc1urXvBFj+6dxqbK20L0VV
 R7Ag==
X-Gm-Message-State: AOAM530ojhklcPRM1Rd/HwK96TrkqK75YH0QIt0IUvzzSHV94PWPOWbW
 lCG9dtzpvlBpH83o0f7qYCWoQm6tYgc=
X-Google-Smtp-Source: ABdhPJwYGqeCzZw+TOF5krLflaDroAmf4JwDlN3VNQMKBm15eMLurKcXLKTyiiemNu8c4kI8FG3H8A==
X-Received: by 2002:adf:f512:: with SMTP id q18mr24375779wro.318.1628021468935; 
 Tue, 03 Aug 2021 13:11:08 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id x18sm8272543wmc.17.2021.08.03.13.11.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 13:11:08 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mB0kl-0006Dn-E0; Tue, 03 Aug 2021 22:11:07 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Kory Maincent <kory.maincent@bootlin.com>
References: <20210630090247.1035893-1-kory.maincent@bootlin.com>
Date: Tue, 03 Aug 2021 22:11:07 +0200
In-Reply-To: <20210630090247.1035893-1-kory.maincent@bootlin.com> (Kory
 Maincent's message of "Wed, 30 Jun 2021 11:02:47 +0200")
Message-ID: <87im0muw4k.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] boot/uboot: fix uboot building host
 tools on x86 architecture
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
Cc: buildroot@busybox.net, yann.morin.1998@free.fr,
 thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Kory" == Kory Maincent <kory.maincent@bootlin.com> writes:

 > The make all command run the tools/makefile on the process.
 > This makefile use "pkg-config" command to support static link.
 > The issue is the use of pkg-config configured for crosscompiling
 > to build binaries tools for host architecture.
 > To fix it, I add pkg-config environment variable to configure it for host.

 > Add a test to avoid future regress on the build of U-boot.

 > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
