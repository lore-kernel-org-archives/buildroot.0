Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 239FCC4338F
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 20:56:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B669760EB2
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 20:56:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B669760EB2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52E15400BF;
	Fri,  6 Aug 2021 20:56:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nkA6XFmM7Mvm; Fri,  6 Aug 2021 20:56:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71A98401B9;
	Fri,  6 Aug 2021 20:56:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 857AC1BF3AF
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 20:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 73FC560808
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 20:56:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cBZ7LPuc3V-h for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 20:56:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4DA6B607DD
 for <buildroot@buildroot.org>; Fri,  6 Aug 2021 20:56:49 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id cf5so14862630edb.2
 for <buildroot@buildroot.org>; Fri, 06 Aug 2021 13:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=ALlfXCGgDTCoLugjloe0yEqKvoeTd5CEtYrH0l4M7N8=;
 b=uszM1MHxTnHewg6fqxdzopC4S69ZNrB8Jo8zw/rA1PaHDpnQxgwXghxsdu/phXexLr
 i/qwPPeDMovUhZeFfPiEm8DCMf1vGWPPJLE8sGW/aEUPw2xFIkyNZTi95rxoh/87mBxU
 /zuVg2cZS26IO/OA9wurRUTM6Wqtp0gjcfHUL720KEANaCXV9kOWkV/yFMXn262JuDn9
 e6aPHk8o4AvcVc5hOq1yw2d+KYXwvEKJGvWua4w2mKFJdl9Vw4fgyQVaduTw6fa+Ahe4
 WlsnWzNOfUHcOJ1ToA46axFytCJ4WPGG6HKwCJLaE9fU8h5m9B74m+VDuMtGV8QW6a7W
 j0sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=ALlfXCGgDTCoLugjloe0yEqKvoeTd5CEtYrH0l4M7N8=;
 b=mIb5B1Rks2L9PtrijFbDjK8VGkC24Hgldcswn1IhbZhpCir6VW+LHDtOCmfO3ecBS1
 SxYk4a8E67JL0YgmCno6/86gLkJMFQs7iBxp3ELxs1UCb2NPtd9OqP9c3dTq4DEKdSV5
 MBuOb4cQ59ZkqE/UXipNEzNrLNU3svJZwmCLgQxVteIH4GZK44cVxwQzQfiiNpQlzDOx
 fmw3ew8korJjCtcOvEnS/tmRllNilIfHLXklvY/lqhgieP4yxg/zd0Obp3YnQrw2j/XE
 /BSwPrFAah4WjDokfzkJibsWUk45CFn2ubakT1Ahwx9GPRBUxS5fcxm1shv/Y3eLdJjo
 4Lgg==
X-Gm-Message-State: AOAM5321ViM7XPuLWpPNS1mZdgpl8VMZEYCWmVS/95XVqs/FCbtSjPbS
 SR+LTk9PMInOUJZ+63Cg4T8=
X-Google-Smtp-Source: ABdhPJwEO+87phB5Qiv1ZuOABzYV9btN9B/tuH0ZH3rKBV1Tc5Lmv7B6JKMc0nvUGlVSiMGIO/nqvA==
X-Received: by 2002:a05:6402:11c6:: with SMTP id
 j6mr15278835edw.349.1628283407562; 
 Fri, 06 Aug 2021 13:56:47 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id cf16sm4305451edb.92.2021.08.06.13.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 13:56:47 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mC6ta-000888-BA; Fri, 06 Aug 2021 22:56:46 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <4a27ed904dd80b00498185003c9a7bb26dc9a128.camel@calian.com>
 <202fcb4f-1edb-30bd-806d-e530619d510d@mind.be>
 <ea3f35ea-249e-d18a-b650-05c94573e7aa@mind.be>
Date: Fri, 06 Aug 2021 22:56:46 +0200
In-Reply-To: <ea3f35ea-249e-d18a-b650-05c94573e7aa@mind.be> (Arnout
 Vandecappelle's message of "Thu, 5 Aug 2021 22:29:49 +0200")
Message-ID: <878s1egult.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] Serious time jump bug found in gpsd 3.20+
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
Cc: "bernd.kuhls@t-online.de" <bernd.kuhls@t-online.de>,
 Robert Hancock <robert.hancock@calian.com>,
 Peter Korsgaard <jacmet@sunsite.dk>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> For master, I think we can still afford to update to 3.23.
 >> 
 >> For 2021.05.x and 2021.02.x, we'll need to backport the patch. Unless if Peter
 >> thinks that in this case (since upstream's policy is "always update to latest")
 >> it's OK to just bump it there as well?

 >  Forget about bumping the stable branches - the bump to 3.21 deprecates some
 > options, and we can't do that on the stable branches.

:/

It would be great if someone who actually knows and uses gpsd could send
a backport patch for 2021.02.x.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
