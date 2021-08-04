Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF76C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 13:45:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4219F60EFF
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 13:45:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4219F60EFF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02CBA83B7D;
	Wed,  4 Aug 2021 13:45:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p2uLn5cRVBdE; Wed,  4 Aug 2021 13:45:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62EB783B75;
	Wed,  4 Aug 2021 13:45:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AAE771BF82C
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 13:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9ACF983B75
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 13:45:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k2lMtI0wMIeB for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 13:45:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5371283B68
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 13:45:46 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 i10-20020a05600c354ab029025a0f317abfso3977111wmq.3
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 06:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=aGySA82jEUBllQjlZmTSTFrQgCbfc7EELAUmhpDLCd0=;
 b=mu2kWJUeFEPMy+94j+mzduq4ZNK8neSfF19vb0LSxYis0wvqqlzLlX6stN1PWRmCW7
 GgiPc/B1HzHKXxRJ2MwfgnSf4VgWI3TmybXD10KeMW9M33Pzms4KyLTed4s9BPaNtD4u
 2fAHTuIw98+mrZHEIHAwLQowDl8j1zYkPXLqOdATu94tX4+BaxSI9KrOc/CnEZyWlQC+
 X1L1FbbfR1mWrshxyWJM3UL+enE+00RGBc64++ncaDyenTmWJelAWwXzy07E04CVSZso
 Szj+QLxVP9wrT0UskISZ7qu3UmP2g8+RxvI27ZRvHQVy60xZ9+BIqKIda+a6GSY1wvLS
 IYyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=aGySA82jEUBllQjlZmTSTFrQgCbfc7EELAUmhpDLCd0=;
 b=Wva+S7VgKjIlagR7KfEy+9Weq2wXQJmb54qJVDKIEdDhlxTSQtOzCnHWPKHDIaF1hY
 ZgRK/VHaFTosiERc7V+2kxGAdSo0a7sQ87a+WsNnSF3Vs7HPuzPRTEDvVQNANaLJIBRI
 209gJNn7kEznGwSIWCFsDOgYXMK5YyZXlCg2QJncxWpqMXucrsFqw3AqCg+e7L2Vcq73
 sumVrut3CgEVky/P9fg1M8HlcJcS/WSPUhhI5NzTpIODI2DPq5Nsq1xqmy9OE9jkIUXp
 197MbxpWAN7k+kqdbucVE737wAVElhjqaWURoSQdM73AypHZxKtsNB2x6uIBorjmucmF
 ieWw==
X-Gm-Message-State: AOAM532VKDr4bSmpKWOZ4gOhTKyv0HtvApDqql6MO5uxwYeQmwEj2caH
 Yyx6HRwn/QTlMUEoTCkaWf+WOlTSPVk=
X-Google-Smtp-Source: ABdhPJwmGSTrizRxDbY+g06PSw/HTW4OHrylJpRXVV6fI9sihfd4kUrbJjNVfElKWOZ8+4i67oKmXQ==
X-Received: by 2002:a7b:c255:: with SMTP id b21mr28117120wmj.100.1628084744548; 
 Wed, 04 Aug 2021 06:45:44 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id j140sm2413669wmj.37.2021.08.04.06.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 06:45:43 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mBHDL-0002pw-0K; Wed, 04 Aug 2021 15:45:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210718080418.1536430-1-fontaine.fabrice@gmail.com>
Date: Wed, 04 Aug 2021 15:45:42 +0200
In-Reply-To: <20210718080418.1536430-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 18 Jul 2021 10:04:18 +0200")
Message-ID: <87fsvps4qh.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libuci: add license files
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
